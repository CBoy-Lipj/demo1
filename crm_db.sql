/*
Navicat MySQL Data Transfer

Source Server         : lipj
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : crm_db

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2020-03-29 18:52:35
*/
CREATE DATABASE crm_db;

use crm_db;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  `busubess_name` varchar(255) NOT NULL,
  `head` varchar(255) NOT NULL,
  `telphone` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_del` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('1', '腥红之月', '易', '15444844487', '皮肤', '2020-03-29 20:35:53', '2020-03-28 18:35:55', '0');
INSERT INTO `business` VALUES ('2', '玉剑传说', '易', '15445556544', '皮肤', '2020-03-29 17:42:25', '2020-03-29 18:45:48', '0');
INSERT INTO `business` VALUES ('3', '合金装备', '易', '32115445447', '皮肤', '2020-03-29 18:46:04', '2020-03-29 18:46:31', '1');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `way` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_del` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('7', '电话联系', '哈哈哈', '8', '1', '2020-03-29 17:53:35', '2020-03-29 17:53:35', '0');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(255) NOT NULL,
  `sex` varchar(4) NOT NULL,
  `telphone` varchar(20) NOT NULL,
  `company` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `is_orders` int(10) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_del` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('8', '李朋骏', '男', '12345678911', '随便', '哪里都行', '1', '1', '2020-03-29 17:53:20', '2020-03-29 17:53:20', '0');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_del` int(11) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '总经办', '2020-03-24 09:34:13', '2020-03-24 09:34:16', '0');
INSERT INTO `department` VALUES ('2', '人事部', '2020-03-29 17:34:18', '2020-03-29 17:34:18', '0');
INSERT INTO `department` VALUES ('3', '外联部', '2020-03-29 18:40:49', '2020-03-29 18:42:52', '1');

