local RSGCore = exports['rsg-core']:GetCoreObject()

---------------------------------------------
-- count owned blacksmiths
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-blacksmith:server:countowned', function(source, cb)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local result = MySQL.prepare.await("SELECT COUNT(*) as count FROM rex_blacksmith WHERE owner = ?", { citizenid })
    if result then
        cb(result)
    else
        cb(nil)
    end
end)

---------------------------------------------
-- get data
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-blacksmith:server:getblacksmithdata', function(source, cb, blacksmithid)
    MySQL.query('SELECT * FROM rex_blacksmith WHERE blacksmithid = ?', { blacksmithid }, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

---------------------------------------------
-- check stock
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-blacksmith:server:checkstock', function(source, cb, blacksmithid)
    MySQL.query('SELECT * FROM rex_blacksmith_stock WHERE blacksmithid = ?', { blacksmithid }, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

---------------------------------------------
-- update stock or add new stock
---------------------------------------------
RegisterNetEvent('rex-blacksmith:server:newstockitem', function(blacksmithid, item, amount, price)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local itemcount = MySQL.prepare.await("SELECT COUNT(*) as count FROM rex_blacksmith_stock WHERE blacksmithid = ? AND item = ?", { blacksmithid, item })
    if itemcount == 0 then
        MySQL.Async.execute('INSERT INTO rex_blacksmith_stock (blacksmithid, item, stock, price) VALUES (@blacksmithid, @item, @stock, @price)',
        {
            ['@blacksmithid'] = blacksmithid,
            ['@item'] = item,
            ['@stock'] = amount,
            ['@price'] = price
        })
        Player.Functions.RemoveItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item], "remove")
    else
        MySQL.query('SELECT * FROM rex_blacksmith_stock WHERE blacksmithid = ? AND item = ?', { blacksmithid, item }, function(data)
            local stockupdate = (amount + data[1].stock)
            MySQL.update('UPDATE rex_blacksmith_stock SET stock = ? WHERE blacksmithid = ? AND item = ?',{stockupdate, blacksmithid, item})
            MySQL.update('UPDATE rex_blacksmith_stock SET price = ? WHERE blacksmithid = ? AND item = ?',{price, blacksmithid, item})
            Player.Functions.RemoveItem(item, amount)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item], "remove")
        end)
    end
end)

---------------------------------------------
-- buy item amount / add money to account
---------------------------------------------
RegisterNetEvent('rex-blacksmith:server:buyitem', function(amount, item, newstock, price, label, blacksmithid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local money = Player.PlayerData.money[Config.Money]
    local totalcost = (price * amount)
    if money >= totalcost then
        MySQL.update('UPDATE rex_blacksmith_stock SET stock = ? WHERE blacksmithid = ? AND item = ?', {newstock, blacksmithid, item})
        Player.Functions.RemoveMoney(Config.Money, totalcost)
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item], "add")
        MySQL.query('SELECT * FROM rex_blacksmith WHERE blacksmithid = ?', { blacksmithid }, function(data2)
            local moneyupdate = (data2[1].money + totalcost)
            MySQL.update('UPDATE rex_blacksmith SET money = ? WHERE blacksmithid = ?',{moneyupdate, blacksmithid})
        end)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = Lang:t('server.lang_1')..Config.Money, type = 'error', duration = 7000 })
    end
end)

---------------------------------------------
-- remove stock item
---------------------------------------------
RegisterNetEvent('rex-blacksmith:server:removestockitem', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    MySQL.query('SELECT * FROM rex_blacksmith_stock WHERE blacksmithid = ? AND item = ?', { data.blacksmithid, data.item }, function(result)
        Player.Functions.AddItem(result[1].item, result[1].stock)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[result[1].item], "add")
        MySQL.Async.execute('DELETE FROM rex_blacksmith_stock WHERE id = ?', { result[1].id })
    end)
end)

---------------------------------------------
-- get money
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-blacksmith:server:getmoney', function(source, cb, blacksmithid)
    MySQL.query('SELECT * FROM rex_blacksmith WHERE blacksmithid = ?', { blacksmithid }, function(result)
        if result[1] then
            cb(result[1])
        else
            cb(nil)
        end
    end)
end)

