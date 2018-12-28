/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 100136
Source Host           : localhost:3306
Source Database       : tst

Target Server Type    : MYSQL
Target Server Version : 100136
File Encoding         : 65001

Date: 2018-12-28 15:00:01
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
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for data
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data` (
  `dataID` int(11) NOT NULL AUTO_INCREMENT,
  `testID` int(11) DEFAULT NULL,
  `taskID` int(11) DEFAULT NULL,
  `proID` int(11) DEFAULT NULL,
  `testOrder` int(11) DEFAULT NULL,
  `recordID` int(11) DEFAULT NULL,
  `itemID` int(11) DEFAULT NULL,
  `devID` int(11) DEFAULT NULL,
  `dataVal` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dataID`)
) ENGINE=InnoDB AUTO_INCREMENT=558 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of data
-- ----------------------------
INSERT INTO `data` VALUES ('540', '41', '7', '26', '1', '78', '65', '-1', '10.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('541', '41', '7', '26', '1', '80', '66', '-1', '30.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('542', '41', '7', '26', '1', '82', '67', '-1', '3.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('543', '41', '7', '26', '1', '82', '68', '-1', '4.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('544', '41', '7', '26', '1', '82', '69', '-1', '5.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('545', '41', '7', '26', '1', '82', '70', '-1', '0.4', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('546', '41', '7', '26', '1', '84', '71', '-1', '9.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('547', '41', '7', '26', '1', '84', '72', '-1', '8.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('548', '41', '7', '26', '1', '84', '73', '-1', '9.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('549', '41', '7', '26', '1', '84', '74', '-1', '0.1111111111111111', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('550', '41', '7', '26', '1', '86', '75', '-1', '11.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('551', '41', '7', '26', '1', '86', '76', '-1', '12.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('552', '41', '7', '26', '1', '86', '77', '-1', '13.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('553', '41', '7', '26', '1', '86', '78', '-1', '0.15384615384615385', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('554', '41', '7', '26', '2', '86', '75', '-1', '5.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('555', '41', '7', '26', '2', '86', '76', '-1', '6.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('556', '41', '7', '26', '2', '86', '77', '-1', '7.0', '2018-12-20 14:45:54');
INSERT INTO `data` VALUES ('557', '41', '7', '26', '2', '86', '78', '-1', '0.2857142857142857', '2018-12-20 14:45:54');

-- ----------------------------
-- Table structure for defaultdata
-- ----------------------------
DROP TABLE IF EXISTS `defaultdata`;
CREATE TABLE `defaultdata` (
  `defaultID` int(11) NOT NULL AUTO_INCREMENT,
  `devID` int(11) DEFAULT NULL,
  `proID` int(11) DEFAULT NULL,
  `testOrder` int(11) DEFAULT NULL,
  `recordID` int(11) DEFAULT NULL,
  `itemID` int(11) DEFAULT NULL,
  `dataval` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`defaultID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of defaultdata
-- ----------------------------

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
-- Records of devattrval
-- ----------------------------

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
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('1', null, '设备1', '1', '1', '2018-12-07 13:36:50');

-- ----------------------------
-- Table structure for devicefile
-- ----------------------------
DROP TABLE IF EXISTS `devicefile`;
CREATE TABLE `devicefile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fileID` int(11) DEFAULT NULL,
  `devID` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of devicefile
-- ----------------------------

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
-- Records of devtype
-- ----------------------------
INSERT INTO `devtype` VALUES ('1', null, '类型1', '0', '1', '1', '2018-11-20 15:26:23');
INSERT INTO `devtype` VALUES ('2', null, '类型2', '0', '1', '2', '2018-11-20 15:26:20');
INSERT INTO `devtype` VALUES ('3', null, '类型3', '0', '1', '3', '2018-11-20 15:26:17');
INSERT INTO `devtype` VALUES ('4', null, '类型1-1', '1', '2', '1', '2018-11-20 15:45:43');
INSERT INTO `devtype` VALUES ('5', null, '类型1-2', '1', '2', '2', '2018-11-20 15:26:10');
INSERT INTO `devtype` VALUES ('6', null, '类型2-1', '2', '2', '1', '2018-11-20 15:26:12');
INSERT INTO `devtype` VALUES ('7', null, '类型3-1', '3', '2', '1', '2018-11-20 15:24:44');
INSERT INTO `devtype` VALUES ('8', null, '类型1-1-1', '4', '3', '1', '2018-11-20 15:24:48');
INSERT INTO `devtype` VALUES ('9', null, '类型1-1-2', '4', '3', '2', '2018-11-20 15:26:26');
INSERT INTO `devtype` VALUES ('10', null, '类型1-2-1', '5', '3', '1', '2018-11-20 15:26:29');
INSERT INTO `devtype` VALUES ('11', null, '类型4', '0', null, null, '0000-00-00 00:00:00');
INSERT INTO `devtype` VALUES ('12', null, '类型5', '0', null, null, '2018-11-21 13:07:12');
INSERT INTO `devtype` VALUES ('13', null, '类型6', '0', null, null, '2018-11-22 14:25:25');

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
-- Records of es
-- ----------------------------

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `fileID` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fileType` int(11) DEFAULT '0' COMMENT '0,文件1，图片',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fileID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('1', '一张图片', '0', 'E:\\image\\数据库ER图.jpg', '图片备注', '2018-12-28 12:40:17');
INSERT INTO `file` VALUES ('2', '一个文件', '1', 'E:\\file\\三项油浸式变压器.xlsx', '文件备注', '2018-12-28 12:41:20');
INSERT INTO `file` VALUES ('3', '02', '0', 'E:\\image\\02.png', '02的备注', '2018-12-28 13:32:08');
INSERT INTO `file` VALUES ('4', '03', '0', 'E:\\image\\03.png', '03的备注', '2018-12-28 13:33:18');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of instrument
-- ----------------------------
INSERT INTO `instrument` VALUES ('1', '电阻测试仪', '1', '1-名字', 'DYCSY001', 'tst', '1', '0', '2018-12-21 13:28:56');

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
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('37', '温度', 'STRING', '20℃', '58');
INSERT INTO `item` VALUES ('38', '湿度', 'NUMERIC', '0.0', '60');
INSERT INTO `item` VALUES ('39', 'AB', 'NUMERIC', '2.0', '62');
INSERT INTO `item` VALUES ('40', 'BC', 'NUMERIC', '3.0', '62');
INSERT INTO `item` VALUES ('41', 'CA', 'NUMERIC', '4.0', '62');
INSERT INTO `item` VALUES ('42', '误差 ', 'FORMULA', '0.5', '62');
INSERT INTO `item` VALUES ('43', 'AB', 'BLANK', '', '64');
INSERT INTO `item` VALUES ('44', 'BC', 'BLANK', '', '64');
INSERT INTO `item` VALUES ('45', 'CA', 'BLANK', '', '64');
INSERT INTO `item` VALUES ('46', '误差 ', 'FORMULA', '0.0', '64');
INSERT INTO `item` VALUES ('47', 'AB', 'NUMERIC', '1.0', '66');
INSERT INTO `item` VALUES ('48', 'BC', 'NUMERIC', '2.0', '66');
INSERT INTO `item` VALUES ('49', 'CA', 'NUMERIC', '3.0', '66');
INSERT INTO `item` VALUES ('50', '误差 ', 'FORMULA', '0.6666666666666666', '66');
INSERT INTO `item` VALUES ('51', '温度', 'NUMERIC', '2.0', '68');
INSERT INTO `item` VALUES ('52', '湿度', 'NUMERIC', '2.0', '70');
INSERT INTO `item` VALUES ('53', 'AB', 'NUMERIC', '3.0', '72');
INSERT INTO `item` VALUES ('54', 'BC', 'NUMERIC', '4.0', '72');
INSERT INTO `item` VALUES ('55', 'CA', 'NUMERIC', '5.0', '72');
INSERT INTO `item` VALUES ('56', '误差 ', 'FORMULA', '0.4', '72');
INSERT INTO `item` VALUES ('57', 'AB', 'NUMERIC', '7.0', '74');
INSERT INTO `item` VALUES ('58', 'BC', 'NUMERIC', '8.0', '74');
INSERT INTO `item` VALUES ('59', 'CA', 'NUMERIC', '9.0', '74');
INSERT INTO `item` VALUES ('60', '误差 ', 'FORMULA', '0.2222222222222222', '74');
INSERT INTO `item` VALUES ('61', 'AB', 'NUMERIC', '11.0', '76');
INSERT INTO `item` VALUES ('62', 'BC', 'NUMERIC', '12.0', '76');
INSERT INTO `item` VALUES ('63', 'CA', 'NUMERIC', '13.0', '76');
INSERT INTO `item` VALUES ('64', '误差 ', 'FORMULA', '0.15384615384615385', '76');
INSERT INTO `item` VALUES ('65', '温度', 'NUMERIC', '2.0', '78');
INSERT INTO `item` VALUES ('66', '湿度', 'NUMERIC', '2.0', '80');
INSERT INTO `item` VALUES ('67', 'AB', 'NUMERIC', '3.0', '82');
INSERT INTO `item` VALUES ('68', 'BC', 'NUMERIC', '4.0', '82');
INSERT INTO `item` VALUES ('69', 'CA', 'NUMERIC', '5.0', '82');
INSERT INTO `item` VALUES ('70', '误差 ', 'FORMULA', '0.4', '82');
INSERT INTO `item` VALUES ('71', 'AB', 'NUMERIC', '7.0', '84');
INSERT INTO `item` VALUES ('72', 'BC', 'NUMERIC', '8.0', '84');
INSERT INTO `item` VALUES ('73', 'CA', 'NUMERIC', '9.0', '84');
INSERT INTO `item` VALUES ('74', '误差 ', 'FORMULA', '0.2222222222222222', '84');
INSERT INTO `item` VALUES ('75', 'AB', 'NUMERIC', '11.0', '86');
INSERT INTO `item` VALUES ('76', 'BC', 'NUMERIC', '12.0', '86');
INSERT INTO `item` VALUES ('77', 'CA', 'NUMERIC', '13.0', '86');
INSERT INTO `item` VALUES ('78', '误差 ', 'FORMULA', '0.15384615384615385', '86');
INSERT INTO `item` VALUES ('79', '温度', 'NUMERIC', '2.0', '88');
INSERT INTO `item` VALUES ('80', '湿度', 'NUMERIC', '2.0', '90');
INSERT INTO `item` VALUES ('81', 'AB', 'NUMERIC', '3.0', '92');
INSERT INTO `item` VALUES ('82', 'BC', 'NUMERIC', '4.0', '92');
INSERT INTO `item` VALUES ('83', 'CA', 'NUMERIC', '5.0', '92');
INSERT INTO `item` VALUES ('84', '误差 ', 'FORMULA', '0.4', '92');
INSERT INTO `item` VALUES ('85', 'AB', 'NUMERIC', '7.0', '94');
INSERT INTO `item` VALUES ('86', 'BC', 'NUMERIC', '8.0', '94');
INSERT INTO `item` VALUES ('87', 'CA', 'NUMERIC', '9.0', '94');
INSERT INTO `item` VALUES ('88', '误差 ', 'FORMULA', '0.2222222222222222', '94');
INSERT INTO `item` VALUES ('89', 'AB', 'NUMERIC', '11.0', '96');
INSERT INTO `item` VALUES ('90', 'BC', 'NUMERIC', '12.0', '96');
INSERT INTO `item` VALUES ('91', 'CA', 'NUMERIC', '13.0', '96');
INSERT INTO `item` VALUES ('92', '误差 ', 'FORMULA', '0.15384615384615385', '96');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `planID` int(11) NOT NULL AUTO_INCREMENT,
  `planName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cycType` int(11) DEFAULT '0' COMMENT '//0：不循环，1：每天，2：每周，3：每月，4：每个季度，5：每年',
  `builderID` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0未执行，1已执行，-1停止执行',
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`planID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('1', '立即执行的计划', '0', null, '-1', '2018-12-11 18:51:15');
INSERT INTO `plan` VALUES ('2', '周期计划1', '2', null, '-1', '2018-12-12 10:21:58');
INSERT INTO `plan` VALUES ('6', '每天的计划', '1', null, '1', '2018-12-13 19:19:46');

-- ----------------------------
-- Table structure for plandan
-- ----------------------------
DROP TABLE IF EXISTS `plandan`;
CREATE TABLE `plandan` (
  `planDanID` int(11) NOT NULL AUTO_INCREMENT,
  `planDanNumber` varchar(255) DEFAULT NULL,
  `cycType` int(11) DEFAULT NULL,
  `cycTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `staID` int(11) DEFAULT NULL,
  `planID` int(11) DEFAULT NULL,
  `builderID` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`planDanID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of plandan
-- ----------------------------

-- ----------------------------
-- Table structure for plantest
-- ----------------------------
DROP TABLE IF EXISTS `plantest`;
CREATE TABLE `plantest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `planID` int(11) DEFAULT NULL,
  `soluID` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of plantest
-- ----------------------------

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
-- Records of pro
-- ----------------------------
INSERT INTO `pro` VALUES ('25', '直流电阻模板', 'E:/file/直流电阻模板.xlsx', '4');
INSERT INTO `pro` VALUES ('26', '直流电阻模板', 'E:/file/直流电阻模板.xlsx', '4');
INSERT INTO `pro` VALUES ('27', '直流电阻模板', 'E:/file/直流电阻模板.xlsx', '7');
INSERT INTO `pro` VALUES ('28', '直流电阻模板', 'E:/file/直流电阻模板.xlsx', '4');

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
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('57', '温度', '0', '25');
INSERT INTO `record` VALUES ('58', '温度', '57', '25');
INSERT INTO `record` VALUES ('59', '湿度', '0', '25');
INSERT INTO `record` VALUES ('60', '湿度', '59', '25');
INSERT INTO `record` VALUES ('61', '低压绕阻', '0', '25');
INSERT INTO `record` VALUES ('62', '数据', '61', '25');
INSERT INTO `record` VALUES ('63', '中压绕阻', '0', '25');
INSERT INTO `record` VALUES ('64', '数据', '63', '25');
INSERT INTO `record` VALUES ('65', '高压绕阻', '0', '25');
INSERT INTO `record` VALUES ('66', '1.0', '65', '25');
INSERT INTO `record` VALUES ('67', '温度', '0', '26');
INSERT INTO `record` VALUES ('68', '温度', '67', '26');
INSERT INTO `record` VALUES ('69', '湿度', '0', '26');
INSERT INTO `record` VALUES ('70', '湿度', '69', '26');
INSERT INTO `record` VALUES ('71', '低压绕阻', '0', '26');
INSERT INTO `record` VALUES ('72', '数据', '71', '26');
INSERT INTO `record` VALUES ('73', '中压绕阻', '0', '26');
INSERT INTO `record` VALUES ('74', '数据', '73', '26');
INSERT INTO `record` VALUES ('75', '高压绕阻', '0', '26');
INSERT INTO `record` VALUES ('76', '1.0', '75', '26');
INSERT INTO `record` VALUES ('77', '温度', '0', '27');
INSERT INTO `record` VALUES ('78', '温度', '77', '27');
INSERT INTO `record` VALUES ('79', '湿度', '0', '27');
INSERT INTO `record` VALUES ('80', '湿度', '79', '27');
INSERT INTO `record` VALUES ('81', '低压绕阻', '0', '27');
INSERT INTO `record` VALUES ('82', '数据', '81', '27');
INSERT INTO `record` VALUES ('83', '中压绕阻', '0', '27');
INSERT INTO `record` VALUES ('84', '数据', '83', '27');
INSERT INTO `record` VALUES ('85', '高压绕阻', '0', '27');
INSERT INTO `record` VALUES ('86', '1.0', '85', '27');
INSERT INTO `record` VALUES ('87', '温度', '0', '28');
INSERT INTO `record` VALUES ('88', '温度', '87', '28');
INSERT INTO `record` VALUES ('89', '湿度', '0', '28');
INSERT INTO `record` VALUES ('90', '湿度', '89', '28');
INSERT INTO `record` VALUES ('91', '低压绕阻', '0', '28');
INSERT INTO `record` VALUES ('92', '数据', '91', '28');
INSERT INTO `record` VALUES ('93', '中压绕阻', '0', '28');
INSERT INTO `record` VALUES ('94', '数据', '93', '28');
INSERT INTO `record` VALUES ('95', '高压绕阻', '0', '28');
INSERT INTO `record` VALUES ('96', '1.0', '95', '28');

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
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('1', 'testcode', '报告名字', 'E:/reportPDF/报告名字.xlsx', null, '27', '0', '2018-12-11 09:26:12');
INSERT INTO `report` VALUES ('39', '201812131920008700', '每天的计划2018-12-13', null, null, '27', '0', '2018-12-13 19:20:00');
INSERT INTO `report` VALUES ('40', '201812131920006901', '每天的计划2018-12-13', null, null, '28', '0', '2018-12-13 19:20:00');
INSERT INTO `report` VALUES ('41', '201812140115026744', '每天的计划2018-12-14', null, null, '27', '0', '2018-12-14 01:15:00');
INSERT INTO `report` VALUES ('42', '201812140115022012', '每天的计划2018-12-14', null, null, '28', '0', '2018-12-14 01:15:00');
INSERT INTO `report` VALUES ('43', '201812150115008606', '每天的计划2018-12-15', null, null, '27', '0', '2018-12-15 01:15:00');
INSERT INTO `report` VALUES ('44', '201812150115022926', '每天的计划2018-12-15', null, null, '28', '0', '2018-12-15 01:15:00');

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
-- Records of repprofile
-- ----------------------------
INSERT INTO `repprofile` VALUES ('1', '1', '7', '25', 'E:\\testFile\\直流电阻模板2726.xlsx', '-1', '2', '2018-12-13 13:27:11');
INSERT INTO `repprofile` VALUES ('2', '1', '7', '26', 'E:/testFile/直流电阻模板2726.xlsx', '-1', '0', '2018-12-13 14:12:48');
INSERT INTO `repprofile` VALUES ('47', '39', '7', '25', null, '40', '0', '2018-12-13 19:20:00');
INSERT INTO `repprofile` VALUES ('48', '39', '7', '26', null, '40', '0', '2018-12-13 19:20:00');
INSERT INTO `repprofile` VALUES ('49', '40', '9', '27', null, '1', '0', '2018-12-13 19:20:00');
INSERT INTO `repprofile` VALUES ('50', '41', '7', '25', 'E:\\testFile\\直流电阻模板rep41task7pro25.xlsx', '40', '2', '2018-12-14 01:15:02');
INSERT INTO `repprofile` VALUES ('51', '41', '7', '26', 'E:\\testFile\\直流电阻模板rep44task9pro27.xlsx', '40', '0', '2018-12-14 01:15:02');
INSERT INTO `repprofile` VALUES ('52', '42', '9', '27', 'E:\\testFile\\直流电阻模板rep1task7pro25.xlsx', '1', '2', '2018-12-14 01:15:02');
INSERT INTO `repprofile` VALUES ('53', '43', '7', '25', 'E:\\testFile\\直流电阻模板rep43task7pro25.xlsx', '40', '2', '2018-12-15 01:15:00');
INSERT INTO `repprofile` VALUES ('54', '43', '7', '26', null, '40', '0', '2018-12-15 01:15:00');
INSERT INTO `repprofile` VALUES ('55', '44', '9', '27', 'E:\\testFile\\直流电阻模板rep44task9pro27.xlsx', '1', '0', '2018-12-15 01:15:02');

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
-- Records of solupro
-- ----------------------------
INSERT INTO `solupro` VALUES ('20', '1', '25', '直流电阻模板', '2018-12-11 14:09:54');
INSERT INTO `solupro` VALUES ('21', '1', '26', '直流电阻模板', '2018-12-11 14:09:54');
INSERT INTO `solupro` VALUES ('22', '2', '25', '直流电阻模板', '2018-12-11 14:10:24');
INSERT INTO `solupro` VALUES ('23', '2', '26', '直流电阻模板', '2018-12-11 14:10:24');
INSERT INTO `solupro` VALUES ('24', '2', '27', '直流电阻模板', '2018-12-11 14:10:24');
INSERT INTO `solupro` VALUES ('26', '10', '25', '直流电阻模板', '2018-12-11 14:11:14');
INSERT INTO `solupro` VALUES ('27', '10', '26', '直流电阻模板', '2018-12-11 14:11:14');
INSERT INTO `solupro` VALUES ('28', '10', '27', '直流电阻模板', '2018-12-11 14:11:14');

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
-- Records of solution
-- ----------------------------
INSERT INTO `solution` VALUES ('1', '方案一', '14', '-1', '2018-12-11 14:09:54');
INSERT INTO `solution` VALUES ('2', '方案二', '6', '-1', '2018-12-11 14:10:24');
INSERT INTO `solution` VALUES ('10', '方案三', '6', '-1', '2018-12-11 14:11:14');

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
  `address` varchar(255) DEFAULT '',
  `addTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`staID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES ('1', '武汉供电公司', '0', '1', '1', '0.000000', '0.000000', '', '2018-12-24 15:14:59');
INSERT INTO `station` VALUES ('2', '黄石供电公司', '0', '1', null, '0.000000', '0.000000', '', '2018-12-24 15:17:19');
INSERT INTO `station` VALUES ('3', '35kv变电站', '1', '2', null, '0.000000', '0.000000', '', '2018-12-24 15:15:32');
INSERT INTO `station` VALUES ('4', '二级1-2', '1', '2', null, '0.000000', '0.000000', '', '2018-12-18 14:41:03');
INSERT INTO `station` VALUES ('5', '二级1-3', '1', '2', null, '0.000000', '0.000000', '', '2018-12-18 14:41:06');
INSERT INTO `station` VALUES ('6', '二级2-1', '2', '2', null, '0.000000', '0.000000', '', '2018-12-18 14:41:09');
INSERT INTO `station` VALUES ('7', '二级2-2', '2', '2', null, null, null, '', '2018-11-16 13:50:52');
INSERT INTO `station` VALUES ('8', '洪山区珞瑜35kv变电站', '3', '3', null, '116.359779', '39.962406', '', '2018-12-24 15:16:33');
INSERT INTO `station` VALUES ('9', '三级2-2-1', '7', '3', null, '116.227257', '39.973984', '', '2018-12-18 14:40:19');
INSERT INTO `station` VALUES ('10', '三级1-3-1', '5', '3', null, '0.000000', '0.000000', '', '2018-12-18 15:38:55');
INSERT INTO `station` VALUES ('11', '江夏区35kv变电站', '3', '3', null, '116.227257', '39.911861', '', '2018-12-24 15:17:02');
INSERT INTO `station` VALUES ('12', '四级1-3-1-1', '10', '4', null, '116.376945', '39.962406', '', '2018-12-18 14:39:45');

-- ----------------------------
-- Table structure for stationfile
-- ----------------------------
DROP TABLE IF EXISTS `stationfile`;
CREATE TABLE `stationfile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fileID` int(11) DEFAULT NULL,
  `staID` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stationfile
-- ----------------------------
INSERT INTO `stationfile` VALUES ('1', '1', '11', '2018-12-28 12:41:42');
INSERT INTO `stationfile` VALUES ('2', '1', '8', '2018-12-28 12:42:12');
INSERT INTO `stationfile` VALUES ('3', '3', '11', '2018-12-28 13:31:31');
INSERT INTO `stationfile` VALUES ('4', '4', '11', '2018-12-28 13:31:38');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tagType` int(11) DEFAULT '0' COMMENT '0,站点tag，1设备tag',
  `pTagID` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tagID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '标签1', '0', '0', '2018-12-28 10:39:26');
INSERT INTO `tag` VALUES ('2', '标签1-1', '0', '1', '2018-12-28 10:40:04');
INSERT INTO `tag` VALUES ('3', '原创', '0', '0', '2018-12-28 10:40:35');
INSERT INTO `tag` VALUES ('4', '笔记', '0', '0', '2018-12-28 10:40:37');

-- ----------------------------
-- Table structure for tagdevice
-- ----------------------------
DROP TABLE IF EXISTS `tagdevice`;
CREATE TABLE `tagdevice` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tagID` int(11) DEFAULT NULL,
  `devID` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tagdevice
-- ----------------------------

-- ----------------------------
-- Table structure for tagstation
-- ----------------------------
DROP TABLE IF EXISTS `tagstation`;
CREATE TABLE `tagstation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tagID` int(11) DEFAULT NULL,
  `staID` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tagstation
-- ----------------------------
INSERT INTO `tagstation` VALUES ('1', '1', '9', '2018-12-28 10:41:09');
INSERT INTO `tagstation` VALUES ('2', '2', '9', '2018-12-28 10:41:22');
INSERT INTO `tagstation` VALUES ('3', '3', '10', '2018-12-28 10:42:09');
INSERT INTO `tagstation` VALUES ('4', '1', '10', '2018-12-28 10:42:22');
INSERT INTO `tagstation` VALUES ('5', '4', '11', '2018-12-28 10:42:30');
INSERT INTO `tagstation` VALUES ('6', '1', '11', '2018-12-28 10:42:39');
INSERT INTO `tagstation` VALUES ('7', '1', '12', '2018-12-28 10:42:46');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `taskID` int(11) NOT NULL AUTO_INCREMENT,
  `taskNumber` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `workerID` int(11) DEFAULT NULL,
  `testID` int(11) DEFAULT NULL,
  `proID` int(11) DEFAULT NULL,
  `proName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `devID` int(11) DEFAULT NULL,
  `insID` int(11) DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '完成状态',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`taskID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('7', '11', '40', '27', '26', '直流电阻模板', '1', '1', null, '0', null, '2018-12-21 13:29:00');
INSERT INTO `task` VALUES ('8', '12', '1', '35', '25', '直流电阻模板', '1', '1', null, '0', null, '2018-12-21 13:29:12');
INSERT INTO `task` VALUES ('9', '每天计划里的任务', '1', '28', '27', '直流电阻模板', '1', '1', null, '0', null, '2018-12-21 15:08:05');

-- ----------------------------
-- Table structure for taskfile
-- ----------------------------
DROP TABLE IF EXISTS `taskfile`;
CREATE TABLE `taskfile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fileID` int(11) DEFAULT NULL,
  `taskID` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of taskfile
-- ----------------------------

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
-- Records of taskpro
-- ----------------------------
INSERT INTO `taskpro` VALUES ('13', '7', '25', '直流电阻模板', '2018-12-11 14:09:54');
INSERT INTO `taskpro` VALUES ('14', '7', '26', '直流电阻模板', '2018-12-11 14:09:54');
INSERT INTO `taskpro` VALUES ('15', '8', '25', '直流电阻模板', '2018-12-11 14:09:54');
INSERT INTO `taskpro` VALUES ('16', '9', '27', '电压模板', '2018-12-13 18:59:12');

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
-- Records of taskuser
-- ----------------------------
INSERT INTO `taskuser` VALUES ('17', '7', '1', '2018-12-11 15:48:48');
INSERT INTO `taskuser` VALUES ('18', '7', '40', '2018-12-11 15:48:48');
INSERT INTO `taskuser` VALUES ('19', '8', '1', '2018-12-11 15:49:15');
INSERT INTO `taskuser` VALUES ('20', '8', '40', '2018-12-11 15:49:15');
INSERT INTO `taskuser` VALUES ('21', '9', '1', '2018-12-13 18:59:29');
INSERT INTO `taskuser` VALUES ('22', '9', '40', '2018-12-13 18:59:43');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `testID` int(11) NOT NULL AUTO_INCREMENT,
  `testNumber` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `soluID` int(11) DEFAULT NULL,
  `planDanID` int(11) DEFAULT NULL,
  `builderID` int(11) DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`testID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('27', null, '1', '1', '1', null, null, '2018-12-11 15:39:59');
INSERT INTO `test` VALUES ('28', null, '2', '1', '1', null, null, '2018-12-11 15:34:02');
INSERT INTO `test` VALUES ('35', null, '1', '1', '39', null, null, '2018-12-11 15:17:05');
INSERT INTO `test` VALUES ('36', null, '1', '1', '39', null, null, '2018-12-11 15:35:12');
INSERT INTO `test` VALUES ('37', null, '2', '1', '1', null, null, '2018-12-11 15:36:11');
INSERT INTO `test` VALUES ('38', null, '1', '1', '39', null, null, '2018-12-11 15:40:33');

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
-- Records of testuser
-- ----------------------------
INSERT INTO `testuser` VALUES ('24', '35', '1', '2018-12-11 15:17:06');
INSERT INTO `testuser` VALUES ('25', '35', '39', '2018-12-11 15:17:06');
INSERT INTO `testuser` VALUES ('28', '28', '1', '2018-12-11 15:34:03');
INSERT INTO `testuser` VALUES ('29', '28', '41', '2018-12-11 15:34:03');
INSERT INTO `testuser` VALUES ('30', '36', '1', '2018-12-11 15:35:12');
INSERT INTO `testuser` VALUES ('31', '36', '39', '2018-12-11 15:35:12');
INSERT INTO `testuser` VALUES ('32', '37', '1', '2018-12-11 15:36:11');
INSERT INTO `testuser` VALUES ('33', '37', '39', '2018-12-11 15:36:11');
INSERT INTO `testuser` VALUES ('34', '27', '1', '2018-12-11 15:39:59');
INSERT INTO `testuser` VALUES ('35', '27', '40', '2018-12-11 15:39:59');
INSERT INTO `testuser` VALUES ('36', '38', '1', '2018-12-11 15:40:33');
INSERT INTO `testuser` VALUES ('37', '38', '39', '2018-12-11 15:40:33');

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
-- Records of typeattr
-- ----------------------------

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

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', '测试昵称', '测试真实姓名', 'pw123456', '0', '13000000000', '120000@qq.com', '1', '0', null);
INSERT INTO `user` VALUES ('39', null, '彭立发', null, '12314', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('40', null, '12', '12', '12', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('41', null, '123', '', '123', null, null, null, null, null, null);