-- ----------------------------
-- Table structure for dept_role
-- ----------------------------
DROP TABLE IF EXISTS `dept_role`;
CREATE TABLE `dept_role` (
  `dept_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_del` int(11) NOT NULL,
  PRIMARY KEY (`dept_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept_role
-- ----------------------------
INSERT INTO `dept_role` VALUES ('1', '1', '2020-03-24 09:33:54', '2020-03-24 09:33:56', '0');
INSERT INTO `dept_role` VALUES ('1', '3', '2020-03-29 17:56:05', '2020-03-29 17:56:05', '0');
INSERT INTO `dept_role` VALUES ('1', '5', '2020-03-29 18:34:08', '2020-03-29 18:35:32', '0');
INSERT INTO `dept_role` VALUES ('2', '4', '2020-03-29 18:32:54', '2020-03-29 18:32:54', '0');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(50) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(3) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_del` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'admin', 'ab395f9bcce071deeb8d6a42ccb31082', 'b88ad99e38ec', '18', '男', '13513513511', '广州天河', '2020-03-23 15:34:10', '2020-03-23 15:34:13', '0');
INSERT INTO `employee` VALUES ('2', '张三', '123', '123', '18', '男', '13355', '广州', '2020-03-24 09:29:16', '2020-03-24 09:29:19', '1');
INSERT INTO `employee` VALUES ('3', '李四', '123456', '123', '18', '男', '13355', '广州', '2020-03-24 09:29:16', '2020-03-24 09:29:19', '1');
INSERT INTO `employee` VALUES ('4', 'tom', '123456', '123', '18', '男', '13355', '广州', '2020-03-24 09:29:16', '2020-03-29 17:56:24', '0');
INSERT INTO `employee` VALUES ('5', 'jerry', '123456', '123', '18', '女', '13355', '广州', '2020-03-24 09:29:16', '2020-03-29 17:56:33', '0');
INSERT INTO `employee` VALUES ('6', 'ben', '123456', '123', '18', '男', '13355', '广州', '2020-03-24 09:29:16', '2020-03-29 18:27:07', '1');
INSERT INTO `employee` VALUES ('7', 'luffy', '123456', '123', '18', '男', '13355', '广州', '2020-03-24 09:29:16', '2020-03-24 09:29:19', '0');
INSERT INTO `employee` VALUES ('8', 'nami', '123456', '123', '18', '女', '13355', '广州', '2020-03-24 09:29:16', '2020-03-24 09:29:19', '0');
INSERT INTO `employee` VALUES ('9', 'soro', '123456', '123', '18', '男', '13355', '广州', '2020-03-24 09:29:16', '2020-03-24 09:29:19', '0');
INSERT INTO `employee` VALUES ('10', 'san', '123456', '123', '18', '男', '13355', '广州', '2020-03-24 09:29:16', '2020-03-24 09:29:19', '0');
INSERT INTO `employee` VALUES ('11', 'honto', '123456', '123', '18', '男', '13355', '广州', '2020-03-24 09:29:16', '2020-03-24 09:29:19', '0');
INSERT INTO `employee` VALUES ('12', 'mali', '123456', '123', '18', '女', '13355', '广州', '2020-03-24 09:29:16', '2020-03-24 09:29:19', '0');
INSERT INTO `employee` VALUES ('13', 'test', '123', '123', '18', '男', '13533', '天河', '2020-03-25 00:00:00', '2020-03-25 00:00:00', '0');
INSERT INTO `employee` VALUES ('14', 'test', '5eea41cb71c152f41548489ac186b12c', 'c0f135ff74bb', '18', '男', '13533', '天河', '2020-03-25 14:53:46', '2020-03-25 14:53:46', '0');
INSERT INTO `employee` VALUES ('16', '帅哥', '228e0cb83072fc4bdf626561d2c42536', 'f2a59fd5bcb7', '18', '男', '13533', '天河', '2020-03-25 15:05:36', '2020-03-25 15:05:36', '1');
INSERT INTO `employee` VALUES ('17', '小崔', 'eaa979864ee5d5c8a7b480bacca3e141', '87b423c94b97', '30', '男', '13535556788', '天河', '2020-03-25 15:10:50', '2020-03-25 15:10:50', '1');
INSERT INTO `employee` VALUES ('18', '小崔', '0f99a23a30b9d77277ce637e3287f211', '5d3476d3334c', '30', '男', '13535556788', '天河', '2020-03-25 15:10:55', '2020-03-28 14:11:27', '0');
INSERT INTO `employee` VALUES ('19', '小崔', '0441ab42d667d3773bf55e27b577b009', '79183b940a60', '30', '男', '13535556788', '天河哈哈哈哈哈哈', '2020-03-25 15:11:04', '2020-03-25 15:11:04', '1');
INSERT INTO `employee` VALUES ('20', '小崔', '5dcd9ecc6e06f47dedf3c65f4fd59379', 'fa4851839f80', '30', '男', '13535556788', '天河哈哈哈哈哈哈', '2020-03-25 15:11:15', '2020-03-25 15:11:15', '1');
INSERT INTO `employee` VALUES ('21', '小小', 'a59b046ff0b81a93c51aba485123d1a2', '0d5d3d632cfa', '18', '女', '11111111111', 'jj', '2020-03-25 15:18:22', '2020-03-29 17:33:13', '1');
INSERT INTO `employee` VALUES ('22', '娜美', 'c74cff82a1a51a706539907ca71c3be6', 'fed21df74311', '20', '女', '13533876766', 'dad', '2020-03-25 15:22:56', '2020-03-25 15:22:56', '0');
INSERT INTO `employee` VALUES ('24', '李朋骏', '9419c0560f29d6caa33232d48cec1108', '49692f930f62', '20', '男', '13554445444', '广东深圳', '2020-03-25 19:29:28', '2020-03-29 17:32:57', '0');
INSERT INTO `employee` VALUES ('25', 'vsh', '2bf6ef5577bcc89903cf19f9ea48ab3c', '5d1d22ce9ef2', '45', '男', '13555444555', 'tgd', '2020-03-26 18:07:52', '2020-03-29 18:15:15', '0');
INSERT INTO `employee` VALUES ('26', 'lpj', '92e3c0f5a8f6c38c1052c72a2954a5d0', 'ba909a851954', '18', '男', '12222444455', '觉得', '2020-03-29 17:33:39', '2020-03-29 17:33:39', '0');
INSERT INTO `employee` VALUES ('27', 'zhw', 'f61fe31e43076f36f0b545d295000886', 'e1cdc99cbaca', '18', '男', '12444454456', '随便', '2020-03-29 17:57:19', '2020-03-29 17:57:19', '0');
INSERT INTO `employee` VALUES ('28', 'asf', '94f59fc650718e0ae68c5e4e87a105d6', '7bda71903fb8', '18', '男', '15444877755', '哪都行', '2020-03-29 18:28:28', '2020-03-29 18:28:28', '0');

-- ----------------------------
-- Table structure for emp_role
-- ----------------------------
DROP TABLE IF EXISTS `emp_role`;
CREATE TABLE `emp_role` (
  `emp_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_del` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_role
-- ----------------------------
INSERT INTO `emp_role` VALUES ('1', '1', '2020-03-24 09:29:38', '2020-03-24 09:29:40', '0');
INSERT INTO `emp_role` VALUES ('2', '2', '2020-03-24 09:30:05', '2020-03-24 09:30:08', '0');
INSERT INTO `emp_role` VALUES ('4', '1', '2020-03-29 17:56:24', '2020-03-29 17:56:24', '0');
INSERT INTO `emp_role` VALUES ('5', '3', '2020-03-29 17:56:33', '2020-03-29 17:56:33', '0');
INSERT INTO `emp_role` VALUES ('16', '1', '2020-03-25 15:05:36', '2020-03-25 15:05:36', '0');
INSERT INTO `emp_role` VALUES ('17', '2', '2020-03-25 15:10:50', '2020-03-25 15:10:50', '0');
INSERT INTO `emp_role` VALUES ('18', '1', '2020-03-25 15:10:55', '2020-03-28 14:11:27', '0');
INSERT INTO `emp_role` VALUES ('19', '2', '2020-03-25 15:11:04', '2020-03-25 15:11:04', '0');
INSERT INTO `emp_role` VALUES ('20', '2', '2020-03-25 15:11:15', '2020-03-25 15:11:15', '0');
INSERT INTO `emp_role` VALUES ('21', '2', '2020-03-25 15:18:23', '2020-03-25 15:18:23', '0');
INSERT INTO `emp_role` VALUES ('22', '2', '2020-03-25 15:22:56', '2020-03-25 15:22:56', '0');
INSERT INTO `emp_role` VALUES ('23', '1', '2020-03-25 19:23:53', '2020-03-25 19:23:53', '0');
INSERT INTO `emp_role` VALUES ('24', '1', '2020-03-25 19:29:28', '2020-03-26 18:05:34', '0');
INSERT INTO `emp_role` VALUES ('25', '2', '2020-03-26 18:07:52', '2020-03-28 16:48:11', '0');
INSERT INTO `emp_role` VALUES ('26', '2', '2020-03-29 17:33:39', '2020-03-29 17:33:39', '0');
INSERT INTO `emp_role` VALUES ('27', '1', '2020-03-29 17:57:19', '2020-03-29 17:57:19', '0');
INSERT INTO `emp_role` VALUES ('28', '3', '2020-03-29 18:28:28', '2020-03-29 18:28:28', '0');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_del` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1006', '2', '79.00', '8', '2020-03-29 17:55:28', '2020-03-29 17:55:28', '0');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `perm_id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_del` int(11) NOT NULL,
  PRIMARY KEY (`perm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '员工查询', '/emp', 'emp:list', '2020-03-24 09:33:28', '2020-03-24 09:33:30', '0');
INSERT INTO `permission` VALUES ('2', '员工修改', '/emp/del/', 'emp:del', '2020-03-29 17:36:21', '2020-03-29 17:36:21', '0');
INSERT INTO `permission` VALUES ('3', '员工添加', '/emp/add/', 'emp:add', '2020-03-29 18:46:39', '2020-03-29 18:48:27', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_del` int(11) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '总经理', '2020-03-24 09:27:40', '2020-03-24 09:27:42', '0');
INSERT INTO `role` VALUES ('2', '销售员', '2020-03-24 09:28:09', '2020-03-29 17:55:49', '1');
INSERT INTO `role` VALUES ('3', '助理', '2020-03-29 17:56:05', '2020-03-29 17:56:05', '0');
INSERT INTO `role` VALUES ('4', '客服', '2020-03-29 18:32:54', '2020-03-29 18:32:59', '1');
INSERT INTO `role` VALUES ('5', '客服', '2020-03-29 18:34:08', '2020-03-29 18:35:44', '1');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `role_id` int(11) NOT NULL,
  `perm_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_del` int(11) NOT NULL,
  PRIMARY KEY (`perm_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '2020-03-24 09:34:39', '2020-03-24 09:34:41', '0');
