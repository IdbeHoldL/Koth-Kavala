/*
Navicat MySQL Data Transfer

Source Server         : DEV
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : koth

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-04-19 12:52:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for configdata
-- ----------------------------
DROP TABLE IF EXISTS `configdata`;
CREATE TABLE `configdata` (
  `mode` varchar(12) NOT NULL,
  `fatigueOff` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for playerdata
-- ----------------------------
DROP TABLE IF EXISTS `playerdata`;
CREATE TABLE `playerdata` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `UID` varchar(32) NOT NULL,
  `GUID` varchar(34) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Gear` text,
  `Stats` text,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastModified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
