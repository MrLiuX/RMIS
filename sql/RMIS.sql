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

 Date: 03/07/2020 05:35:48
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
  `损坏密度` decimal(10, 5) NOT NULL,
  `扣分` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`路面类型`, `损坏类型`, `损坏密度`) USING BTREE,
  INDEX `损坏类型0`(`损坏类型`) USING BTREE,
  CONSTRAINT `损坏类型0` FOREIGN KEY (`损坏类型`) REFERENCES `损坏类型` (`损坏类型`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `路面类型0` FOREIGN KEY (`路面类型`) REFERENCES `路面类型` (`路面类型`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 损坏单项扣分表
-- ----------------------------
INSERT INTO `损坏单项扣分表` VALUES ('沥青', '线裂', 0.01000, 3);

-- ----------------------------
-- Table structure for 损坏扣分表
-- ----------------------------
DROP TABLE IF EXISTS `损坏扣分表`;
CREATE TABLE `损坏扣分表`  (
  `记录编号` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `路面类型` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `损坏类型` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `损坏面积` decimal(10, 5) NOT NULL,
  `损坏密度` decimal(10, 5) NOT NULL,
  `单项扣分值` decimal(10, 5) NOT NULL,
  PRIMARY KEY (`记录编号`) USING BTREE,
  INDEX `路面类型1`(`路面类型`) USING BTREE,
  INDEX `损坏类型02`(`损坏类型`) USING BTREE,
  CONSTRAINT `损坏类型02` FOREIGN KEY (`损坏类型`) REFERENCES `损坏类型` (`损坏类型`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `路面类型1` FOREIGN KEY (`路面类型`) REFERENCES `路面类型` (`路面类型`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`损坏类型`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 损坏类型
-- ----------------------------
INSERT INTO `损坏类型` VALUES ('水泥', '交叉裂缝和破碎板');
INSERT INTO `损坏类型` VALUES ('沥青', '剥落');
INSERT INTO `损坏类型` VALUES ('通用', '唧浆');
INSERT INTO `损坏类型` VALUES ('沥青', '啃边');
INSERT INTO `损坏类型` VALUES ('沥青', '坑槽');
INSERT INTO `损坏类型` VALUES ('水泥', '坑洞');
INSERT INTO `损坏类型` VALUES ('水泥', '层状剥落');
INSERT INTO `损坏类型` VALUES ('沥青', '拥包');
INSERT INTO `损坏类型` VALUES ('水泥', '拱胀');
INSERT INTO `损坏类型` VALUES ('水泥', '接缝料损坏');
INSERT INTO `损坏类型` VALUES ('水泥', '板角断裂');
INSERT INTO `损坏类型` VALUES ('通用', '沉陷');
INSERT INTO `损坏类型` VALUES ('沥青', '泛油');
INSERT INTO `损坏类型` VALUES ('通用', '线裂');
INSERT INTO `损坏类型` VALUES ('沥青', '网裂');
INSERT INTO `损坏类型` VALUES ('沥青', '翻浆');
INSERT INTO `损坏类型` VALUES ('水泥', '表面裂纹');
INSERT INTO `损坏类型` VALUES ('通用', '路框差');
INSERT INTO `损坏类型` VALUES ('沥青', '车辙');
INSERT INTO `损坏类型` VALUES ('水泥', '边角剥落');
INSERT INTO `损坏类型` VALUES ('水泥', '边角裂缝');
INSERT INTO `损坏类型` VALUES ('水泥', '错台');
INSERT INTO `损坏类型` VALUES ('沥青', '龟裂');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `设计时速` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `路幅宽度` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `道路长度` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `道路面积` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AADT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `交通量等级` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `所属乡镇` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `管理分类` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `管理单位` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `养护单位` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `建造年月` date NULL DEFAULT NULL,
  `路面厚度` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `基层类型` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `基层厚度` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
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
  `检查井数量` int(4) NULL DEFAULT NULL,
  `雨水口数量` int(4) NULL DEFAULT NULL,
  `路名牌数量` int(4) NULL DEFAULT NULL,
  `标志牌数量` int(4) NULL DEFAULT NULL,
  `树池面积` int(4) NULL DEFAULT NULL,
  PRIMARY KEY (`道路编号`) USING BTREE,
  CONSTRAINT `道路完整信息` FOREIGN KEY (`道路编号`) REFERENCES `道路关键信息` (`道路编号`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 道路完整信息
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 道路路面平整度检测
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
