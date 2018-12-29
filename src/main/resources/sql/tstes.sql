/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 100136
Source Host           : localhost:3306
Source Database       : tstes

Target Server Type    : MYSQL
Target Server Version : 100136
File Encoding         : 65001

Date: 2018-12-29 14:30:36
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
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '1', '', '', '0');
INSERT INTO `city` VALUES ('2', '2', '', '', '0');
INSERT INTO `city` VALUES ('3', '3', '', '', '0');
INSERT INTO `city` VALUES ('1', '4', '', '', '0');
INSERT INTO `city` VALUES ('2', '5', '', '', '0');
INSERT INTO `city` VALUES ('3', '6', '', '', '0');

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
-- Records of city1
-- ----------------------------
INSERT INTO `city1` VALUES ('1', '1', '', '', '0');
INSERT INTO `city1` VALUES ('2', '2', '', '', '0');
INSERT INTO `city1` VALUES ('3', '3', '', '', '0');

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
-- Records of city2
-- ----------------------------
INSERT INTO `city2` VALUES ('1', '4', '', '', '0');
INSERT INTO `city2` VALUES ('2', '5', '', '', '0');
INSERT INTO `city2` VALUES ('3', '6', '', '', '0');

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
  `addTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

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
INSERT INTO `devtype` VALUES ('14', null, '类型1-1-1', '4', '3', null, '2018-12-06 14:42:38');

-- ----------------------------
-- Table structure for instype
-- ----------------------------
DROP TABLE IF EXISTS `instype`;
CREATE TABLE `instype` (
  `insTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `insTypeName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pTypeID` int(11) DEFAULT NULL,
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`insTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of instype
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=latin1;

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
INSERT INTO `item` VALUES ('93', '温度', 'NUMERIC', '2.0', '98');
INSERT INTO `item` VALUES ('94', '湿度', 'NUMERIC', '2.0', '100');
INSERT INTO `item` VALUES ('95', 'AB', 'NUMERIC', '3.0', '102');
INSERT INTO `item` VALUES ('96', 'BC', 'NUMERIC', '4.0', '102');
INSERT INTO `item` VALUES ('97', 'CA', 'NUMERIC', '5.0', '102');
INSERT INTO `item` VALUES ('98', '误差 ', 'FORMULA', '0.4', '102');
INSERT INTO `item` VALUES ('99', 'AB', 'NUMERIC', '7.0', '104');
INSERT INTO `item` VALUES ('100', 'BC', 'NUMERIC', '8.0', '104');
INSERT INTO `item` VALUES ('101', 'CA', 'NUMERIC', '9.0', '104');
INSERT INTO `item` VALUES ('102', '误差 ', 'FORMULA', '0.2222222222222222', '104');
INSERT INTO `item` VALUES ('103', 'AB', 'NUMERIC', '11.0', '106');
INSERT INTO `item` VALUES ('104', 'BC', 'NUMERIC', '12.0', '106');
INSERT INTO `item` VALUES ('105', 'CA', 'NUMERIC', '13.0', '106');
INSERT INTO `item` VALUES ('106', '误差 ', 'FORMULA', '0.15384615384615385', '106');
INSERT INTO `item` VALUES ('107', '试验设备', 'NUMERIC', '1.0', '108');
INSERT INTO `item` VALUES ('108', '试验人员', 'NUMERIC', '2.0', '110');
INSERT INTO `item` VALUES ('109', '试验日期', 'NUMERIC', '3.0', '110');
INSERT INTO `item` VALUES ('110', '标准温度', 'NUMERIC', '4.0', '112');
INSERT INTO `item` VALUES ('111', '标准油温', 'NUMERIC', '5.0', '112');
INSERT INTO `item` VALUES ('112', '试验温度', 'NUMERIC', '6.0', '114');
INSERT INTO `item` VALUES ('113', '试验油温', 'NUMERIC', '7.0', '114');
INSERT INTO `item` VALUES ('114', 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', '116');
INSERT INTO `item` VALUES ('115', 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', '116');
INSERT INTO `item` VALUES ('116', 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', '116');
INSERT INTO `item` VALUES ('117', 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', '118');
INSERT INTO `item` VALUES ('118', 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', '118');
INSERT INTO `item` VALUES ('119', 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', '118');
INSERT INTO `item` VALUES ('120', 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', '120');
INSERT INTO `item` VALUES ('121', 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', '120');
INSERT INTO `item` VALUES ('122', 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', '120');
INSERT INTO `item` VALUES ('123', '试验设备', 'NUMERIC', '1.0', '122');
INSERT INTO `item` VALUES ('124', '试验人员', 'NUMERIC', '2.0', '124');
INSERT INTO `item` VALUES ('125', '试验日期', 'NUMERIC', '3.0', '124');
INSERT INTO `item` VALUES ('126', '标准温度', 'NUMERIC', '4.0', '126');
INSERT INTO `item` VALUES ('127', '标准油温', 'NUMERIC', '5.0', '126');
INSERT INTO `item` VALUES ('128', '试验温度', 'NUMERIC', '6.0', '128');
INSERT INTO `item` VALUES ('129', '试验油温', 'NUMERIC', '7.0', '128');
INSERT INTO `item` VALUES ('130', 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', '130');
INSERT INTO `item` VALUES ('131', 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', '130');
INSERT INTO `item` VALUES ('132', 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', '130');
INSERT INTO `item` VALUES ('133', 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', '132');
INSERT INTO `item` VALUES ('134', 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', '132');
INSERT INTO `item` VALUES ('135', 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', '132');
INSERT INTO `item` VALUES ('136', 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', '134');
INSERT INTO `item` VALUES ('137', 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', '134');
INSERT INTO `item` VALUES ('138', 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', '134');
INSERT INTO `item` VALUES ('139', '试验设备', 'NUMERIC', '1.0', '136');
INSERT INTO `item` VALUES ('140', '试验人员', 'NUMERIC', '2.0', '138');
INSERT INTO `item` VALUES ('141', '试验日期', 'NUMERIC', '3.0', '138');
INSERT INTO `item` VALUES ('142', '高压/中压\nAB相误差', 'NUMERIC', '4.0', '140');
INSERT INTO `item` VALUES ('143', '高压/中压\nBC相误差', 'NUMERIC', '5.0', '140');
INSERT INTO `item` VALUES ('144', '高压/中压\nCA相误差', 'NUMERIC', '6.0', '140');
INSERT INTO `item` VALUES ('145', '高压/低压\nAB相误差', 'NUMERIC', '7.0', '140');
INSERT INTO `item` VALUES ('146', '高压/低压\nBC相误差', 'NUMERIC', '8.0', '140');
INSERT INTO `item` VALUES ('147', '高压/低压\nCA相误差', 'NUMERIC', '9.0', '140');
INSERT INTO `item` VALUES ('148', '高压/中压\nAB相误差', 'NUMERIC', '5.0', '141');
INSERT INTO `item` VALUES ('149', '高压/中压\nBC相误差', 'NUMERIC', '6.0', '141');
INSERT INTO `item` VALUES ('150', '高压/中压\nCA相误差', 'NUMERIC', '7.0', '141');
INSERT INTO `item` VALUES ('151', '高压/低压\nAB相误差', 'NUMERIC', '8.0', '141');
INSERT INTO `item` VALUES ('152', '高压/低压\nBC相误差', 'NUMERIC', '9.0', '141');
INSERT INTO `item` VALUES ('153', '高压/低压\nCA相误差', 'NUMERIC', '10.0', '141');
INSERT INTO `item` VALUES ('154', '试验设备', 'NUMERIC', '1.0', '143');
INSERT INTO `item` VALUES ('155', '试验人员', 'NUMERIC', '2.0', '145');
INSERT INTO `item` VALUES ('156', '试验日期', 'NUMERIC', '3.0', '145');
INSERT INTO `item` VALUES ('157', '高压/中压\nAB相误差', 'NUMERIC', '4.0', '147');
INSERT INTO `item` VALUES ('158', '高压/中压\nBC相误差', 'NUMERIC', '5.0', '147');
INSERT INTO `item` VALUES ('159', '高压/中压\nCA相误差', 'NUMERIC', '6.0', '147');
INSERT INTO `item` VALUES ('160', '高压/低压\nAB相误差', 'NUMERIC', '7.0', '147');
INSERT INTO `item` VALUES ('161', '高压/低压\nBC相误差', 'NUMERIC', '8.0', '147');
INSERT INTO `item` VALUES ('162', '高压/低压\nCA相误差', 'NUMERIC', '9.0', '147');
INSERT INTO `item` VALUES ('163', '高压/中压\nAB相误差', 'NUMERIC', '5.0', '148');
INSERT INTO `item` VALUES ('164', '高压/中压\nBC相误差', 'NUMERIC', '6.0', '148');
INSERT INTO `item` VALUES ('165', '高压/中压\nCA相误差', 'NUMERIC', '7.0', '148');
INSERT INTO `item` VALUES ('166', '高压/低压\nAB相误差', 'NUMERIC', '8.0', '148');
INSERT INTO `item` VALUES ('167', '高压/低压\nBC相误差', 'NUMERIC', '9.0', '148');
INSERT INTO `item` VALUES ('168', '高压/低压\nCA相误差', 'NUMERIC', '10.0', '148');
INSERT INTO `item` VALUES ('169', '试验设备', 'NUMERIC', '1.0', '150');
INSERT INTO `item` VALUES ('170', '试验人员', 'NUMERIC', '2.0', '152');
INSERT INTO `item` VALUES ('171', '试验日期', 'NUMERIC', '3.0', '152');
INSERT INTO `item` VALUES ('172', '高压/中压\nAB相误差', 'NUMERIC', '4.0', '154');
INSERT INTO `item` VALUES ('173', '高压/中压\nBC相误差', 'NUMERIC', '5.0', '154');
INSERT INTO `item` VALUES ('174', '高压/中压\nCA相误差', 'NUMERIC', '6.0', '154');
INSERT INTO `item` VALUES ('175', '高压/低压\nAB相误差', 'NUMERIC', '7.0', '154');
INSERT INTO `item` VALUES ('176', '高压/低压\nBC相误差', 'NUMERIC', '8.0', '154');
INSERT INTO `item` VALUES ('177', '高压/低压\nCA相误差', 'NUMERIC', '9.0', '154');
INSERT INTO `item` VALUES ('178', '高压/中压\nAB相误差', 'NUMERIC', '5.0', '155');
INSERT INTO `item` VALUES ('179', '高压/中压\nBC相误差', 'NUMERIC', '6.0', '155');
INSERT INTO `item` VALUES ('180', '高压/中压\nCA相误差', 'NUMERIC', '7.0', '155');
INSERT INTO `item` VALUES ('181', '高压/低压\nAB相误差', 'NUMERIC', '8.0', '155');
INSERT INTO `item` VALUES ('182', '高压/低压\nBC相误差', 'NUMERIC', '9.0', '155');
INSERT INTO `item` VALUES ('183', '高压/低压\nCA相误差', 'NUMERIC', '10.0', '155');
INSERT INTO `item` VALUES ('184', '试验设备', 'NUMERIC', '1.0', '157');
INSERT INTO `item` VALUES ('185', '试验人员', 'NUMERIC', '2.0', '159');
INSERT INTO `item` VALUES ('186', '试验日期', 'NUMERIC', '3.0', '159');
INSERT INTO `item` VALUES ('187', '高压/中压\nAB相误差', 'NUMERIC', '4.0', '161');
INSERT INTO `item` VALUES ('188', '高压/中压\nBC相误差', 'NUMERIC', '5.0', '161');
INSERT INTO `item` VALUES ('189', '高压/中压\nCA相误差', 'NUMERIC', '6.0', '161');
INSERT INTO `item` VALUES ('190', '高压/低压\nAB相误差', 'NUMERIC', '7.0', '161');
INSERT INTO `item` VALUES ('191', '高压/低压\nBC相误差', 'NUMERIC', '8.0', '161');
INSERT INTO `item` VALUES ('192', '高压/低压\nCA相误差', 'NUMERIC', '9.0', '161');
INSERT INTO `item` VALUES ('193', '高压/中压\nAB相误差', 'NUMERIC', '5.0', '162');
INSERT INTO `item` VALUES ('194', '高压/中压\nBC相误差', 'NUMERIC', '6.0', '162');
INSERT INTO `item` VALUES ('195', '高压/中压\nCA相误差', 'NUMERIC', '7.0', '162');
INSERT INTO `item` VALUES ('196', '高压/低压\nAB相误差', 'NUMERIC', '8.0', '162');
INSERT INTO `item` VALUES ('197', '高压/低压\nBC相误差', 'NUMERIC', '9.0', '162');
INSERT INTO `item` VALUES ('198', '高压/低压\nCA相误差', 'NUMERIC', '10.0', '162');
INSERT INTO `item` VALUES ('199', '高压/中压\nAB相误差', 'NUMERIC', '3.0', '164');
INSERT INTO `item` VALUES ('200', '高压/中压\nBC相误差', 'NUMERIC', '4.0', '164');
INSERT INTO `item` VALUES ('201', '高压/中压\nCA相误差', 'NUMERIC', '5.0', '164');
INSERT INTO `item` VALUES ('202', '高压/低压\nAB相误差', 'NUMERIC', '6.0', '164');
INSERT INTO `item` VALUES ('203', '高压/低压\nBC相误差', 'NUMERIC', '7.0', '164');
INSERT INTO `item` VALUES ('204', '高压/低压\nCA相误差', 'NUMERIC', '8.0', '164');
INSERT INTO `item` VALUES ('205', '试验设备', 'NUMERIC', '1.0', '166');
INSERT INTO `item` VALUES ('206', '试验人员', 'NUMERIC', '2.0', '168');
INSERT INTO `item` VALUES ('207', '试验日期', 'NUMERIC', '3.0', '168');
INSERT INTO `item` VALUES ('208', '标准温度', 'NUMERIC', '4.0', '170');
INSERT INTO `item` VALUES ('209', '标准油温', 'NUMERIC', '5.0', '170');
INSERT INTO `item` VALUES ('210', '试验温度', 'NUMERIC', '6.0', '172');
INSERT INTO `item` VALUES ('211', '试验油温', 'NUMERIC', '7.0', '172');
INSERT INTO `item` VALUES ('212', 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', '174');
INSERT INTO `item` VALUES ('213', 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', '174');
INSERT INTO `item` VALUES ('214', 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', '174');
INSERT INTO `item` VALUES ('215', 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', '176');
INSERT INTO `item` VALUES ('216', 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', '176');
INSERT INTO `item` VALUES ('217', 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', '176');
INSERT INTO `item` VALUES ('218', 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', '178');
INSERT INTO `item` VALUES ('219', 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', '178');
INSERT INTO `item` VALUES ('220', 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', '178');

-- ----------------------------
-- Table structure for pro
-- ----------------------------
DROP TABLE IF EXISTS `pro`;
CREATE TABLE `pro` (
  `proID` int(11) NOT NULL AUTO_INCREMENT,
  `proName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `devTypeID` int(11) DEFAULT NULL,
  `proType` int(11) DEFAULT '0' COMMENT '0,实测值，1，出厂值',
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`proID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pro
-- ----------------------------
INSERT INTO `pro` VALUES ('25', '直流电阻模板', 'E:/file/直流电阻模板.xlsx', '4', '0', '2018-12-29 14:24:13');
INSERT INTO `pro` VALUES ('26', '直流电阻模板', 'E:/file/直流电阻模板.xlsx', '4', '0', '2018-12-29 14:24:16');
INSERT INTO `pro` VALUES ('27', '直流电阻模板', 'E:/file/直流电阻模板.xlsx', '7', '0', '2018-12-29 14:24:18');
INSERT INTO `pro` VALUES ('28', '直流电阻模板', 'E:/file/直流电阻模板.xlsx', '4', '0', '2018-12-29 14:24:21');
INSERT INTO `pro` VALUES ('29', '直流电阻模板', 'E:/file/直流电阻模板.xlsx', '8', '0', '2018-12-29 14:24:24');
INSERT INTO `pro` VALUES ('35', '三项油浸式变压器', 'E:/file/三项油浸式变压器.xlsx', '8', '0', '2018-12-27 13:32:18');
INSERT INTO `pro` VALUES ('36', '三项油浸式变压器', 'E:/file/三项油浸式变压器.xlsx', '8', '1', '2018-12-27 13:32:18');
INSERT INTO `pro` VALUES ('37', '油浸式变压器', 'E:/file/油浸式变压器.xlsx', '8', '0', '2018-12-27 13:42:49');

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
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=latin1;

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
INSERT INTO `record` VALUES ('97', '温度', '0', '29');
INSERT INTO `record` VALUES ('98', '温度', '97', '29');
INSERT INTO `record` VALUES ('99', '湿度', '0', '29');
INSERT INTO `record` VALUES ('100', '湿度', '99', '29');
INSERT INTO `record` VALUES ('101', '低压绕阻', '0', '29');
INSERT INTO `record` VALUES ('102', '数据', '101', '29');
INSERT INTO `record` VALUES ('103', '中压绕阻', '0', '29');
INSERT INTO `record` VALUES ('104', '数据', '103', '29');
INSERT INTO `record` VALUES ('105', '高压绕阻', '0', '29');
INSERT INTO `record` VALUES ('106', '1.0', '105', '29');
INSERT INTO `record` VALUES ('156', '试验设备', '0', '35');
INSERT INTO `record` VALUES ('157', '试验设备', '156', '35');
INSERT INTO `record` VALUES ('158', '试验人员', '0', '35');
INSERT INTO `record` VALUES ('159', '试验人员', '158', '35');
INSERT INTO `record` VALUES ('160', '分接开关位置', '0', '35');
INSERT INTO `record` VALUES ('161', '1.0', '160', '35');
INSERT INTO `record` VALUES ('162', '2.0', '160', '35');
INSERT INTO `record` VALUES ('163', '分接开关位置', '0', '36');
INSERT INTO `record` VALUES ('164', '1.0', '163', '36');
INSERT INTO `record` VALUES ('165', '试验设备', '0', '37');
INSERT INTO `record` VALUES ('166', '试验设备', '165', '37');
INSERT INTO `record` VALUES ('167', '试验人员', '0', '37');
INSERT INTO `record` VALUES ('168', '试验人员', '167', '37');
INSERT INTO `record` VALUES ('169', '标准环境', '0', '37');
INSERT INTO `record` VALUES ('170', '标准环境', '169', '37');
INSERT INTO `record` VALUES ('171', '试验环境', '0', '37');
INSERT INTO `record` VALUES ('172', '试验环境', '171', '37');
INSERT INTO `record` VALUES ('173', '低压侧', '0', '37');
INSERT INTO `record` VALUES ('174', '数据', '173', '37');
INSERT INTO `record` VALUES ('175', '中压侧', '0', '37');
INSERT INTO `record` VALUES ('176', '数据', '175', '37');
INSERT INTO `record` VALUES ('177', '高压侧', '0', '37');
INSERT INTO `record` VALUES ('178', '1.0', '177', '37');

-- ----------------------------
-- Table structure for typeattr
-- ----------------------------
DROP TABLE IF EXISTS `typeattr`;
CREATE TABLE `typeattr` (
  `attrID` int(11) NOT NULL AUTO_INCREMENT,
  `attrName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `typeID` int(11) DEFAULT NULL,
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`attrID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of typeattr
-- ----------------------------
