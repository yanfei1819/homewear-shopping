/*
Navicat MySQL Data Transfer

Source Server         : shopping
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2018-05-02 18:19:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for homewear
-- ----------------------------
DROP TABLE IF EXISTS `homewear`;
CREATE TABLE `homewear` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='家居表';

-- ----------------------------
-- Records of homewear
-- ----------------------------
INSERT INTO `homewear` VALUES ('1', '厨房', '灶台', '蓝色', '10', '5000', '123456.jpg');
INSERT INTO `homewear` VALUES ('2', '客厅', '餐桌', '红色', '11', '3000', 'qwertyu.jpg');
INSERT INTO `homewear` VALUES ('3', '客厅', '电视柜', '白色', '12', '2333', 'qwertyu.jpg');
INSERT INTO `homewear` VALUES ('4', '客厅', '桌子', '蓝色', '13', '444', 'qwertyu.jpg');
INSERT INTO `homewear` VALUES ('5', '客厅', '椅子', '黄色', '14', '1333', 'qwertyu.jpg');
INSERT INTO `homewear` VALUES ('6', '客厅', '茶几', '橙色', '15', '3434', 'qwertyu.jpg');
INSERT INTO `homewear` VALUES ('7', '客厅', '鞋架', '卢瑟', '16', '1343', 'qwertyu.jpg');

-- ----------------------------
-- Table structure for homewear_copy
-- ----------------------------
DROP TABLE IF EXISTS `homewear_copy`;
CREATE TABLE `homewear_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家居表';

-- ----------------------------
-- Records of homewear_copy
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `shoppingCarId` int(11) DEFAULT NULL,
  `shopDate` varchar(60) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('3', '1', '4', '18-05-01', '已支付');
INSERT INTO `orders` VALUES ('4', '1', '5', '18-05-01', '未支付');
INSERT INTO `orders` VALUES ('5', '1', '4', '18-05-02', '未支付');
INSERT INTO `orders` VALUES ('6', '4', '4', '18-05-02', '未支付');

-- ----------------------------
-- Table structure for order_copy
-- ----------------------------
DROP TABLE IF EXISTS `order_copy`;
CREATE TABLE `order_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `shoppingCarId` int(11) DEFAULT NULL,
  `shopDate` varchar(60) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of order_copy
-- ----------------------------
INSERT INTO `order_copy` VALUES ('1', '0', '1', '2018-8-8', '未完成');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员');
INSERT INTO `role` VALUES ('2', '普通用户');

-- ----------------------------
-- Table structure for shoppingcar
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcar` (
  `shoppCarId` int(11) NOT NULL AUTO_INCREMENT,
  `homewearId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `homeWearNo` int(11) DEFAULT '1' COMMENT '货物件数',
  PRIMARY KEY (`shoppCarId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of shoppingcar
-- ----------------------------
INSERT INTO `shoppingcar` VALUES ('4', '12', '12', '23', '6');
INSERT INTO `shoppingcar` VALUES ('5', '12', '12', '23', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `age` int(3) NOT NULL,
  `role` varchar(11) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('4', 'admin', '12', '管理员', '123', '10000', '合肥蜀山区');
INSERT INTO `user` VALUES ('5', 'user', '30', '用户', '123', '10000', '安徽安庆');
INSERT INTO `user` VALUES ('7', '112', '123', '123', '123', '10000', '123');
INSERT INTO `user` VALUES ('8', '12345', '123', '123', '12', '10000', '123');
INSERT INTO `user` VALUES ('11', 'qwerty', '0', '用户', 'qwert', '10000', null);
INSERT INTO `user` VALUES ('14', 'test', '0', '管理员', '123', '10000', null);
INSERT INTO `user` VALUES ('15', 'admin', '0', '管理员', '123134', '10000', null);
