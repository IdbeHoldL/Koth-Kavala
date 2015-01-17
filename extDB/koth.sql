CREATE DATABASE  IF NOT EXISTS `koth` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `koth`;

DROP TABLE IF EXISTS `playerinfo`;
CREATE TABLE `playerinfo` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `UID` varchar(32) NOT NULL,
  `GUID` varchar(34) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `XP` int(100) NOT NULL DEFAULT '0',
  `Kills` int(100) NOT NULL DEFAULT '0',
  `Deaths` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `playersave`;
CREATE TABLE `playersave` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `UID` varchar(32) NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastModified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Headgear` varchar(64) DEFAULT NULL,
  `Goggles` varchar(64) DEFAULT NULL,
  `Uniform` varchar(64) DEFAULT NULL,
  `Vest` varchar(64) DEFAULT NULL,
  `Backpack` varchar(64) DEFAULT NULL,
  `UniformWeapons` text,
  `UniformItems` text,
  `UniformMagazines` text,
  `VestWeapons` text,
  `VestItems` text,
  `VestMagazines` text,
  `BackpackWeapons` text,
  `BackpackItems` text,
  `BackpackMagazines` text,
  `PrimaryWeapon` varchar(64) DEFAULT NULL,
  `SecondaryWeapon` varchar(64) DEFAULT NULL,
  `HandgunWeapon` varchar(64) DEFAULT NULL,
  `PrimaryWeaponItems` varchar(128) DEFAULT NULL,
  `SecondaryWeaponItems` varchar(128) DEFAULT NULL,
  `HandgunItems` varchar(128) DEFAULT NULL,
  `AssignedItems` varchar(256) DEFAULT NULL,
  `LoadedMagazines` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
