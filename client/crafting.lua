local RSGCore = exports['rsg-core']:GetCoreObject()

---------------------------------------------
-- crafting menu
---------------------------------------------
local CategoryMenus = {}

CreateThread(function()
    for _, v in ipairs(Config.BlacksmithCrafting) do
        local IngredientsMetadata = {}
        local setheader = RSGCore.Shared.Items[tostring(v.receive)].label
        local itemimg = "nui://"..Config.Img..RSGCore.Shared.Items[tostring(v.receive)].image

        for i, ingredient in ipairs(v.ingredients) do
            table.insert(IngredientsMetadata, { label = RSGCore.Shared.Items[ingredient.item].label, value = ingredient.amount })
        end

        local option = {
            title = setheader,
            icon = itemimg,
            event = 'rex-blacksmith:client:checkingredients',
            metadata = IngredientsMetadata,
            args = {
                title = setheader,
                category = v.category,
                ingredients = v.ingredients,
                crafttime = v.crafttime,
                receive = v.receive,
                giveamount = v.giveamount
            }
        }

        if not CategoryMenus[v.category] then
            CategoryMenus[v.category] = {
                id = 'crafting_menu_' .. v.category,
                title = v.category,
                menu = 'crafting_menu',
                onBack = function() end,
                options = { option }
            }
        else
            table.insert(CategoryMenus[v.category].options, option)
        end
    end
end)

CreateThread(function()
    for category, MenuData in pairs(CategoryMenus) do
        RegisterNetEvent('rex-blacksmith:client:' .. category)
        AddEventHandler('rex-blacksmith:client:' .. category, function()
            lib.registerContext(MenuData)
            lib.showContext(MenuData.id)
        end)
    end
end)

RegisterNetEvent('rex-blacksmith:client:craftingmenu', function()
    local Menu = {
        id = 'crafting_menu',
        title = Lang:t('client.lang_44'),
        menu = 'blacksmith_job_menu',
        onBack = function() end,
        options = {}
    }

    for category, MenuData in pairs(CategoryMenus) do
        table.insert(Menu.options, {
            title = category,
            description = Lang:t('client.lang_45') .. category,
            event = 'rex-blacksmith:client:' .. category,
            arrow = true
        })
    end

    lib.registerContext(Menu)
    lib.showContext(Menu.id)
end)

---------------------------------------------
-- craft item
---------------------------------------------
RegisterNetEvent('rex-blacksmith:client:checkingredients', function(data)
    RSGCore.Functions.TriggerCallback('rex-blacksmith:server:checkingredients', function(hasRequired)

        if not hasRequired then 
            return 
        end

        LocalPlayer.state:set("inv_busy", true, true) -- lock inventory
        if lib.progressBar({
            duration = tonumber(data.crafttime),
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disableControl = true,
            disable = {
                move = true,
                mouse = true,
            },
            label = Lang:t('client.lang_46').. RSGCore.Shared.Items[data.receive].label,
        }) then
            TriggerServerEvent('rex-blacksmith:server:finishcrafting', data)
        end
        LocalPlayer.state:set("inv_busy", false, true) -- unlock inventory

    end, data.ingredients)
end)
