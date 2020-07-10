/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : course

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-04-12 22:20:47
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `bulletinboard`
-- ----------------------------
DROP TABLE IF EXISTS `bulletinboard`;
CREATE TABLE `bulletinboard` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(500) NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bulletinboard
-- ----------------------------

-- ----------------------------
-- Table structure for `classes`
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `name` varchar(30) NOT NULL COMMENT '班级名称',
  `majorId` bigint(12) NOT NULL COMMENT '专业id',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO classes VALUES ('1', '计算机1701', '1', '2016-03-08 00:00:00');
INSERT INTO classes VALUES ('2', '计算机1702', '2', '2016-03-02 00:00:00');
INSERT INTO classes VALUES ('4', '计算机1703', '1', '2016-03-15 00:00:00');
INSERT INTO classes VALUES ('5', '计算机1704', '3', '2016-03-16 00:00:00');
INSERT INTO classes VALUES ('6', '计算机1705', '3', '2016-03-09 00:00:00');
INSERT INTO classes VALUES ('7', '计算机1706', '3', '2016-03-15 00:00:00');

-- ----------------------------
-- Table structure for `college`
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT '学院id',
  `name` varchar(30) NOT NULL COMMENT '学院名称',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO college VALUES ('1', '计算机学院', '2016-03-01 15:41:58');
INSERT INTO college VALUES ('2', '音乐舞蹈学院', '2016-02-16 00:00:00');
INSERT INTO college VALUES ('4', '设计学院', '2015-09-01 15:43:03');
INSERT INTO college VALUES ('5', '体育学院', '2016-03-08 00:00:00');
INSERT INTO college VALUES ('6', '材料学院', '2016-03-16 09:50:35');
INSERT INTO college VALUES ('11', '文史学院', '2016-03-04 00:00:00');
INSERT INTO college VALUES ('12', '经济学院', '2016-03-02 00:00:00');
INSERT INTO college VALUES ('13', '外国语学院', '2016-03-21 00:00:00');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `courseNumber` varchar(40) COLLATE utf8_bin NOT NULL,
  `userNumber` varchar(40) COLLATE utf8_bin NOT NULL,
  `content` varchar(400) COLLATE utf8_bin NOT NULL,
  `createtime` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO comment VALUES ('16', '223', '3171911130', 'sdasd', '2020-03-23 17:02:38');
INSERT INTO comment VALUES ('17', '223', '3171911130', '会', '2020-03-23 17:08:50');
INSERT INTO comment VALUES ('18', '223', '3171911130', 'dsd', '2020-03-23 17:28:54');
INSERT INTO comment VALUES ('19', '223', '3171911130', 'dasdda', '2020-03-23 17:34:23');
INSERT INTO comment VALUES ('20', '223', '3171911130', 'dasdasdfds', '2020-03-23 17:39:13');
INSERT INTO comment VALUES ('21', '223', '3171911130', 'ggfg', '2020-03-23 17:48:03');
INSERT INTO comment VALUES ('24', '223', '3171911130', '我不会咋办', '2020-03-23 17:50:32');
INSERT INTO comment VALUES ('33', '223', '3171911149', '信任到来', '2020-04-12 11:19:14');
INSERT INTO comment VALUES ('36', '223', '3171911130', '你好吗，我很好', '2020-04-12 14:10:05');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `courseNumber` bigint(12) DEFAULT NULL COMMENT '课程编号',
  `name` varchar(50) NOT NULL COMMENT '课程名称',
  `credit` int(2) NOT NULL COMMENT '学分',
  `teacherId` bigint(12) NOT NULL COMMENT '任课老师id',
  `schooltime` varchar(50) NOT NULL DEFAULT '' COMMENT '上课时间',
  `address` varchar(50) NOT NULL COMMENT '上课地址',
  `specialtyId` bigint(12) NOT NULL COMMENT '所属专业id',
  `numberLimit` int(3) NOT NULL COMMENT '最大的选课人数',
  `numberSpace` int(3) DEFAULT NULL COMMENT '剩余多少容量',
  `isFinish` int(1) DEFAULT '0' COMMENT '是否可选（0：不可  1：可选）',
  `createTime` datetime DEFAULT NULL COMMENT '添加课程的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO course VALUES ('1', '1', '高数学', '2', '2', '周三5,6节；周五9,10节（16周）', '博8', '1', '212', '11', '1', '2020-03-21 01:11:11');
