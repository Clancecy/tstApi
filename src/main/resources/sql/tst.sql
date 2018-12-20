/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 100136
Source Host           : localhost:3306
Source Database       : tst

Target Server Type    : MYSQL
Target Server Version : 100136
File Encoding         : 65001

Date: 2018-12-20 10:55:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `compID` int(11) NOT NULL AUTO_INCREMENT,
  `compName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `compZM` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`compID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for data
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data` (
  `dataID` int(11) NOT NULL AUTO_INCREMENT,
  `reportID` int(11) DEFAULT NULL,
  `taskID` int(11) DEFAULT NULL,
  `proID` int(11) DEFAULT NULL,
  `testOrder` int(11) DEFAULT NULL,
  `recordID` int(11) DEFAULT NULL,
  `itemID` int(11) DEFAULT NULL,
  `devID` int(11) DEFAULT NULL,
  `dataVal` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dataID`)
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for devattrval
-- ----------------------------
DROP TABLE IF EXISTS `devattrval`;
CREATE TABLE `devattrval` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `attrID` int(11) DEFAULT NULL,
  `attrName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `devID` int(11) DEFAULT NULL,
  `arrtVal` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `devID` int(11) NOT NULL AUTO_INCREMENT,
  `typeCode` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `devName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `devTypeID` int(11) DEFAULT NULL,
  `staID` int(11) DEFAULT NULL,
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`devID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for es
-- ----------------------------
DROP TABLE IF EXISTS `es`;
CREATE TABLE `es` (
  `ID` int(11) NOT NULL,
  `ESUrl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for instrument
-- ----------------------------
DROP TABLE IF EXISTS `instrument`;
CREATE TABLE `instrument` (
  `insID` int(11) NOT NULL AUTO_INCREMENT,
  `insName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `insTypeID` int(11) DEFAULT NULL,
  `insTypeName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `insNumber` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `isWork` int(11) DEFAULT '1' COMMENT '//1正常工作，0维修中，2报废',
  `isRepair` int(11) DEFAULT '0' COMMENT '0未检查，1已检查，2送检中',
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`insID`)
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `planID` int(11) NOT NULL AUTO_INCREMENT,
  `planName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `staID` int(11) DEFAULT NULL,
  `cycType` int(11) DEFAULT '0' COMMENT '//0：不循环，1：每天，2：每周，3：每月，4：每个季度，5：每年',
  `firsttime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `cycTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0' COMMENT '0未执行，1已执行，-1停止执行',
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`planID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for plandan
-- ----------------------------
DROP TABLE IF EXISTS `plandan`;
CREATE TABLE `plandan` (
  `planDanID` int(11) NOT NULL AUTO_INCREMENT,
  `planDanName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `planDanNumber` varchar(255) DEFAULT NULL,
  `planID` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`planDanID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for plantest
-- ----------------------------
DROP TABLE IF EXISTS `plantest`;
CREATE TABLE `plantest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `planID` int(11) DEFAULT NULL,
  `testID` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `reportID` int(11) NOT NULL AUTO_INCREMENT,
  `reportCode` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `reportName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `planDanID` int(11) DEFAULT NULL,
  `testID` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0进行中，1已完成',
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reportID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for repprofile
-- ----------------------------
DROP TABLE IF EXISTS `repprofile`;
CREATE TABLE `repprofile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `reportID` int(11) DEFAULT NULL,
  `taskID` int(11) DEFAULT NULL,
  `proID` int(11) DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `workerID` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0正在进行，1已完成',
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for solupro
-- ----------------------------
DROP TABLE IF EXISTS `solupro`;
CREATE TABLE `solupro` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `soluID` int(11) DEFAULT NULL,
  `proID` int(11) DEFAULT NULL,
  `proName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for solution
-- ----------------------------
DROP TABLE IF EXISTS `solution`;
CREATE TABLE `solution` (
  `soluID` int(11) NOT NULL AUTO_INCREMENT,
  `soluName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `devTypeID` int(11) DEFAULT NULL,
  `builder` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`soluID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `staID` int(11) NOT NULL AUTO_INCREMENT,
  `staName` varchar(255) DEFAULT NULL,
  `pStaID` int(11) DEFAULT NULL,
  `depth` int(255) DEFAULT NULL,
  `order` int(255) DEFAULT NULL,
  `longitude` float(255,6) DEFAULT NULL,
  `latitude` float(255,6) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`staID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `taskID` int(11) NOT NULL AUTO_INCREMENT,
  `taskName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `workerID` int(11) DEFAULT NULL,
  `testID` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '完成状态',
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`taskID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for taskdan
-- ----------------------------
DROP TABLE IF EXISTS `taskdan`;
CREATE TABLE `taskdan` (
  `taskDanID` int(11) NOT NULL AUTO_INCREMENT,
  `taskDanName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `reportID` int(11) DEFAULT NULL,
  `taskID` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`taskDanID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for taskpro
-- ----------------------------
DROP TABLE IF EXISTS `taskpro`;
CREATE TABLE `taskpro` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `taskID` int(11) DEFAULT NULL,
  `proID` int(11) DEFAULT NULL,
  `proName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for taskuser
-- ----------------------------
DROP TABLE IF EXISTS `taskuser`;
CREATE TABLE `taskuser` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `taskID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `testID` int(11) NOT NULL AUTO_INCREMENT,
  `testName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `soluID` int(11) DEFAULT NULL,
  `devID` int(11) DEFAULT NULL,
  `leaderID` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`testID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for testuser
-- ----------------------------
DROP TABLE IF EXISTS `testuser`;
CREATE TABLE `testuser` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `testID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

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

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userType` int(255) DEFAULT NULL COMMENT '0，公司管理员，1公司领导，2试验人员',
  `userName` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `userRealName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `userPassword` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `userSex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `userMobile` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `userMail` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `userNumber` int(11) DEFAULT NULL,
  `userCompanyID` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
