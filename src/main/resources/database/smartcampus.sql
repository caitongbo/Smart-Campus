/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : smartcampus

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 05/07/2018 13:04:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `au_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名，比如老师、学生、商户',
  `au_details` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限职能描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (-1, '商户', '我的商品 我要上架 我要下架');
INSERT INTO `authority` VALUES (0, '教师', '我的一卡通 审核学生申请的一卡通 我的订单');
INSERT INTO `authority` VALUES (1, '学生', '我的一卡通，我的订单');

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '一卡通编号',
  `card_vid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card_balance` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '一卡通余额',
  `sq_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请ID',
  `auth_id` int(11) NOT NULL COMMENT '一卡通权限',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0不可用1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES (5, '1111111', '5453', 't1', 0, '0');
INSERT INTO `card` VALUES (12, '1', '1', 's1', 1, '0');
INSERT INTO `card` VALUES (14, '1', '1111111111111111', 's1', 1, '0');
INSERT INTO `card` VALUES (15, '3', '1212121', 't1', 1, '0');
INSERT INTO `card` VALUES (16, '3', '88', 't1', 0, '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL,
  `g_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名',
  `g_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品价格',
  `g_ly` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品来源',
  `g_vid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '条形码',
  `g_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `g_simg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品缩略图',
  `g_label` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `g_details` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品详情',
  `g_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品状态 1上架 0下架 -1缺货',
  `s_i_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家表ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (3, '3', '3', '3', '3', '3', '3', '3', '3', '0', '5');
INSERT INTO `goods` VALUES (4, '4', '4', '4', '4', '4', '4', '4', '4', '-1', '5');
INSERT INTO `goods` VALUES (5, '5', '5', '5', '5', '5', '5', '5', '5', '-1', '5');
INSERT INTO `goods` VALUES (6, '6', '6', '6', '6', '6', '6', '6', '6', '1', '5');
INSERT INTO `goods` VALUES (7, '7', '7', '7', '7', '7', '7', '7', '7', '1', '6');
INSERT INTO `goods` VALUES (8, '8', '8', '8', '8', '8', '8', '8', '8', '1', '6');
INSERT INTO `goods` VALUES (9, '9', '9', '9', '9', '9', '9', '9', '9', '1', '6');
INSERT INTO `goods` VALUES (10, '10', '10', '10', '10', '10', '10', '10', '10', '1', '6');
INSERT INTO `goods` VALUES (11, '11', '11', '11', '11', '11', '11', '11', '11', '1', '6');
INSERT INTO `goods` VALUES (12, '12', '12', '12', '12', '12', '12', '12', '12', '1', '6');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `user_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `g_id` int(11) NOT NULL COMMENT '商品ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 1);
INSERT INTO `orders` VALUES ('3', 1);
INSERT INTO `orders` VALUES ('3', 1);
INSERT INTO `orders` VALUES ('3', 3);
INSERT INTO `orders` VALUES ('1', 9);
INSERT INTO `orders` VALUES ('1', 1);
INSERT INTO `orders` VALUES ('1', 7);
INSERT INTO `orders` VALUES ('1', 8);
INSERT INTO `orders` VALUES ('1', 2);
INSERT INTO `orders` VALUES ('3', 4);
INSERT INTO `orders` VALUES ('5', 8);

-- ----------------------------
-- Table structure for shop_info
-- ----------------------------
DROP TABLE IF EXISTS `shop_info`;
CREATE TABLE `shop_info`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自动生成UUID',
  `shop_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家名',
  `show_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家地址',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否可用 0不可用 1可用'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_info
-- ----------------------------
INSERT INTO `shop_info` VALUES ('6', '京东超市', '苏州市吴江区金家坝镇金长路1248号', '0');
INSERT INTO `shop_info` VALUES ('5', '天猫超市', '南京市雨花台区软件大道109号', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自动生成UUID',
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号/教师账号 系统生成',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码，手机登录无需密码',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否可用，0不可用，1可用',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0邮箱，1手机，2帐号',
  `auth_id` int(11) NOT NULL COMMENT '用户权限',
  `shop_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0普通用户 1商家',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 's1', 's1', '0', '0', 0, '0');
INSERT INTO `user` VALUES ('2', 's2', 's2', '1', '1', 0, '0');
INSERT INTO `user` VALUES ('3', 't1', 't1', '0', '2', 1, '1');
INSERT INTO `user` VALUES ('4', 't2', 't2', '1', '0', 1, '1');
INSERT INTO `user` VALUES ('5', 'b1', 'b1', '0', '1', -1, '-1');
INSERT INTO `user` VALUES ('6', 'b2', 'b2', '1', '2', -1, '-1');

SET FOREIGN_KEY_CHECKS = 1;