INSERT INTO course VALUES ('3', '23', '马克思', '23', '3', '周二5,6节；周五9,10节（16周）', '博8', '2', '81', '0', '1', '2020-03-21 22:22:22');
INSERT INTO course VALUES ('4', '223', '计算机科学', '3', '3', '周三5,6节；周四9,10节（16周）', '博8', '1', '69', '66', '1', '2020-03-21 03:33:33');
INSERT INTO course VALUES ('5', '12', '数据结构', '2', '2', '周三5,6节；周四9,10节（16周）', '博8', '1', '69', '66', '1', '2020-03-21 05:55:55');
INSERT INTO course VALUES ('6', '123', '离散数学', '123', '2', '周一1,2节；周五3,4节（16周）', '博8', '1', '50', '8', '1', '2020-03-21 06:06:00');
INSERT INTO course VALUES ('7', '21', 'Java程序设计', '3', '3', '周二3,4节；周四7,8节（12周）', '博8', '1', '70', '69', '1', '2020-03-21 07:07:00');

-- ----------------------------
-- Table structure for `data`
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `courseNumber` varchar(40) COLLATE utf8_bin NOT NULL,
  `studentid` varchar(40) COLLATE utf8_bin NOT NULL,
  `indentfy` int(2) NOT NULL,
  `url` varchar(400) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of data
-- ----------------------------
INSERT INTO data VALUES ('14', '1', '3171911130', '0', 'c++.txt');
INSERT INTO data VALUES ('16', '1', '3171911130', '1', 'Java.pdf');
INSERT INTO data VALUES ('17', '223', '3171911130', '0', 'settings.xml');
INSERT INTO data VALUES ('18', '223', '3171911130', '0', 'toolchains.xml');

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT '专业id',
  `name` varchar(30) NOT NULL COMMENT '专业名称',
  `collegeId` bigint(12) NOT NULL COMMENT '学院id',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO major VALUES ('1', '软件工程', '1', '2016-03-07 00:00:00');
INSERT INTO major VALUES ('2', '声乐学', '2', '2016-03-09 00:00:00');
INSERT INTO major VALUES ('3', '网络工程', '1', '2016-03-09 00:00:00');
INSERT INTO major VALUES ('4', '信管专业', '1', '2016-03-08 00:00:00');

-- ----------------------------
-- Table structure for `quebank`
-- ----------------------------
DROP TABLE IF EXISTS `quebank`;
CREATE TABLE `quebank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(40) COLLATE utf8_bin NOT NULL,
  `quesion` varchar(40) COLLATE utf8_bin NOT NULL,
  `answer` varchar(40) COLLATE utf8_bin NOT NULL,
  `courseNumber` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of quebank
-- ----------------------------
INSERT INTO quebank VALUES ('1', '历史', '1+2', '3', '1');
INSERT INTO quebank VALUES ('2', '历史', '1+3', '4', '1');
INSERT INTO quebank VALUES ('3', '历史', '1+1', '2', '1');
INSERT INTO quebank VALUES ('4', '历史', '1+4', '5', '1');
INSERT INTO quebank VALUES ('5', '历史', '1+5', '6', '1');
INSERT INTO quebank VALUES ('6', '历史', '1+6', '7', '1');
INSERT INTO quebank VALUES ('7', '历史', '1+7', '8', '1');
INSERT INTO quebank VALUES ('8', '历史', '1+8', '9', '1');
INSERT INTO quebank VALUES ('9', '历史', '1+9', '10', '1');
INSERT INTO quebank VALUES ('10', '历史', '1+10', '11', '1');
INSERT INTO quebank VALUES ('11', '历史', '1+11', '12', '1');
INSERT INTO quebank VALUES ('12', '历史', '1+12', '13', '1');
INSERT INTO quebank VALUES ('13', '计算机科学', '2+3', '5', '223');
INSERT INTO quebank VALUES ('14', '计算机科学', '2+1', '3', '223');
INSERT INTO quebank VALUES ('15', '计算机科学', '2+2', '4', '223');
INSERT INTO quebank VALUES ('16', '计算机科学', '2+4', '6', '223');
INSERT INTO quebank VALUES ('17', '计算机科学', '2+5', '7', '223');
INSERT INTO quebank VALUES ('18', '计算机科学', '2+6', '8', '223');
INSERT INTO quebank VALUES ('19', '计算机科学', '2+7', '9', '223');
INSERT INTO quebank VALUES ('20', '计算机科学', '2+8', '10', '223');
INSERT INTO quebank VALUES ('21', '计算机科学', '2+9', '11', '223');
INSERT INTO quebank VALUES ('22', '计算机科学', '2+10', '12', '223');
INSERT INTO quebank VALUES ('23', '计算机科学', '2+11', '13', '223');
INSERT INTO quebank VALUES ('24', '计算机科学', '2+12', '14', '223');
INSERT INTO quebank VALUES ('25', '计算机科学', '2+13', '15', '223');
INSERT INTO quebank VALUES ('26', '计算机科学', '2+14', '16', '223');
INSERT INTO quebank VALUES ('27', '计算机科学', '2+15', '17', '223');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `comment_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `commentuserNumber` varchar(40) COLLATE utf8_bin NOT NULL,
  `replyuserNumber` varchar(40) COLLATE utf8_bin NOT NULL,
  `comment` varchar(40) COLLATE utf8_bin NOT NULL,
  `reply` varchar(40) COLLATE utf8_bin NOT NULL,
  `createtime` varchar(40) COLLATE utf8_bin NOT NULL,
  `courseNumber` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO reply VALUES ('3', '1', '20120000', '20120000', '[object HTMLInputElement]', '我会', '2020-03-23 22:41:35', '223');
