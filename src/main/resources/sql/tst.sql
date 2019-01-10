/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100137
 Source Host           : localhost:3306
 Source Schema         : tst

 Target Server Type    : MySQL
 Target Server Version : 100137
 File Encoding         : 65001

 Date: 10/01/2019 20:43:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `compID` int(11) NOT NULL AUTO_INCREMENT,
  `compName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `compZM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`compID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, '特试特公司', 'TSTZS', '2019-01-04 16:36:48');

-- ----------------------------
-- Table structure for data
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data`  (
  `dataID` int(11) NOT NULL AUTO_INCREMENT,
  `testID` int(11) NULL DEFAULT NULL,
  `taskID` int(11) NULL DEFAULT NULL,
  `proID` int(11) NULL DEFAULT NULL,
  `proName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `testOrder` int(11) NULL DEFAULT NULL,
  `recordID` int(11) NULL DEFAULT NULL,
  `recordName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `itemID` int(11) NULL DEFAULT NULL,
  `itemName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `devID` int(11) NULL DEFAULT NULL,
  `dataVal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`dataID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 839 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of data
-- ----------------------------
INSERT INTO `data` VALUES (759, 35, 28, 50, '油浸式变压器', 1, 340, '试验设备', 406, '试验设备', 1, '10.0', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (760, 35, 28, 50, '油浸式变压器', 1, 342, '试验人员', 407, '试验人员', 1, '2.0', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (761, 35, 28, 50, '油浸式变压器', 1, 342, '试验人员', 408, '试验日期', 1, '3.0', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (762, 35, 28, 50, '油浸式变压器', 1, 344, '标准环境', 409, '标准温度', 1, '4.0', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (763, 35, 28, 50, '油浸式变压器', 1, 344, '标准环境', 410, '标准油温', 1, '5.0', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (764, 35, 28, 50, '油浸式变压器', 1, 346, '试验环境', 411, '试验温度', 1, '6.0', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (765, 35, 28, 50, '油浸式变压器', 1, 346, '试验环境', 412, '试验油温', 1, '7.0', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (766, 35, 28, 50, '油浸式变压器', 1, 348, '数据', 413, 'a相(mΩ)', 1, '8.0', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (767, 35, 28, 50, '油浸式变压器', 1, 348, '数据', 414, 'b相(mΩ)', 1, '9.0', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (768, 35, 28, 50, '油浸式变压器', 1, 348, '数据', 415, 'c)相(mΩ)', 1, '10.0', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (769, 35, 28, 50, '油浸式变压器', 1, 350, '数据', 416, 'Am相(mΩ)', 1, '11.0', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (770, 35, 28, 50, '油浸式变压器', 1, 350, '数据', 417, 'Bm相(mΩ)', 1, '12.0', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (771, 35, 28, 50, '油浸式变压器', 1, 350, '数据', 418, 'Cm相(mΩ)', 1, '13.0', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (772, 35, 28, 50, '油浸式变压器', 1, 352, '1.0', 419, 'A相(mΩ)', 1, '9', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (773, 35, 28, 50, '油浸式变压器', 1, 352, '1.0', 420, 'B相(mΩ)', 1, '4', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (774, 35, 28, 50, '油浸式变压器', 1, 352, '1.0', 421, 'C相(mΩ)', 1, '8', '2019-01-10 19:35:21');
INSERT INTO `data` VALUES (775, 36, 29, 50, '油浸式变压器', 1, 340, '试验设备', 406, '试验设备', 1, '3.0', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (776, 36, 29, 50, '油浸式变压器', 1, 342, '试验人员', 407, '试验人员', 1, '2.0', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (777, 36, 29, 50, '油浸式变压器', 1, 342, '试验人员', 408, '试验日期', 1, '3.0', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (778, 36, 29, 50, '油浸式变压器', 1, 344, '标准环境', 409, '标准温度', 1, '4.0', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (779, 36, 29, 50, '油浸式变压器', 1, 344, '标准环境', 410, '标准油温', 1, '5.0', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (780, 36, 29, 50, '油浸式变压器', 1, 346, '试验环境', 411, '试验温度', 1, '6.0', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (781, 36, 29, 50, '油浸式变压器', 1, 346, '试验环境', 412, '试验油温', 1, '7.0', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (782, 36, 29, 50, '油浸式变压器', 1, 348, '数据', 413, 'a相(mΩ)', 1, '8.0', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (783, 36, 29, 50, '油浸式变压器', 1, 348, '数据', 414, 'b相(mΩ)', 1, '9.0', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (784, 36, 29, 50, '油浸式变压器', 1, 348, '数据', 415, 'c)相(mΩ)', 1, '10.0', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (785, 36, 29, 50, '油浸式变压器', 1, 350, '数据', 416, 'Am相(mΩ)', 1, '11.0', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (786, 36, 29, 50, '油浸式变压器', 1, 350, '数据', 417, 'Bm相(mΩ)', 1, '12.0', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (787, 36, 29, 50, '油浸式变压器', 1, 350, '数据', 418, 'Cm相(mΩ)', 1, '13.0', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (788, 36, 29, 50, '油浸式变压器', 1, 352, '1.0', 419, 'A相(mΩ)', 1, '12', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (789, 36, 29, 50, '油浸式变压器', 1, 352, '1.0', 420, 'B相(mΩ)', 1, '3', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (790, 36, 29, 50, '油浸式变压器', 1, 352, '1.0', 421, 'C相(mΩ)', 1, '14', '2019-01-10 19:35:34');
INSERT INTO `data` VALUES (791, 37, 30, 50, '油浸式变压器', 1, 340, '试验设备', 406, '试验设备', 1, '4.0', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (792, 37, 30, 50, '油浸式变压器', 1, 342, '试验人员', 407, '试验人员', 1, '2.0', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (793, 37, 30, 50, '油浸式变压器', 1, 342, '试验人员', 408, '试验日期', 1, '3.0', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (794, 37, 30, 50, '油浸式变压器', 1, 344, '标准环境', 409, '标准温度', 1, '4.0', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (795, 37, 30, 50, '油浸式变压器', 1, 344, '标准环境', 410, '标准油温', 1, '5.0', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (796, 37, 30, 50, '油浸式变压器', 1, 346, '试验环境', 411, '试验温度', 1, '6.0', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (797, 37, 30, 50, '油浸式变压器', 1, 346, '试验环境', 412, '试验油温', 1, '7.0', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (798, 37, 30, 50, '油浸式变压器', 1, 348, '数据', 413, 'a相(mΩ)', 1, '8.0', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (799, 37, 30, 50, '油浸式变压器', 1, 348, '数据', 414, 'b相(mΩ)', 1, '9.0', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (800, 37, 30, 50, '油浸式变压器', 1, 348, '数据', 415, 'c)相(mΩ)', 1, '10.0', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (801, 37, 30, 50, '油浸式变压器', 1, 350, '数据', 416, 'Am相(mΩ)', 1, '11.0', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (802, 37, 30, 50, '油浸式变压器', 1, 350, '数据', 417, 'Bm相(mΩ)', 1, '12.0', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (803, 37, 30, 50, '油浸式变压器', 1, 350, '数据', 418, 'Cm相(mΩ)', 1, '13.0', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (804, 37, 30, 50, '油浸式变压器', 1, 352, '1.0', 419, 'A相(mΩ)', 1, '5', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (805, 37, 30, 50, '油浸式变压器', 1, 352, '1.0', 420, 'B相(mΩ)', 1, '9', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (806, 37, 30, 50, '油浸式变压器', 1, 352, '1.0', 421, 'C相(mΩ)', 1, '6', '2019-01-10 19:35:44');
INSERT INTO `data` VALUES (807, 37, 31, 50, '油浸式变压器', 1, 340, '试验设备', 406, '试验设备', 1, '12.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (808, 37, 31, 50, '油浸式变压器', 1, 342, '试验人员', 407, '试验人员', 1, '2.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (809, 37, 31, 50, '油浸式变压器', 1, 342, '试验人员', 408, '试验日期', 1, '3.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (810, 37, 31, 50, '油浸式变压器', 1, 344, '标准环境', 409, '标准温度', 1, '4.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (811, 37, 31, 50, '油浸式变压器', 1, 344, '标准环境', 410, '标准油温', 1, '5.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (812, 37, 31, 50, '油浸式变压器', 1, 346, '试验环境', 411, '试验温度', 1, '6.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (813, 37, 31, 50, '油浸式变压器', 1, 346, '试验环境', 412, '试验油温', 1, '7.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (814, 37, 31, 50, '油浸式变压器', 1, 348, '数据', 413, 'a相(mΩ)', 1, '8.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (815, 37, 31, 50, '油浸式变压器', 1, 348, '数据', 414, 'b相(mΩ)', 1, '9.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (816, 37, 31, 50, '油浸式变压器', 1, 348, '数据', 415, 'c)相(mΩ)', 1, '10.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (817, 37, 31, 50, '油浸式变压器', 1, 350, '数据', 416, 'Am相(mΩ)', 1, '11.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (818, 37, 31, 50, '油浸式变压器', 1, 350, '数据', 417, 'Bm相(mΩ)', 1, '12.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (819, 37, 31, 50, '油浸式变压器', 1, 350, '数据', 418, 'Cm相(mΩ)', 1, '13.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (820, 37, 31, 50, '油浸式变压器', 1, 352, '1.0', 419, 'A相(mΩ)', 1, '14.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (821, 37, 31, 50, '油浸式变压器', 1, 352, '1.0', 420, 'B相(mΩ)', 1, '15.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (822, 37, 31, 50, '油浸式变压器', 1, 352, '1.0', 421, 'C相(mΩ)', 1, '16.0', '2019-01-10 19:38:18');
INSERT INTO `data` VALUES (823, 28, 27, 50, '油浸式变压器', 1, 340, '试验设备', 406, '试验设备', 1, '1.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (824, 28, 27, 50, '油浸式变压器', 1, 342, '试验人员', 407, '试验人员', 1, '2.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (825, 28, 27, 50, '油浸式变压器', 1, 342, '试验人员', 408, '试验日期', 1, '3.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (826, 28, 27, 50, '油浸式变压器', 1, 344, '标准环境', 409, '标准温度', 1, '4.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (827, 28, 27, 50, '油浸式变压器', 1, 344, '标准环境', 410, '标准油温', 1, '5.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (828, 28, 27, 50, '油浸式变压器', 1, 346, '试验环境', 411, '试验温度', 1, '6.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (829, 28, 27, 50, '油浸式变压器', 1, 346, '试验环境', 412, '试验油温', 1, '7.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (830, 28, 27, 50, '油浸式变压器', 1, 348, '数据', 413, 'a相(mΩ)', 1, '8.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (831, 28, 27, 50, '油浸式变压器', 1, 348, '数据', 414, 'b相(mΩ)', 1, '9.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (832, 28, 27, 50, '油浸式变压器', 1, 348, '数据', 415, 'c)相(mΩ)', 1, '10.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (833, 28, 27, 50, '油浸式变压器', 1, 350, '数据', 416, 'Am相(mΩ)', 1, '6.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (834, 28, 27, 50, '油浸式变压器', 1, 350, '数据', 417, 'Bm相(mΩ)', 1, '12.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (835, 28, 27, 50, '油浸式变压器', 1, 350, '数据', 418, 'Cm相(mΩ)', 1, '13.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (836, 28, 27, 50, '油浸式变压器', 1, 352, '1.0', 419, 'A相(mΩ)', 1, '5.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (837, 28, 27, 50, '油浸式变压器', 1, 352, '1.0', 420, 'B相(mΩ)', 1, '7.0', '2019-01-10 20:36:51');
INSERT INTO `data` VALUES (838, 28, 27, 50, '油浸式变压器', 1, 352, '1.0', 421, 'C相(mΩ)', 1, '9.0', '2019-01-10 20:36:51');

-- ----------------------------
-- Table structure for defaultdata
-- ----------------------------
DROP TABLE IF EXISTS `defaultdata`;
CREATE TABLE `defaultdata`  (
  `defaultID` int(11) NOT NULL AUTO_INCREMENT,
  `devID` int(11) NULL DEFAULT NULL,
  `proID` int(11) NULL DEFAULT NULL,
  `testOrder` int(11) NULL DEFAULT NULL,
  `recordID` int(11) NULL DEFAULT NULL,
  `itemID` int(11) NULL DEFAULT NULL,
  `dataval` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`defaultID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for devattrval
-- ----------------------------
DROP TABLE IF EXISTS `devattrval`;
CREATE TABLE `devattrval`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `attrID` int(11) NULL DEFAULT NULL,
  `attrName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `devID` int(11) NULL DEFAULT NULL,
  `arrtVal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device`  (
  `devID` int(11) NOT NULL AUTO_INCREMENT,
  `runNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `devName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `initNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lineNumber` int(11) NULL DEFAULT NULL,
  `volStep` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `buildtime` datetime(0) NULL DEFAULT NULL,
  `usetime` datetime(0) NULL DEFAULT NULL,
  `modNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `factory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `plateUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `devUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `devTypeID` int(11) NULL DEFAULT NULL,
  `staID` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`devID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES (1, '11241094', '设备1', '12315415', 23526, '35KV', '2019-01-04 15:22:47', '2019-01-04 15:22:50', '23542-068-885', '武汉特试特', '0', 'E:/image/address.png', 'E:/image/device2.png', 6, 8, '备注', '2018-12-07 13:36:50');
INSERT INTO `device` VALUES (2, NULL, '新设备', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 6, -1, NULL, '2019-01-05 13:58:48');

-- ----------------------------
-- Table structure for devicefile
-- ----------------------------
DROP TABLE IF EXISTS `devicefile`;
CREATE TABLE `devicefile`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fileID` int(11) NULL DEFAULT NULL,
  `devID` int(11) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of devicefile
-- ----------------------------
INSERT INTO `devicefile` VALUES (7, 22, 1, '2019-01-05 13:57:27');

-- ----------------------------
-- Table structure for devtype
-- ----------------------------
DROP TABLE IF EXISTS `devtype`;
CREATE TABLE `devtype`  (
  `typeID` int(11) NOT NULL AUTO_INCREMENT,
  `typeCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pTypeID` int(11) NULL DEFAULT NULL,
  `depth` int(11) NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  `addTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`typeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of devtype
-- ----------------------------
INSERT INTO `devtype` VALUES (1, NULL, '类型1', 0, 1, 1, '2018-11-20 15:26:23');
INSERT INTO `devtype` VALUES (2, NULL, '类型2', 0, 1, 2, '2018-11-20 15:26:20');
INSERT INTO `devtype` VALUES (3, NULL, '类型3', 0, 1, 3, '2018-11-20 15:26:17');
INSERT INTO `devtype` VALUES (4, NULL, '类型1-1', 1, 2, 1, '2018-11-20 15:45:43');
INSERT INTO `devtype` VALUES (5, NULL, '类型1-2', 1, 2, 2, '2018-11-20 15:26:10');
INSERT INTO `devtype` VALUES (6, NULL, '类型2-1', 2, 2, 1, '2018-11-20 15:26:12');
INSERT INTO `devtype` VALUES (7, NULL, '类型3-1', 3, 2, 1, '2018-11-20 15:24:44');
INSERT INTO `devtype` VALUES (8, NULL, '类型1-1-1', 4, 3, 1, '2018-11-20 15:24:48');
INSERT INTO `devtype` VALUES (9, NULL, '类型1-1-2', 4, 3, 2, '2018-11-20 15:26:26');
INSERT INTO `devtype` VALUES (10, NULL, '类型1-2-1', 5, 3, 1, '2018-11-20 15:26:29');
INSERT INTO `devtype` VALUES (11, NULL, '类型4', 0, NULL, NULL, '0000-00-00 00:00:00');
INSERT INTO `devtype` VALUES (12, NULL, '类型5', 0, NULL, NULL, '2018-11-21 13:07:12');
INSERT INTO `devtype` VALUES (13, NULL, '类型6', 0, NULL, NULL, '2018-11-22 14:25:25');

-- ----------------------------
-- Table structure for es
-- ----------------------------
DROP TABLE IF EXISTS `es`;
CREATE TABLE `es`  (
  `ID` int(11) NOT NULL,
  `ESUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `fileID` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fileType` int(11) NULL DEFAULT 0 COMMENT '0,文件1，图片，2音频，3，视频',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`fileID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (1, '一张图片', 0, 'E:\\image\\数据库ER图.jpg', '图片备注', '2018-12-28 12:40:17');
INSERT INTO `file` VALUES (2, '一个文件', 1, 'E:\\file\\三项油浸式变压器.xlsx', '文件备注', '2018-12-28 12:41:20');
INSERT INTO `file` VALUES (3, '02', 0, 'E:\\image\\02.png', '02的备注', '2018-12-28 13:32:08');
INSERT INTO `file` VALUES (4, '03', 0, 'E:\\image\\03.png', '03的备注', '2018-12-28 13:33:18');
INSERT INTO `file` VALUES (5, 'timg', 0, 'E:/image/timg.jpg', NULL, '2019-01-04 10:21:24');
INSERT INTO `file` VALUES (7, 'timg', 0, 'E:/image/timg.jpg', NULL, '2019-01-04 10:55:08');
INSERT INTO `file` VALUES (8, 'device', 0, 'E:/image/device.png', NULL, '2019-01-04 11:15:28');
INSERT INTO `file` VALUES (9, 'device', 0, 'E:/image/device.png', NULL, '2019-01-04 13:56:43');
INSERT INTO `file` VALUES (10, 'ins', 0, 'E:/image/ins.png', NULL, '2019-01-04 13:58:07');
INSERT INTO `file` VALUES (11, 'device1', 0, 'E:/image/device1.png', NULL, '2019-01-04 13:58:37');
INSERT INTO `file` VALUES (12, 'device', 0, 'E:/image/device.png', NULL, '2019-01-04 14:40:25');
INSERT INTO `file` VALUES (13, 'device', 0, 'E:/image/device.png', NULL, '2019-01-04 14:40:38');
INSERT INTO `file` VALUES (14, 'device1', 0, 'E:/image/device1.png', NULL, '2019-01-04 15:18:07');
INSERT INTO `file` VALUES (15, 'device4', 0, 'E:/image/device4.png', NULL, '2019-01-04 15:18:17');
INSERT INTO `file` VALUES (16, '云试验管理系统', 1, 'E:/image/云试验管理系统.zip', NULL, '2019-01-05 10:29:01');
INSERT INTO `file` VALUES (17, 'device1.png', 1, 'E:/image/device1.png', NULL, '2019-01-05 13:50:01');
INSERT INTO `file` VALUES (18, 'items.png', 1, 'E:/image/items.png', NULL, '2019-01-05 13:50:15');
INSERT INTO `file` VALUES (19, 'address.png', 1, 'E:/image/address.png', NULL, '2019-01-05 13:54:27');
INSERT INTO `file` VALUES (20, 'device.png', 1, 'E:/image/device.png', NULL, '2019-01-05 13:54:33');
INSERT INTO `file` VALUES (21, 'address.png', 1, 'E:/image/address.png', NULL, '2019-01-05 13:57:19');
INSERT INTO `file` VALUES (22, 'device1.png', 1, 'E:/image/device1.png', NULL, '2019-01-05 13:57:27');
INSERT INTO `file` VALUES (23, 'PTMS系统部分功能', 1, 'E:/image/PTMS系统部分功能.docx', NULL, '2019-01-06 13:59:03');
INSERT INTO `file` VALUES (24, 'device4', 1, 'E:/image/device4.png', NULL, '2019-01-06 13:59:31');
INSERT INTO `file` VALUES (25, 'device', 1, 'E:/image/device.png', NULL, '2019-01-06 14:00:46');
INSERT INTO `file` VALUES (26, 'items', 1, 'E:/image/items.png', NULL, '2019-01-06 14:03:40');
INSERT INTO `file` VALUES (27, 'PTMS系统部分功能.docx', 1, 'E:/image/PTMS系统部分功能.docx', NULL, '2019-01-06 14:32:15');
INSERT INTO `file` VALUES (28, '02.png', 1, 'E:/image/02.png', 'i', '2019-01-08 20:18:54');
INSERT INTO `file` VALUES (29, '0.png', 1, 'E:/image/0.png', '1', '2019-01-08 20:21:17');
INSERT INTO `file` VALUES (30, '1.png', 1, 'E:/image/1.png', '', '2019-01-08 20:21:17');
INSERT INTO `file` VALUES (31, '1.png', 1, 'E:/image/1.png', '1', '2019-01-08 20:27:18');
INSERT INTO `file` VALUES (32, '2.png', 1, 'E:/image/2.png', '', '2019-01-08 20:27:18');
INSERT INTO `file` VALUES (33, '1.png', 1, 'E:/image/1.png', '1', '2019-01-08 20:29:29');
INSERT INTO `file` VALUES (34, '2.png', 1, 'E:/image/2.png', '2', '2019-01-08 20:29:29');
INSERT INTO `file` VALUES (35, '1.png', 1, 'E:/image/1.png', '', '2019-01-08 20:30:47');
INSERT INTO `file` VALUES (36, '2.png', 1, 'E:/image/2.png', '', '2019-01-08 20:30:47');
INSERT INTO `file` VALUES (37, '站点地图.png', 1, 'E:/image/站点地图.png', '', '2019-01-08 20:30:47');
INSERT INTO `file` VALUES (38, '1.png', 1, 'E:/image/1.png', '1', '2019-01-08 20:36:52');
INSERT INTO `file` VALUES (39, '2.png', 1, 'E:/image/2.png', '2', '2019-01-08 20:36:52');
INSERT INTO `file` VALUES (40, '3.png', 1, 'E:/image/3.png', '3', '2019-01-08 20:36:52');
INSERT INTO `file` VALUES (41, '1.png', 1, 'E:/image/1.png', '1', '2019-01-08 20:37:27');
INSERT INTO `file` VALUES (42, '2.png', 1, 'E:/image/2.png', '2', '2019-01-08 20:37:27');
INSERT INTO `file` VALUES (43, '3.png', 1, 'E:/image/3.png', '', '2019-01-08 20:37:27');
INSERT INTO `file` VALUES (44, '1.png', 1, 'E:/image/1.png', '1', '2019-01-08 20:53:30');
INSERT INTO `file` VALUES (45, '2.png', 1, 'E:/image/2.png', '2', '2019-01-08 20:53:30');
INSERT INTO `file` VALUES (46, '3.png', 1, 'E:/image/3.png', '', '2019-01-08 20:53:30');
INSERT INTO `file` VALUES (47, '1.png', 1, 'E:/image/1.png', '1', '2019-01-08 20:54:29');
INSERT INTO `file` VALUES (48, '2.png', 1, 'E:/image/2.png', '2', '2019-01-08 20:54:29');
INSERT INTO `file` VALUES (49, '3.png', 1, 'E:/image/3.png', '', '2019-01-08 20:54:29');
INSERT INTO `file` VALUES (50, '1.png', 1, 'E:/image/1.png', '1', '2019-01-08 20:56:30');
INSERT INTO `file` VALUES (51, '2.png', 1, 'E:/image/2.png', '2', '2019-01-08 20:56:30');
INSERT INTO `file` VALUES (52, '3.png', 1, 'E:/image/3.png', '3', '2019-01-08 20:56:30');
INSERT INTO `file` VALUES (53, '1.png', 1, 'E:/image/1.png', '', '2019-01-08 21:00:38');
INSERT INTO `file` VALUES (54, '1.png', 1, 'E:/image/1.png', '1', '2019-01-09 15:40:40');
INSERT INTO `file` VALUES (55, '2.png', 1, 'E:/image/2.png', '2', '2019-01-09 15:40:40');
INSERT INTO `file` VALUES (56, '1.png', 1, '/upload/image/1.png', '11', '2019-01-09 19:33:08');
INSERT INTO `file` VALUES (57, '1.png', 1, '/upload/image/1.png', NULL, '2019-01-09 22:59:15');
INSERT INTO `file` VALUES (58, '2.png', 1, '/upload/image/2.png', NULL, '2019-01-09 22:59:15');
INSERT INTO `file` VALUES (59, '1.png', 1, '/upload/image/1.png', NULL, '2019-01-09 23:06:13');
INSERT INTO `file` VALUES (60, '1.png', 1, '/upload/image/1.png', NULL, '2019-01-09 23:06:47');
INSERT INTO `file` VALUES (61, '1.png', 1, '/upload/image/1.png', '', '2019-01-09 23:07:17');
INSERT INTO `file` VALUES (62, '1.png', 1, '/upload/image/1.png', '', '2019-01-09 23:11:51');
INSERT INTO `file` VALUES (63, '2.png', 1, '/upload/image/2.png', '', '2019-01-09 23:11:51');
INSERT INTO `file` VALUES (64, '3.png', 1, '/upload/image/3.png', '3', '2019-01-09 23:11:51');
INSERT INTO `file` VALUES (65, '1.png', 1, '/upload/image/1.png', '', '2019-01-10 12:41:22');
INSERT INTO `file` VALUES (66, '2.png', 1, '/upload/image/2.png', '', '2019-01-10 12:41:22');
INSERT INTO `file` VALUES (67, '1.png', 1, '/upload/image/1.png', '1', '2019-01-10 15:17:55');
INSERT INTO `file` VALUES (68, '1.png', 1, '/upload/image/1.png', '', '2019-01-10 15:58:35');
INSERT INTO `file` VALUES (69, '2.png', 1, '/upload/image/2.png', '2', '2019-01-10 15:58:35');
INSERT INTO `file` VALUES (70, '1.png', 1, '/upload/image/1.png', '', '2019-01-10 16:06:04');
INSERT INTO `file` VALUES (71, '站点地图.png', 1, '/upload/image/站点地图.png', '', '2019-01-10 16:06:04');
INSERT INTO `file` VALUES (72, 'img_logo.png', 1, '/upload/image/img_logo.png', '', '2019-01-10 16:06:04');
INSERT INTO `file` VALUES (73, '1.png', 1, '/upload/image/1.png', '', '2019-01-10 16:12:46');
INSERT INTO `file` VALUES (74, '2.png', 1, '/upload/image/2.png', '', '2019-01-10 16:13:07');
INSERT INTO `file` VALUES (75, '1.png', 1, '/upload/image/1.png', '1', '2019-01-10 16:35:45');
INSERT INTO `file` VALUES (76, '2.png', 1, '/upload/image/2.png', '2', '2019-01-10 16:35:45');
INSERT INTO `file` VALUES (77, '3.png', 1, '/upload/image/3.png', '3', '2019-01-10 16:35:45');
INSERT INTO `file` VALUES (78, '站点列表.png', 1, '/upload/image/站点列表.png', '3', '2019-01-10 16:36:18');
INSERT INTO `file` VALUES (79, 'img_company.png', 1, '/upload/image/img_company.png', '2', '2019-01-10 16:36:18');
INSERT INTO `file` VALUES (80, '站点地图.png', 1, '/upload/image/站点地图.png', '2', '2019-01-10 16:40:49');
INSERT INTO `file` VALUES (81, '1.png', 1, '/upload/image/1.png', '2', '2019-01-10 16:46:20');
INSERT INTO `file` VALUES (82, '2.png', 1, '/upload/image/2.png', '3', '2019-01-10 16:46:20');
INSERT INTO `file` VALUES (83, '1.png', 1, '/upload/image/1.png', '3', '2019-01-10 19:21:48');
INSERT INTO `file` VALUES (84, '2.png', 1, '/upload/image/2.png', '3', '2019-01-10 19:21:48');
INSERT INTO `file` VALUES (85, '2.png', 1, '/upload/image/2.png', '3', '2019-01-10 19:36:39');
INSERT INTO `file` VALUES (86, '3.png', 1, '/upload/image/3.png', '2', '2019-01-10 19:36:39');
INSERT INTO `file` VALUES (87, '1.png', 1, '/upload/image/1.png', '1', '2019-01-10 19:38:02');
INSERT INTO `file` VALUES (88, '2.png', 1, '/upload/image/2.png', '2', '2019-01-10 19:38:02');
INSERT INTO `file` VALUES (89, '3.png', 1, '/upload/image/3.png', '3', '2019-01-10 19:38:02');

-- ----------------------------
-- Table structure for instrument
-- ----------------------------
DROP TABLE IF EXISTS `instrument`;
CREATE TABLE `instrument`  (
  `insID` int(11) NOT NULL AUTO_INCREMENT,
  `insName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `insNumber` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `factory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` int(11) NULL DEFAULT 1 COMMENT '//1正常工作，0维修中，2报废',
  `initNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `usetime` datetime(0) NULL DEFAULT NULL,
  `inittime` datetime(0) NULL DEFAULT NULL,
  `insUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `plateUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `valtime` datetime(0) NULL DEFAULT NULL,
  `modNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`insID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of instrument
-- ----------------------------
INSERT INTO `instrument` VALUES (1, '电阻测试仪', 'DYCSY001', 'tst', 0, '4135162', '2019-01-05 15:36:30', '2019-01-05 15:36:33', 'E:/image/device1.png', 'E:/image/device.png', '2019-01-05 15:36:58', '型211578-1xfs', '备注一下', '2018-12-21 13:28:56');

-- ----------------------------
-- Table structure for instrumentfile
-- ----------------------------
DROP TABLE IF EXISTS `instrumentfile`;
CREATE TABLE `instrumentfile`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fileID` int(11) NULL DEFAULT NULL,
  `insID` int(11) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of instrumentfile
-- ----------------------------
INSERT INTO `instrumentfile` VALUES (1, 25, 1, '2019-01-06 14:00:46');
INSERT INTO `instrumentfile` VALUES (3, 27, 1, '2019-01-06 14:32:15');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemVal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recordID` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`itemID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (37, '温度', 'STRING', '20℃', 58);
INSERT INTO `item` VALUES (38, '湿度', 'NUMERIC', '0.0', 60);
INSERT INTO `item` VALUES (39, 'AB', 'NUMERIC', '2.0', 62);
INSERT INTO `item` VALUES (40, 'BC', 'NUMERIC', '3.0', 62);
INSERT INTO `item` VALUES (41, 'CA', 'NUMERIC', '4.0', 62);
INSERT INTO `item` VALUES (42, '误差 ', 'FORMULA', '0.5', 62);
INSERT INTO `item` VALUES (43, 'AB', 'BLANK', '', 64);
INSERT INTO `item` VALUES (44, 'BC', 'BLANK', '', 64);
INSERT INTO `item` VALUES (45, 'CA', 'BLANK', '', 64);
INSERT INTO `item` VALUES (46, '误差 ', 'FORMULA', '0.0', 64);
INSERT INTO `item` VALUES (47, 'AB', 'NUMERIC', '1.0', 66);
INSERT INTO `item` VALUES (48, 'BC', 'NUMERIC', '2.0', 66);
INSERT INTO `item` VALUES (49, 'CA', 'NUMERIC', '3.0', 66);
INSERT INTO `item` VALUES (50, '误差 ', 'FORMULA', '0.6666666666666666', 66);
INSERT INTO `item` VALUES (51, '温度', 'NUMERIC', '2.0', 68);
INSERT INTO `item` VALUES (52, '湿度', 'NUMERIC', '2.0', 70);
INSERT INTO `item` VALUES (53, 'AB', 'NUMERIC', '3.0', 72);
INSERT INTO `item` VALUES (54, 'BC', 'NUMERIC', '4.0', 72);
INSERT INTO `item` VALUES (55, 'CA', 'NUMERIC', '5.0', 72);
INSERT INTO `item` VALUES (56, '误差 ', 'FORMULA', '0.4', 72);
INSERT INTO `item` VALUES (57, 'AB', 'NUMERIC', '7.0', 74);
INSERT INTO `item` VALUES (58, 'BC', 'NUMERIC', '8.0', 74);
INSERT INTO `item` VALUES (59, 'CA', 'NUMERIC', '9.0', 74);
INSERT INTO `item` VALUES (60, '误差 ', 'FORMULA', '0.2222222222222222', 74);
INSERT INTO `item` VALUES (61, 'AB', 'NUMERIC', '11.0', 76);
INSERT INTO `item` VALUES (62, 'BC', 'NUMERIC', '12.0', 76);
INSERT INTO `item` VALUES (63, 'CA', 'NUMERIC', '13.0', 76);
INSERT INTO `item` VALUES (64, '误差 ', 'FORMULA', '0.15384615384615385', 76);
INSERT INTO `item` VALUES (65, '温度', 'NUMERIC', '2.0', 78);
INSERT INTO `item` VALUES (66, '湿度', 'NUMERIC', '2.0', 80);
INSERT INTO `item` VALUES (67, 'AB', 'NUMERIC', '3.0', 82);
INSERT INTO `item` VALUES (68, 'BC', 'NUMERIC', '4.0', 82);
INSERT INTO `item` VALUES (69, 'CA', 'NUMERIC', '5.0', 82);
INSERT INTO `item` VALUES (70, '误差 ', 'FORMULA', '0.4', 82);
INSERT INTO `item` VALUES (71, 'AB', 'NUMERIC', '7.0', 84);
INSERT INTO `item` VALUES (72, 'BC', 'NUMERIC', '8.0', 84);
INSERT INTO `item` VALUES (73, 'CA', 'NUMERIC', '9.0', 84);
INSERT INTO `item` VALUES (74, '误差 ', 'FORMULA', '0.2222222222222222', 84);
INSERT INTO `item` VALUES (75, 'AB', 'NUMERIC', '11.0', 86);
INSERT INTO `item` VALUES (76, 'BC', 'NUMERIC', '12.0', 86);
INSERT INTO `item` VALUES (77, 'CA', 'NUMERIC', '13.0', 86);
INSERT INTO `item` VALUES (78, '误差 ', 'FORMULA', '0.15384615384615385', 86);
INSERT INTO `item` VALUES (79, '温度', 'NUMERIC', '2.0', 88);
INSERT INTO `item` VALUES (80, '湿度', 'NUMERIC', '2.0', 90);
INSERT INTO `item` VALUES (81, 'AB', 'NUMERIC', '3.0', 92);
INSERT INTO `item` VALUES (82, 'BC', 'NUMERIC', '4.0', 92);
INSERT INTO `item` VALUES (83, 'CA', 'NUMERIC', '5.0', 92);
INSERT INTO `item` VALUES (84, '误差 ', 'FORMULA', '0.4', 92);
INSERT INTO `item` VALUES (85, 'AB', 'NUMERIC', '7.0', 94);
INSERT INTO `item` VALUES (86, 'BC', 'NUMERIC', '8.0', 94);
INSERT INTO `item` VALUES (87, 'CA', 'NUMERIC', '9.0', 94);
INSERT INTO `item` VALUES (88, '误差 ', 'FORMULA', '0.2222222222222222', 94);
INSERT INTO `item` VALUES (89, 'AB', 'NUMERIC', '11.0', 96);
INSERT INTO `item` VALUES (90, 'BC', 'NUMERIC', '12.0', 96);
INSERT INTO `item` VALUES (91, 'CA', 'NUMERIC', '13.0', 96);
INSERT INTO `item` VALUES (92, '误差 ', 'FORMULA', '0.15384615384615385', 96);

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan`  (
  `planID` int(11) NOT NULL AUTO_INCREMENT,
  `planName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cycType` int(11) NULL DEFAULT 0 COMMENT '//0：不循环，1：每天，2：每周，3：每月，4：每个季度，5：每年',
  `builderID` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0 COMMENT '0未执行，1已执行，-1停止执行',
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`planID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES (1, '立即执行的计划', 0, 1, -1, '2019-01-07 14:47:37');
INSERT INTO `plan` VALUES (2, '周期计划1', 2, 1, -1, '2018-12-12 10:21:58');
INSERT INTO `plan` VALUES (8, '新模板', 3, 1, -1, '2019-01-07 14:51:12');
INSERT INTO `plan` VALUES (10, '模板3', 4, 1, -1, '2019-01-08 16:07:47');
INSERT INTO `plan` VALUES (11, '模板2', 4, 1, -1, '2019-01-08 16:08:39');

-- ----------------------------
-- Table structure for plandan
-- ----------------------------
DROP TABLE IF EXISTS `plandan`;
CREATE TABLE `plandan`  (
  `planDanID` int(11) NOT NULL AUTO_INCREMENT,
  `planDanNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cycType` int(11) NULL DEFAULT NULL,
  `cycTime` datetime(0) NULL DEFAULT NULL,
  `staID` int(11) NULL DEFAULT NULL,
  `planID` int(11) NULL DEFAULT NULL,
  `builderID` int(11) NULL DEFAULT NULL,
  `leaderID` int(11) NULL DEFAULT NULL,
  `endtime` datetime(0) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL COMMENT '0,进行中，1已完成，2已终止',
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`planDanID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of plandan
-- ----------------------------
INSERT INTO `plandan` VALUES (1, '3526747235', 1, '2019-01-09 15:26:55', 11, 1, -1, 42, NULL, -1, '2019-01-08 15:26:55');
INSERT INTO `plandan` VALUES (4, '', 0, '2019-01-08 15:30:07', 4, -1, -1, 43, NULL, -1, '2019-01-08 15:30:07');

-- ----------------------------
-- Table structure for plantest
-- ----------------------------
DROP TABLE IF EXISTS `plantest`;
CREATE TABLE `plantest`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `planID` int(11) NULL DEFAULT NULL,
  `soluID` int(11) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of plantest
-- ----------------------------
INSERT INTO `plantest` VALUES (3, 2, 1, '2019-01-07 14:04:32');
INSERT INTO `plantest` VALUES (4, 2, 10, '2019-01-07 14:04:46');
INSERT INTO `plantest` VALUES (5, 2, 2, '2019-01-07 14:04:53');
INSERT INTO `plantest` VALUES (7, 1, 2, '2019-01-07 14:47:37');
INSERT INTO `plantest` VALUES (8, 1, 10, '2019-01-07 14:47:37');
INSERT INTO `plantest` VALUES (9, 1, 1, '2019-01-07 14:47:37');
INSERT INTO `plantest` VALUES (12, 8, 2, '2019-01-07 14:51:12');
INSERT INTO `plantest` VALUES (13, 8, 10, '2019-01-07 14:51:12');
INSERT INTO `plantest` VALUES (27, 10, 2, '2019-01-08 16:07:47');
INSERT INTO `plantest` VALUES (28, 10, 10, '2019-01-08 16:07:47');
INSERT INTO `plantest` VALUES (29, 10, 2, '2019-01-08 16:07:47');
INSERT INTO `plantest` VALUES (30, 10, 10, '2019-01-08 16:07:47');
INSERT INTO `plantest` VALUES (31, 10, 2, '2019-01-08 16:07:47');
INSERT INTO `plantest` VALUES (32, 10, 10, '2019-01-08 16:07:47');
INSERT INTO `plantest` VALUES (33, 11, 2, '2019-01-08 16:08:39');
INSERT INTO `plantest` VALUES (34, 11, 10, '2019-01-08 16:08:39');
INSERT INTO `plantest` VALUES (35, 11, 2, '2019-01-08 16:08:39');
INSERT INTO `plantest` VALUES (36, 11, 10, '2019-01-08 16:08:39');
INSERT INTO `plantest` VALUES (37, 11, 2, '2019-01-08 16:08:39');
INSERT INTO `plantest` VALUES (38, 11, 10, '2019-01-08 16:08:39');

-- ----------------------------
-- Table structure for pro
-- ----------------------------
DROP TABLE IF EXISTS `pro`;
CREATE TABLE `pro`  (
  `proID` int(11) NOT NULL AUTO_INCREMENT,
  `proName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `devTypeID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`proID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pro
-- ----------------------------
INSERT INTO `pro` VALUES (25, '直流电阻模板', 'E:/file/直流电阻模板.xlsx', 4);
INSERT INTO `pro` VALUES (26, '直流电阻模板', 'E:/file/直流电阻模板.xlsx', 4);
INSERT INTO `pro` VALUES (27, '直流电阻模板', 'E:/file/直流电阻模板.xlsx', 7);
INSERT INTO `pro` VALUES (28, '直流电阻模板', 'E:/file/直流电阻模板.xlsx', 4);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `recordID` int(11) NOT NULL AUTO_INCREMENT,
  `recordName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pRecID` int(11) NULL DEFAULT NULL,
  `proID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`recordID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (57, '温度', 0, 25);
INSERT INTO `record` VALUES (58, '温度', 57, 25);
INSERT INTO `record` VALUES (59, '湿度', 0, 25);
INSERT INTO `record` VALUES (60, '湿度', 59, 25);
INSERT INTO `record` VALUES (61, '低压绕阻', 0, 25);
INSERT INTO `record` VALUES (62, '数据', 61, 25);
INSERT INTO `record` VALUES (63, '中压绕阻', 0, 25);
INSERT INTO `record` VALUES (64, '数据', 63, 25);
INSERT INTO `record` VALUES (65, '高压绕阻', 0, 25);
INSERT INTO `record` VALUES (66, '1.0', 65, 25);
INSERT INTO `record` VALUES (67, '温度', 0, 26);
INSERT INTO `record` VALUES (68, '温度', 67, 26);
INSERT INTO `record` VALUES (69, '湿度', 0, 26);
INSERT INTO `record` VALUES (70, '湿度', 69, 26);
INSERT INTO `record` VALUES (71, '低压绕阻', 0, 26);
INSERT INTO `record` VALUES (72, '数据', 71, 26);
INSERT INTO `record` VALUES (73, '中压绕阻', 0, 26);
INSERT INTO `record` VALUES (74, '数据', 73, 26);
INSERT INTO `record` VALUES (75, '高压绕阻', 0, 26);
INSERT INTO `record` VALUES (76, '1.0', 75, 26);
INSERT INTO `record` VALUES (77, '温度', 0, 27);
INSERT INTO `record` VALUES (78, '温度', 77, 27);
INSERT INTO `record` VALUES (79, '湿度', 0, 27);
INSERT INTO `record` VALUES (80, '湿度', 79, 27);
INSERT INTO `record` VALUES (81, '低压绕阻', 0, 27);
INSERT INTO `record` VALUES (82, '数据', 81, 27);
INSERT INTO `record` VALUES (83, '中压绕阻', 0, 27);
INSERT INTO `record` VALUES (84, '数据', 83, 27);
INSERT INTO `record` VALUES (85, '高压绕阻', 0, 27);
INSERT INTO `record` VALUES (86, '1.0', 85, 27);
INSERT INTO `record` VALUES (87, '温度', 0, 28);
INSERT INTO `record` VALUES (88, '温度', 87, 28);
INSERT INTO `record` VALUES (89, '湿度', 0, 28);
INSERT INTO `record` VALUES (90, '湿度', 89, 28);
INSERT INTO `record` VALUES (91, '低压绕阻', 0, 28);
INSERT INTO `record` VALUES (92, '数据', 91, 28);
INSERT INTO `record` VALUES (93, '中压绕阻', 0, 28);
INSERT INTO `record` VALUES (94, '数据', 93, 28);
INSERT INTO `record` VALUES (95, '高压绕阻', 0, 28);
INSERT INTO `record` VALUES (96, '1.0', 95, 28);

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `reportID` int(11) NOT NULL AUTO_INCREMENT,
  `reportCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reportName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `planDanID` int(11) NULL DEFAULT NULL,
  `testID` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0 COMMENT '0进行中，1已完成',
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`reportID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES (1, 'testcode', '报告名字', 'E:/reportPDF/报告名字.xlsx', NULL, 27, 0, '2018-12-11 09:26:12');
INSERT INTO `report` VALUES (39, '201812131920008700', '每天的计划2018-12-13', NULL, NULL, 27, 0, '2018-12-13 19:20:00');
INSERT INTO `report` VALUES (40, '201812131920006901', '每天的计划2018-12-13', NULL, NULL, 28, 0, '2018-12-13 19:20:00');
INSERT INTO `report` VALUES (41, '201812140115026744', '每天的计划2018-12-14', NULL, NULL, 27, 0, '2018-12-14 01:15:00');
INSERT INTO `report` VALUES (42, '201812140115022012', '每天的计划2018-12-14', NULL, NULL, 28, 0, '2018-12-14 01:15:00');
INSERT INTO `report` VALUES (43, '201812150115008606', '每天的计划2018-12-15', NULL, NULL, 27, 0, '2018-12-15 01:15:00');
INSERT INTO `report` VALUES (44, '201812150115022926', '每天的计划2018-12-15', NULL, NULL, 28, 0, '2018-12-15 01:15:00');

-- ----------------------------
-- Table structure for repprofile
-- ----------------------------
DROP TABLE IF EXISTS `repprofile`;
CREATE TABLE `repprofile`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `reportID` int(11) NULL DEFAULT NULL,
  `taskID` int(11) NULL DEFAULT NULL,
  `proID` int(11) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `workerID` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0 COMMENT '0正在进行，1已完成',
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of repprofile
-- ----------------------------
INSERT INTO `repprofile` VALUES (1, 1, 7, 25, 'E:\\testFile\\直流电阻模板2726.xlsx', -1, 2, '2018-12-13 13:27:11');
INSERT INTO `repprofile` VALUES (2, 1, 7, 26, 'E:/testFile/直流电阻模板2726.xlsx', -1, 0, '2018-12-13 14:12:48');
INSERT INTO `repprofile` VALUES (47, 39, 7, 25, NULL, 40, 0, '2018-12-13 19:20:00');
INSERT INTO `repprofile` VALUES (48, 39, 7, 26, NULL, 40, 0, '2018-12-13 19:20:00');
INSERT INTO `repprofile` VALUES (49, 40, 9, 27, NULL, 1, 0, '2018-12-13 19:20:00');
INSERT INTO `repprofile` VALUES (50, 41, 7, 25, 'E:\\testFile\\直流电阻模板rep41task7pro25.xlsx', 40, 2, '2018-12-14 01:15:02');
INSERT INTO `repprofile` VALUES (51, 41, 7, 26, 'E:\\testFile\\直流电阻模板rep44task9pro27.xlsx', 40, 0, '2018-12-14 01:15:02');
INSERT INTO `repprofile` VALUES (52, 42, 9, 27, 'E:\\testFile\\直流电阻模板rep1task7pro25.xlsx', 1, 2, '2018-12-14 01:15:02');
INSERT INTO `repprofile` VALUES (53, 43, 7, 25, 'E:\\testFile\\直流电阻模板rep43task7pro25.xlsx', 40, 2, '2018-12-15 01:15:00');
INSERT INTO `repprofile` VALUES (54, 43, 7, 26, NULL, 40, 0, '2018-12-15 01:15:00');
INSERT INTO `repprofile` VALUES (55, 44, 9, 27, 'E:\\testFile\\直流电阻模板rep44task9pro27.xlsx', 1, 0, '2018-12-15 01:15:02');

-- ----------------------------
-- Table structure for solupro
-- ----------------------------
DROP TABLE IF EXISTS `solupro`;
CREATE TABLE `solupro`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `soluID` int(11) NULL DEFAULT NULL,
  `proID` int(11) NULL DEFAULT NULL,
  `proName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of solupro
-- ----------------------------
INSERT INTO `solupro` VALUES (22, 2, 25, '直流电阻模板', '2018-12-11 14:10:24');
INSERT INTO `solupro` VALUES (23, 2, 26, '直流电阻模板', '2018-12-11 14:10:24');
INSERT INTO `solupro` VALUES (24, 2, 27, '直流电阻模板', '2018-12-11 14:10:24');
INSERT INTO `solupro` VALUES (29, 16, 25, '直流电阻模板', '2018-12-29 14:24:13');
INSERT INTO `solupro` VALUES (30, 16, 35, '三项油浸式变压器', '2018-12-27 13:32:18');
INSERT INTO `solupro` VALUES (31, 10, 29, '直流电阻模板', '2018-12-29 14:24:24');
INSERT INTO `solupro` VALUES (32, 10, 35, '三项油浸式变压器', '2018-12-27 13:32:18');

-- ----------------------------
-- Table structure for solution
-- ----------------------------
DROP TABLE IF EXISTS `solution`;
CREATE TABLE `solution`  (
  `soluID` int(11) NOT NULL AUTO_INCREMENT,
  `soluName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `devTypeID` int(11) NULL DEFAULT NULL,
  `builderID` int(11) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`soluID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of solution
-- ----------------------------
INSERT INTO `solution` VALUES (2, '方案二', 6, 1, '2018-12-11 14:10:24');
INSERT INTO `solution` VALUES (10, '方案三', 6, 1, '2019-01-07 17:29:02');
INSERT INTO `solution` VALUES (16, '新模板', 14, 1, '2019-01-07 17:22:49');

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station`  (
  `staID` int(11) NOT NULL AUTO_INCREMENT,
  `staName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pStaID` int(11) NULL DEFAULT NULL,
  `depth` int(255) NULL DEFAULT NULL,
  `order` int(255) NULL DEFAULT NULL,
  `longitude` float(255, 6) NULL DEFAULT NULL,
  `latitude` float(255, 6) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `addTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`staID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES (1, '武汉供电公司', 0, 1, 1, 0.000000, 0.000000, '', '2018-12-24 15:14:59');
INSERT INTO `station` VALUES (2, '黄石供电公司', 0, 1, NULL, 0.000000, 0.000000, '', '2018-12-24 15:17:19');
INSERT INTO `station` VALUES (3, '35kv变电站', 1, 2, NULL, 0.000000, 0.000000, '', '2018-12-24 15:15:32');
INSERT INTO `station` VALUES (4, '二级1-2', 1, 2, NULL, 0.000000, 0.000000, '', '2018-12-18 14:41:03');
INSERT INTO `station` VALUES (5, '二级1-3', 1, 2, NULL, 0.000000, 0.000000, '', '2018-12-18 14:41:06');
INSERT INTO `station` VALUES (6, '二级2-1', 2, 2, NULL, 0.000000, 0.000000, '', '2018-12-18 14:41:09');
INSERT INTO `station` VALUES (7, '二级2-2', 2, 2, NULL, NULL, NULL, '', '2018-11-16 13:50:52');
INSERT INTO `station` VALUES (8, '洪山区珞瑜35kv变电站', 3, 3, NULL, 116.359779, 39.962406, '12131', '2019-01-04 13:38:35');
INSERT INTO `station` VALUES (9, '三级2-2-1', 7, 3, NULL, 116.227257, 39.973984, '', '2018-12-18 14:40:19');
INSERT INTO `station` VALUES (10, '三级1-3-1', 5, 3, NULL, 0.000000, 0.000000, '', '2018-12-18 15:38:55');
INSERT INTO `station` VALUES (11, '江夏区35kv变电站', 3, 3, NULL, 116.227257, 39.911861, '', '2018-12-24 15:17:02');
INSERT INTO `station` VALUES (12, '四级1-3-1-1', 10, 4, NULL, 116.376945, 39.962406, '', '2018-12-18 14:39:45');

-- ----------------------------
-- Table structure for stationfile
-- ----------------------------
DROP TABLE IF EXISTS `stationfile`;
CREATE TABLE `stationfile`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fileID` int(11) NULL DEFAULT NULL,
  `staID` int(11) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stationfile
-- ----------------------------
INSERT INTO `stationfile` VALUES (1, 1, 11, '2018-12-28 12:41:42');
INSERT INTO `stationfile` VALUES (2, 1, 8, '2018-12-28 12:42:12');
INSERT INTO `stationfile` VALUES (3, 3, 11, '2018-12-28 13:31:31');
INSERT INTO `stationfile` VALUES (4, 4, 11, '2018-12-28 13:31:38');
INSERT INTO `stationfile` VALUES (10, 10, 8, '2019-01-04 13:58:07');
INSERT INTO `stationfile` VALUES (11, 11, 8, '2019-01-04 13:58:37');
INSERT INTO `stationfile` VALUES (14, 14, 8, '2019-01-04 15:18:07');
INSERT INTO `stationfile` VALUES (15, 15, 11, '2019-01-04 15:18:17');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tagType` int(11) NULL DEFAULT 0 COMMENT '0,站点tag，1设备tag，2人员组别',
  `pTagID` int(11) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`tagID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (-2, '未分组', 2, 0, '2019-01-07 11:16:22');
INSERT INTO `tag` VALUES (1, '标签1', 0, 0, '2018-12-28 10:39:26');
INSERT INTO `tag` VALUES (2, '标签1-1', 0, 1, '2018-12-28 10:40:04');
INSERT INTO `tag` VALUES (3, '原创', 0, 0, '2018-12-28 10:40:35');
INSERT INTO `tag` VALUES (4, '笔记', 0, 0, '2018-12-28 10:40:37');
INSERT INTO `tag` VALUES (5, '科创组', 2, 0, '2019-01-04 16:24:25');
INSERT INTO `tag` VALUES (6, '办公室', 2, 0, '2019-01-04 16:41:09');
INSERT INTO `tag` VALUES (7, '小小', 2, 0, '2019-01-06 20:39:07');

-- ----------------------------
-- Table structure for tagdevice
-- ----------------------------
DROP TABLE IF EXISTS `tagdevice`;
CREATE TABLE `tagdevice`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tagID` int(11) NULL DEFAULT NULL,
  `devID` int(11) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tagstation
-- ----------------------------
DROP TABLE IF EXISTS `tagstation`;
CREATE TABLE `tagstation`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tagID` int(11) NULL DEFAULT NULL,
  `staID` int(11) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tagstation
-- ----------------------------
INSERT INTO `tagstation` VALUES (1, 1, 9, '2018-12-28 10:41:09');
INSERT INTO `tagstation` VALUES (2, 2, 9, '2018-12-28 10:41:22');
INSERT INTO `tagstation` VALUES (3, 3, 10, '2018-12-28 10:42:09');
INSERT INTO `tagstation` VALUES (4, 1, 10, '2018-12-28 10:42:22');
INSERT INTO `tagstation` VALUES (5, 4, 11, '2018-12-28 10:42:30');
INSERT INTO `tagstation` VALUES (6, 1, 11, '2018-12-28 10:42:39');
INSERT INTO `tagstation` VALUES (7, 1, 12, '2018-12-28 10:42:46');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `taskID` int(11) NOT NULL AUTO_INCREMENT,
  `taskNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leaderID` int(11) NULL DEFAULT NULL,
  `builderID` int(11) NULL DEFAULT NULL,
  `testID` int(11) NULL DEFAULT NULL,
  `proID` int(11) NULL DEFAULT NULL,
  `proName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `devID` int(11) NULL DEFAULT NULL,
  `insID` int(11) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0 COMMENT '完成状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `endtime` datetime(0) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`taskID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (9, '3014957967-1254165790', 1, 44, 28, 27, '直流电阻模板', 1, 1, NULL, 0, '', '2019-01-09 09:57:01', '2018-12-21 15:08:05');
INSERT INTO `task` VALUES (22, '201901091150264819', 1, 44, 37, 27, '直流电阻模板', 1, 1, 'E:\\testFile\\直流电阻模板test37task22pro27.xlsx', 2, '123', '2019-01-10 10:03:18', '2019-01-09 11:50:26');
INSERT INTO `task` VALUES (23, '201901091150264375', 1, 44, 37, 27, '直流电阻模板', 1, 1, NULL, 0, NULL, '2019-01-08 10:03:23', '2019-01-09 11:50:26');
INSERT INTO `task` VALUES (24, '1241532124141', 1, 44, 28, 38, '三项油浸式变压器', 1, 1, 'E:\\testFile\\三项油浸式变压器test28task24pro38.xlsx', 0, '', NULL, '2019-01-09 19:43:14');
INSERT INTO `task` VALUES (25, '3463735632', 1, 1, 28, 45, '油浸式变压器', 1, 1, NULL, 0, '', NULL, '2019-01-10 14:38:49');
INSERT INTO `task` VALUES (26, '346735735634', 1, 1, 28, 47, '油浸式变压器', 1, 1, 'E:\\testFile\\油浸式变压器test28task26pro47.xlsx', 0, '', NULL, '2019-01-10 14:45:31');
INSERT INTO `task` VALUES (27, '346357453735', 1, 1, 28, 50, '油浸式变压器', 1, 1, 'E:\\testFile\\油浸式变压器test28task27pro50.xlsx', 1, '', '2019-01-10 20:36:57', '2019-01-10 15:12:52');
INSERT INTO `task` VALUES (28, '6r7585784', 1, 1, 35, 50, '油浸式变压器', 1, 1, 'E:\\testFile\\油浸式变压器test35task28pro50.xlsx', 1, '', '2019-01-09 19:35:24', '2019-01-10 15:13:55');
INSERT INTO `task` VALUES (29, '34637353754684', 1, 1, 36, 50, '油浸式变压器', 1, 1, 'E:\\testFile\\油浸式变压器test36task29pro50.xlsx', 1, '', '2019-01-09 19:35:35', '2019-01-10 15:14:16');
INSERT INTO `task` VALUES (30, '4678594579567', 1, 1, 37, 50, '油浸式变压器', 1, 1, 'E:\\testFile\\油浸式变压器test37task30pro50.xlsx', 1, '', '2019-01-09 22:35:47', '2019-01-10 15:14:39');
INSERT INTO `task` VALUES (31, '5t678568i57', 1, 1, 37, 50, '油浸式变压器', 1, 1, 'E:\\testFile\\油浸式变压器test37task31pro50.xlsx', 2, '', '2019-01-10 19:25:55', '2019-01-10 15:42:30');

-- ----------------------------
-- Table structure for taskfile
-- ----------------------------
DROP TABLE IF EXISTS `taskfile`;
CREATE TABLE `taskfile`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fileID` int(11) NULL DEFAULT NULL,
  `taskID` int(11) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of taskfile
-- ----------------------------
INSERT INTO `taskfile` VALUES (60, 87, 31, '2019-01-10 19:38:02');
INSERT INTO `taskfile` VALUES (61, 88, 31, '2019-01-10 19:38:02');
INSERT INTO `taskfile` VALUES (62, 89, 31, '2019-01-10 19:38:02');

-- ----------------------------
-- Table structure for taskpro
-- ----------------------------
DROP TABLE IF EXISTS `taskpro`;
CREATE TABLE `taskpro`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `taskID` int(11) NULL DEFAULT NULL,
  `proID` int(11) NULL DEFAULT NULL,
  `proName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of taskpro
-- ----------------------------
INSERT INTO `taskpro` VALUES (13, 7, 25, '直流电阻模板', '2018-12-11 14:09:54');
INSERT INTO `taskpro` VALUES (14, 7, 26, '直流电阻模板', '2018-12-11 14:09:54');
INSERT INTO `taskpro` VALUES (15, 8, 25, '直流电阻模板', '2018-12-11 14:09:54');
INSERT INTO `taskpro` VALUES (16, 9, 27, '电压模板', '2018-12-13 18:59:12');

-- ----------------------------
-- Table structure for taskuser
-- ----------------------------
DROP TABLE IF EXISTS `taskuser`;
CREATE TABLE `taskuser`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `taskID` int(11) NULL DEFAULT NULL,
  `userID` int(11) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of taskuser
-- ----------------------------
INSERT INTO `taskuser` VALUES (33, 27, 1, '2019-01-10 15:15:19');
INSERT INTO `taskuser` VALUES (34, 28, 1, '2019-01-10 15:15:27');
INSERT INTO `taskuser` VALUES (35, 29, 1, '2019-01-10 15:15:33');
INSERT INTO `taskuser` VALUES (36, 30, 1, '2019-01-10 15:15:40');
INSERT INTO `taskuser` VALUES (37, 31, 1, '2019-01-10 15:43:05');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `testID` int(11) NOT NULL AUTO_INCREMENT,
  `testNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `soluID` int(11) NULL DEFAULT NULL,
  `planDanID` int(11) NULL DEFAULT NULL,
  `builderID` int(11) NULL DEFAULT NULL,
  `leaderID` int(11) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`testID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (28, '346346', 2, 1, 1, 1, NULL, 0, '2018-12-11 15:34:02');
INSERT INTO `test` VALUES (35, '37373', 10, 1, 44, 1, NULL, 1, '2018-12-11 15:17:05');
INSERT INTO `test` VALUES (36, '4624524', 10, 1, 44, 1, NULL, 0, '2018-12-11 15:35:12');
INSERT INTO `test` VALUES (37, '7288356', 2, 1, 1, 1, NULL, 0, '2018-12-11 15:36:11');

-- ----------------------------
-- Table structure for testuser
-- ----------------------------
DROP TABLE IF EXISTS `testuser`;
CREATE TABLE `testuser`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `testID` int(11) NULL DEFAULT NULL,
  `userID` int(11) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of testuser
-- ----------------------------
INSERT INTO `testuser` VALUES (24, 35, 1, '2018-12-11 15:17:06');
INSERT INTO `testuser` VALUES (25, 35, 39, '2018-12-11 15:17:06');
INSERT INTO `testuser` VALUES (28, 28, 1, '2018-12-11 15:34:03');
INSERT INTO `testuser` VALUES (29, 28, 41, '2018-12-11 15:34:03');
INSERT INTO `testuser` VALUES (30, 36, 1, '2018-12-11 15:35:12');
INSERT INTO `testuser` VALUES (31, 36, 39, '2018-12-11 15:35:12');
INSERT INTO `testuser` VALUES (32, 37, 1, '2018-12-11 15:36:11');
INSERT INTO `testuser` VALUES (33, 37, 39, '2018-12-11 15:36:11');

-- ----------------------------
-- Table structure for typeattr
-- ----------------------------
DROP TABLE IF EXISTS `typeattr`;
CREATE TABLE `typeattr`  (
  `attrID` int(11) NOT NULL AUTO_INCREMENT,
  `attrName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typeID` int(11) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`attrID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userType` int(255) NULL DEFAULT NULL COMMENT '0，公司管理员，1公司领导，2试验人员',
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `userRealName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userPassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userSex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userMobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userMail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userNumber` int(11) NULL DEFAULT NULL,
  `userCompanyID` int(11) NULL DEFAULT NULL,
  `deptID` int(11) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  `userPic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`userID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, -1, '测试昵称', '123123123', NULL, '-1', '1231231231', '13231231', NULL, -1, 6, '2019-01-07 11:52:23', 'E:/image/ins.png');
INSERT INTO `user` VALUES (42, -1, NULL, '121313313', NULL, '-1', '23123123', '13123123', NULL, -1, -2, '2019-01-07 10:27:03', 'E:/image/ins.png');
INSERT INTO `user` VALUES (43, -1, NULL, 'qwrqwrq', NULL, '-1', '11213313', '12121212', NULL, -1, -2, '2019-01-07 11:05:05', 'E:/image/ins.png');
INSERT INTO `user` VALUES (44, -1, NULL, 'qwqrqwrq', NULL, '-1', 'qweqwe', 'qweqwe', NULL, -1, -2, '2019-01-07 11:06:36', 'E:/image/ins.png');

SET FOREIGN_KEY_CHECKS = 1;
