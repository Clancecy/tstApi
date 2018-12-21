/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 100136
Source Host           : localhost:3306
Source Database       : tstes

Target Server Type    : MYSQL
Target Server Version : 100136
File Encoding         : 65001

Date: 2018-12-21 16:53:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(35) NOT NULL,
  `CountryCode` char(3) NOT NULL,
  `District` char(20) NOT NULL,
  `Population` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`city1`,`city2`);

-- ----------------------------
-- Table structure for city1
-- ----------------------------
DROP TABLE IF EXISTS `city1`;
CREATE TABLE `city1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(35) NOT NULL,
  `CountryCode` char(3) NOT NULL,
  `District` char(20) NOT NULL,
  `Population` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for city2
-- ----------------------------
DROP TABLE IF EXISTS `city2`;
CREATE TABLE `city2` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(35) NOT NULL,
  `CountryCode` char(3) NOT NULL,
  `District` char(20) NOT NULL,
  `Population` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for devtype
-- ----------------------------
DROP TABLE IF EXISTS `devtype`;
CREATE TABLE `devtype` (
  `typeID` int(11) NOT NULL AUTO_INCREMENT,
  `typeCode` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `typeName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pTypeID` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `addTime` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for instype
-- ----------------------------
DROP TABLE IF EXISTS `instype`;
CREATE TABLE `instype` (
  `insTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `insTypeName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pTypeID` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`insTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `itemType` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `itemVal` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `recordID` int(11) DEFAULT '0',
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for pro
-- ----------------------------
DROP TABLE IF EXISTS `pro`;
CREATE TABLE `pro` (
  `proID` int(11) NOT NULL AUTO_INCREMENT,
  `proName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `devTypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`proID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `recordID` int(11) NOT NULL AUTO_INCREMENT,
  `recordName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pRecID` int(11) DEFAULT NULL,
  `proID` int(11) DEFAULT NULL,
  PRIMARY KEY (`recordID`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for typeattr
-- ----------------------------
DROP TABLE IF EXISTS `typeattr`;
CREATE TABLE `typeattr` (
  `attrID` int(11) NOT NULL AUTO_INCREMENT,
  `attrName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `typeID` int(11) DEFAULT NULL,
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`attrID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
