CREATE DATABASE  IF NOT EXISTS `koth` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `koth`;

DROP TABLE IF EXISTS `playerinfo`;
CREATE TABLE `playerinfo` (
  `UID` varchar(32) NOT NULL,
  `GUID` varchar(34) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `XP` int(100) NOT NULL DEFAULT '0',
  `Kills` int(100) NOT NULL DEFAULT '0',
  `Deaths` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `playersave`;
CREATE TABLE `playersave` (
  `UID` varchar(32) NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastModified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ammo` text,
  `weapons` text,
  `items` text,
  `assignitems` text,
  `headgear` text,
  `goggles` text,
  `vest` text,
  `vestitems` text,
  `uniform` text,
  `uniformitems` text,
  `backpack` text,
  `packitems` text,
  `handgunitems` text,
  `primarywep` text,
  `secondarywep` text,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
