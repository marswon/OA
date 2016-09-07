/*
Navicat MySQL Data Transfer

Source Server         : oa
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-07 09:38:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `gname` varchar(255) DEFAULT NULL COMMENT '物品名称',
  `gcounts` varchar(255) DEFAULT NULL COMMENT '数量',
  `gprice` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `gtotle` decimal(10,2) DEFAULT NULL COMMENT '总价',
  `gpurpose` varchar(255) DEFAULT NULL COMMENT '用途',
  `adatetime` datetime DEFAULT NULL COMMENT '申请时间',
  `astatus` varchar(255) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`aid`),
  KEY `eid` (`eid`),
  KEY `wid` (`wid`),
  CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_2` FOREIGN KEY (`wid`) REFERENCES `worktype` (`swid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('7', '1', '2', '铅球', '30', '0.00', '0.00', '上体育课使用', '2016-09-02 15:18:07', '已审批');
INSERT INTO `apply` VALUES ('8', '4', '7', '山水', '30', '0.00', '0.00', '事实上事实上杀', '2016-09-02 15:19:24', '已审批');
INSERT INTO `apply` VALUES ('9', '4', '2', '多读书', '15', '300.00', '4500.00', '积极急急急', '2016-09-02 15:23:21', '已审批');
INSERT INTO `apply` VALUES ('10', '1', '2', '铅球', '10', '100.00', '1000.00', '是哪个体育节', '2016-09-03 08:48:26', '已审批');
INSERT INTO `apply` VALUES ('13', '1', '15', '11', '11', '11.00', '121.00', '11111111', '2016-09-05 11:36:15', '未审批');
INSERT INTO `apply` VALUES ('14', '4', '15', '12强', '11', '111.00', '1221.00', '1111111111', '2016-09-05 14:00:21', '已审批');

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `classid` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) DEFAULT NULL COMMENT '名称',
  `classcount` int(11) DEFAULT NULL COMMENT '班级人数',
  `classmax` int(11) DEFAULT NULL,
  `empteach` int(255) DEFAULT NULL COMMENT '任课老师',
  `empteachs` int(255) DEFAULT NULL COMMENT '辅导老师',
  `empteaches` int(255) DEFAULT NULL COMMENT '班主任',
  `classaddr` varchar(255) DEFAULT NULL COMMENT '班级地址',
  `classlx` varchar(255) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`classid`),
  KEY `empteach` (`empteach`),
  KEY `empteachs` (`empteachs`),
  KEY `empteaches` (`empteaches`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`empteach`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`empteachs`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `classes_ibfk_3` FOREIGN KEY (`empteaches`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('34', '15春', '1', '20', '15', '14', '25', '211', '空');

-- ----------------------------
-- Table structure for computer
-- ----------------------------
DROP TABLE IF EXISTS `computer`;
CREATE TABLE `computer` (
  `comid` int(11) NOT NULL AUTO_INCREMENT,
  `coma` varchar(255) DEFAULT NULL COMMENT '电脑',
  `comb` varchar(255) DEFAULT NULL COMMENT '配件',
  `comcount` int(11) DEFAULT NULL,
  `stuid` int(11) DEFAULT NULL COMMENT '学生',
  PRIMARY KEY (`comid`),
  KEY `stuid` (`stuid`),
  CONSTRAINT `computer_ibfk_1` FOREIGN KEY (`stuid`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of computer
-- ----------------------------
INSERT INTO `computer` VALUES ('3', 'x223', '华为', '1', '35');
INSERT INTO `computer` VALUES ('4', 'XF23', '上的', '1', '35');
INSERT INTO `computer` VALUES ('5', 'XD34', '华硕', '1', '35');
INSERT INTO `computer` VALUES ('11', 'DS23', '联想', '1', '35');
INSERT INTO `computer` VALUES ('28', 'esa', 'sdfsdfg', '1', '35');
INSERT INTO `computer` VALUES ('29', 'df', 'fs', '1', '35');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `objectid` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程编码',
  `objectname` varchar(255) DEFAULT NULL COMMENT '课程名称',
  `semester` int(11) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objectid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'C++', '1', '十讲');
INSERT INTO `course` VALUES ('2', 'Java', '2', '二十讲');
INSERT INTO `course` VALUES ('3', 'JSP', '3', '十五讲');
INSERT INTO `course` VALUES ('4', 'sql', '2', '十讲');
INSERT INTO `course` VALUES ('5', 'Web', '4', '三十讲');

-- ----------------------------
-- Table structure for courseplan
-- ----------------------------
DROP TABLE IF EXISTS `courseplan`;
CREATE TABLE `courseplan` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `empid` int(11) DEFAULT NULL COMMENT '教师编码',
  `objectid` int(11) DEFAULT NULL COMMENT '课程编码',
  `current_course` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '讲课内容',
  PRIMARY KEY (`kid`),
  KEY `empid` (`empid`),
  KEY `objectid` (`objectid`),
  CONSTRAINT `courseplan_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `courseplan_ibfk_2` FOREIGN KEY (`objectid`) REFERENCES `course` (`objectid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseplan
-- ----------------------------
INSERT INTO `courseplan` VALUES ('1', '2', '1', '1', '变量');
INSERT INTO `courseplan` VALUES ('2', '2', '2', '2', '查询');
INSERT INTO `courseplan` VALUES ('3', '3', '3', '3', '异常');
INSERT INTO `courseplan` VALUES ('4', '5', '5', '4', '服务器');
INSERT INTO `courseplan` VALUES ('6', '2', '4', '12', '连接查询');
INSERT INTO `courseplan` VALUES ('8', '15', '4', '11', '222');

-- ----------------------------
-- Table structure for dep
-- ----------------------------
DROP TABLE IF EXISTS `dep`;
CREATE TABLE `dep` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(255) DEFAULT NULL COMMENT '员工姓名',
  `esex` varchar(255) DEFAULT NULL COMMENT '性别',
  `mid` int(11) DEFAULT NULL COMMENT '部门',
  `ebirth` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '生日',
  `enumber` varchar(255) DEFAULT NULL COMMENT '号码',
  `ecertid` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `ecity` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `eanton` varchar(255) DEFAULT NULL COMMENT '民族',
  `edu` varchar(255) DEFAULT NULL COMMENT '学历',
  `eaddr` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `etry` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '录用时间',
  `estatus` int(11) DEFAULT NULL COMMENT '职位',
  `basepay` decimal(11,1) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `mid` (`mid`),
  KEY `estatus` (`estatus`),
  CONSTRAINT `dep_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `department` (`did`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dep_ibfk_2` FOREIGN KEY (`estatus`) REFERENCES `dstatus` (`dsid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dep
-- ----------------------------
INSERT INTO `dep` VALUES ('1', '武平', '男', '2', '2016-09-06 15:21:23', '15779768753', '36073119895241564', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:23', '3', '3000.0');
INSERT INTO `dep` VALUES ('2', '武平1', '男', '2', '2016-09-06 15:21:27', '15779768753', '360731199810021025', '江西赣州', '汉族', '专科', '您觉得和大家教教我表达   ', '2016-09-06 15:21:27', '2', '3000.0');
INSERT INTO `dep` VALUES ('3', '武平2', '男', '2', '2016-09-06 15:21:28', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:28', '5', '3000.0');
INSERT INTO `dep` VALUES ('4', '武平3', '男', '2', '2016-09-06 15:21:33', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:33', '4', '3000.0');
INSERT INTO `dep` VALUES ('5', '武平4', '男', '2', '2016-09-06 15:21:34', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:34', '1', '3000.0');
INSERT INTO `dep` VALUES ('6', '武平5', '男', '2', '2016-09-06 15:21:35', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:35', '5', '3000.0');
INSERT INTO `dep` VALUES ('7', '武平6', '男', '2', '2016-09-06 15:21:35', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:35', '5', '3000.0');
INSERT INTO `dep` VALUES ('8', '武平7', '男', '2', '2016-09-06 15:21:36', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:36', '5', '3000.0');
INSERT INTO `dep` VALUES ('9', '武平8', '男', '2', '2016-09-06 15:21:36', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:36', '5', '3000.0');
INSERT INTO `dep` VALUES ('10', '武平9', '男', '2', '2016-09-06 15:21:37', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:37', '5', '3000.0');
INSERT INTO `dep` VALUES ('11', '武平10', '男', '2', '2016-09-06 15:21:37', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:37', '5', '3000.0');
INSERT INTO `dep` VALUES ('12', '武平11', '男', '2', '2016-09-06 15:21:37', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:37', '5', '3000.0');
INSERT INTO `dep` VALUES ('13', '武平12', '男', '2', '2016-09-06 15:21:38', '15779768753', '360731199810021025', '江西赣州', '汉族', '初中', '江都', '2016-09-06 15:21:38', '3', '3000.0');
INSERT INTO `dep` VALUES ('14', '武平13', '男', '2', '2016-09-06 15:21:38', '15779768753', '360731199810021025', '江西赣州', '汉族', '初中', '江都', '2016-09-06 15:21:38', '2', '3000.0');
INSERT INTO `dep` VALUES ('15', '武平14', '男', '2', '2016-09-06 15:21:39', '15779768753', '360731199810021025', '江西赣州', '汉族', '初中', '江都', '2016-09-06 15:21:39', '1', '3000.0');
INSERT INTO `dep` VALUES ('16', '武平15', '男', '2', '2016-09-06 15:21:39', '15779768753', '360731199810021025', '江西赣州', '汉族', '初中', '江都', '2016-09-06 15:21:39', '3', '3000.0');
INSERT INTO `dep` VALUES ('17', '武平16', '男', '2', '2016-09-06 15:21:40', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:40', '2', '3000.0');
INSERT INTO `dep` VALUES ('18', '武平17', '男', '2', '2016-09-06 15:21:40', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:40', '1', '3000.0');
INSERT INTO `dep` VALUES ('19', '武平18', '男', '2', '2016-09-06 15:21:41', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:41', '5', '3000.0');
INSERT INTO `dep` VALUES ('20', '武平19', '男', '2', '2016-09-06 15:21:41', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:41', '7', '3000.0');
INSERT INTO `dep` VALUES ('21', '武平20', '男', '2', '2016-09-06 15:21:42', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:42', '6', '3000.0');
INSERT INTO `dep` VALUES ('22', '武平21', '男', '2', '2016-09-06 15:21:42', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:42', '4', '3000.0');
INSERT INTO `dep` VALUES ('23', '天仁孝', '男', '2', '2016-09-06 15:21:43', '12345678901', '360731199810021025', '江西赣州', '汉族', '专科', '江都', '2016-09-06 15:21:43', '4', '3000.0');
INSERT INTO `dep` VALUES ('25', '京津冀', '男', '6', '2016-09-06 15:21:43', '15768357954', '360731199810021475', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:43', '3', '3000.0');
INSERT INTO `dep` VALUES ('26', '霹雳舞', '男', '6', '2016-09-06 15:21:44', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-06 15:21:44', '1', '3000.0');
INSERT INTO `dep` VALUES ('27', '霹雳舞', '男', '6', '2016-09-06 15:21:44', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-06 15:21:44', '4', '3000.0');
INSERT INTO `dep` VALUES ('28', '霹雳舞', '男', '6', '2016-09-06 15:21:44', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-06 15:21:44', '4', '3000.0');
INSERT INTO `dep` VALUES ('29', '霹雳舞', '男', '6', '2016-09-06 15:21:45', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-06 15:21:45', '4', '3000.0');
INSERT INTO `dep` VALUES ('30', '霹雳舞', '男', '6', '2016-09-06 15:21:45', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-06 15:21:45', '4', '3000.0');
INSERT INTO `dep` VALUES ('31', '霹雳舞', '男', '6', '2016-09-06 15:21:46', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-06 15:21:46', '4', '3000.0');
INSERT INTO `dep` VALUES ('32', '口水话', '男', '8', '2016-09-06 15:21:46', '15779768755', '36079687542357896', '江西赣州', '汉族', '其它', '剑姬', '2016-09-06 15:21:46', '2', '3000.0');
INSERT INTO `dep` VALUES ('33', '口水话', '男', '8', '2016-09-06 15:21:47', '15779768755', '36079687542357896', '江西赣州', '汉族', '其它', '剑姬', '2016-09-06 15:21:47', '2', '3000.0');
INSERT INTO `dep` VALUES ('34', '口水话', '男', '8', '2016-09-06 15:21:47', '15779768755', '36079687542357896', '江西赣州', '汉族', '其它', '剑姬', '2016-09-06 15:21:47', '2', '3000.0');
INSERT INTO `dep` VALUES ('35', '怡和', '女', '9', '2016-09-06 15:21:48', '15797678542', '36079354997854254', '江西赣州', '汉族', '硕士', '袅袅娜娜', '2016-09-06 15:27:23', '3', '3000.0');
INSERT INTO `dep` VALUES ('37', '张二', '女', '6', '2016-09-06 15:21:48', '11111111111', '1111111111111111', '江西赣州', '汉族', '本科', '赣州', '2016-09-06 15:25:51', '1', '3000.0');
INSERT INTO `dep` VALUES ('41', '姬发', '男', '2', '2016-09-07 00:00:00', '15779753872', '360731199810021542', '江西赣州', '汉族', '本科', '江西省南康市', '2016-09-07 09:15:52', '4', '3000.0');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) DEFAULT NULL,
  `dcreatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('2', '行政部', '2016-08-30 14:27:15');
INSERT INTO `department` VALUES ('6', '教务部', '2016-09-01 10:43:05');
INSERT INTO `department` VALUES ('8', '人事部', '2016-09-02 15:35:10');
INSERT INTO `department` VALUES ('9', '市场部1', '2016-09-03 08:22:00');

-- ----------------------------
-- Table structure for dstatus
-- ----------------------------
DROP TABLE IF EXISTS `dstatus`;
CREATE TABLE `dstatus` (
  `dsid` int(11) NOT NULL AUTO_INCREMENT,
  `dsname` varchar(255) NOT NULL,
  PRIMARY KEY (`dsid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dstatus
-- ----------------------------
INSERT INTO `dstatus` VALUES ('1', '任课老师');
INSERT INTO `dstatus` VALUES ('2', '辅导老师');
INSERT INTO `dstatus` VALUES ('3', '班主任');
INSERT INTO `dstatus` VALUES ('4', '招生老师');
INSERT INTO `dstatus` VALUES ('5', '教务主任');
INSERT INTO `dstatus` VALUES ('6', '后勤主任');
INSERT INTO `dstatus` VALUES ('7', '助理');
INSERT INTO `dstatus` VALUES ('12', '财务主任');

-- ----------------------------
-- Table structure for duty
-- ----------------------------
DROP TABLE IF EXISTS `duty`;
CREATE TABLE `duty` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `ddatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `dstatus` varchar(255) DEFAULT NULL COMMENT '类型',
  `drange` varchar(255) DEFAULT NULL COMMENT '范围',
  `ddesc` varchar(255) DEFAULT NULL COMMENT '情况',
  PRIMARY KEY (`did`),
  KEY `eid` (`eid`),
  CONSTRAINT `duty_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of duty
-- ----------------------------
INSERT INTO `duty` VALUES ('1', '1', '2016-09-03 11:48:01', '班级巡查', '15春', '啊啊啊啊啊啊啊啊啊');
INSERT INTO `duty` VALUES ('2', '1', '2016-09-04 21:12:15', '宿舍巡查', '二栋', '222222222222');
INSERT INTO `duty` VALUES ('4', '1', '2016-09-28 08:19:30', '宿舍巡查', '六栋', '是是是是是是是是是谁谁谁');
INSERT INTO `duty` VALUES ('5', '15', '2016-09-05 16:47:35', '宿舍巡查', '六栋', '1111111111111111111111');
INSERT INTO `duty` VALUES ('13', '15', '2016-09-05 16:47:17', '班级巡查', '15春', '2222222');

-- ----------------------------
-- Table structure for expend
-- ----------------------------
DROP TABLE IF EXISTS `expend`;
CREATE TABLE `expend` (
  `payid` int(11) NOT NULL AUTO_INCREMENT COMMENT '支出编号',
  `paypro` varchar(1000) DEFAULT NULL COMMENT '支出原因',
  `paycount` decimal(10,2) DEFAULT NULL COMMENT '支出金额',
  `ptime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `payname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expend
-- ----------------------------
INSERT INTO `expend` VALUES ('1', '购物', '1000.00', '2016-09-06 11:20:29', '支出人');
INSERT INTO `expend` VALUES ('2', '发放工资', '1122.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('3', '发放工资', '44.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('4', '发放工资', '44.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('5', '发放工资', '2521.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('6', '发放工资', '7300.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('7', '购买物品', '98901.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('8', '发放工资', '0.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('9', '购买物品', '2000.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('10', '发放工资', '1134.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('11', '发放工资', '22.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('12', '发放工资', '364.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('13', '购买物品', '0.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('14', '购买物品', '1000.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('15', '发放工资', '2576.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('16', '发放工资', '222.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('17', '发放工资', '222.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('18', '购买物品', '0.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('19', '购买物品', '4500.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('20', '购买物品', '1221.00', '2016-09-06 11:16:23', null);
INSERT INTO `expend` VALUES ('21', '发放工资', '36333.00', null, null);
INSERT INTO `expend` VALUES ('22', '发放工资', '5211.00', null, null);
INSERT INTO `expend` VALUES ('23', '发放工资', '3121.00', '2016-09-07 08:15:53', '武平14');

-- ----------------------------
-- Table structure for fankui
-- ----------------------------
DROP TABLE IF EXISTS `fankui`;
CREATE TABLE `fankui` (
  `tbackid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL,
  `pro` varchar(300) NOT NULL COMMENT '内容',
  `ans` varchar(255) DEFAULT NULL COMMENT '答案',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tbackid`),
  KEY `tep_tde_pk` (`eid`),
  CONSTRAINT `tep_tde_pk` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fankui
-- ----------------------------
INSERT INTO `fankui` VALUES ('4', '2', '11', 'hhh ', '11', '2016-09-02 10:30:02');
INSERT INTO `fankui` VALUES ('5', '3', '11', '11', '11', '2016-09-02 10:30:14');
INSERT INTO `fankui` VALUES ('6', '4', '11', '11', '11', '2016-09-02 10:30:41');
INSERT INTO `fankui` VALUES ('7', '2', 'sssssss', '暂未回复', 'sss', '2016-09-03 09:00:21');

-- ----------------------------
-- Table structure for getjob
-- ----------------------------
DROP TABLE IF EXISTS `getjob`;
CREATE TABLE `getjob` (
  `jobid` int(11) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `jobstu` int(255) DEFAULT NULL COMMENT '学生编码',
  `jobtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `jobmoney` varchar(255) DEFAULT NULL,
  `jobdesc` varchar(255) DEFAULT NULL COMMENT '职位描述',
  PRIMARY KEY (`jobid`),
  KEY `jobstu` (`jobstu`),
  CONSTRAINT `getjob_ibfk_1` FOREIGN KEY (`jobstu`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of getjob
-- ----------------------------

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `scoid` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` int(11) DEFAULT NULL,
  `score` float(11,2) DEFAULT NULL COMMENT '成绩',
  `sconame` varchar(255) DEFAULT NULL COMMENT '课程名称',
  PRIMARY KEY (`scoid`),
  KEY `stuid` (`stuid`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`stuid`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('37', '20', '11.00', 'C++');
INSERT INTO `grade` VALUES ('38', '1', '222.00', 'C++');
INSERT INTO `grade` VALUES ('39', '3', '222.00', 'C++');
INSERT INTO `grade` VALUES ('40', '1', '2.00', 'JSP');
INSERT INTO `grade` VALUES ('41', '2', '11.00', 'JSP');
INSERT INTO `grade` VALUES ('42', '4', '111.00', 'JSP');
INSERT INTO `grade` VALUES ('43', '5', '0.00', 'JSP');
INSERT INTO `grade` VALUES ('45', '2', '123.00', 'C++');
INSERT INTO `grade` VALUES ('46', '2', '100.00', 'C++');
INSERT INTO `grade` VALUES ('47', '2', '1000.00', 'C++');

-- ----------------------------
-- Table structure for hourse
-- ----------------------------
DROP TABLE IF EXISTS `hourse`;
CREATE TABLE `hourse` (
  `hourid` int(11) NOT NULL AUTO_INCREMENT,
  `hourname` varchar(255) DEFAULT NULL COMMENT '宿舍名称',
  `hourkz` int(11) DEFAULT NULL,
  `houryz` int(11) DEFAULT NULL,
  `hourhkz` int(11) DEFAULT NULL,
  PRIMARY KEY (`hourid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hourse
-- ----------------------------
INSERT INTO `hourse` VALUES ('1', '二栋', '500', '12', '488');
INSERT INTO `hourse` VALUES ('2', '小红楼', '233', '200', '33');
INSERT INTO `hourse` VALUES ('3', '六栋', '480', '450', '30');
INSERT INTO `hourse` VALUES ('4', '七栋', '800', '600', '200');
INSERT INTO `hourse` VALUES ('5', '一栋', '500', '400', '100');
INSERT INTO `hourse` VALUES ('6', '三栋', '480', '450', '30');
INSERT INTO `hourse` VALUES ('7', '四栋', '480', '350', '130');
INSERT INTO `hourse` VALUES ('8', '五栋', '480', '400', '80');

-- ----------------------------
-- Table structure for income
-- ----------------------------
DROP TABLE IF EXISTS `income`;
CREATE TABLE `income` (
  `monid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `moncount` decimal(10,2) DEFAULT NULL COMMENT '收入金额，可是学费，学杂费，企业经营收入额等',
  `monpro` varchar(255) DEFAULT NULL COMMENT '收入的原因',
  `mname` varchar(255) DEFAULT NULL COMMENT '收入人',
  `mdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`monid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of income
-- ----------------------------
INSERT INTO `income` VALUES ('21', '300.00', '收取学费', '廖文汉', '2016-08-28 15:01:41');
INSERT INTO `income` VALUES ('22', '300.00', '收取学费', '廖文汉', '2016-08-28 15:01:44');
INSERT INTO `income` VALUES ('23', '1000.00', '收取学费', '廖文汉', '2016-08-28 15:09:06');
INSERT INTO `income` VALUES ('24', '1000.00', '收取学费', '廖文汉', '2016-08-28 15:09:06');
INSERT INTO `income` VALUES ('25', '4000.00', '收取古钟同学的学费', '武平14', '2016-09-07 08:58:15');

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `xid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `sstuid` int(11) DEFAULT NULL,
  `steacher` int(11) DEFAULT NULL,
  `sdate` varchar(255) DEFAULT NULL COMMENT '时间',
  `score` float(11,0) DEFAULT NULL COMMENT '分数',
  PRIMARY KEY (`xid`),
  KEY `sstuid` (`sstuid`),
  KEY `steacher` (`steacher`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`sstuid`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`steacher`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('1', 'Java', '1', '15', '2016-09-01', '50');

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `eid` int(11) NOT NULL,
  `jstart` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `jend` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `jcompany` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  `jedu` varchar(255) DEFAULT NULL COMMENT '职位',
  `jpeople` varchar(255) DEFAULT NULL COMMENT '证明人',
  `jtel` varchar(255) DEFAULT NULL COMMENT '证明人号码',
  PRIMARY KEY (`eid`),
  CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES ('23', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('25', '宏图学院', '2011-09-14 08:18:51', '2016-09-02 08:18:56', '主任', '潇潇', '12345678936');
INSERT INTO `jobs` VALUES ('26', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('27', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('28', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('29', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('30', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('31', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('32', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('33', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('34', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('35', '刚刚', '2009-09-01 08:24:44', '2016-09-01 08:24:49', '经理', '记录', '1579768543');
INSERT INTO `jobs` VALUES ('37', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('41', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for money
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` int(11) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL COMMENT '学期',
  `ys` decimal(10,2) DEFAULT NULL COMMENT '应该收取的费用',
  `actual` decimal(10,2) DEFAULT NULL COMMENT '实际收取的费用',
  `owe` decimal(10,2) DEFAULT NULL COMMENT '还欠的费用',
  `mtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '收取时间',
  PRIMARY KEY (`mid`),
  KEY `stuid` (`stuid`),
  KEY `eid` (`eid`),
  CONSTRAINT `money_ibfk_1` FOREIGN KEY (`stuid`) REFERENCES `student` (`intenid`),
  CONSTRAINT `money_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of money
-- ----------------------------
INSERT INTO `money` VALUES ('1', '1', '1', '预科', '300.00', '200.00', '100.00', '2016-09-06 11:33:39');
INSERT INTO `money` VALUES ('2', '1', '1', '预科', '300.00', '200.00', '100.00', '2016-09-06 11:33:36');
INSERT INTO `money` VALUES ('3', '5', '1', '预科', '300.00', '200.00', '100.00', '2016-09-06 14:34:09');
INSERT INTO `money` VALUES ('5', '27', '1', '第一学期', '6500.00', '6500.00', '0.00', '2016-09-06 19:39:01');
INSERT INTO `money` VALUES ('6', '1', '1', '第二学期', '7000.00', '7000.00', '0.00', '2016-09-06 19:39:04');
INSERT INTO `money` VALUES ('7', '1', '15', '第二学期', '7000.00', '7000.00', '0.00', '2016-09-06 20:10:14');
INSERT INTO `money` VALUES ('12', '1', '15', '第一学期', '6500.00', '1111.00', '5389.00', '2016-09-06 19:34:30');
INSERT INTO `money` VALUES ('13', '1', '15', '第一学期', '6500.00', '1111.00', '5389.00', '2016-09-06 19:36:58');
INSERT INTO `money` VALUES ('14', '5', '15', '第二学期', '7000.00', '7000.00', '0.00', '2016-09-06 20:15:48');
INSERT INTO `money` VALUES ('15', '1', '15', '第二学期', '7000.00', '2222.00', '4778.00', '2016-09-07 08:37:37');
INSERT INTO `money` VALUES ('16', '1', '15', '第三学期', '7500.00', '4000.00', '3500.00', '2016-09-07 08:58:14');

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `msgid` int(11) NOT NULL AUTO_INCREMENT,
  `msgcon` varchar(600) DEFAULT NULL COMMENT '公告内容',
  `msgks` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `msgjz` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  PRIMARY KEY (`msgid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg
-- ----------------------------
INSERT INTO `msg` VALUES ('17', '1234567777778777', '2016-09-05 14:39:19', '2016-09-05 14:39:57');

-- ----------------------------
-- Table structure for pays
-- ----------------------------
DROP TABLE IF EXISTS `pays`;
CREATE TABLE `pays` (
  `paysid` int(11) NOT NULL AUTO_INCREMENT COMMENT '工资编码',
  `empid` int(11) DEFAULT NULL COMMENT '员工编码',
  `paysa` decimal(10,2) DEFAULT NULL COMMENT '奖励金额',
  `paysb` decimal(10,2) DEFAULT NULL COMMENT '惩罚金额',
  `payspro` varchar(255) DEFAULT NULL COMMENT '惩罚原因',
  `payssta` decimal(10,2) DEFAULT NULL COMMENT '基本工资',
  `paysc` decimal(10,2) DEFAULT NULL COMMENT '补贴工资',
  `paysd` decimal(10,2) DEFAULT NULL COMMENT '结余工资',
  `paytime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`paysid`),
  KEY `empid` (`empid`),
  CONSTRAINT `pays_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pays
-- ----------------------------
INSERT INTO `pays` VALUES ('39', '33', '33333.00', '-3.00', '33', '3000.00', '3.00', '36333.00', '2016-09-06 16:03:05');
INSERT INTO `pays` VALUES ('40', '35', '1111.00', '-11.00', '11', '3000.00', '1111.00', '5211.00', '2016-09-06 16:11:47');
INSERT INTO `pays` VALUES ('41', '2', '121.00', '-122.00', '迟到早退', '3000.00', '122.00', '3121.00', '2016-09-07 08:15:22');
INSERT INTO `pays` VALUES ('42', '37', '0.00', '-100.00', '迟到早退', '3000.00', '0.00', '2900.00', '2016-09-07 08:23:20');
INSERT INTO `pays` VALUES ('43', '29', '100.00', '0.00', '积极加班', '3000.00', '100.00', '3200.00', '2016-09-07 08:23:20');
INSERT INTO `pays` VALUES ('44', '27', '0.00', '0.00', '无', '3000.00', '0.00', '3000.00', '2016-09-07 08:23:20');
INSERT INTO `pays` VALUES ('45', '37', '0.00', '-100.00', '迟到早退', '3000.00', '0.00', '2900.00', '2016-09-07 08:23:20');
INSERT INTO `pays` VALUES ('46', '29', '100.00', '0.00', '积极加班', '3000.00', '100.00', '3200.00', '2016-09-07 08:23:20');
INSERT INTO `pays` VALUES ('47', '27', '0.00', '0.00', '无', '3000.00', '0.00', '3000.00', '2016-09-07 08:23:20');

-- ----------------------------
-- Table structure for rawpun
-- ----------------------------
DROP TABLE IF EXISTS `rawpun`;
CREATE TABLE `rawpun` (
  `jid` int(11) NOT NULL AUTO_INCREMENT,
  `jstuid` int(11) DEFAULT NULL,
  `jtitle` varchar(255) DEFAULT NULL COMMENT '奖惩对象',
  `jcontent` varchar(255) DEFAULT NULL COMMENT '奖惩内容',
  PRIMARY KEY (`jid`),
  KEY `jstuid` (`jstuid`),
  CONSTRAINT `rawpun_ibfk_1` FOREIGN KEY (`jstuid`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16;

-- ----------------------------
-- Records of rawpun
-- ----------------------------
INSERT INTO `rawpun` VALUES ('5', '1', '上课睡觉', '做50个俯卧撑和50个下蹲');

-- ----------------------------
-- Table structure for receiue
-- ----------------------------
DROP TABLE IF EXISTS `receiue`;
CREATE TABLE `receiue` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '申领编号',
  `eid` int(11) DEFAULT NULL COMMENT '员工编号',
  `uwork` int(11) DEFAULT NULL COMMENT '申领物品名称',
  `ucount` int(11) DEFAULT NULL COMMENT '申领物品数量',
  `upurpose` varchar(255) DEFAULT NULL COMMENT '用途',
  `ucreattime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `uendtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  `restore` varchar(255) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`uid`),
  KEY `eid` (`eid`),
  KEY `receiue_work_wid` (`uwork`),
  CONSTRAINT `receiue_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receiue_work_wid` FOREIGN KEY (`uwork`) REFERENCES `work` (`wid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receiue
-- ----------------------------
INSERT INTO `receiue` VALUES ('13', '2', '17', '5', '京津冀', '2016-09-02 00:00:00', '2016-09-23 00:00:00', '还');
INSERT INTO `receiue` VALUES ('14', '3', '17', '10', '搞得过覆盖广泛', '2016-09-02 00:00:00', '2016-09-02 00:00:00', '还');
INSERT INTO `receiue` VALUES ('15', '1', '18', '10', '上体育课使用', '2016-09-03 00:00:00', '2016-09-07 00:00:00', '还');
INSERT INTO `receiue` VALUES ('16', '1', '18', '13', '这个学生在本学期表现良好', '2016-09-03 00:00:00', '2016-09-14 00:00:00', '借');
INSERT INTO `receiue` VALUES ('17', '1', '17', '10', '积极急急急急急急急急急急急急急急急', '2016-09-07 00:00:00', '2016-09-29 00:00:00', '借');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL COMMENT '员工编号',
  `rdate` varchar(100) DEFAULT NULL COMMENT '本周日期',
  `rsun` varchar(255) DEFAULT NULL COMMENT '周日',
  `rmon` varchar(255) DEFAULT NULL COMMENT '周一',
  `rtue` varchar(255) DEFAULT NULL,
  `twed` varchar(255) DEFAULT NULL,
  `rthu` varchar(255) DEFAULT NULL,
  `tfri` varchar(255) DEFAULT NULL,
  `rsta` varchar(255) DEFAULT NULL,
  `rsummary` varchar(255) DEFAULT NULL COMMENT '本周总结',
  PRIMARY KEY (`rid`),
  KEY `eid` (`eid`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report
-- ----------------------------

-- ----------------------------
-- Table structure for says
-- ----------------------------
DROP TABLE IF EXISTS `says`;
CREATE TABLE `says` (
  `sayid` int(11) NOT NULL AUTO_INCREMENT COMMENT '谈心编号 ',
  `sayface` int(100) DEFAULT NULL COMMENT '谈心对象',
  `sayempid` int(11) DEFAULT NULL COMMENT '策划人',
  `sayscon` varchar(100) DEFAULT NULL COMMENT '谈心内容',
  `sayspro` varchar(100) DEFAULT NULL COMMENT '谈心问题',
  `sysback` varchar(255) DEFAULT NULL COMMENT '学生反馈',
  PRIMARY KEY (`sayid`),
  KEY `sayface` (`sayface`),
  KEY `sayempid` (`sayempid`),
  CONSTRAINT `says_ibfk_1` FOREIGN KEY (`sayface`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `says_ibfk_2` FOREIGN KEY (`sayempid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16;

-- ----------------------------
-- Records of says
-- ----------------------------
INSERT INTO `says` VALUES ('2', '1', '1', '11111111111', '11111111111111', '111111111111111111111');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `zid` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', '任课老师');
INSERT INTO `status` VALUES ('2', '辅导老师');
INSERT INTO `status` VALUES ('3', '班主任');
INSERT INTO `status` VALUES ('4', '招生老师');
INSERT INTO `status` VALUES ('5', '教务主任');
INSERT INTO `status` VALUES ('6', '后勤主任');
INSERT INTO `status` VALUES ('7', '助理');
INSERT INTO `status` VALUES ('8', '意向学生');
INSERT INTO `status` VALUES ('9', '预订学生');
INSERT INTO `status` VALUES ('10', '正式学生');
INSERT INTO `status` VALUES ('11', '超级管理员');
INSERT INTO `status` VALUES ('12', '财务主任');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `intenid` int(11) NOT NULL AUTO_INCREMENT,
  `intenname` varchar(50) DEFAULT NULL COMMENT '名字',
  `intensch` varchar(255) DEFAULT NULL COMMENT '毕业学校',
  `intensex` char(2) DEFAULT NULL COMMENT '性别',
  `intenage` int(11) DEFAULT NULL COMMENT '年龄',
  `intenbir` varchar(255) DEFAULT NULL COMMENT '出生年月',
  `intenfat` varchar(50) DEFAULT NULL COMMENT '家长',
  `intentel` varchar(20) DEFAULT NULL COMMENT '号码',
  `intenfatel` varchar(255) DEFAULT NULL COMMENT '家长号码',
  `intenaddr` varchar(255) DEFAULT NULL COMMENT '住址',
  `intenpeo` varchar(255) DEFAULT NULL COMMENT '就读疑问',
  `intenmz` varchar(255) DEFAULT NULL COMMENT '民族',
  `intenjg` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `intenstatus` varchar(255) DEFAULT NULL COMMENT '状态',
  `classid` int(11) DEFAULT NULL,
  `hourid` int(11) DEFAULT NULL,
  `intendate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `stustatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`intenid`),
  KEY `hourid` (`hourid`),
  KEY `classid` (`classid`),
  KEY `stustatus` (`stustatus`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`hourid`) REFERENCES `hourse` (`hourid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`stustatus`) REFERENCES `status` (`zid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '古钟', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-05 14:13:53', '9');
INSERT INTO `student` VALUES ('2', '钟胜峰2', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:52', '9');
INSERT INTO `student` VALUES ('3', '钟胜峰3', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:53', '9');
INSERT INTO `student` VALUES ('4', '钟胜峰4', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:54', '9');
INSERT INTO `student` VALUES ('5', '钟胜峰5', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:54', '9');
INSERT INTO `student` VALUES ('6', '钟胜峰6', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:55', '9');
INSERT INTO `student` VALUES ('7', '钟胜峰7', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:55', '9');
INSERT INTO `student` VALUES ('8', '钟胜峰8', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '退学', '34', '1', '2016-09-01 14:14:42', '9');
INSERT INTO `student` VALUES ('9', '钟胜峰9', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '毕业', '34', '1', '2016-09-01 14:14:47', '9');
INSERT INTO `student` VALUES ('10', '钟胜峰10', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '退学', '34', '1', '2016-09-01 14:14:37', '9');
INSERT INTO `student` VALUES ('11', '钟胜峰11', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '休学', '34', '1', '2016-09-01 14:14:24', '9');
INSERT INTO `student` VALUES ('12', '钟胜峰12', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '休学', '34', '1', '2016-09-01 14:14:20', '9');
INSERT INTO `student` VALUES ('13', '钟胜峰13', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '毕业', '34', '1', '2016-09-01 14:14:14', '9');
INSERT INTO `student` VALUES ('14', '钟胜峰14', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '毕业', '34', '1', '2016-09-01 14:14:13', '9');
INSERT INTO `student` VALUES ('15', '钟胜峰15', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '毕业', '34', '1', '2016-09-01 14:14:12', '9');
INSERT INTO `student` VALUES ('16', '钟胜峰16', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '毕业', '34', '1', '2016-09-01 14:14:12', '9');
INSERT INTO `student` VALUES ('17', '钟胜峰17', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '毕业', '34', '1', '2016-09-01 14:14:11', '9');
INSERT INTO `student` VALUES ('18', '钟胜峰18', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '毕业', '34', '1', '2016-09-01 14:14:10', '9');
INSERT INTO `student` VALUES ('19', '钟胜峰19', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:14:02', '9');
INSERT INTO `student` VALUES ('20', '钟胜峰20', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:59', '9');
INSERT INTO `student` VALUES ('21', '钟胜峰21', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:58', '9');
INSERT INTO `student` VALUES ('22', '钟胜峰22', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:57', '9');
INSERT INTO `student` VALUES ('24', '钟胜峰24', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都地底', '无', '彝族', '江西赣州', '毕业', '34', '4', '2016-09-01 14:02:52', '9');
INSERT INTO `student` VALUES ('25', '密码', '，，，，', '男', '12', '2016-09-02', '111111', '11111111111', '11111111111', '111', '111', '汉族', '11111', '在读', '34', '4', '2016-09-02 15:48:36', null);
INSERT INTO `student` VALUES ('26', '时间合适呢', '军事记得', '男', '111', '2016-09-02', '12223', '14214124124', '14124141414', '41414', '141414', '汉族', '11111', '在读', '34', '4', '2016-09-02 15:48:38', null);
INSERT INTO `student` VALUES ('27', '着眼于', '击飞学院', '男', '25', '2016-09-02', '集合分', '14796325879', '65479312876', '斤斤计较', '无', '汉族', '江西赣州', null, '34', '1', '2016-09-02 16:00:18', '9');
INSERT INTO `student` VALUES ('28', '霹雳火', '而中国', '男', '15', '2016-09-02', '皮卡剧', '15779753875', '', '', '', '汉族', '江西', null, '34', '3', null, '9');
INSERT INTO `student` VALUES ('29', '中雨', '山水', '男', '17', '2016-09-01', '中级', '15796357865', '', '', '', '汉', '江西', null, '34', '1', null, '9');
INSERT INTO `student` VALUES ('30', '中雨', '山水', '男', '17', '2016-09-01', '中级', '15796357865', '15796357867', '中土', '无', '汉', '江西', null, '34', '1', null, '9');
INSERT INTO `student` VALUES ('31', '剑姬', '于都二中', '男', '18', '2016-09-03', '剑圣', '15797685435', '15798654852', '京津冀', '无', '蒙古族', '江西赣州', '在读', '34', '8', '2016-09-05 19:50:10', '9');
INSERT INTO `student` VALUES ('32', '111', '1111', '男', null, '1990-01-01', '111', '11111111111', '11111111111', '11', '1111', '汉族', '1111', '在读', '34', '1', '2016-09-05 19:52:30', null);
INSERT INTO `student` VALUES ('33', '11', '1111', '男', '26', '1990-01-01', '1111', '11111111111', '11111111111', '1111', '111111', '汉族', '11111', '在读', '34', '1', '2016-09-05 20:19:32', null);
INSERT INTO `student` VALUES ('34', '11', '1111', '男', '26', '1990-01-01', '111', '11111111111', '11111111111', '1111', '111111', '汉族', '1111', '在读', '34', '1', '2016-09-05 20:20:23', null);

-- ----------------------------
-- Table structure for studentyx
-- ----------------------------
DROP TABLE IF EXISTS `studentyx`;
CREATE TABLE `studentyx` (
  `intenid` int(11) NOT NULL AUTO_INCREMENT,
  `intenname` varchar(50) DEFAULT NULL,
  `intensch` varchar(255) DEFAULT NULL,
  `intensex` char(2) DEFAULT NULL,
  `intenage` int(11) DEFAULT NULL,
  `intenbir` varchar(255) DEFAULT NULL,
  `intenfat` varchar(50) DEFAULT NULL,
  `intentel` varchar(20) DEFAULT NULL,
  `intenfatel` varchar(255) DEFAULT NULL,
  `intenaddr` varchar(255) DEFAULT NULL,
  `intenpeo` varchar(255) DEFAULT NULL,
  `intenmz` varchar(255) DEFAULT NULL,
  `intenjg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`intenid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentyx
-- ----------------------------
INSERT INTO `studentyx` VALUES ('1', '钟胜峰', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉', '江西赣州');
INSERT INTO `studentyx` VALUES ('2', '剑姬', '于都二中', '男', '18', '2016-09-03', '剑圣', '15797685435', '15798654852', '京津冀', '无', '蒙古族', '江西赣州');
INSERT INTO `studentyx` VALUES ('7', '111', '111111', '男', '26', '1990-01-01', '1111', '11111111111', '11111111111', '1111111', '11111111', '汉族', '111');
INSERT INTO `studentyx` VALUES ('8', '111', '111111', '男', '26', '1990-01-01', '1111', '11111111111', '11111111111', '1111111', '11111111', '汉族', '111');
INSERT INTO `studentyx` VALUES ('9', '111', '1111', '男', '20', '1996-03-01', '1111', '11111111111', '11111111111', '11', '111', '汉族', '1111');
INSERT INTO `studentyx` VALUES ('10', '111', '1111', '男', '20', '1996-03-01', '1111', '11111111111', '11111111111', '11', '111', '汉族', '1111');
INSERT INTO `studentyx` VALUES ('11', '111', '1111', '男', '20', '1996-03-01', '1111', '11111111111', '11111111111', '11', '111', '汉族', '1111');
INSERT INTO `studentyx` VALUES ('12', '111', '1111', '男', '20', '1996-03-01', '1111', '11111111111', '11111111111', '11', '111', '汉族', '1111');
INSERT INTO `studentyx` VALUES ('13', '111', '1111', '男', '20', '1996-03-01', '1111', '11111111111', '11111111111', '11', '111', '汉族', '1111');
INSERT INTO `studentyx` VALUES ('14', '111', '1111', '男', '20', '1996-03-01', '1111', '11111111111', '11111111111', '11', '111', '汉族', '1111');
INSERT INTO `studentyx` VALUES ('15', '111', '1111', '男', '20', '1996-03-01', '1111', '11111111111', '11111111111', '11', '111', '汉族', '1111');
INSERT INTO `studentyx` VALUES ('19', '11', '1111111', '男', '26', '1990-01-01', '1111', '11111111111', '11111111111', '11111', '11111111111', '汉族', '111111');
INSERT INTO `studentyx` VALUES ('23', '11111', '1111', '男', '26', '1990-01-01', '111111', '11111111111', '11111111111', '1111', '11111', '汉族', '111');
INSERT INTO `studentyx` VALUES ('24', '111', '1111', '男', '26', '1990-01-01', '111', '11111111111', '11111111111', '111', '111111', '汉族', '1111');
INSERT INTO `studentyx` VALUES ('25', '11', '11111', '男', '26', '1990-01-01', '1111', '11111111111', '11111111111', '111', '11', '汉族', '11111');
INSERT INTO `studentyx` VALUES ('26', '1111', '11111', '男', '26', '1990-01-01', '1111', '11111111111', '11111111111', '111', '11111', '汉族', '111');
INSERT INTO `studentyx` VALUES ('27', '111', '111111', '男', '26', '1990-01-01', '111', '11111111111', '11111111111', '1111', '111', '汉族', '11');
INSERT INTO `studentyx` VALUES ('28', '11', '111111', '男', '26', '1990-01-01', '111111', '11111111111', '11111111111', '111', '1111', '汉族', '111111');

-- ----------------------------
-- Table structure for stutotal
-- ----------------------------
DROP TABLE IF EXISTS `stutotal`;
CREATE TABLE `stutotal` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` int(11) DEFAULT NULL COMMENT '学生编码',
  `ssay` varchar(255) DEFAULT NULL COMMENT '学生评语',
  `semester` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `stuid` (`stuid`),
  CONSTRAINT `stutotal_ibfk_1` FOREIGN KEY (`stuid`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stutotal
-- ----------------------------
INSERT INTO `stutotal` VALUES ('10', '1', '这个学生在本学期表现良好', '第一学期');
INSERT INTO `stutotal` VALUES ('11', '2', '这是一个斗笔你人文   撒旦', '第一学期');

-- ----------------------------
-- Table structure for tuition
-- ----------------------------
DROP TABLE IF EXISTS `tuition`;
CREATE TABLE `tuition` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `one` decimal(10,2) DEFAULT NULL COMMENT '预科费用',
  `two` decimal(10,2) DEFAULT NULL COMMENT '第一学期费用',
  `three` decimal(10,2) DEFAULT NULL COMMENT '第二学期费用',
  `four` decimal(10,2) DEFAULT NULL COMMENT '第三学期费用',
  `five` decimal(10,2) DEFAULT NULL COMMENT '第四学期费用',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tuition
-- ----------------------------
INSERT INTO `tuition` VALUES ('1', '300.00', '6500.00', '7000.00', '7500.00', '8000.00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `pwd` varchar(255) DEFAULT 'JdVa0oOqQAr0ZMdtcTwHrQ==',
  `status` int(11) NOT NULL COMMENT '状态',
  `eid` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `status` (`status`),
  KEY `eid` (`eid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`zid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '123456', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '11', '15');
INSERT INTO `user` VALUES ('11', '110120119', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '11', '15');
INSERT INTO `user` VALUES ('12', '15797635241', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '4', '31');
INSERT INTO `user` VALUES ('13', '15779768755', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '2', '34');
INSERT INTO `user` VALUES ('14', '15797678542', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '2', '35');
INSERT INTO `user` VALUES ('16', '11111111111', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '1', '37');
INSERT INTO `user` VALUES ('17', '15779753872', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '4', '41');

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `wtypeid` int(255) DEFAULT NULL COMMENT '类型',
  `wname` varchar(255) DEFAULT NULL COMMENT '名称',
  `wcount` int(255) DEFAULT NULL,
  `wamount` int(255) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`wid`),
  KEY `work_type_id` (`wtypeid`),
  CONSTRAINT `work_type_id` FOREIGN KEY (`wtypeid`) REFERENCES `worktype` (`swid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES ('17', '1', '吉他', '111', '5');
INSERT INTO `work` VALUES ('18', '2', '篮球', '23', '23');
INSERT INTO `work` VALUES ('19', '4', '12强', null, '11');

-- ----------------------------
-- Table structure for workcheck
-- ----------------------------
DROP TABLE IF EXISTS `workcheck`;
CREATE TABLE `workcheck` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `wdate` datetime DEFAULT NULL COMMENT '打卡时间',
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`wid`),
  KEY `eid` (`eid`),
  CONSTRAINT `workcheck_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workcheck
-- ----------------------------
INSERT INTO `workcheck` VALUES ('60', '2', '2016-09-01 11:25:17', '签到');
INSERT INTO `workcheck` VALUES ('61', '15', '2016-09-03 08:56:42', '签到');
INSERT INTO `workcheck` VALUES ('62', '15', '2016-09-03 08:56:53', '签到');

-- ----------------------------
-- Table structure for worktype
-- ----------------------------
DROP TABLE IF EXISTS `worktype`;
CREATE TABLE `worktype` (
  `swid` int(11) NOT NULL AUTO_INCREMENT,
  `swname` varchar(255) NOT NULL,
  PRIMARY KEY (`swid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worktype
-- ----------------------------
INSERT INTO `worktype` VALUES ('1', '体育类');
INSERT INTO `worktype` VALUES ('2', '电子类');
INSERT INTO `worktype` VALUES ('3', '书本类');
INSERT INTO `worktype` VALUES ('4', '其他类');
