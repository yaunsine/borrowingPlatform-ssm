/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : db_book

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-07-09 19:57:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` int(30) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', '张三', '111', '17806707086');

-- ----------------------------
-- Table structure for `tb_book`
-- ----------------------------
DROP TABLE IF EXISTS `tb_book`;
CREATE TABLE `tb_book` (
  `bookid` int(30) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL,
  `typeid` int(30) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `publisher` varchar(60) DEFAULT NULL,
  `subtime` date DEFAULT NULL,
  `counts` int(10) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_book
-- ----------------------------
INSERT INTO `tb_book` VALUES ('1', '西游记', '吴承恩', '978-252542-23452453', '3', 'ed033ae6-f4b6-4f3e-9a05-b41721efbbc5.jpg', '清华大学出版社', '2020-06-19', '0');
INSERT INTO `tb_book` VALUES ('2', '设计模式', '李华', '978-252542-23452453', '1', 'a047e580-111d-4518-adb3-09dee1f7ac12.jpg', '清华大学出版社', '2020-06-17', '2');
INSERT INTO `tb_book` VALUES ('3', '玩转GitHub', '蒋虎虎', '978-2132-123213313', '1', '6f1e1068-86f5-4ef2-a272-c50ddf5d8a1a.jpg', '清华大学出版社', '2020-06-24', '2');
INSERT INTO `tb_book` VALUES ('4', '编程从入门到放弃', '小小鱼', '978-32343432-234234', '1', 'c4414c89-3857-453d-bcc4-17bd6d6222ef.gif', '机械大学出版社', '2020-06-25', '2');
INSERT INTO `tb_book` VALUES ('5', '水浒传', '施耐庵', '978-00323-32342343', '3', '0519f653-0e94-40d5-8ffc-9658b2f3bf5f.gif', '黄河出版社', '2020-06-26', '2');
INSERT INTO `tb_book` VALUES ('6', '三国演义', '罗贯中', '968-23434-2342343', '3', 'c7e9eed3-82d6-4eef-9d04-4a7b28770df2.jpg', '中国教育出版社', '2020-06-26', '2');
INSERT INTO `tb_book` VALUES ('7', '悲惨世界', '雨果', '945-234324-645646', '2', 'c99fdd9b-f735-47b0-b7b5-bb17378b9bc5.jpg', '人民日报出版社', '2020-06-26', '3');
INSERT INTO `tb_book` VALUES ('8', '英语过关5500词', '俞敏洪', '868-254543-673652', '5', 'afd93825-faed-465c-942c-391e7a0ba677.gif', '新东方出版社', '2020-06-26', '3');
INSERT INTO `tb_book` VALUES ('9', '歇后语大全', '阿凡提提', '922-026328-3382843', '4', 'be25f04d-7086-4250-b44d-9a048e011f1a.gif', '青年志愿者出版社', '2020-06-26', '2');
INSERT INTO `tb_book` VALUES ('10', '父与子', '张小二', '966-245245-245242', '6', 'a1cacee9-dd5d-4a99-9785-0dc27097b4fc.jpg', '长江出版社', '2020-06-29', '5');
INSERT INTO `tb_book` VALUES ('11', '山海经', '佚名', '955-4245234-234523453', '6', '877e1309-fd72-42e0-9749-b49a677ceba7.jpg', '长江出版社', '2020-06-29', '4');
INSERT INTO `tb_book` VALUES ('12', '第一行代码', '小明', '952452-245245-2424', '1', 'be12f2af-fc60-44f6-adaf-1da700b135a4.jpg', '清华大学出版社', '2020-07-04', '3');
INSERT INTO `tb_book` VALUES ('13', '他们', '小小鱼', '952--5435343-34543', '2', 'b766c1b5-a73c-4acf-b2d3-b02914af8c90.png', '西双版纳出版社', '2020-07-04', '2');
INSERT INTO `tb_book` VALUES ('14', 'Spring微服务', '张小龙', '9234-234324432-23432', '1', '319888ca-1662-4772-aa6e-442e0e711119.jpg', '阿里大学出版社', '2020-07-04', '3');
INSERT INTO `tb_book` VALUES ('15', '父与子', '普劳恩', '923-245433-35353', '6', 'c64d51cc-0c97-4262-8ac4-daa71ac2a1c6.jpg', '长安漫画出版社', '2020-07-04', '4');
INSERT INTO `tb_book` VALUES ('16', '国学大观', '阿金', '8423-23423-234234', '4', '07758b43-e659-4c58-9a04-89fe9ce03352.jpg', '北京大学出版社', '2020-07-04', '2');
INSERT INTO `tb_book` VALUES ('17', '图解语音识别', '张小兵', '94564-6775-68867', '1', '210852b4-402e-408c-948e-ecdd11c0bce6.jpg', '机械工业出版社', '2020-07-04', '3');
INSERT INTO `tb_book` VALUES ('18', '国学知识大全', '函', '942-23424234-23423432', '4', '725ad8b6-c401-452d-a312-f5811dba2421.jpg', '金正出版社', '2020-07-04', '2');
INSERT INTO `tb_book` VALUES ('19', '韩语入门', '飘飘', '932-2323-2342344', '5', 'a12944f3-d012-4def-ab21-43d698cd73ad.jpg', '韩语郑出版社', '2020-07-04', '2');

-- ----------------------------
-- Table structure for `tb_borrow`
-- ----------------------------
DROP TABLE IF EXISTS `tb_borrow`;
CREATE TABLE `tb_borrow` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `bookid` int(30) DEFAULT NULL,
  `userid` int(30) DEFAULT NULL,
  `starttime` date DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `stat` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_borrow
-- ----------------------------
INSERT INTO `tb_borrow` VALUES ('1', '5', '10', '2020-05-28', '2020-06-28', '2');
INSERT INTO `tb_borrow` VALUES ('5', '8', '9', '2020-06-29', '2020-07-29', '3');
INSERT INTO `tb_borrow` VALUES ('6', '1', '10', '2020-06-29', '2020-07-29', '1');
INSERT INTO `tb_borrow` VALUES ('7', '1', '10', '2020-06-29', '2020-07-29', '1');
INSERT INTO `tb_borrow` VALUES ('8', '12', '10', '2020-07-04', '2020-08-04', '1');

-- ----------------------------
-- Table structure for `tb_card`
-- ----------------------------
DROP TABLE IF EXISTS `tb_card`;
CREATE TABLE `tb_card` (
  `userid` int(30) DEFAULT NULL,
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `stime` date DEFAULT NULL,
  `etime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_card