INSERT INTO reply VALUES ('8', '16', '20120000', '20120000', 'sdasd', '嗯嗯', '2020-03-24 17:58:00', '223');
INSERT INTO reply VALUES ('9', '1', '20120000', '20120000', '不会', '飒飒大', '2020-03-24 17:58:19', '223');
INSERT INTO reply VALUES ('12', '17', '20120000', '20120000', '会', '会就多看书', '2020-03-24 18:11:03', '223');
INSERT INTO reply VALUES ('13', '18', '20120000', '20120000', 'dsd', '啦啦啦', '2020-03-24 18:15:45', '223');
INSERT INTO reply VALUES ('14', '16', '20120000', '20120000', 'sdasd', '和经济', '2020-04-10 21:51:50', '223');
INSERT INTO reply VALUES ('15', '20', '20120000', '20120000', 'dasdasdfds', '离开了', '2020-04-10 21:52:15', '223');
INSERT INTO reply VALUES ('19', '16', '20120000', '20120000', 'sdasd', 'dsd', '2020-04-10 22:01:52', '223');
INSERT INTO reply VALUES ('20', '16', '20120000', '20120000', 'sdasd', '的撒旦', '2020-04-10 22:25:06', '223');
INSERT INTO reply VALUES ('21', '16', '20120000', '20120000', 'sdasd', '嗯额', '2020-04-10 22:43:22', '223');
INSERT INTO reply VALUES ('22', '17', '20120000', '20120000', '会', '命名', '2020-04-10 22:43:30', '223');
INSERT INTO reply VALUES ('23', '16', '20120000', '20120000', 'sdasd', '笨蛋', '2020-04-10 22:43:38', '223');
INSERT INTO reply VALUES ('24', '18', '20120000', '20120000', 'dsd', '嗯嗯', '2020-04-10 22:46:17', '223');
INSERT INTO reply VALUES ('25', '36', '2147483647', '3171911130', '你好吗，我很好', '好的好的', '2020-04-12 14:11:24', '223');

-- ----------------------------
-- Table structure for `squesionbank`
-- ----------------------------
DROP TABLE IF EXISTS `squesionbank`;
CREATE TABLE `squesionbank` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `courseNumber` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `coursename` varchar(40) COLLATE utf8_bin NOT NULL,
  `teachername` varchar(40) COLLATE utf8_bin NOT NULL,
  `workid` int(10) NOT NULL,
  `quesion` varchar(40) COLLATE utf8_bin NOT NULL,
  `sanswer` varchar(40) COLLATE utf8_bin NOT NULL,
  `answer` varchar(40) COLLATE utf8_bin NOT NULL,
  `studentname` varchar(40) COLLATE utf8_bin NOT NULL,
  `studentid` varchar(10) COLLATE utf8_bin NOT NULL,
  `grade` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of squesionbank
