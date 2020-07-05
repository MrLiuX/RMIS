/*
 Navicat Premium Data Transfer

 Source Server         : Aliyun
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 47.98.248.28:3306
 Source Schema         : RMIS

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 05/07/2020 21:17:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 损坏单项扣分表
-- ----------------------------
DROP TABLE IF EXISTS `损坏单项扣分表`;
CREATE TABLE `损坏单项扣分表`  (
  `路面类型` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `损坏类型` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `损坏密度` decimal(5, 2) NOT NULL,
  `扣分` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`路面类型`, `损坏类型`, `损坏密度`) USING BTREE,
  INDEX `损坏类型0`(`损坏类型`) USING BTREE,
  CONSTRAINT `损坏类型0` FOREIGN KEY (`损坏类型`) REFERENCES `损坏类型` (`损坏类型`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `路面类型0` FOREIGN KEY (`路面类型`) REFERENCES `路面类型` (`路面类型`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 损坏单项扣分表
-- ----------------------------
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '交叉裂缝和破碎板', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '交叉裂缝和破碎板', 1.00, 8);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '交叉裂缝和破碎板', 5.00, 17);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '交叉裂缝和破碎板', 10.00, 27);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '交叉裂缝和破碎板', 30.00, 55);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '交叉裂缝和破碎板', 50.00, 65);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '交叉裂缝和破碎板', 100.00, 75);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '坑洞', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '坑洞', 0.02, 9);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '坑洞', 0.10, 19);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '坑洞', 0.20, 30);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '坑洞', 0.60, 60);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '坑洞', 1.00, 70);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '坑洞', 100.00, 80);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '接缝料损坏', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '接缝料损坏', 0.10, 1);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '接缝料损坏', 1.00, 3);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '接缝料损坏', 5.00, 5);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '接缝料损坏', 10.00, 7);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '接缝料损坏', 20.00, 10);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '接缝料损坏', 100.00, 12);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '板角断裂', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '板角断裂', 0.50, 12);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '板角断裂', 1.00, 25);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '板角断裂', 3.00, 33);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '板角断裂', 5.00, 44);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '板角断裂', 7.00, 55);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '板角断裂', 100.00, 65);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '表面裂纹', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '表面裂纹', 0.50, 5);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '表面裂纹', 1.00, 8);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '表面裂纹', 5.00, 10);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '表面裂纹', 10.00, 16);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '表面裂纹', 50.00, 33);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '表面裂纹', 100.00, 42);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角剥落', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角剥落', 0.50, 4);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角剥落', 1.00, 11);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角剥落', 3.00, 15);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角剥落', 5.00, 21);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角剥落', 7.00, 27);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角剥落', 100.00, 35);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角裂缝', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角裂缝', 0.50, 5);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角裂缝', 1.00, 12);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角裂缝', 3.00, 17);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角裂缝', 5.00, 23);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角裂缝', 7.00, 29);
INSERT INTO `损坏单项扣分表` VALUES ('水泥', '边角裂缝', 100.00, 35);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '剥落', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '剥落', 0.01, 2);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '剥落', 0.10, 5);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '剥落', 1.00, 8);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '剥落', 10.00, 15);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '剥落', 50.00, 35);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '剥落', 100.00, 45);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '唧浆', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '唧浆', 0.01, 5);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '唧浆', 0.10, 10);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '唧浆', 1.00, 15);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '唧浆', 10.00, 25);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '唧浆', 50.00, 50);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '唧浆', 100.00, 80);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '啃边', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '啃边', 0.01, 2);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '啃边', 0.10, 4);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '啃边', 1.00, 8);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '啃边', 10.00, 15);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '啃边', 50.00, 30);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '啃边', 100.00, 40);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '坑槽', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '坑槽', 0.01, 10);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '坑槽', 0.10, 15);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '坑槽', 1.00, 25);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '坑槽', 10.00, 40);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '坑槽', 50.00, 65);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '坑槽', 100.00, 72);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '拥包', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '拥包', 0.01, 3);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '拥包', 0.10, 10);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '拥包', 1.00, 15);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '拥包', 10.00, 30);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '拥包', 50.00, 52);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '拥包', 100.00, 65);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '沉陷', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '沉陷', 0.01, 3);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '沉陷', 0.10, 5);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '沉陷', 1.00, 12);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '沉陷', 10.00, 25);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '沉陷', 50.00, 47);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '沉陷', 100.00, 63);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '泛油', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '泛油', 0.01, 2);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '泛油', 0.10, 4);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '泛油', 1.00, 8);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '泛油', 10.00, 20);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '泛油', 50.00, 40);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '泛油', 100.00, 70);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '线裂', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '线裂', 0.01, 3);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '线裂', 0.10, 5);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '线裂', 1.00, 8);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '线裂', 10.00, 16);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '线裂', 50.00, 38);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '线裂', 100.00, 48);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '网裂', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '网裂', 0.01, 5);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '网裂', 0.10, 5);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '网裂', 1.00, 10);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '网裂', 10.00, 20);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '网裂', 50.00, 45);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '网裂', 100.00, 70);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '翻浆', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '翻浆', 0.01, 10);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '翻浆', 0.10, 15);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '翻浆', 1.00, 20);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '翻浆', 10.00, 40);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '翻浆', 50.00, 65);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '翻浆', 100.00, 80);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '路框差', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '路框差', 0.01, 3);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '路框差', 0.10, 8);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '路框差', 1.00, 12);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '路框差', 10.00, 12);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '路框差', 50.00, 12);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '路框差', 100.00, 12);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '车辙', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '车辙', 0.01, 2);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '车辙', 0.10, 7);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '车辙', 1.00, 12);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '车辙', 10.00, 25);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '车辙', 50.00, 45);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '车辙', 100.00, 55);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '龟裂', 0.00, 0);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '龟裂', 0.01, 8);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '龟裂', 0.10, 10);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '龟裂', 1.00, 15);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '龟裂', 10.00, 30);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '龟裂', 50.00, 55);
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '龟裂', 100.00, 80);

-- ----------------------------
-- Table structure for 损坏扣分表
-- ----------------------------
DROP TABLE IF EXISTS `损坏扣分表`;
CREATE TABLE `损坏扣分表`  (
  `记录编号` int(6) NOT NULL,
  `路面类型` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `损坏类型` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `损坏面积` decimal(10, 5) NOT NULL,
  `损坏密度` decimal(10, 5) NOT NULL,
  `单项扣分值` decimal(10, 5) NOT NULL,
  PRIMARY KEY (`记录编号`) USING BTREE,
  INDEX `路面类型1`(`路面类型`) USING BTREE,
  INDEX `损坏类型02`(`损坏类型`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 损坏扣分表
-- ----------------------------

-- ----------------------------
-- Table structure for 损坏类型
-- ----------------------------
DROP TABLE IF EXISTS `损坏类型`;
CREATE TABLE `损坏类型`  (
  `路面类型` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `损坏类型` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `从属类别` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `单项损坏类型数` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`损坏类型`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 损坏类型
-- ----------------------------
INSERT INTO `损坏类型` VALUES ('水泥', '交叉裂缝和破碎板', '裂缝类', '3');
INSERT INTO `损坏类型` VALUES ('沥青', '剥落', '松散类', '3');
INSERT INTO `损坏类型` VALUES ('沥青', '唧浆', '其他类', '3');
INSERT INTO `损坏类型` VALUES ('沥青', '啃边', '松散类', '3');
INSERT INTO `损坏类型` VALUES ('沥青', '坑槽', '松散类', '3');
INSERT INTO `损坏类型` VALUES ('水泥', '坑洞', '表面破坏类', '2');
INSERT INTO `损坏类型` VALUES ('沥青', '拥包', '变形类', '4');
INSERT INTO `损坏类型` VALUES ('水泥', '接缝料损坏', '接缝破坏类', '2');
INSERT INTO `损坏类型` VALUES ('水泥', '板角断裂', '裂缝类', '3');
INSERT INTO `损坏类型` VALUES ('沥青', '沉陷', '变形类', '4');
INSERT INTO `损坏类型` VALUES ('沥青', '泛油', '其他类', '3');
INSERT INTO `损坏类型` VALUES ('沥青', '线裂', '裂缝类', '3');
INSERT INTO `损坏类型` VALUES ('沥青', '网裂', '裂缝类', '3');
INSERT INTO `损坏类型` VALUES ('沥青', '翻浆', '变形类', '4');
INSERT INTO `损坏类型` VALUES ('水泥', '表面裂纹', '表面破坏类', '2');
INSERT INTO `损坏类型` VALUES ('沥青', '路框差', '其他类', '3');
INSERT INTO `损坏类型` VALUES ('沥青', '车辙', '变形类', '4');
INSERT INTO `损坏类型` VALUES ('水泥', '边角剥落', '接缝破坏类', '2');
INSERT INTO `损坏类型` VALUES ('水泥', '边角裂缝', '裂缝类', '3');
INSERT INTO `损坏类型` VALUES ('沥青', '龟裂', '裂缝类', '3');

-- ----------------------------
-- Table structure for 损坏详情
-- ----------------------------
DROP TABLE IF EXISTS `损坏详情`;
CREATE TABLE `损坏详情`  (
  `检查编号` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `损坏类型` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `损坏长` decimal(10, 5) NOT NULL,
  `损坏宽` decimal(10, 5) NOT NULL,
  `损坏高` decimal(10, 5) NOT NULL,
  `损坏面积` decimal(10, 5) NOT NULL,
  `损坏位置及损坏情况描述` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `备注` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `检查编号1`(`检查编号`) USING BTREE,
  INDEX `损坏类型2`(`损坏类型`) USING BTREE,
  CONSTRAINT `损坏类型2` FOREIGN KEY (`损坏类型`) REFERENCES `损坏类型` (`损坏类型`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `检查编号1` FOREIGN KEY (`检查编号`) REFERENCES `道路设施路面损害情况` (`检查编号`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 损坏详情
-- ----------------------------

-- ----------------------------
-- Table structure for 系统人员
-- ----------------------------
DROP TABLE IF EXISTS `系统人员`;
CREATE TABLE `系统人员`  (
  `账号` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `密码` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `姓名` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `账户等级` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`账号`) USING BTREE,
  INDEX `账户等级`(`账户等级`) USING BTREE,
  CONSTRAINT `账户等级` FOREIGN KEY (`账户等级`) REFERENCES `账户等级` (`账户等级`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 系统人员
-- ----------------------------
INSERT INTO `系统人员` VALUES ('123', '123', '刘旭', '管理员');
INSERT INTO `系统人员` VALUES ('shy', '123', '豆玉明', '管理员');

-- ----------------------------
-- Table structure for 设施损害通知单
-- ----------------------------
DROP TABLE IF EXISTS `设施损害通知单`;
CREATE TABLE `设施损害通知单`  (
  `通知号` int(6) NOT NULL,
  `日期` date NOT NULL,
  `设施名称` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `损坏部位` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `损坏原因` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `处理意见` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `技术员` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`通知号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of 设施损害通知单
-- ----------------------------

-- ----------------------------
-- Table structure for 账户等级
-- ----------------------------
DROP TABLE IF EXISTS `账户等级`;
CREATE TABLE `账户等级`  (
  `账户等级` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`账户等级`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 账户等级
-- ----------------------------
INSERT INTO `账户等级` VALUES ('检查人员');
INSERT INTO `账户等级` VALUES ('管理员');

-- ----------------------------
-- Table structure for 路面损坏状况评价
-- ----------------------------
DROP TABLE IF EXISTS `路面损坏状况评价`;
CREATE TABLE `路面损坏状况评价`  (
  `道路编号` int(6) NOT NULL,
  `评价日期` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PCI` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `评级` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`道路编号`, `评价日期`) USING BTREE,
  CONSTRAINT `道路编号4` FOREIGN KEY (`道路编号`) REFERENCES `道路关键信息` (`道路编号`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 路面损坏状况评价
-- ----------------------------

-- ----------------------------
-- Table structure for 路面类型
-- ----------------------------
DROP TABLE IF EXISTS `路面类型`;
CREATE TABLE `路面类型`  (
  `路面类型` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`路面类型`) USING BTREE,
  INDEX `路面类型`(`路面类型`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 路面类型
-- ----------------------------
INSERT INTO `路面类型` VALUES ('水泥');
INSERT INTO `路面类型` VALUES ('沥青');

-- ----------------------------
-- Table structure for 路面行驶质量评价
-- ----------------------------
DROP TABLE IF EXISTS `路面行驶质量评价`;
CREATE TABLE `路面行驶质量评价`  (
  `道路编号` int(6) NOT NULL,
  `评价日期` int(4) NOT NULL,
  `RQI` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `评级` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`道路编号`, `评价日期`) USING BTREE,
  CONSTRAINT `道路编号3` FOREIGN KEY (`道路编号`) REFERENCES `道路关键信息` (`道路编号`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 路面行驶质量评价
-- ----------------------------

-- ----------------------------
-- Table structure for 道路关键信息
-- ----------------------------
DROP TABLE IF EXISTS `道路关键信息`;
CREATE TABLE `道路关键信息`  (
  `道路编号` int(6) NOT NULL,
  `道路名称` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `道路养护等级` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `路面类型` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`道路编号`) USING BTREE,
  INDEX `路面类型`(`路面类型`) USING BTREE,
  CONSTRAINT `路面类型` FOREIGN KEY (`路面类型`) REFERENCES `路面类型` (`路面类型`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of 道路关键信息
-- ----------------------------
INSERT INTO `道路关键信息` VALUES (615487, '九永高速', 'A', '水泥');
INSERT INTO `道路关键信息` VALUES (639874, '渝昆高速', 'A', '水泥');
INSERT INTO `道路关键信息` VALUES (645897, '三环高速', 'A', '水泥');
INSERT INTO `道路关键信息` VALUES (842645, '和顺大道', 'C', '水泥');
INSERT INTO `道路关键信息` VALUES (843654, '兴隆大道', 'B', '沥青');
INSERT INTO `道路关键信息` VALUES (849126, '龙马大道', 'B', '沥青');
INSERT INTO `道路关键信息` VALUES (856173, '兴龙大道', 'B', '水泥');
INSERT INTO `道路关键信息` VALUES (857213, '海棠大道', 'C', '水泥');
INSERT INTO `道路关键信息` VALUES (925614, '陈莲公路', 'D', '沥青');
INSERT INTO `道路关键信息` VALUES (928417, '临江路', 'D', '水泥');
INSERT INTO `道路关键信息` VALUES (935672, '双凤路', 'D', '沥青');
INSERT INTO `道路关键信息` VALUES (946135, '大安路', 'B', '沥青');
INSERT INTO `道路关键信息` VALUES (984614, '高滩公路', 'D', '沥青');

-- ----------------------------
-- Table structure for 道路完整信息
-- ----------------------------
DROP TABLE IF EXISTS `道路完整信息`;
CREATE TABLE `道路完整信息`  (
  `道路编号` int(6) NOT NULL,
  `道路走向` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `起点` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `终点` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `设计单位` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `施工单位` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `道路等级` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `设计时速` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `路幅宽度` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `道路长度` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `道路面积` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AADT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `交通量等级` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `所属乡镇` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `管理分类` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `管理单位` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `养护单位` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `建造年月` date NULL DEFAULT NULL,
  `路面厚度` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `基层类型` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `基层厚度` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `车行道数` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `通行方向` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `机动车道宽度范围` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `左侧机动车道宽度范围` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `右侧机动车道宽度范围` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `车行道面积` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `有无公交车专用道` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `侧石类型` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `侧石长度` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `平石类型` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `平石长度` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `检查井数量` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `雨水口数量` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `路名牌数量` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `标志牌数量` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `树池面积` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`道路编号`) USING BTREE,
  CONSTRAINT `a` FOREIGN KEY (`道路编号`) REFERENCES `道路关键信息` (`道路编号`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 道路完整信息
-- ----------------------------
INSERT INTO `道路完整信息` VALUES (615487, '九龙坡走马——华岩隧道——小坎——成渝高速公路', '黄瓜山', '大安', '永沪高速公路有限公司', '马鞍山施工队', 'A', '100Km/h', '9', '49120', '221040', '41084', 'A', '重庆市', '县级公路', '重庆高速公路管理有限共公司', '重庆高速公路有限公司', '2017-12-26', '1', '水泥稳定碎石', '0.52', '6', '双向', '30-34', '15-17', '15-17', '147360', '无', '钢筋混泥土', '1.2', '钢筋混泥土', '1.2', '44', '103', '42', '56', '0');
INSERT INTO `道路完整信息` VALUES (639874, '重庆——昆明', '重庆', '昆明', '永沪高速公路', '重庆高速公路管理责任有限公司', 'A', '120Km/h', '50', '838652', '41932600', '40065', 'A', '重庆', '县级公路', '重庆高速公路管理有限公司', '重庆高速公路有限公司', '2015-09-25', '1.2', '水泥稳定碎石', '0.61', '6', '双向', '40-42', '16-20', '16-20', '34384732', '无', '钢筋混泥土', '0.84', '钢筋0混泥土', '0.84', '365', '806', '236', '189', '1241204.96');
INSERT INTO `道路完整信息` VALUES (645897, '渝北——北碚——合川——铜梁——大足——双桥——永川——江津——綦江', '渝北', '綦江', '高速公路建设有限公司', '重庆高速公路建造', 'A', '80Km/h', '36', '475564', '17120304', '60489', 'A', '重庆市', '国家级公路', '重庆高速公路管理有限公司', '重庆高速公路有限公司', '1998-01-04', '1.3', '水泥稳定碎石', '0.6', '4', '双向', '29-33', '14.5-16.5', '14.5-16.5', '14742484', '无', '钢筋混泥土', '1.2', '钢筋混泥土', '1.2', '86', '145', '246', '194', '0');
INSERT INTO `道路完整信息` VALUES (842645, '菜鸟驿站——金科地产', '菜鸟驿站', '金科地产', '永川道路规划局', '长安建筑', 'C', '30Km/h', '12', '18756', '225072', '32654', 'A', '永川区', '城市街道', '永川区', '永川城市道路管理', '1994-09-19', '1.1', '水泥稳定碎石', '0.8', '2', '双向', '8-10', '4-5', '4-5', '168804', '有', '钢筋混泥土', '0.8', '钢筋混泥土', '0.8', '26', '29', '38', '49', '0');
INSERT INTO `道路完整信息` VALUES (843654, '兴盛街——和平街', '兴盛街', '和平街', '永川道路规划局', '民间施工队', 'B', '20km/h', '11.96', '861', '5579.28', '163', 'D', '陈食镇', '街道', '陈食镇', '陈食镇', '1994-01-15', '0.2', '沥青', '0.2', '2', '双向', '5.8-6', '2.9-3', '2.9-3', '5079.9', '无', '无', '无', '钢筋混凝泥土', '0.45', '0', '0', '2', '4', '0');
INSERT INTO `道路完整信息` VALUES (849126, '永川凤凰湖工业园区——陈食——南川', '永川', '南川', '永川城市道路规划局', '城市建造', 'B', '80Km/h', '20', '72830', '1476600', '1314', 'D', '重庆市', '县级公路', '重庆高速公路管理有限公司', '永川城市道路管理', '2010-05-06', '0.8', '沥青', '0.6', '4', '双向', '16-19', '8-9.5', '8-9.5', '5207345', '无', '钢筋混泥土', '1.2', '钢筋混泥土', '1.2', '45', '68', '106', '216', '23456.45');
INSERT INTO `道路完整信息` VALUES (856173, '永川博物馆——滩子坝', '永川博物馆', '滩子坝', '永川道路规划局', '八里乡施工队', 'B', '30Km/h', '25', '9463', '236575', '46154', 'A', '永川区', '城市街道', '永川区', '永川城市道路管路', '1998-04-23', '1.1', '水泥稳定碎石', '0.8', '4', '双向', '20-22', '10-11', '10-11', '99361.5', '有', '钢筋混泥土', '0.8', '钢筋混泥土', '0.8', '9', '15', '14', '26', '0');
INSERT INTO `道路完整信息` VALUES (857213, '重庆科创职业学院——利安凰城华府', '重庆科创职业学院', '利安凰城华府', '永川道路规划局', '城市建筑有限公司', 'C', '25Km/h', '12', '4861', '58332', '34846', 'B', '永川区', '城市街道', '永川区', '永川城市道路管理有限公司', '1999-06-14', '1.1', '水泥稳定碎石', '0.8', '2', '双向', '8-10', '4-5', '4-5', '43749', '有', '钢筋混泥土', '0.8', '钢筋混泥土', '0.8', '6', '9', '12', '16', '0');
INSERT INTO `道路完整信息` VALUES (925614, '陈食——莲花', '陈食', '莲花', '永川道路规划据', '民间施工队', 'D', '40Km/h', '8.04', '10823', '42426.16', '42', 'D', '陈食镇', '乡镇公路', '陈食镇', '陈食镇', '1989-08-05', '0.1', '沥青', '0.1', '1', '单向', '2.97-3.72', '1.46-1.58', '1.46-1.58', '16450.96', '无', '无', '无', '沥青', '无', '3', '5', '9', '7', '356.85');
INSERT INTO `道路完整信息` VALUES (928417, '永川——莲花——临江', '永川', '临江', '永川道路规划局', '民间施工队', 'D', '50Km/h', '11.44', '48536', '277625.92', '485', 'D', '永川区', '乡镇公路', '永川区', '永川区', '1962-06-23', '0.2', '水泥稳定碎石', '0.6', '2', '双向', '5.08-5.44', '2.54-2.72', '2.54-2.72', '257240.8', '无', '无', '无', '钢筋混泥土', '0.6', '9', '8', '21', '34', '4568.46');
INSERT INTO `道路完整信息` VALUES (935672, '临江——双凤', '临江', '双凤', '永川道路规划局', '民间施工队', 'D', '50Km/h', '11.44', '19436', '111173.92', '86', 'D', '临江镇', '乡镇公路', '临江镇', '临江镇', '1991-03-21', '0.2', '沥青', '0.2', '2', '双向', '5.08-5.44', '2.54-2.72', '2.54-2.72', '103010.8', '无', '无', '无', '钢筋混泥土', '0.6', '8', '12', '17', '28', '6564.82');
INSERT INTO `道路完整信息` VALUES (946135, '永川——大安', '永川', '大安', '永川道路规划局', '民间施工队', 'B', '40Km/h', '11.96', '16457', '98412.86', '265', 'D', '大安镇', '乡镇公路', '大安镇', '大安镇', '1991-02-13', '0.2', '沥青', '0.2', '2', '双向', '5.2-5.8', '2.6-2.9', '2.6-2.9', '92157.2', '无', '无', '无', '钢筋混泥土', '0.4', '12', '16', '24', '34', '7514.23');
INSERT INTO `道路完整信息` VALUES (984614, '永川——高滩', '永川', '高滩', '永川道路规划局', '民间施工队', 'D', '30Km/h', '8', '18462', '147696', '235', 'D', '高滩镇', '乡镇街道', '永川区', '高滩镇', '1989-08-06', '0.4', '沥青', '0.4', '2', '双向', '6.2-7.4', '3.1-3.7', '3.1-3.7', '118156.8', '无', '无', '无', '无', '无 ', '21', '23', '36', '39', '9462.26');

-- ----------------------------
-- Table structure for 道路综合评价表
-- ----------------------------
DROP TABLE IF EXISTS `道路综合评价表`;
CREATE TABLE `道路综合评价表`  (
  `道路编号` int(6) NOT NULL,
  `评价日期` int(4) NOT NULL,
  `PQI` decimal(10, 5) NOT NULL,
  `评级` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`道路编号`, `评价日期`) USING BTREE,
  CONSTRAINT `道路编号9` FOREIGN KEY (`道路编号`) REFERENCES `道路关键信息` (`道路编号`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 道路综合评价表
-- ----------------------------

-- ----------------------------
-- Table structure for 道路设施日常巡查情况记录
-- ----------------------------
DROP TABLE IF EXISTS `道路设施日常巡查情况记录`;
CREATE TABLE `道路设施日常巡查情况记录`  (
  `巡查记录编号` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `巡查日期` date NULL DEFAULT NULL,
  `巡查人员` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `道路编号` int(6) NOT NULL,
  `损坏类型` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `损坏位置及损坏情况描述` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `备注` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`巡查记录编号`) USING BTREE,
  INDEX `道路巡查`(`道路编号`) USING BTREE,
  INDEX `巡检损害类型`(`损坏类型`) USING BTREE,
  CONSTRAINT `巡检损害类型` FOREIGN KEY (`损坏类型`) REFERENCES `损坏类型` (`损坏类型`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `道路巡查` FOREIGN KEY (`道路编号`) REFERENCES `道路关键信息` (`道路编号`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of 道路设施日常巡查情况记录
-- ----------------------------

-- ----------------------------
-- Table structure for 道路设施路面损害情况
-- ----------------------------
DROP TABLE IF EXISTS `道路设施路面损害情况`;
CREATE TABLE `道路设施路面损害情况`  (
  `检查编号` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `日期` date NOT NULL,
  `检查人员` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `道路编号` int(6) NOT NULL,
  `起止位置` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `检查总长` decimal(20, 0) NOT NULL,
  `检查总宽` decimal(20, 0) NOT NULL,
  PRIMARY KEY (`检查编号`) USING BTREE,
  INDEX `道路编号2`(`道路编号`) USING BTREE,
  CONSTRAINT `道路编号2` FOREIGN KEY (`道路编号`) REFERENCES `道路关键信息` (`道路编号`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 道路设施路面损害情况
-- ----------------------------

-- ----------------------------
-- Table structure for 道路路面平整度检测
-- ----------------------------
DROP TABLE IF EXISTS `道路路面平整度检测`;
CREATE TABLE `道路路面平整度检测`  (
  `检测编号` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `检测日期` date NOT NULL,
  `检测人员` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `道路编号` int(6) NOT NULL,
  `IRI` decimal(6, 0) NOT NULL,
  `备注` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`检测编号`) USING BTREE,
  INDEX `平整度检测道路编号`(`道路编号`) USING BTREE,
  CONSTRAINT `平整度检测道路编号` FOREIGN KEY (`道路编号`) REFERENCES `道路关键信息` (`道路编号`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 道路路面平整度检测
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
