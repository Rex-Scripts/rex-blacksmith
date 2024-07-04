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