-- ----------------------------
INSERT INTO squesionbank VALUES ('144', '1', '历史', '贾乃亮', '1', '1+5', '6', '6', '张益达', '3171911130', '10');
INSERT INTO squesionbank VALUES ('145', '1', '历史', '贾乃亮', '1', '1+3', '4', '4', '张益达', '3171911130', '10');
INSERT INTO squesionbank VALUES ('146', '1', '历史', '贾乃亮', '1', '1+2', '3', '3', '张益达', '3171911130', '10');
INSERT INTO squesionbank VALUES ('147', '1', '历史', '贾乃亮', '1', '1+10', '11', '11', '张益达', '3171911130', '10');
INSERT INTO squesionbank VALUES ('148', '1', '历史', '贾乃亮', '1', '1+6', '7', '7', '张益达', '3171911130', '10');
INSERT INTO squesionbank VALUES ('149', '1', '历史', '贾乃亮', '1', '1+6', '7', '7', '张益达', '3171911130', '10');
INSERT INTO squesionbank VALUES ('150', '1', '历史', '贾乃亮', '1', '1+12', '13', '13', '张益达', '3171911130', '10');
INSERT INTO squesionbank VALUES ('151', '1', '历史', '贾乃亮', '1', '1+2', '3', '3', '张益达', '3171911130', '10');
INSERT INTO squesionbank VALUES ('152', '1', '历史', '贾乃亮', '1', '1+1', '2', '2', '张益达', '3171911130', '10');
INSERT INTO squesionbank VALUES ('153', '1', '历史', '贾乃亮', '1', '1+2', '3', '3', '张益达', '3171911130', '10');

-- ----------------------------
-- Table structure for `studentcourse`
-- ----------------------------
DROP TABLE IF EXISTS `studentcourse`;
CREATE TABLE `studentcourse` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT '学生和课程中间表id',
  `studentId` bigint(12) NOT NULL COMMENT ' 学生id',
  `courseId` bigint(12) NOT NULL COMMENT '课程id',
  `grade` int(3) DEFAULT NULL COMMENT '成绩',
  `createTime` datetime NOT NULL COMMENT '选课时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentcourse
-- ----------------------------
INSERT INTO studentcourse VALUES ('23', '5', '6', '100', '2020-03-23 13:48:04');
INSERT INTO studentcourse VALUES ('24', '6', '5', '100', '2020-03-23 13:48:31');
INSERT INTO studentcourse VALUES ('29', '10', '6', '100', '2020-03-24 14:15:37');
INSERT INTO studentcourse VALUES ('41', '4', '4', '100', '2020-03-23 15:34:50');
INSERT INTO studentcourse VALUES ('43', '8', '4', '100', '2020-03-23 15:45:43');
INSERT INTO studentcourse VALUES ('44', '8', '6', '100', '2020-03-17 15:45:45');
INSERT INTO studentcourse VALUES ('47', '11', '4', '100', '2020-03-22 10:51:58');
INSERT INTO studentcourse VALUES ('48', '11', '1', '100', '2020-03-23 10:52:07');
INSERT INTO studentcourse VALUES ('51', '12', '4', '0', '2020-03-24 14:11:11');
INSERT INTO studentcourse VALUES ('52', '12', '1', '100', '2020-04-08 22:26:51');
INSERT INTO studentcourse VALUES ('53', '12', '7', '100', '2020-04-08 23:04:12');
INSERT INTO studentcourse VALUES ('54', '12', '5', null, '2020-04-12 14:12:10');

-- ----------------------------
-- Table structure for `swords`
-- ----------------------------
DROP TABLE IF EXISTS `swords`;
CREATE TABLE `swords` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `sword` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of swords
-- ----------------------------
INSERT INTO swords VALUES ('1', '死');
INSERT INTO swords VALUES ('2', '傻瓜');
INSERT INTO swords VALUES ('3', '笨蛋');

-- ----------------------------
-- Table structure for `sworklist`
-- ----------------------------
DROP TABLE IF EXISTS `sworklist`;
CREATE TABLE `sworklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(255) COLLATE utf8_bin NOT NULL,
  `teacher` varchar(255) COLLATE utf8_bin NOT NULL,
  `studentname` varchar(40) COLLATE utf8_bin NOT NULL,
  `studentid` varchar(40) COLLATE utf8_bin NOT NULL,
  `workid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `courseNumber` varchar(40) COLLATE utf8_bin NOT NULL,
  `grade` int(10) NOT NULL,
  `indentfy` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sworklist
