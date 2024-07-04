# RexshackGaming
- discord : https://discord.gg/YUV7ebzkqs
- youtube : https://www.youtube.com/@rexshack/videos
- tebex store : https://rexshackgaming.tebex.io/
- support me : https://ko-fi.com/rexshackgaming

# rex-blacksmith
- For RSG RedM Framework : https://discord.gg/eW3ADkf4Af

# Dependancies
- rsg-core
- rsg-target
- ox_lib

# Installation:
- ensure that the dependancies are added and started
- add rex-blacksmith to your resources folder
- items have already been added to rsg-core check you have the latest version
- images have already been added to rsg-core check you have the latest version
- add the following table to your database : rex-blacksmith.sql

# Add Jobs
- add jobs to "\rsg-core\shared\jobs.lua"
```lua
    ['valblacksmith'] = {
        label = 'Valentine Blacksmith',
        type = 'blacksmith',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
            ['1'] = { name = 'Blacksmith', payment = 15 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 25 },
        },
    },
    ['blkblacksmith'] = {
        label = 'Blackwater Blacksmith',
        type = 'blacksmith',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
            ['1'] = { name = 'Blacksmith', payment = 15 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 25 },
        },
    },
    ['vanblacksmith'] = {
        label = 'Van-Horn Blacksmith',
        type = 'blacksmith',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
            ['1'] = { name = 'Blacksmith', payment = 15 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 25 },
        },
    },
    ['stdblacksmith'] = {
        label = 'StDenis Blacksmith',
        type = 'blacksmith',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
            ['1'] = { name = 'Blacksmith', payment = 15 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 25 },
        },
    },
    ['strblacksmith'] = {
        label = 'Strawberry Blacksmith',
        type = 'blacksmith',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
            ['1'] = { name = 'Blacksmith', payment = 15 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 25 },
        },
    },
    ['macblacksmith'] = {
        label = 'Macfarlane Blacksmith',
        type = 'blacksmith',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
            ['1'] = { name = 'Blacksmith', payment = 15 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 25 },
        },
    },
    ['spiblacksmith'] = {
        label = 'Spider Blacksmith',
        type = 'blacksmith',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
            ['1'] = { name = 'Blacksmith', payment = 15 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 25 },
        },
    },
    ['tumblacksmith'] = {
        label = 'Tumbleweed Blacksmith',
        type = 'blacksmith',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
            ['1'] = { name = 'Blacksmith', payment = 15 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 25 },
        },
    },
```

# Starting the resource:
- add the following to your server.cfg file : ensure rex-blacksmith
