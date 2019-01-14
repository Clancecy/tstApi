/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100137
 Source Host           : localhost:3306
 Source Schema         : tstes

 Target Server Type    : MySQL
 Target Server Version : 100137
 File Encoding         : 65001

 Date: 12/01/2019 15:29:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `addTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`typeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
INSERT INTO `devtype` VALUES (14, NULL, '类型1-1-1', 4, 3, NULL, '2018-12-06 14:42:38');

-- ----------------------------
-- Table structure for instype
-- ----------------------------
DROP TABLE IF EXISTS `instype`;
CREATE TABLE `instype`  (
  `insTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `insTypeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pTypeID` int(11) NULL DEFAULT NULL,
  `addtime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`insTypeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 438 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
INSERT INTO `item` VALUES (93, '温度', 'NUMERIC', '2.0', 98);
INSERT INTO `item` VALUES (94, '湿度', 'NUMERIC', '2.0', 100);
INSERT INTO `item` VALUES (95, 'AB', 'NUMERIC', '3.0', 102);
INSERT INTO `item` VALUES (96, 'BC', 'NUMERIC', '4.0', 102);
INSERT INTO `item` VALUES (97, 'CA', 'NUMERIC', '5.0', 102);
INSERT INTO `item` VALUES (98, '误差 ', 'FORMULA', '0.4', 102);
INSERT INTO `item` VALUES (99, 'AB', 'NUMERIC', '7.0', 104);
INSERT INTO `item` VALUES (100, 'BC', 'NUMERIC', '8.0', 104);
INSERT INTO `item` VALUES (101, 'CA', 'NUMERIC', '9.0', 104);
INSERT INTO `item` VALUES (102, '误差 ', 'FORMULA', '0.2222222222222222', 104);
INSERT INTO `item` VALUES (103, 'AB', 'NUMERIC', '11.0', 106);
INSERT INTO `item` VALUES (104, 'BC', 'NUMERIC', '12.0', 106);
INSERT INTO `item` VALUES (105, 'CA', 'NUMERIC', '13.0', 106);
INSERT INTO `item` VALUES (106, '误差 ', 'FORMULA', '0.15384615384615385', 106);
INSERT INTO `item` VALUES (107, '试验设备', 'NUMERIC', '1.0', 108);
INSERT INTO `item` VALUES (108, '试验人员', 'NUMERIC', '2.0', 110);
INSERT INTO `item` VALUES (109, '试验日期', 'NUMERIC', '3.0', 110);
INSERT INTO `item` VALUES (110, '标准温度', 'NUMERIC', '4.0', 112);
INSERT INTO `item` VALUES (111, '标准油温', 'NUMERIC', '5.0', 112);
INSERT INTO `item` VALUES (112, '试验温度', 'NUMERIC', '6.0', 114);
INSERT INTO `item` VALUES (113, '试验油温', 'NUMERIC', '7.0', 114);
INSERT INTO `item` VALUES (114, 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', 116);
INSERT INTO `item` VALUES (115, 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', 116);
INSERT INTO `item` VALUES (116, 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', 116);
INSERT INTO `item` VALUES (117, 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', 118);
INSERT INTO `item` VALUES (118, 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', 118);
INSERT INTO `item` VALUES (119, 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', 118);
INSERT INTO `item` VALUES (120, 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', 120);
INSERT INTO `item` VALUES (121, 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', 120);
INSERT INTO `item` VALUES (122, 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', 120);
INSERT INTO `item` VALUES (123, '试验设备', 'NUMERIC', '1.0', 122);
INSERT INTO `item` VALUES (124, '试验人员', 'NUMERIC', '2.0', 124);
INSERT INTO `item` VALUES (125, '试验日期', 'NUMERIC', '3.0', 124);
INSERT INTO `item` VALUES (126, '标准温度', 'NUMERIC', '4.0', 126);
INSERT INTO `item` VALUES (127, '标准油温', 'NUMERIC', '5.0', 126);
INSERT INTO `item` VALUES (128, '试验温度', 'NUMERIC', '6.0', 128);
INSERT INTO `item` VALUES (129, '试验油温', 'NUMERIC', '7.0', 128);
INSERT INTO `item` VALUES (130, 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', 130);
INSERT INTO `item` VALUES (131, 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', 130);
INSERT INTO `item` VALUES (132, 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', 130);
INSERT INTO `item` VALUES (133, 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', 132);
INSERT INTO `item` VALUES (134, 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', 132);
INSERT INTO `item` VALUES (135, 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', 132);
INSERT INTO `item` VALUES (136, 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', 134);
INSERT INTO `item` VALUES (137, 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', 134);
INSERT INTO `item` VALUES (138, 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', 134);
INSERT INTO `item` VALUES (139, '试验设备', 'NUMERIC', '1.0', 136);
INSERT INTO `item` VALUES (140, '试验人员', 'NUMERIC', '2.0', 138);
INSERT INTO `item` VALUES (141, '试验日期', 'NUMERIC', '3.0', 138);
INSERT INTO `item` VALUES (142, '高压/中压\nAB相误差', 'NUMERIC', '4.0', 140);
INSERT INTO `item` VALUES (143, '高压/中压\nBC相误差', 'NUMERIC', '5.0', 140);
INSERT INTO `item` VALUES (144, '高压/中压\nCA相误差', 'NUMERIC', '6.0', 140);
INSERT INTO `item` VALUES (145, '高压/低压\nAB相误差', 'NUMERIC', '7.0', 140);
INSERT INTO `item` VALUES (146, '高压/低压\nBC相误差', 'NUMERIC', '8.0', 140);
INSERT INTO `item` VALUES (147, '高压/低压\nCA相误差', 'NUMERIC', '9.0', 140);
INSERT INTO `item` VALUES (148, '高压/中压\nAB相误差', 'NUMERIC', '5.0', 141);
INSERT INTO `item` VALUES (149, '高压/中压\nBC相误差', 'NUMERIC', '6.0', 141);
INSERT INTO `item` VALUES (150, '高压/中压\nCA相误差', 'NUMERIC', '7.0', 141);
INSERT INTO `item` VALUES (151, '高压/低压\nAB相误差', 'NUMERIC', '8.0', 141);
INSERT INTO `item` VALUES (152, '高压/低压\nBC相误差', 'NUMERIC', '9.0', 141);
INSERT INTO `item` VALUES (153, '高压/低压\nCA相误差', 'NUMERIC', '10.0', 141);
INSERT INTO `item` VALUES (154, '试验设备', 'NUMERIC', '1.0', 143);
INSERT INTO `item` VALUES (155, '试验人员', 'NUMERIC', '2.0', 145);
INSERT INTO `item` VALUES (156, '试验日期', 'NUMERIC', '3.0', 145);
INSERT INTO `item` VALUES (157, '高压/中压\nAB相误差', 'NUMERIC', '4.0', 147);
INSERT INTO `item` VALUES (158, '高压/中压\nBC相误差', 'NUMERIC', '5.0', 147);
INSERT INTO `item` VALUES (159, '高压/中压\nCA相误差', 'NUMERIC', '6.0', 147);
INSERT INTO `item` VALUES (160, '高压/低压\nAB相误差', 'NUMERIC', '7.0', 147);
INSERT INTO `item` VALUES (161, '高压/低压\nBC相误差', 'NUMERIC', '8.0', 147);
INSERT INTO `item` VALUES (162, '高压/低压\nCA相误差', 'NUMERIC', '9.0', 147);
INSERT INTO `item` VALUES (163, '高压/中压\nAB相误差', 'NUMERIC', '5.0', 148);
INSERT INTO `item` VALUES (164, '高压/中压\nBC相误差', 'NUMERIC', '6.0', 148);
INSERT INTO `item` VALUES (165, '高压/中压\nCA相误差', 'NUMERIC', '7.0', 148);
INSERT INTO `item` VALUES (166, '高压/低压\nAB相误差', 'NUMERIC', '8.0', 148);
INSERT INTO `item` VALUES (167, '高压/低压\nBC相误差', 'NUMERIC', '9.0', 148);
INSERT INTO `item` VALUES (168, '高压/低压\nCA相误差', 'NUMERIC', '10.0', 148);
INSERT INTO `item` VALUES (169, '试验设备', 'NUMERIC', '1.0', 150);
INSERT INTO `item` VALUES (170, '试验人员', 'NUMERIC', '2.0', 152);
INSERT INTO `item` VALUES (171, '试验日期', 'NUMERIC', '3.0', 152);
INSERT INTO `item` VALUES (172, '高压/中压\nAB相误差', 'NUMERIC', '4.0', 154);
INSERT INTO `item` VALUES (173, '高压/中压\nBC相误差', 'NUMERIC', '5.0', 154);
INSERT INTO `item` VALUES (174, '高压/中压\nCA相误差', 'NUMERIC', '6.0', 154);
INSERT INTO `item` VALUES (175, '高压/低压\nAB相误差', 'NUMERIC', '7.0', 154);
INSERT INTO `item` VALUES (176, '高压/低压\nBC相误差', 'NUMERIC', '8.0', 154);
INSERT INTO `item` VALUES (177, '高压/低压\nCA相误差', 'NUMERIC', '9.0', 154);
INSERT INTO `item` VALUES (178, '高压/中压\nAB相误差', 'NUMERIC', '5.0', 155);
INSERT INTO `item` VALUES (179, '高压/中压\nBC相误差', 'NUMERIC', '6.0', 155);
INSERT INTO `item` VALUES (180, '高压/中压\nCA相误差', 'NUMERIC', '7.0', 155);
INSERT INTO `item` VALUES (181, '高压/低压\nAB相误差', 'NUMERIC', '8.0', 155);
INSERT INTO `item` VALUES (182, '高压/低压\nBC相误差', 'NUMERIC', '9.0', 155);
INSERT INTO `item` VALUES (183, '高压/低压\nCA相误差', 'NUMERIC', '10.0', 155);
INSERT INTO `item` VALUES (184, '试验设备', 'NUMERIC', '1.0', 157);
INSERT INTO `item` VALUES (185, '试验人员', 'NUMERIC', '2.0', 159);
INSERT INTO `item` VALUES (186, '试验日期', 'NUMERIC', '3.0', 159);
INSERT INTO `item` VALUES (187, '高压/中压\nAB相误差', 'NUMERIC', '4.0', 161);
INSERT INTO `item` VALUES (188, '高压/中压\nBC相误差', 'NUMERIC', '5.0', 161);
INSERT INTO `item` VALUES (189, '高压/中压\nCA相误差', 'NUMERIC', '6.0', 161);
INSERT INTO `item` VALUES (190, '高压/低压\nAB相误差', 'NUMERIC', '7.0', 161);
INSERT INTO `item` VALUES (191, '高压/低压\nBC相误差', 'NUMERIC', '8.0', 161);
INSERT INTO `item` VALUES (192, '高压/低压\nCA相误差', 'NUMERIC', '9.0', 161);
INSERT INTO `item` VALUES (193, '高压/中压\nAB相误差', 'NUMERIC', '5.0', 162);
INSERT INTO `item` VALUES (194, '高压/中压\nBC相误差', 'NUMERIC', '6.0', 162);
INSERT INTO `item` VALUES (195, '高压/中压\nCA相误差', 'NUMERIC', '7.0', 162);
INSERT INTO `item` VALUES (196, '高压/低压\nAB相误差', 'NUMERIC', '8.0', 162);
INSERT INTO `item` VALUES (197, '高压/低压\nBC相误差', 'NUMERIC', '9.0', 162);
INSERT INTO `item` VALUES (198, '高压/低压\nCA相误差', 'NUMERIC', '10.0', 162);
INSERT INTO `item` VALUES (199, '高压/中压\nAB相误差', 'NUMERIC', '3.0', 164);
INSERT INTO `item` VALUES (200, '高压/中压\nBC相误差', 'NUMERIC', '4.0', 164);
INSERT INTO `item` VALUES (201, '高压/中压\nCA相误差', 'NUMERIC', '5.0', 164);
INSERT INTO `item` VALUES (202, '高压/低压\nAB相误差', 'NUMERIC', '6.0', 164);
INSERT INTO `item` VALUES (203, '高压/低压\nBC相误差', 'NUMERIC', '7.0', 164);
INSERT INTO `item` VALUES (204, '高压/低压\nCA相误差', 'NUMERIC', '8.0', 164);
INSERT INTO `item` VALUES (205, '试验设备', 'NUMERIC', '1.0', 166);
INSERT INTO `item` VALUES (206, '试验人员', 'NUMERIC', '2.0', 168);
INSERT INTO `item` VALUES (207, '试验日期', 'NUMERIC', '3.0', 168);
INSERT INTO `item` VALUES (208, '标准温度', 'NUMERIC', '4.0', 170);
INSERT INTO `item` VALUES (209, '标准油温', 'NUMERIC', '5.0', 170);
INSERT INTO `item` VALUES (210, '试验温度', 'NUMERIC', '6.0', 172);
INSERT INTO `item` VALUES (211, '试验油温', 'NUMERIC', '7.0', 172);
INSERT INTO `item` VALUES (212, 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', 174);
INSERT INTO `item` VALUES (213, 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', 174);
INSERT INTO `item` VALUES (214, 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', 174);
INSERT INTO `item` VALUES (215, 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', 176);
INSERT INTO `item` VALUES (216, 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', 176);
INSERT INTO `item` VALUES (217, 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', 176);
INSERT INTO `item` VALUES (218, 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', 178);
INSERT INTO `item` VALUES (219, 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', 178);
INSERT INTO `item` VALUES (220, 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', 178);
INSERT INTO `item` VALUES (221, '试验设备', 'NUMERIC', '1.0', 180);
INSERT INTO `item` VALUES (222, '试验人员', 'NUMERIC', '2.0', 182);
INSERT INTO `item` VALUES (223, '试验日期', 'NUMERIC', '3.0', 182);
INSERT INTO `item` VALUES (224, '高压/中压\nAB相误差', 'NUMERIC', '4.0', 184);
INSERT INTO `item` VALUES (225, '高压/中压\nBC相误差', 'NUMERIC', '5.0', 184);
INSERT INTO `item` VALUES (226, '高压/中压\nCA相误差', 'NUMERIC', '6.0', 184);
INSERT INTO `item` VALUES (227, '高压/低压\nAB相误差', 'NUMERIC', '7.0', 184);
INSERT INTO `item` VALUES (228, '高压/低压\nBC相误差', 'NUMERIC', '8.0', 184);
INSERT INTO `item` VALUES (229, '高压/低压\nCA相误差', 'NUMERIC', '9.0', 184);
INSERT INTO `item` VALUES (230, '试验设备', 'NUMERIC', '1.0', 186);
INSERT INTO `item` VALUES (231, '试验人员', 'NUMERIC', '2.0', 188);
INSERT INTO `item` VALUES (232, '试验日期', 'NUMERIC', '3.0', 188);
INSERT INTO `item` VALUES (233, '标准温度', 'NUMERIC', '4.0', 190);
INSERT INTO `item` VALUES (234, '标准油温', 'NUMERIC', '5.0', 190);
INSERT INTO `item` VALUES (235, '试验温度', 'NUMERIC', '6.0', 192);
INSERT INTO `item` VALUES (236, '试验油温', 'NUMERIC', '7.0', 192);
INSERT INTO `item` VALUES (237, 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', 194);
INSERT INTO `item` VALUES (238, 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', 194);
INSERT INTO `item` VALUES (239, 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', 194);
INSERT INTO `item` VALUES (240, 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', 196);
INSERT INTO `item` VALUES (241, 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', 196);
INSERT INTO `item` VALUES (242, 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', 196);
INSERT INTO `item` VALUES (243, 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', 198);
INSERT INTO `item` VALUES (244, 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', 198);
INSERT INTO `item` VALUES (245, 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', 198);
INSERT INTO `item` VALUES (246, '试验设备', 'NUMERIC', '1.0', 200);
INSERT INTO `item` VALUES (247, '试验人员', 'NUMERIC', '2.0', 202);
INSERT INTO `item` VALUES (248, '试验日期', 'NUMERIC', '3.0', 202);
INSERT INTO `item` VALUES (249, '标准温度', 'NUMERIC', '4.0', 204);
INSERT INTO `item` VALUES (250, '标准油温', 'NUMERIC', '5.0', 204);
INSERT INTO `item` VALUES (251, '试验温度', 'NUMERIC', '6.0', 206);
INSERT INTO `item` VALUES (252, '试验油温', 'NUMERIC', '7.0', 206);
INSERT INTO `item` VALUES (253, 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', 208);
INSERT INTO `item` VALUES (254, 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', 208);
INSERT INTO `item` VALUES (255, 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', 208);
INSERT INTO `item` VALUES (256, 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', 210);
INSERT INTO `item` VALUES (257, 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', 210);
INSERT INTO `item` VALUES (258, 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', 210);
INSERT INTO `item` VALUES (259, 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', 212);
INSERT INTO `item` VALUES (260, 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', 212);
INSERT INTO `item` VALUES (261, 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', 212);
INSERT INTO `item` VALUES (262, '试验设备', 'NUMERIC', '1.0', 214);
INSERT INTO `item` VALUES (263, '试验人员', 'NUMERIC', '2.0', 216);
INSERT INTO `item` VALUES (264, '试验日期', 'NUMERIC', '3.0', 216);
INSERT INTO `item` VALUES (265, '标准温度', 'NUMERIC', '4.0', 218);
INSERT INTO `item` VALUES (266, '标准油温', 'NUMERIC', '5.0', 218);
INSERT INTO `item` VALUES (267, '试验温度', 'NUMERIC', '6.0', 220);
INSERT INTO `item` VALUES (268, '试验油温', 'NUMERIC', '7.0', 220);
INSERT INTO `item` VALUES (269, 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', 222);
INSERT INTO `item` VALUES (270, 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', 222);
INSERT INTO `item` VALUES (271, 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', 222);
INSERT INTO `item` VALUES (272, 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', 224);
INSERT INTO `item` VALUES (273, 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', 224);
INSERT INTO `item` VALUES (274, 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', 224);
INSERT INTO `item` VALUES (275, 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', 226);
INSERT INTO `item` VALUES (276, 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', 226);
INSERT INTO `item` VALUES (277, 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', 226);
INSERT INTO `item` VALUES (278, '试验设备', 'NUMERIC', '1.0', 228);
INSERT INTO `item` VALUES (279, '试验人员', 'NUMERIC', '2.0', 230);
INSERT INTO `item` VALUES (280, '试验日期', 'NUMERIC', '3.0', 230);
INSERT INTO `item` VALUES (281, '标准温度', 'NUMERIC', '4.0', 232);
INSERT INTO `item` VALUES (282, '标准油温', 'NUMERIC', '5.0', 232);
INSERT INTO `item` VALUES (283, '试验温度', 'NUMERIC', '6.0', 234);
INSERT INTO `item` VALUES (284, '试验油温', 'NUMERIC', '7.0', 234);
INSERT INTO `item` VALUES (285, 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', 236);
INSERT INTO `item` VALUES (286, 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', 236);
INSERT INTO `item` VALUES (287, 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', 236);
INSERT INTO `item` VALUES (288, 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', 238);
INSERT INTO `item` VALUES (289, 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', 238);
INSERT INTO `item` VALUES (290, 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', 238);
INSERT INTO `item` VALUES (291, 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', 240);
INSERT INTO `item` VALUES (292, 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', 240);
INSERT INTO `item` VALUES (293, 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', 240);
INSERT INTO `item` VALUES (294, '试验设备', 'NUMERIC', '1.0', 242);
INSERT INTO `item` VALUES (295, '试验人员', 'NUMERIC', '2.0', 244);
INSERT INTO `item` VALUES (296, '试验日期', 'NUMERIC', '3.0', 244);
INSERT INTO `item` VALUES (297, '标准温度', 'NUMERIC', '4.0', 246);
INSERT INTO `item` VALUES (298, '标准油温', 'NUMERIC', '5.0', 246);
INSERT INTO `item` VALUES (299, '试验温度', 'NUMERIC', '6.0', 248);
INSERT INTO `item` VALUES (300, '试验油温', 'NUMERIC', '7.0', 248);
INSERT INTO `item` VALUES (301, 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', 250);
INSERT INTO `item` VALUES (302, 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', 250);
INSERT INTO `item` VALUES (303, 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', 250);
INSERT INTO `item` VALUES (304, 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', 252);
INSERT INTO `item` VALUES (305, 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', 252);
INSERT INTO `item` VALUES (306, 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', 252);
INSERT INTO `item` VALUES (307, 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', 254);
INSERT INTO `item` VALUES (308, 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', 254);
INSERT INTO `item` VALUES (309, 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', 254);
INSERT INTO `item` VALUES (310, '试验设备', 'NUMERIC', '1.0', 256);
INSERT INTO `item` VALUES (311, '试验人员', 'NUMERIC', '2.0', 258);
INSERT INTO `item` VALUES (312, '试验日期', 'NUMERIC', '3.0', 258);
INSERT INTO `item` VALUES (313, '标准温度', 'NUMERIC', '4.0', 260);
INSERT INTO `item` VALUES (314, '标准油温', 'NUMERIC', '5.0', 260);
INSERT INTO `item` VALUES (315, '试验温度', 'NUMERIC', '6.0', 262);
INSERT INTO `item` VALUES (316, '试验油温', 'NUMERIC', '7.0', 262);
INSERT INTO `item` VALUES (317, 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', 264);
INSERT INTO `item` VALUES (318, 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', 264);
INSERT INTO `item` VALUES (319, 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', 264);
INSERT INTO `item` VALUES (320, 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', 266);
INSERT INTO `item` VALUES (321, 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', 266);
INSERT INTO `item` VALUES (322, 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', 266);
INSERT INTO `item` VALUES (323, 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', 268);
INSERT INTO `item` VALUES (324, 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', 268);
INSERT INTO `item` VALUES (325, 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', 268);
INSERT INTO `item` VALUES (326, '试验设备', 'NUMERIC', '1.0', 270);
INSERT INTO `item` VALUES (327, '试验人员', 'NUMERIC', '2.0', 272);
INSERT INTO `item` VALUES (328, '试验日期', 'NUMERIC', '3.0', 272);
INSERT INTO `item` VALUES (329, '标准温度', 'NUMERIC', '4.0', 274);
INSERT INTO `item` VALUES (330, '标准油温', 'NUMERIC', '5.0', 274);
INSERT INTO `item` VALUES (331, '试验温度', 'NUMERIC', '6.0', 276);
INSERT INTO `item` VALUES (332, '试验油温', 'NUMERIC', '7.0', 276);
INSERT INTO `item` VALUES (333, 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', 278);
INSERT INTO `item` VALUES (334, 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', 278);
INSERT INTO `item` VALUES (335, 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', 278);
INSERT INTO `item` VALUES (336, 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', 280);
INSERT INTO `item` VALUES (337, 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', 280);
INSERT INTO `item` VALUES (338, 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', 280);
INSERT INTO `item` VALUES (339, 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', 282);
INSERT INTO `item` VALUES (340, 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', 282);
INSERT INTO `item` VALUES (341, 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', 282);
INSERT INTO `item` VALUES (342, '试验设备', 'NUMERIC', '1.0', 284);
INSERT INTO `item` VALUES (343, '试验人员', 'NUMERIC', '2.0', 286);
INSERT INTO `item` VALUES (344, '试验日期', 'NUMERIC', '3.0', 286);
INSERT INTO `item` VALUES (345, '标准温度', 'NUMERIC', '4.0', 288);
INSERT INTO `item` VALUES (346, '标准油温', 'NUMERIC', '5.0', 288);
INSERT INTO `item` VALUES (347, '试验温度', 'NUMERIC', '6.0', 290);
INSERT INTO `item` VALUES (348, '试验油温', 'NUMERIC', '7.0', 290);
INSERT INTO `item` VALUES (349, 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', 292);
INSERT INTO `item` VALUES (350, 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', 292);
INSERT INTO `item` VALUES (351, 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', 292);
INSERT INTO `item` VALUES (352, 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', 294);
INSERT INTO `item` VALUES (353, 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', 294);
INSERT INTO `item` VALUES (354, 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', 294);
INSERT INTO `item` VALUES (355, 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', 296);
INSERT INTO `item` VALUES (356, 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', 296);
INSERT INTO `item` VALUES (357, 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', 296);
INSERT INTO `item` VALUES (358, '试验设备', 'NUMERIC', '1.0', 298);
INSERT INTO `item` VALUES (359, '试验人员', 'NUMERIC', '2.0', 300);
INSERT INTO `item` VALUES (360, '试验日期', 'NUMERIC', '3.0', 300);
INSERT INTO `item` VALUES (361, '标准温度', 'NUMERIC', '4.0', 302);
INSERT INTO `item` VALUES (362, '标准油温', 'NUMERIC', '5.0', 302);
INSERT INTO `item` VALUES (363, '试验温度', 'NUMERIC', '6.0', 304);
INSERT INTO `item` VALUES (364, '试验油温', 'NUMERIC', '7.0', 304);
INSERT INTO `item` VALUES (365, 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', 306);
INSERT INTO `item` VALUES (366, 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', 306);
INSERT INTO `item` VALUES (367, 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', 306);
INSERT INTO `item` VALUES (368, 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', 308);
INSERT INTO `item` VALUES (369, 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', 308);
INSERT INTO `item` VALUES (370, 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', 308);
INSERT INTO `item` VALUES (371, 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', 310);
INSERT INTO `item` VALUES (372, 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', 310);
INSERT INTO `item` VALUES (373, 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', 310);
INSERT INTO `item` VALUES (374, '试验设备', 'NUMERIC', '1.0', 312);
INSERT INTO `item` VALUES (375, '试验人员', 'NUMERIC', '2.0', 314);
INSERT INTO `item` VALUES (376, '试验日期', 'NUMERIC', '3.0', 314);
INSERT INTO `item` VALUES (377, '标准温度', 'NUMERIC', '4.0', 316);
INSERT INTO `item` VALUES (378, '标准油温', 'NUMERIC', '5.0', 316);
INSERT INTO `item` VALUES (379, '试验温度', 'NUMERIC', '6.0', 318);
INSERT INTO `item` VALUES (380, '试验油温', 'NUMERIC', '7.0', 318);
INSERT INTO `item` VALUES (381, 'a(a-b)相(mΩ)', 'NUMERIC', '8.0', 320);
INSERT INTO `item` VALUES (382, 'b(b-c)相(mΩ)', 'NUMERIC', '9.0', 320);
INSERT INTO `item` VALUES (383, 'c(c-a)相(mΩ)', 'NUMERIC', '10.0', 320);
INSERT INTO `item` VALUES (384, 'Am(Am-Bm)相(mΩ)', 'NUMERIC', '11.0', 322);
INSERT INTO `item` VALUES (385, 'Bm(Bm-Cm)相(mΩ)', 'NUMERIC', '12.0', 322);
INSERT INTO `item` VALUES (386, 'Cm(Cm-Am)相(mΩ)', 'NUMERIC', '13.0', 322);
INSERT INTO `item` VALUES (387, 'A(A-B)相(mΩ)', 'NUMERIC', '14.0', 324);
INSERT INTO `item` VALUES (388, 'B(B-C)相(mΩ)', 'NUMERIC', '15.0', 324);
INSERT INTO `item` VALUES (389, 'C(C-A)相(mΩ)', 'NUMERIC', '16.0', 324);
INSERT INTO `item` VALUES (390, '试验设备', 'NUMERIC', '1.0', 326);
INSERT INTO `item` VALUES (391, '试验人员', 'NUMERIC', '2.0', 328);
INSERT INTO `item` VALUES (392, '试验日期', 'NUMERIC', '3.0', 328);
INSERT INTO `item` VALUES (393, '标准温度', 'NUMERIC', '4.0', 330);
INSERT INTO `item` VALUES (394, '标准油温', 'NUMERIC', '5.0', 330);
INSERT INTO `item` VALUES (395, '试验温度', 'NUMERIC', '6.0', 332);
INSERT INTO `item` VALUES (396, '试验油温', 'NUMERIC', '7.0', 332);
INSERT INTO `item` VALUES (397, 'a相(mΩ)', 'NUMERIC', '8.0', 334);
INSERT INTO `item` VALUES (398, 'b相(mΩ)', 'NUMERIC', '9.0', 334);
INSERT INTO `item` VALUES (399, 'c)相(mΩ)', 'NUMERIC', '10.0', 334);
INSERT INTO `item` VALUES (400, 'Am相(mΩ)', 'NUMERIC', '11.0', 336);
INSERT INTO `item` VALUES (401, 'Bm相(mΩ)', 'NUMERIC', '12.0', 336);
INSERT INTO `item` VALUES (402, 'Cm相(mΩ)', 'NUMERIC', '13.0', 336);
INSERT INTO `item` VALUES (403, 'A相(mΩ)', 'NUMERIC', '14.0', 338);
INSERT INTO `item` VALUES (404, 'B相(mΩ)', 'NUMERIC', '15.0', 338);
INSERT INTO `item` VALUES (405, 'C相(mΩ)', 'NUMERIC', '16.0', 338);
INSERT INTO `item` VALUES (406, '试验设备', 'NUMERIC', '1.0', 340);
INSERT INTO `item` VALUES (407, '试验人员', 'NUMERIC', '2.0', 342);
INSERT INTO `item` VALUES (408, '试验日期', 'NUMERIC', '3.0', 342);
INSERT INTO `item` VALUES (409, '标准温度', 'NUMERIC', '4.0', 344);
INSERT INTO `item` VALUES (410, '标准油温', 'NUMERIC', '5.0', 344);
INSERT INTO `item` VALUES (411, '试验温度', 'NUMERIC', '6.0', 346);
INSERT INTO `item` VALUES (412, '试验油温', 'NUMERIC', '7.0', 346);
INSERT INTO `item` VALUES (413, 'a相(mΩ)', 'NUMERIC', '8.0', 348);
INSERT INTO `item` VALUES (414, 'b相(mΩ)', 'NUMERIC', '9.0', 348);
INSERT INTO `item` VALUES (415, 'c)相(mΩ)', 'NUMERIC', '10.0', 348);
INSERT INTO `item` VALUES (416, 'Am相(mΩ)', 'NUMERIC', '11.0', 350);
INSERT INTO `item` VALUES (417, 'Bm相(mΩ)', 'NUMERIC', '12.0', 350);
INSERT INTO `item` VALUES (418, 'Cm相(mΩ)', 'NUMERIC', '13.0', 350);
INSERT INTO `item` VALUES (419, 'A相(mΩ)', 'NUMERIC', '14.0', 352);
INSERT INTO `item` VALUES (420, 'B相(mΩ)', 'NUMERIC', '15.0', 352);
INSERT INTO `item` VALUES (421, 'C相(mΩ)', 'NUMERIC', '16.0', 352);
INSERT INTO `item` VALUES (422, '试验设备', 'NUMERIC', '1.0', 354);
INSERT INTO `item` VALUES (423, '试验人员', 'NUMERIC', '2.0', 356);
INSERT INTO `item` VALUES (424, '试验日期', 'NUMERIC', '3.0', 356);
INSERT INTO `item` VALUES (425, '标准温度', 'NUMERIC', '4.0', 358);
INSERT INTO `item` VALUES (426, '标准油温', 'NUMERIC', '5.0', 358);
INSERT INTO `item` VALUES (427, '试验温度', 'NUMERIC', '6.0', 360);
INSERT INTO `item` VALUES (428, '试验油温', 'NUMERIC', '7.0', 360);
INSERT INTO `item` VALUES (429, 'a相(mΩ)', 'NUMERIC', '8.0', 362);
INSERT INTO `item` VALUES (430, 'b相(mΩ)', 'NUMERIC', '9.0', 362);
INSERT INTO `item` VALUES (431, 'c)相(mΩ)', 'NUMERIC', '10.0', 362);
INSERT INTO `item` VALUES (432, 'Am相(mΩ)', 'NUMERIC', '11.0', 364);
INSERT INTO `item` VALUES (433, 'Bm相(mΩ)', 'NUMERIC', '12.0', 364);
INSERT INTO `item` VALUES (434, 'Cm相(mΩ)', 'NUMERIC', '13.0', 364);
INSERT INTO `item` VALUES (435, 'A相(mΩ)', 'NUMERIC', '14.0', 366);
INSERT INTO `item` VALUES (436, 'B相(mΩ)', 'NUMERIC', '15.0', 366);
INSERT INTO `item` VALUES (437, 'C相(mΩ)', 'NUMERIC', '16.0', 366);

-- ----------------------------
-- Table structure for pro
-- ----------------------------
DROP TABLE IF EXISTS `pro`;
CREATE TABLE `pro`  (
  `proID` int(11) NOT NULL AUTO_INCREMENT,
  `proName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `devTypeID` int(11) NULL DEFAULT NULL,
  `proType` int(11) NULL DEFAULT 0 COMMENT '0,实测值，1，出厂值',
  `addtime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`proID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pro
-- ----------------------------
INSERT INTO `pro` VALUES (25, '直流电阻模板', 'E:/file/直流电阻模板.xlsx', 4, 0, '2018-12-29 14:24:13');
INSERT INTO `pro` VALUES (26, '直流电阻模板', 'E:/file/直流电阻模板.xlsx', 4, 0, '2018-12-29 14:24:16');
INSERT INTO `pro` VALUES (27, '直流电阻模板', 'E:/file/直流电阻模板.xlsx', 6, 0, '2018-12-29 14:24:18');
INSERT INTO `pro` VALUES (28, '直流电阻模板', 'E:/file/直流电阻模板.xlsx', 4, 0, '2018-12-29 14:24:21');
INSERT INTO `pro` VALUES (29, '直流电阻模板', 'E:/file/直流电阻模板.xlsx', 8, 0, '2018-12-29 14:24:24');
INSERT INTO `pro` VALUES (35, '三项油浸式变压器', 'E:/file/三项油浸式变压器.xlsx', 8, 0, '2018-12-27 13:32:18');
INSERT INTO `pro` VALUES (36, '三项油浸式变压器', 'E:/file/三项油浸式变压器.xlsx', 8, 1, '2018-12-27 13:32:18');
INSERT INTO `pro` VALUES (37, '油浸式变压器', 'E:/file/油浸式变压器.xlsx', 8, 0, '2018-12-27 13:42:49');
INSERT INTO `pro` VALUES (38, '三项油浸式变压器', 'E:/file/三项油浸式变压器.xlsx', 6, 0, '2019-01-09 11:32:20');
INSERT INTO `pro` VALUES (50, '油浸式变压器', 'E:/file/油浸式变压器.xlsx', 6, 0, '2019-01-10 15:12:15');
INSERT INTO `pro` VALUES (51, '油浸式变压器', 'E:/file/油浸式变压器.xlsx', 6, 1, '2019-01-10 15:12:15');

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
) ENGINE = InnoDB AUTO_INCREMENT = 367 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
INSERT INTO `record` VALUES (97, '温度', 0, 29);
INSERT INTO `record` VALUES (98, '温度', 97, 29);
INSERT INTO `record` VALUES (99, '湿度', 0, 29);
INSERT INTO `record` VALUES (100, '湿度', 99, 29);
INSERT INTO `record` VALUES (101, '低压绕阻', 0, 29);
INSERT INTO `record` VALUES (102, '数据', 101, 29);
INSERT INTO `record` VALUES (103, '中压绕阻', 0, 29);
INSERT INTO `record` VALUES (104, '数据', 103, 29);
INSERT INTO `record` VALUES (105, '高压绕阻', 0, 29);
INSERT INTO `record` VALUES (106, '1.0', 105, 29);
INSERT INTO `record` VALUES (156, '试验设备', 0, 35);
INSERT INTO `record` VALUES (157, '试验设备', 156, 35);
INSERT INTO `record` VALUES (158, '试验人员', 0, 35);
INSERT INTO `record` VALUES (159, '试验人员', 158, 35);
INSERT INTO `record` VALUES (160, '分接开关位置', 0, 35);
INSERT INTO `record` VALUES (161, '1.0', 160, 35);
INSERT INTO `record` VALUES (162, '2.0', 160, 35);
INSERT INTO `record` VALUES (163, '分接开关位置', 0, 36);
INSERT INTO `record` VALUES (164, '1.0', 163, 36);
INSERT INTO `record` VALUES (165, '试验设备', 0, 37);
INSERT INTO `record` VALUES (166, '试验设备', 165, 37);
INSERT INTO `record` VALUES (167, '试验人员', 0, 37);
INSERT INTO `record` VALUES (168, '试验人员', 167, 37);
INSERT INTO `record` VALUES (169, '标准环境', 0, 37);
INSERT INTO `record` VALUES (170, '标准环境', 169, 37);
INSERT INTO `record` VALUES (171, '试验环境', 0, 37);
INSERT INTO `record` VALUES (172, '试验环境', 171, 37);
INSERT INTO `record` VALUES (173, '低压侧', 0, 37);
INSERT INTO `record` VALUES (174, '数据', 173, 37);
INSERT INTO `record` VALUES (175, '中压侧', 0, 37);
INSERT INTO `record` VALUES (176, '数据', 175, 37);
INSERT INTO `record` VALUES (177, '高压侧', 0, 37);
INSERT INTO `record` VALUES (178, '1.0', 177, 37);
INSERT INTO `record` VALUES (179, '试验设备', 0, 38);
INSERT INTO `record` VALUES (180, '试验设备', 179, 38);
INSERT INTO `record` VALUES (181, '试验人员', 0, 38);
INSERT INTO `record` VALUES (182, '试验人员', 181, 38);
INSERT INTO `record` VALUES (183, '分接开关位置', 0, 38);
INSERT INTO `record` VALUES (184, '1.0', 183, 38);
INSERT INTO `record` VALUES (297, '试验设备', 0, 47);
INSERT INTO `record` VALUES (298, '试验设备', 297, 47);
INSERT INTO `record` VALUES (299, '试验人员', 0, 47);
INSERT INTO `record` VALUES (300, '试验人员', 299, 47);
INSERT INTO `record` VALUES (301, '标准环境', 0, 47);
INSERT INTO `record` VALUES (302, '标准环境', 301, 47);
INSERT INTO `record` VALUES (303, '试验环境', 0, 47);
INSERT INTO `record` VALUES (304, '试验环境', 303, 47);
INSERT INTO `record` VALUES (305, '低压侧', 0, 47);
INSERT INTO `record` VALUES (306, '数据', 305, 47);
INSERT INTO `record` VALUES (307, '中压侧', 0, 47);
INSERT INTO `record` VALUES (308, '数据', 307, 47);
INSERT INTO `record` VALUES (309, '高压侧', 0, 47);
INSERT INTO `record` VALUES (310, '1.0', 309, 47);
INSERT INTO `record` VALUES (311, '试验设备', 0, 48);
INSERT INTO `record` VALUES (312, '试验设备', 311, 48);
INSERT INTO `record` VALUES (313, '试验人员', 0, 48);
INSERT INTO `record` VALUES (314, '试验人员', 313, 48);
INSERT INTO `record` VALUES (315, '标准环境', 0, 48);
INSERT INTO `record` VALUES (316, '标准环境', 315, 48);
INSERT INTO `record` VALUES (317, '试验环境', 0, 48);
INSERT INTO `record` VALUES (318, '试验环境', 317, 48);
INSERT INTO `record` VALUES (319, '低压侧', 0, 48);
INSERT INTO `record` VALUES (320, '数据', 319, 48);
INSERT INTO `record` VALUES (321, '中压侧', 0, 48);
INSERT INTO `record` VALUES (322, '数据', 321, 48);
INSERT INTO `record` VALUES (323, '高压侧', 0, 48);
INSERT INTO `record` VALUES (324, '1.0', 323, 48);
INSERT INTO `record` VALUES (325, '试验设备', 0, 49);
INSERT INTO `record` VALUES (326, '试验设备', 325, 49);
INSERT INTO `record` VALUES (327, '试验人员', 0, 49);
INSERT INTO `record` VALUES (328, '试验人员', 327, 49);
INSERT INTO `record` VALUES (329, '标准环境', 0, 49);
INSERT INTO `record` VALUES (330, '标准环境', 329, 49);
INSERT INTO `record` VALUES (331, '试验环境', 0, 49);
INSERT INTO `record` VALUES (332, '试验环境', 331, 49);
INSERT INTO `record` VALUES (333, '低压侧', 0, 49);
INSERT INTO `record` VALUES (334, '数据', 333, 49);
INSERT INTO `record` VALUES (335, '中压侧', 0, 49);
INSERT INTO `record` VALUES (336, '数据', 335, 49);
INSERT INTO `record` VALUES (337, '高压侧', 0, 49);
INSERT INTO `record` VALUES (338, '1.0', 337, 49);
INSERT INTO `record` VALUES (339, '试验设备', 0, 50);
INSERT INTO `record` VALUES (340, '试验设备', 339, 50);
INSERT INTO `record` VALUES (341, '试验人员', 0, 50);
INSERT INTO `record` VALUES (342, '试验人员', 341, 50);
INSERT INTO `record` VALUES (343, '标准环境', 0, 50);
INSERT INTO `record` VALUES (344, '标准环境', 343, 50);
INSERT INTO `record` VALUES (345, '试验环境', 0, 50);
INSERT INTO `record` VALUES (346, '试验环境', 345, 50);
INSERT INTO `record` VALUES (347, '低压侧', 0, 50);
INSERT INTO `record` VALUES (348, '数据', 347, 50);
INSERT INTO `record` VALUES (349, '中压侧', 0, 50);
INSERT INTO `record` VALUES (350, '数据', 349, 50);
INSERT INTO `record` VALUES (351, '高压侧', 0, 50);
INSERT INTO `record` VALUES (352, '1.0', 351, 50);
INSERT INTO `record` VALUES (353, '试验设备', 0, 51);
INSERT INTO `record` VALUES (354, '试验设备', 353, 51);
INSERT INTO `record` VALUES (355, '试验人员', 0, 51);
INSERT INTO `record` VALUES (356, '试验人员', 355, 51);
INSERT INTO `record` VALUES (357, '标准环境', 0, 51);
INSERT INTO `record` VALUES (358, '标准环境', 357, 51);
INSERT INTO `record` VALUES (359, '试验环境', 0, 51);
INSERT INTO `record` VALUES (360, '试验环境', 359, 51);
INSERT INTO `record` VALUES (361, '低压侧', 0, 51);
INSERT INTO `record` VALUES (362, '数据', 361, 51);
INSERT INTO `record` VALUES (363, '中压侧', 0, 51);
INSERT INTO `record` VALUES (364, '数据', 363, 51);
INSERT INTO `record` VALUES (365, '高压侧', 0, 51);
INSERT INTO `record` VALUES (366, '1.0', 365, 51);

-- ----------------------------
-- Table structure for typeattr
-- ----------------------------
DROP TABLE IF EXISTS `typeattr`;
CREATE TABLE `typeattr`  (
  `attrID` int(11) NOT NULL AUTO_INCREMENT,
  `attrName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typeID` int(11) NULL DEFAULT NULL,
  `addtime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`attrID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