---------------------------------------------
-- withdraw money
---------------------------------------------
RegisterNetEvent('rex-blacksmith:server:withdrawfunds', function(amount, blacksmithid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    MySQL.query('SELECT * FROM rex_blacksmith WHERE blacksmithid = ?', {blacksmithid} , function(result)
        if result[1] ~= nil then
            if result[1].money >= amount then
                local updatemoney = (result[1].money - amount)
                MySQL.update('UPDATE rex_blacksmith SET money = ? WHERE blacksmithid = ?', { updatemoney, blacksmithid })
                Player.Functions.AddMoney(Config.Money, amount)
            end
        end
    end)
end)

---------------------------------------------
-- rent blacksmith
---------------------------------------------
RegisterNetEvent('rex-blacksmith:server:rentblacksmith', function(blacksmithid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local money = Player.PlayerData.money[Config.Money]
    local citizenid = Player.PlayerData.citizenid
    if money > Config.RentStartup then
        Player.Functions.RemoveMoney(Config.Money, Config.RentStartup)
        Player.Functions.SetJob(blacksmithid, 2)
        if Config.LicenseRequired then
            Player.Functions.RemoveItem('blacksmithlicence', 1)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['blacksmithlicence'], 'remove')
        end
        MySQL.update('UPDATE rex_blacksmith SET owner = ? WHERE blacksmithid = ?',{ citizenid, blacksmithid })
        MySQL.update('UPDATE rex_blacksmith SET rent = ? WHERE blacksmithid = ?',{ Config.RentStartup, blacksmithid })
        MySQL.update('UPDATE rex_blacksmith SET status = ? WHERE blacksmithid = ?', {'open', blacksmithid})
        TriggerClientEvent('ox_lib:notify', src, {title = Lang:t('server.lang_2'), type = 'success', duration = 7000 })
    else
        TriggerClientEvent('ox_lib:notify', src, {title = Lang:t('server.lang_3'), type = 'error', duration = 7000 })
    end
end)

---------------------------------------------
-- add blacksmith rent
---------------------------------------------
RegisterNetEvent('rex-blacksmith:server:addrentmoney', function(rentmoney, blacksmithid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    MySQL.query('SELECT * FROM rex_blacksmith WHERE blacksmithid = ?', { blacksmithid }, function(result)
        local currentrent = result[1].rent
        local rentupdate = (currentrent + rentmoney)
        if rentupdate >= Config.MaxRent then
            TriggerClientEvent('ox_lib:notify', src, {title = 'Can\'t add that much rent!', type = 'error', duration = 7000 })
        else
            Player.Functions.RemoveMoney(Config.Money, rentmoney)
            MySQL.update('UPDATE rex_blacksmith SET rent = ? WHERE blacksmithid = ?',{ rentupdate, blacksmithid })
            MySQL.update('UPDATE rex_blacksmith SET status = ? WHERE blacksmithid = ?', {'open', blacksmithid})
            TriggerClientEvent('ox_lib:notify', src, {title = Lang:t('server.lang_4'), type = 'success', duration = 7000 })
        end
    end)
end)

---------------------------------------------
-- check player has the ingredients
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-blacksmith:server:checkingredients', function(source, cb, ingredients)
    local src = source
    local hasItems = false
    local icheck = 0
    local Player = RSGCore.Functions.GetPlayer(src)
    for k, v in pairs(ingredients) do
        if Player.Functions.GetItemByName(v.item) and Player.Functions.GetItemByName(v.item).amount >= v.amount then
            icheck = icheck + 1
            if icheck == #ingredients then
                cb(true)
            end
        else
            TriggerClientEvent('ox_lib:notify', src, {title = Lang:t('server.lang_5'), type = 'error', duration = 7000 })
            cb(false)
            return
        end
    end
end)

---------------------------------------------
-- finish crafting / give item
---------------------------------------------
RegisterNetEvent('rex-blacksmith:server:finishcrafting', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local receive = data.receive
    local giveamount = data.giveamount
    for k, v in pairs(data.ingredients) do
        Player.Functions.RemoveItem(v.item, v.amount)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[v.item], 'remove')
    end
    Player.Functions.AddItem(receive, giveamount)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[receive], 'add')
end)

---------------------------------------------
-- blacksmith rent system
---------------------------------------------
lib.cron.new(Config.BalacksmithCronJob, function ()

    local result = MySQL.query.await('SELECT * FROM rex_blacksmith')

    if not result then goto continue end

    for i = 1, #result do

        local blacksmithid = result[i].blacksmithid
        local owner = result[i].owner
        local rent = result[i].rent
        local money = result[i].money

        if rent >= 1 then
            local moneyupdate = (rent - Config.RentPerHour)
            MySQL.update('UPDATE rex_blacksmith SET rent = ? WHERE blacksmithid = ?', {moneyupdate, blacksmithid})
            MySQL.update('UPDATE rex_blacksmith SET status = ? WHERE blacksmithid = ?', {'open', blacksmithid})
        else
            MySQL.update('UPDATE rex_blacksmith SET status = ? WHERE blacksmithid = ?', {'closed', blacksmithid})
        end

    end

    ::continue::

    if Config.ServerNotify then
        print(Lang:t('server.lang_6'))
    end

end)