-- ----------------------------
INSERT INTO `tb_card` VALUES ('6', '1', '李四', '2020-06-24', '2021-06-24');
INSERT INTO `tb_card` VALUES ('7', '2', '林谦', '2020-06-24', '2021-06-24');
INSERT INTO `tb_card` VALUES ('8', '3', '陈梦', '2020-06-24', '2021-06-24');
INSERT INTO `tb_card` VALUES ('9', '4', '张镇', '2020-06-26', '2020-07-26');
INSERT INTO `tb_card` VALUES ('10', '5', '刘金', '2020-07-03', '2021-07-03');
INSERT INTO `tb_card` VALUES ('12', '8', '刘梓', '2020-07-04', '2021-07-04');

-- ----------------------------
-- Table structure for `tb_overdue`
-- ----------------------------
DROP TABLE IF EXISTS `tb_overdue`;
CREATE TABLE `tb_overdue` (
  `id` int(30) NOT NULL DEFAULT '0',
  `days` int(10) DEFAULT NULL,
  `rate` double(20,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_overdue
-- ----------------------------
INSERT INTO `tb_overdue` VALUES ('1', '0', '0');

-- ----------------------------
-- Table structure for `tb_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_type`;
CREATE TABLE `tb_type` (
  `typeid` int(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_type
-- ----------------------------
INSERT INTO `tb_type` VALUES ('1', '计算机类', '包括计算机前沿知识，计算机的编程算法，涉及计算机语言C/C++，Python，Java等');
INSERT INTO `tb_type` VALUES ('2', '文学类', '经典国学，涵盖散文、诗歌等经典著作');
INSERT INTO `tb_type` VALUES ('3', '小说类', '仙侠小说，校园小说，短篇、中篇、长篇等');
INSERT INTO `tb_type` VALUES ('4', '国学类', '经典寓言故事，童话故事，成语、歇后语，诗歌……');
INSERT INTO `tb_type` VALUES ('5', '语言类', '中文、日语、英语、葡萄牙语、西班牙语、法语……');
INSERT INTO `tb_type` VALUES ('6', '漫画类', '漫画图书，国漫经典');
INSERT INTO `tb_type` VALUES ('7', '地理人文', '地理山河、气候变化');
INSERT INTO `tb_type` VALUES ('8', '农业类', '种植经济、新型农民');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) DEFAULT NULL,
  `realname` varchar(30) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('6', '爱读书的小伙计', '李四', '男', '17806707086', '12321313@qq.com', '9999');
INSERT INTO `tb_user` VALUES ('7', '爱读书的小伙计', '林谦', '男', '17803434438', '3829433@163.com', '999999');
INSERT INTO `tb_user` VALUES ('8', '爱读书的小伙计', '陈梦', '女', '13532390568', '8342784@qq.com', '111');
INSERT INTO `tb_user` VALUES ('9', '爱读书的小伙计', '张镇', '男', '13729585629', '5785444@qq.com', '6666');
INSERT INTO `tb_user` VALUES ('10', '稻香', '刘金', '男', '17806707089', '792843572@qq.com', '111');
INSERT INTO `tb_user` VALUES ('11', '爱读书的小伙计', '林杰', '男', '17884232458', '14341341@163.com', '111');
INSERT INTO `tb_user` VALUES ('12', '问天', '刘梓', '女', '13476856289', '45556@qq.com', '111');
