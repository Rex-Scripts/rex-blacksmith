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

# Add sql
```sql
CREATE TABLE `rex_blacksmith` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `blacksmithid` varchar(50) DEFAULT NULL,
    `owner` varchar(50) DEFAULT NULL,
    `rent` int(3) NOT NULL DEFAULT 0,
    `status` varchar(50) DEFAULT 'closed',
    `money` double(11,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `rex_blacksmith_stock` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `blacksmithid` varchar(50) DEFAULT NULL,
    `item` varchar(50) DEFAULT NULL,
    `stock` int(11) NOT NULL DEFAULT 0,
    `price` double(11,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `rex_blacksmith` (`blacksmithid`, `owner`, `money`) VALUES
('valblacksmith', 'vacant', 0.00),
('blkblacksmith', 'vacant', 0.00),
('vanblacksmith', 'vacant', 0.00),
('stdblacksmith', 'vacant', 0.00),
('strblacksmith', 'vacant', 0.00),
('macblacksmith', 'vacant', 0.00),
('spiblacksmith', 'vacant', 0.00),
('tumblacksmith', 'vacant', 0.00);

INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES
('valblacksmith', 0, 'boss'),
('blkblacksmith', 0, 'boss'),
('vanblacksmith', 0, 'boss'),
('stdblacksmith', 0, 'boss'),
('strblacksmith', 0, 'boss'),
('macblacksmith', 0, 'boss'),
('spiblacksmith', 0, 'boss'),
('tumblacksmith', 0, 'boss');
```

# Starting the resource:
- add the following to your server.cfg file : ensure rex-blacksmith