-- ----------------------------
INSERT INTO sworklist VALUES ('1', '历史', '贾乃亮', '张益达', '3171911130', '1', '1', '1', '100', '0');
INSERT INTO sworklist VALUES ('2', '计算机科学', '华晨宇', '张益达', '3171911130', '3', '0', '223', '100', '0');
INSERT INTO sworklist VALUES ('3', '历史', '贾乃亮', '张益达', '3171911130', '2', '0', '1', '0', '1');
INSERT INTO sworklist VALUES ('4', '计算机科学', '华晨宇', '张益达', '3171911130', '1', '1', '223', '0', '1');

-- ----------------------------
-- Table structure for `teachercourse`
-- ----------------------------
DROP TABLE IF EXISTS `teachercourse`;
CREATE TABLE `teachercourse` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `courseId` bigint(12) NOT NULL COMMENT '课程id',
  `content` varchar(200) NOT NULL COMMENT '修改原因',
  `isAgree` int(1) DEFAULT '0' COMMENT '管理员是否同意(0:待查看 1：同意 2 ：拒绝)',
  `isChange` int(1) DEFAULT '0' COMMENT '老师是否可修改（0：不可修改 1：可修改 2:已修改)',
  `isDelete` int(1) DEFAULT '0' COMMENT '假删除（0：未删除 1：已删除）',
  `createTime` datetime DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`),
  KEY `pk_course` (`courseId`),
  CONSTRAINT `pk_course` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachercourse
-- ----------------------------
INSERT INTO teachercourse VALUES ('7', '1', '水电费水电费', '1', '1', '1', '2016-03-10 10:25:25');
INSERT INTO teachercourse VALUES ('8', '5', 'fefd', '1', '2', '1', '2016-03-10 10:40:12');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT '学号',
  `userNumber` bigint(12) DEFAULT NULL COMMENT '用户编号',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `classid` bigint(12) DEFAULT NULL COMMENT '所属班级',
  `credit` int(10) DEFAULT '0' COMMENT '学分',
  `identity` int(1) NOT NULL COMMENT '身份（0：管理员 1：老师  2:学生 )',
  `imageUrl` varchar(100) DEFAULT NULL COMMENT '头像地址',
  `sex` int(1) NOT NULL DEFAULT '0' COMMENT '性别(1 男 2 女 0 未知)',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `PK_USER_CLASS` (`classid`),
  CONSTRAINT `PK_USER_CLASS` FOREIGN KEY (`classid`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', '3171911141', '教务处管理员', '123', null, '0', '0', 'upload/1/1.jpg', '0', '2020-04-11 00:00:00');
INSERT INTO user VALUES ('2', '317191142', '华晨宇', '123', null, '0', '1', 'upload/2/2.jpg', '2', '2020-04-01 00:00:00');
INSERT INTO user VALUES ('3', '3171911143', '曾小贤', '123', null, '0', '1', 'images/2.jpg', '2', '2020-04-02 00:00:00');
INSERT INTO user VALUES ('4', '3171911144', '胡一菲', '123', '2', '0', '2', 'images/2.jpg', '0', '2020-04-03 00:00:00');
INSERT INTO user VALUES ('5', '3171911145', '陈美嘉', '123', '2', '0', '2', 'images/2.jpg', '1', '2020-04-04 00:00:00');
INSERT INTO user VALUES ('6', '3171911146', '吕子乔', '123', null, '0', '0', 'images/2.jpg', '2', '2020-04-05 17:19:02');
INSERT INTO user VALUES ('8', '3171911147', '关谷神奇', '123', '4', '0', '2', 'assets/avatars/user.jpg', '0', '2020-04-06 00:00:00');
INSERT INTO user VALUES ('10', '3171911148', '悠悠', '123', '1', '0', '2', 'images/2.jpg', '0', '2020-04-07 00:00:00');
INSERT INTO user VALUES ('11', '3171911149', '羽墨', '123', '4', '0', '2', 'images/2.jpg', '0', '2020-04-08 15:43:54');
INSERT INTO user VALUES ('12', '3171911130', '张益达', '123', '2', '0', '2', 'upload/12/12.jpg', '1', '2020-04-09 15:45:01');
INSERT INTO user VALUES ('13', '1', '1', '123', '2', '0', '2', 'images/2.jpg', '0', null);
INSERT INTO user VALUES ('14', '2', '2', '123', '2', '0', '2', 'images/2.jpg', '0', null);
INSERT INTO user VALUES ('15', '3', '3', '123', '4', '0', '2', 'images/2.jpg', '0', null);
