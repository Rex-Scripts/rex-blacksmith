Config = {}

---------------------------------
-- settings
---------------------------------
Config.Keybind         = 'J'
Config.Img             = "rsg-inventory/html/images/"
Config.Money           = 'cash' -- 'cash', 'bank' or 'bloodmoney'
Config.ServerNotify    = true
Config.LicenseRequired = false

---------------------------------
-- rent settings
---------------------------------
Config.MaxBalacksmiths    = 1
Config.RentStartup        = 100
Config.RentPerHour        = 1
Config.BalacksmithCronJob = '0 * * * *' -- cronjob runs every hour (0 * * * *)
Config.MaxRent            = 100

---------------------------------
-- storage settings
---------------------------------
Config.BarTrayMaxWeight  = 4000000
Config.BarTrayMaxSlots   = 4
Config.CraftingMaxWeight = 4000000
Config.CraftingMaxSlots  = 48
Config.StockMaxWeight    = 4000000
Config.StockMaxSlots     = 48

---------------------------------
-- npc settings
---------------------------------
Config.DistanceSpawn = 20.0
Config.FadeIn = true

---------------------------------
-- blacksmith locations
---------------------------------
Config.BlacksmithLocations = {
    { 
        name = 'Valentine Blacksmith',
        blacksmithid = 'valblacksmith',
        coords = vector3(-369.29, 795.93, 116.19),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(-369.29, 795.93, 116.19, 320.60),
        jobaccess = 'valblacksmith',
        blipname = 'Valentine Blacksmith',
        blipsprite = 'blip_shop_blacksmith',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Blackwater Blacksmith',
        blacksmithid = 'blkblacksmith',
        coords = vector3(-869.60, -1394.87, 43.53),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(-869.60, -1394.87, 43.53, 138.74),
        jobaccess = 'blkblacksmith',
        blipname = 'Blackwater Blacksmith',
        blipsprite = 'blip_shop_blacksmith',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Van-Horn Blacksmith',
        blacksmithid = 'vanblacksmith',
        coords = vector3(2935.53, 560.56, 44.95),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(2935.53, 560.56, 44.95, 48.14),
        jobaccess = 'vanblacksmith',
        blipname = 'Van-Horn Blacksmith',
        blipsprite = 'blip_shop_blacksmith',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'StDenis Blacksmith',
        blacksmithid = 'stdblacksmith',
        coords = vector3(2514.80, -1456.68, 46.31),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(2514.80, -1456.68, 46.31, 101.11),
        jobaccess = 'stdblacksmith',
        blipname = 'StDenis Blacksmith',
        blipsprite = 'blip_shop_blacksmith',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Strawberry Blacksmith',
        blacksmithid = 'strblacksmith',
        coords = vector3(-1819.69, -568.37, 155.99),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(-1819.69, -568.37, 155.99, 208.65),
        jobaccess = 'strblacksmith',
        blipname = 'Strawberry Blacksmith',
        blipsprite = 'blip_shop_blacksmith',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Macfarlane Blacksmith',
        blacksmithid = 'macblacksmith',
        coords = vector3(-2395.84, -2378.86, 61.19),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(-2395.84, -2378.86, 61.19, 110.73),
        jobaccess = 'macblacksmith',
        blipname = 'Macfarlane Blacksmith',
        blipsprite = 'blip_shop_blacksmith',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Spider Blacksmith',
        blacksmithid = 'spiblacksmith',
        coords = vector3(-1348.27, 2404.61, 307.06),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(-1348.27, 2404.61, 307.06, 273.74),
        jobaccess = 'spiblacksmith',
        blipname = 'Spider Blacksmith',
        blipsprite = 'blip_shop_blacksmith',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Tumbleweed Blacksmith',
        blacksmithid = 'tumblacksmith',
        coords = vector3(-5516.69, -3040.95, -2.39),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(-5516.69, -3040.95, -2.39, 209.54),
        jobaccess = 'tumblacksmith',
        blipname = 'Tumbleweed Blacksmith',
        blipsprite = 'blip_shop_blacksmith',
        blipscale = 0.2,
        showblip = true
    },
}

---------------------------------
-- blacksmith crafting
---------------------------------
Config.BlacksmithCrafting = {

    {
        category = 'Tools',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 1 },
            [2] = { item = 'steelbar', amount = 1 },
            [3] = { item = 'wood', amount = 1 },
        },
        receive = 'pickaxe',
        giveamount = 1
    },
    {
        category = 'Tools',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 1 },
            [2] = { item = 'steelbar', amount = 1 },
            [3] = { item = 'wood', amount = 1 },
        },
        receive = 'shovel',
        giveamount = 1
    },
    {
        category = 'Tools',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 2 },
            [2] = { item = 'steelbar', amount = 2 },
        },
        receive = 'bucket',
        giveamount = 1
    },
    {
        category = 'Items',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 2 },
            [2] = { item = 'steelbar', amount = 2 },
        },
        receive = 'handcuffs',
        giveamount = 1
    },
    {
        category = 'Items',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 4 },
            [2] = { item = 'steelbar', amount = 3 },
            [3] = { item = 'copperbar', amount = 1 },
        },
        receive = 'moneybox',
        giveamount = 1
    },
    {
        category = 'Bars',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 10 },
            [2] = { item = 'goldore', amount = 10 },
        },
        receive = 'goldbar',
        giveamount = 1
    },
    {
        category = 'Bars',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 10 },
            [2] = { item = 'silverore', amount = 10 },
        },
        receive = 'silverbar',
        giveamount = 1
    },
    {
        category = 'Bars',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 10 },
            [2] = { item = 'ironore', amount = 10 },
        },
        receive = 'ironbar',
        giveamount = 1
    },
    {
        category = 'Bars',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 10 },
            [2] = { item = 'ironbar', amount = 1 },
        },
        receive = 'steelbar',
        giveamount = 1
    },
    {
        category = 'Bars',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 10 },
            [2] = { item = 'leadore', amount = 10 },
        },
        receive = 'leadbar',
        giveamount = 1
    },
    {
        category = 'Bars',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 10 },
            [2] = { item = 'copperore', amount = 10 },
        },
        receive = 'copperbar',
        giveamount = 1
    },
    {
        category = 'Weapon Parts',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 1 },
            [2] = { item = 'steelbar', amount = 1 },
            [3] = { item = 'wood', amount = 1 },
        },
        receive = 'revolverparts',
        giveamount = 1
    },
    {
        category = 'Weapon Parts',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 1 },
            [2] = { item = 'steelbar', amount = 1 },
            [3] = { item = 'wood', amount = 1 },
        },
        receive = 'pistolparts',
        giveamount = 1
    },
    {
        category = 'Weapon Parts',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 2 },
            [2] = { item = 'steelbar', amount = 2 },
            [3] = { item = 'wood', amount = 2 },
        },
        receive = 'repeaterparts',
        giveamount = 1
    },
    {
        category = 'Weapon Parts',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 2 },
            [2] = { item = 'steelbar', amount = 2 },
            [3] = { item = 'wood', amount = 2 },
        },
        receive = 'rifleparts',
        giveamount = 1
    },
    {
        category = 'Weapon Parts',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 2 },
            [2] = { item = 'steelbar', amount = 2 },
            [3] = { item = 'wood', amount = 2 },
        },
        receive = 'shotgunparts',
        giveamount = 1
    },

}
