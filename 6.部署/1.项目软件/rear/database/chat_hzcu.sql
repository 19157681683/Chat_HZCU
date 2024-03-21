/*
Navicat MySQL Data Transfer

Source Server         : llm1
Source Server Version : 80030
Source Host           : localhost:3306
Source Database       : chat_hzcu

Target Server Type    : MYSQL
Target Server Version : 80030
File Encoding         : 65001

Date: 2024-03-19 16:54:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `register_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1915768000', '123456', '小旋风', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('2', '1915768001', '123456', '飞天猪', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('3', '1915768002', '123456', '笑面虎', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('4', '1915768003', '123456', '独行侠', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('5', '1915768004', '123456', '铁扇子', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('6', '1915768005', '123456', '金甲虫', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('7', '1915768006', '123456', '玉面狐', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('8', '1915768007', '123456', '黑玫瑰', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('9', '1915768010', '123456', '蓝精灵', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('10', '1915768011', '123456', '红苹果', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('11', '1915768012', '123456', '绿巨人', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('12', '1915768013', '123456', '黄鹂鸟', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('13', '1915768014', '123456', '白天鹅', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('14', '1915768015', '123456', '紫罗兰', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('15', '1915768016', '123456', '青草地', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('16', '1915768017', '123456', '橙阳光', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('17', '1915768018', '123456', '粉蝴蝶', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('18', '1915768019', '123456', '灰太狼', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('19', '1915768020', '123456', '棕熊熊', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('20', '1915768021', '123456', '黑猫警', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('21', '1915768022', '123456', '白兔兔', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('22', '1915768023', '123456', '红鲤鱼', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('23', '1915768024', '123456', '绿青蛙', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('24', '1915768025', '123456', '黄蜜蜂', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('25', '1915768026', '123456', '蓝鲸鱼', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('26', '1915768027', '123456', '紫藤萝', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('27', '1915768028', '123456', '青松树', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('28', '1915768029', '123456', '橙花猫', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('29', '1915768030', '123456', '粉嘟嘟', '2024-03-10 02:03:14', '2024-03-10 02:03:14');
INSERT INTO `admin` VALUES ('30', '19157681683', '123456', '尘光', '2024-03-10 02:04:10', '2024-03-09 18:06:48');
INSERT INTO `admin` VALUES ('31', '19157681684', 'enim exercitation consectetur eu', '管理员', '2024-03-09 18:07:48', '2024-03-09 18:07:48');

-- ----------------------------
-- Table structure for admin_chat
-- ----------------------------
DROP TABLE IF EXISTS `admin_chat`;
CREATE TABLE `admin_chat` (
  `admin_chat_id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin_chat
-- ----------------------------
INSERT INTO `admin_chat` VALUES ('38', '[\r\n                    {\'role\': \'assistant\', \'content\': \'你好！有什么问题我可以帮忙解决吗？\'},\r\n                    {\'role\': \'user\', \'content\': \'Java是一门什么样的语言呢？\'},\r\n                    {\'role\': \'assistant\',\r\n                     \'content\': \'Java是一种通用、面向对象、跨平台的编程语言。它由Sun Microsystems公域，包括Web应用程序开发、移动应用程序开发、企业级应用程序开发等。\'\r\n                                \'Java的跨平台特性意味着编写的Java程序可以在不同的操作系统上运行，只需安装相 应的Java虚拟机即可。Java拥有强大的生态系统和广泛的应用领域，因此被广泛应用于软件开发领域。\'}]', '2024-03-19 16:52:37');
INSERT INTO `admin_chat` VALUES ('39', '[\r\n                {\'role\': \'assistant\', \'content\': \'你好！有什么问题我可以帮忙解决吗？\'},\r\n                {\'role\': \'user\', \'content\': \'请使用饼图表示本周每日对话次数\'},\r\n                {\'role\': \'assistant\', \'content\': \'好的，下面是使用Echarts饼图表示本周对话次数\'},\r\n                {\'role\': \'user\', \'content\': \'请使用堆叠区域图表示昨天每小时登录人数和每小时对话次数\'},\r\n                {\'role\': \'assistant\',\'content\': \"好的，下面是使用Echarts堆叠区域图表示昨天每小时登录人数和每小时对话次数\"}]', '2024-03-19 16:52:52');
INSERT INTO `admin_chat` VALUES ('40', '[{\"role\": \"assistant\", \"content\": \"你好！有什么问题我可以帮忙解决吗？\"}]', '2024-03-19 16:53:15');

-- ----------------------------
-- Table structure for admin_chat_relation
-- ----------------------------
DROP TABLE IF EXISTS `admin_chat_relation`;
CREATE TABLE `admin_chat_relation` (
  `admin_chat_relation_id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `admin_chat_id` int DEFAULT NULL,
  PRIMARY KEY (`admin_chat_relation_id`),
  KEY `admin_id` (`admin_id`),
  KEY `admin_chat_id` (`admin_chat_id`),
  CONSTRAINT `admin_chat_relation_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `admin_chat_relation_ibfk_2` FOREIGN KEY (`admin_chat_id`) REFERENCES `admin_chat` (`admin_chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin_chat_relation
-- ----------------------------
INSERT INTO `admin_chat_relation` VALUES ('293', '30', '38');
INSERT INTO `admin_chat_relation` VALUES ('294', '30', '39');
INSERT INTO `admin_chat_relation` VALUES ('295', '30', '40');

-- ----------------------------
-- Table structure for roast
-- ----------------------------
DROP TABLE IF EXISTS `roast`;
CREATE TABLE `roast` (
  `roast_id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `applause_number` int DEFAULT '0',
  `is_deleted` int(10) unsigned zerofill DEFAULT '0000000000',
  PRIMARY KEY (`roast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of roast
-- ----------------------------
INSERT INTO `roast` VALUES ('1', '系统又崩溃了，这是今天的第三次！', '2024-03-09 13:03:55', '608', '0000000000');
INSERT INTO `roast` VALUES ('2', '为什么每次选课系统都这么慢？', '2024-03-09 13:03:55', '406', '0000000000');
INSERT INTO `roast` VALUES ('3', '校务系统的登录验证码也太复杂了吧！', '1987-04-27 19:37:37', '53', '0000000000');
INSERT INTO `roast` VALUES ('4', '希望能有一个更直观的课程表查询功能。', '2024-03-09 13:03:55', '482', '0000000000');
INSERT INTO `roast` VALUES ('5', '系统维护总是在最需要的时候进行。', '2024-03-09 13:03:55', '457', '0000000000');
INSERT INTO `roast` VALUES ('6', '报告提交后多久才能审批完呢？', '2024-03-09 13:03:55', '175', '0000000000');
INSERT INTO `roast` VALUES ('7', '为什么图书馆的预约系统这么难用？', '2024-03-09 13:03:55', '168', '0000000000');
INSERT INTO `roast` VALUES ('8', '成绩查询功能可以更稳定一些吗？', '2024-03-09 13:03:55', '317', '0000000000');
INSERT INTO `roast` VALUES ('9', '校园网的速度真的需要提升了。', '2024-03-09 13:03:55', '412', '0000000000');
INSERT INTO `roast` VALUES ('10', '教务系统的界面设计感觉停留在十年前。', '2024-03-09 13:03:55', '446', '0000000000');
INSERT INTO `roast` VALUES ('11', '希望能有一个更友好的反馈和建议提交渠道。', '2024-03-09 13:03:55', '325', '0000000000');
INSERT INTO `roast` VALUES ('12', '为什么每次登录都要输验证码？', '2024-03-09 13:03:55', '288', '0000000000');
INSERT INTO `roast` VALUES ('13', '选课系统能不能增加一个模拟选课功能？', '2024-03-09 13:03:55', '466', '0000000000');
INSERT INTO `roast` VALUES ('14', '校园卡充值功能可以更便捷一些吗？', '2024-03-09 13:03:55', '134', '0000000000');
INSERT INTO `roast` VALUES ('15', '教务系统的通知更新速度可以更快一些。', '2024-03-09 13:03:55', '605', '0000000000');
INSERT INTO `roast` VALUES ('16', '希望系统能支持更多类型的文件上传。', '2024-03-09 13:03:55', '624', '0000000000');
INSERT INTO `roast` VALUES ('17', '为什么晚上选课系统总是进不去？', '2014-01-30 07:54:14', '11', '0000000000');
INSERT INTO `roast` VALUES ('18', '希望有一个更清晰的课程冲突提示。', '2024-03-09 13:03:55', '661', '0000000000');
INSERT INTO `roast` VALUES ('19', '教务系统的搜索功能可以优化一下。', '2024-03-09 13:03:55', '52', '0000000000');
INSERT INTO `roast` VALUES ('20', '为什么成绩查询时经常显示错误信息？', '1974-12-26 15:21:10', '64', '0000000000');
INSERT INTO `roast` VALUES ('21', '校园网的覆盖范围可以更广一些。', '2024-03-09 13:03:55', '560', '0000000000');
INSERT INTO `roast` VALUES ('22', '教务系统的用户指南可以更详细一些。', '2024-03-09 13:03:55', '640', '0000000000');
INSERT INTO `roast` VALUES ('23', '希望能有一个更方便的课程表调整功能。', '2024-03-09 13:03:55', '188', '0000000000');
INSERT INTO `roast` VALUES ('24', '为什么系统总是在关键时刻崩溃？', '2024-03-09 13:03:55', '352', '0000000000');
INSERT INTO `roast` VALUES ('25', '选课系统的操作流程可以更简洁一些。', '2024-03-09 13:03:55', '531', '0000000000');
INSERT INTO `roast` VALUES ('26', '校园卡的在线服务可以更完善一些。', '2024-03-09 13:03:55', '267', '0000000000');
INSERT INTO `roast` VALUES ('27', '教务系统的反馈响应速度可以更快一些。', '2024-03-09 13:03:55', '408', '0000000000');
INSERT INTO `roast` VALUES ('28', '希望系统能支持更多的浏览器和设备。', '2024-03-09 13:03:55', '574', '0000000000');
INSERT INTO `roast` VALUES ('29', '为什么成绩查询时经常遇到网络延迟？', '2024-03-09 13:03:55', '311', '0000000000');
INSERT INTO `roast` VALUES ('30', '校园网的稳定性可以更好一些。', '2024-03-09 13:03:55', '501', '0000000000');
INSERT INTO `roast` VALUES ('31', '教务系统的界面可以更现代化一些。', null, null, '0000000000');
INSERT INTO `roast` VALUES ('32', '希望能有一个更直观的课程评价系统。', null, null, '0000000000');
INSERT INTO `roast` VALUES ('33', '为什么系统更新总是在最不方便的时候？', '2024-03-09 21:38:21', '0', '0000000000');
INSERT INTO `roast` VALUES ('34', '选课系统的推荐算法可以更智能一些。', '2024-03-15 10:25:07', '863', '0000000000');
INSERT INTO `roast` VALUES ('35', '校园卡的线下服务可以更便捷一些。', '2024-03-15 10:25:07', '19', '0000000000');
INSERT INTO `roast` VALUES ('36', '校务系统的登录验证码也太复杂了吧！', '2024-03-15 10:25:07', '505', '0000000000');
INSERT INTO `roast` VALUES ('37', '希望能有一个更直观的课程表查询功能。', '2024-03-15 10:25:07', '470', '0000000000');
INSERT INTO `roast` VALUES ('38', '系统维护总是在最需要的时候进行。', '2024-03-15 10:25:07', '834', '0000000000');
INSERT INTO `roast` VALUES ('39', '报告提交后多久才能审批完呢？', '2024-03-15 10:25:07', '761', '0000000000');
INSERT INTO `roast` VALUES ('40', '为什么图书馆的预约系统这么难用？', '2024-03-15 10:25:07', '300', '0000000000');
INSERT INTO `roast` VALUES ('41', '成绩查询功能可以更稳定一些吗？', '2024-03-15 10:25:07', '220', '0000000000');
INSERT INTO `roast` VALUES ('42', '校园网的速度真的需要提升了。', '2024-03-15 10:25:07', '198', '0000000000');
INSERT INTO `roast` VALUES ('43', '教务系统的界面设计感觉停留在十年前。', '2024-03-15 10:25:07', '331', '0000000000');
INSERT INTO `roast` VALUES ('44', '希望能有一个更友好的反馈和建议提交渠道。', '2024-03-15 10:25:07', '62', '0000000000');
INSERT INTO `roast` VALUES ('45', '为什么每次登录都要输验证码？', '2024-03-15 10:25:07', '317', '0000000000');
INSERT INTO `roast` VALUES ('46', '选课系统能不能增加一个模拟选课功能？', '2024-03-15 10:25:07', '399', '0000000000');
INSERT INTO `roast` VALUES ('47', '校园卡充值功能可以更便捷一些吗？', '2024-03-15 10:25:07', '44', '0000000000');
INSERT INTO `roast` VALUES ('48', '教务系统的通知更新速度可以更快一些。', '2024-03-15 10:25:07', '22', '0000000000');
INSERT INTO `roast` VALUES ('49', '希望系统能支持更多类型的文件上传。', '2024-03-15 10:25:07', '979', '0000000001');
INSERT INTO `roast` VALUES ('50', '为什么晚上选课系统总是进不去？', '2024-03-15 10:25:07', '829', '0000000000');
INSERT INTO `roast` VALUES ('51', '希望有一个更清晰的课程冲突提示。', '2024-03-15 10:25:07', '206', '0000000000');
INSERT INTO `roast` VALUES ('52', '教务系统的搜索功能可以优化一下。', '2024-03-15 10:25:07', '545', '0000000000');
INSERT INTO `roast` VALUES ('53', '为什么成绩查询时经常显示错误信息？', '2024-03-15 10:25:07', '106', '0000000000');
INSERT INTO `roast` VALUES ('54', '校园网的覆盖范围可以更广一些。', '2024-03-15 10:25:07', '895', '0000000000');
INSERT INTO `roast` VALUES ('55', '教务系统的用户指南可以更详细一些。', '2024-03-15 10:25:07', '158', '0000000000');
INSERT INTO `roast` VALUES ('56', '希望能有一个更方便的课程表调整功能。', '2024-03-15 10:25:07', '106', '0000000000');
INSERT INTO `roast` VALUES ('57', '为什么系统总是在关键时刻崩溃？', '2024-03-15 10:25:07', '57', '0000000000');
INSERT INTO `roast` VALUES ('58', '选课系统的操作流程可以更简洁一些。', '2024-03-15 10:25:07', '964', '0000000000');
INSERT INTO `roast` VALUES ('59', '校园卡的在线服务可以更完善一些。', '2024-03-15 10:25:07', '651', '0000000000');
INSERT INTO `roast` VALUES ('60', '教务系统的反馈响应速度可以更快一些。', '2024-03-15 10:25:07', '361', '0000000000');
INSERT INTO `roast` VALUES ('61', '希望系统能支持更多的浏览器和设备。', '2024-03-15 10:25:07', '851', '0000000000');
INSERT INTO `roast` VALUES ('62', '为什么成绩查询时经常遇到网络延迟？', '2024-03-15 10:25:07', '174', '0000000000');
INSERT INTO `roast` VALUES ('63', '校园网的稳定性可以更好一些。', '2024-03-15 10:25:07', '316', '0000000000');
INSERT INTO `roast` VALUES ('64', '教务系统的界面可以更现代化一些。', '2024-03-15 10:25:07', '60', '0000000000');
INSERT INTO `roast` VALUES ('65', '希望能有一个更直观的课程评价系统。', '2024-03-15 10:25:07', '350', '0000000000');
INSERT INTO `roast` VALUES ('66', '为什么系统更新总是在最不方便的时候？', '2024-03-15 10:25:07', '570', '0000000000');
INSERT INTO `roast` VALUES ('67', '选课系统的推荐算法可以更智能一些。', '2024-03-15 10:25:07', '801', '0000000000');
INSERT INTO `roast` VALUES ('68', '校园卡的线下服务可以更便捷一些。', '2024-03-15 10:25:07', '296', '0000000000');
INSERT INTO `roast` VALUES ('69', '教务系统的操作指南可以更易懂一些。', '2024-03-15 10:25:07', '78', '0000000000');
INSERT INTO `roast` VALUES ('70', '希望系统能提供更多的个性化设置选项。', '2024-03-15 10:25:07', '499', '0000000000');
INSERT INTO `roast` VALUES ('71', 'dolor proident in', '2024-03-18 12:54:57', '0', '0000000000');
INSERT INTO `roast` VALUES ('72', 'dolor proident in', '2024-03-18 12:57:08', '0', '0000000000');

-- ----------------------------
-- Table structure for roast_comment
-- ----------------------------
DROP TABLE IF EXISTS `roast_comment`;
CREATE TABLE `roast_comment` (
  `roast_comment_id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`roast_comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of roast_comment
-- ----------------------------
INSERT INTO `roast_comment` VALUES ('1', '校务系统登录太慢了，每次都要等好久。', '2024-03-08 22:08:57');
INSERT INTO `roast_comment` VALUES ('2', '选课系统总是崩溃，选课体验太差了。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('3', '为什么成绩查询这么难用，界面太复杂。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('4', '校园网速度太慢，影响学习效率。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('5', '图书馆座位预约系统总是满的，根本预约不到。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('6', '校园卡充值太麻烦，希望能有更便捷的充值方式。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('7', '教务系统的通知总是延迟，错过了重要信息。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('8', '校务系统的界面设计太老旧了，希望能更新一下。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('9', '课程表更新太慢，总是找不到最新的课表。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('10', '校务系统的反馈渠道不够畅通，建议增加。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('11', '校园活动信息发布不够及时，错过了很多活动。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('12', '校务系统的用户手册不够详细，新手上手困难。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('13', '校园内的导航系统不够准确，经常找不到教室。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('14', '校务系统的密码找回功能太复杂，操作不便。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('15', '校园内的无线网络覆盖不全面，有些地方信号差。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('16', '校务系统的课程评价功能不够完善，无法全面了解课程。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('17', '校园内的自行车停放区不够，经常找不到地方停车。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('18', '校务系统的在线客服响应太慢，希望能提高效率。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('19', '校园内的自动售货机经常缺货，希望能及时补货。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('20', '校务系统的考试安排查询功能不够直观。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('21', '校园内的公共设施维护不够及时，希望能加强。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('22', '校务系统的课程推荐系统不够智能，希望能改进。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('23', '校园内的绿化做得不够好，希望能增加绿化面积。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('24', '校务系统的用户反馈处理不够及时，希望能加快处理速度。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('25', '校园内的安全措施不够完善，希望能加强安全监控。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('26', '校务系统的学分转换功能不够清晰，希望能简化流程。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('27', '校园内的交通指示不够明确，希望能增加指示牌。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('28', '校务系统的在线报名系统经常出现错误，希望能修复。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('29', '校园内的餐饮服务不够多样化，希望能提供更多选择。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('30', '校务系统的成绩单打印功能不够方便，希望能改进。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('31', '校园内的自习室开放时间不够长，希望能延长。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('32', '校务系统的课程表调整功能不够灵活，希望能改进。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('33', '校园内的体育设施使用规则不够明确，希望能明确说明。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('34', '校务系统的在线选课指导不够详细，希望能提供更多帮助。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('35', '校园内的文化活动宣传不够，希望能加强宣传力度。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('36', '校务系统的在线缴费功能不够稳定，希望能提高稳定性。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('37', '校园内的宿舍管理不够人性化，希望能改进服务。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('38', '校务系统的课程评价系统不够公正，希望能优化评价机制。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('39', '校园内的实验室预约系统不够方便，希望能简化流程。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('40', '校务系统的在线课程资源不够丰富，希望能增加资源。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('41', '校园内的志愿服务活动信息不够全面，希望能提供更多信息。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('42', '校务系统的在线考试系统不够稳定，希望能提高可靠性。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('43', '校园内的社团活动信息发布不够及时，希望能提前通知。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('44', '校务系统的在线请假功能不够完善，希望能改进。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('45', '校园内的教学楼清洁不够及时，希望能加强清洁工作。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('46', '校务系统的在线课程咨询不够及时，希望能提高响应速度。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('47', '校园内的图书馆借阅系统不够便捷，希望能改进。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('48', '校务系统的在线课程评价不够客观，希望能提供更多参考。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('49', '校园内的体育课程安排不够合理，希望能调整课程时间。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('50', '校务系统的在线课程报名系统不够稳定，希望能提高稳定性。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('51', '校园内的宿舍报修流程不够明确，希望能简化流程。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('52', '校务系统的在线课程退选功能不够方便，希望能改进。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('53', '校园内的教学楼开放时间不够长，希望能延长开放时间。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('54', '校务系统的在线课程反馈不够及时，希望能提高反馈效率。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('55', '校园内的图书馆座位预约系统不够公平，希望能改进预约机制。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('56', '校务系统的在线课程讨论区不够活跃，希望能增加互动。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('57', '校园内的宿舍网络速度不够快，希望能提升网络质量。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('58', '校务系统的在线课程视频播放不够流畅，希望能优化视频服务。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('59', '校园内的宿舍公共区域卫生不够好，希望能加强清洁。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('60', '校务系统的在线课程资料下载速度不够快，希望能提高下载速度。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('61', '校园内的宿舍热水供应时间不够长，希望能延长供应时间。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('62', '校务系统的在线课程互动环节不够充分，希望能增加互动机会。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('63', '校园内的宿舍安全管理不够严格，希望能加强安全措施。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('64', '校务系统的在线课程作业提交系统不够稳定，希望能提高稳定性。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('65', '校园内的宿舍公共设施维护不够及时，希望能加强维护。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('66', '校务系统的在线课程考试安排不够合理，希望能调整考试时间。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('67', '校园内的宿舍访客管理不够严格，希望能加强管理。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('68', '校务系统的在线课程学习进度跟踪不够准确，希望能改进跟踪系统。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('69', '校园内的宿舍公共区域设施不够完善，希望能增加设施。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('70', '校务系统的在线课程学习资源更新不够及时，希望能及时更新。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('71', '校园内的宿舍网络信号覆盖不够全面，希望能改善信号。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('72', '校务系统的在线课程学习效果评估不够准确，希望能提供更多数据。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('73', '校园内的宿舍公共区域噪音控制不够好，希望能加强管理。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('74', '校务系统的在线课程学习氛围营造不够，希望能提供更多学习动力。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('75', '校园内的宿舍公共区域安全措施不够完善，希望能加强安全。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('76', '校务系统的在线课程学习路径规划不够合理，希望能提供个性化规划。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('77', '校园内的宿舍公共区域清洁不够及时，希望能加强清洁工作。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('78', '校务系统的在线课程学习支持服务不够全面，希望能提供更多支持。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('79', '校园内的宿舍公共区域设施使用规则不够明确，希望能明确说明。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('80', '校务系统的在线课程学习资源下载限制太多，希望能放宽限制。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('81', '校园内的宿舍公共区域活动安排不够合理，希望能提供更多活动。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('82', '校务系统的在线课程学习进度反馈不够及时，希望能提高反馈速度。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('83', '校园内的宿舍公共区域安全监控不够全面，希望能加强监控。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('84', '校务系统的在线课程学习效果跟踪不够准确，希望能提供更多数据。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('85', '校园内的宿舍公共区域噪音控制措施不够有效，希望能加强管理。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('86', '校务系统的在线课程学习资源更新不够及时，希望能及时更新。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('87', '校园内的宿舍公共区域设施维护不够及时，希望能加强维护。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('88', '校务系统的在线课程学习支持服务不够全面，希望能提供更多支持。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('89', '校园内的宿舍公共区域活动安排不够合理，希望能提供更多活动。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('90', '校务系统的在线课程学习进度反馈不够及时，希望能提高反馈速度。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('91', '校园内的宿舍公共区域安全监控不够全面，希望能加强监控。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('92', '校务系统的在线课程学习效果跟踪不够准确，希望能提供更多数据。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('93', '校园内的宿舍公共区域噪音控制措施不够有效，希望能加强管理。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('94', '校务系统的在线课程学习资源更新不够及时，希望能及时更新。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('95', '校园内的宿舍公共区域设施维护不够及时，希望能加强维护。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('96', '校务系统的在线课程学习支持服务不够全面，希望能提供更多支持。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('97', '校园内的宿舍公共区域活动安排不够合理，希望能提供更多活动。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('98', '校务系统的在线课程学习进度反馈不够及时，希望能提高反馈速度。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('99', '校园内的宿舍公共区域安全监控不够全面，希望能加强监控。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('100', '校务系统的在线课程学习效果跟踪不够准确，希望能提供更多数据。', '2024-03-09 22:08:57');
INSERT INTO `roast_comment` VALUES ('101', 'sunt ut tempor', '2024-03-09 16:27:13');
INSERT INTO `roast_comment` VALUES ('102', 'sunt ut tempor', '2024-03-09 16:31:53');
INSERT INTO `roast_comment` VALUES ('103', 'sunt ut tempor', '2024-03-09 16:32:51');
INSERT INTO `roast_comment` VALUES ('104', 'sunt ut tempor', '2024-03-09 16:34:38');
INSERT INTO `roast_comment` VALUES ('105', 'sunt ut tempor', '2024-03-09 16:38:03');
INSERT INTO `roast_comment` VALUES ('106', 'sunt ut tempor', '2024-03-09 16:38:30');
INSERT INTO `roast_comment` VALUES ('107', 'sunt ut tempor', '2024-03-09 16:50:39');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` int(10) unsigned zerofill DEFAULT '0000000000',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0', '11111111111', '123456', '2024-03-05 21:20:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('1', '19157681683', '123456', '2024-03-05 21:21:01', '2024-03-15 05:42:52', '0000000000');
INSERT INTO `user` VALUES ('2', '19157681684', '123456aaAA', '2024-03-08 06:56:21', '2024-03-08 06:56:21', '0000000001');
INSERT INTO `user` VALUES ('5', '19157681685', '123456aaAA', '2024-03-08 08:18:33', '2024-03-08 08:18:33', '0000000001');
INSERT INTO `user` VALUES ('6', '1915768000', '123456', '2024-03-08 17:10:36', '2024-03-10 03:01:41', '0000000000');
INSERT INTO `user` VALUES ('7', '1915768001', '123456', '2024-03-08 17:10:36', '2024-03-07 03:01:46', '0000000000');
INSERT INTO `user` VALUES ('8', '1915768002', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('9', '1915768003', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('10', '1915768004', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('11', '1915768005', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('12', '1915768006', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('13', '1915768007', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('14', '1915768008', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('15', '1915768009', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('16', '1915768010', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('17', '1915768011', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('18', '1915768012', 'ea', '1976-01-24 17:30:58', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('19', '1915768013', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('20', '1915768014', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('21', '1915768015', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('22', '1915768016', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('23', '1915768017', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('24', '1915768018', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('25', '1915768019', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('26', '1915768020', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('27', '1915768021', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('28', '1915768022', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('29', '1915768023', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('30', '1915768024', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('31', '1915768025', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('32', '1915768026', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('33', '1915768027', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('34', '1915768028', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('35', '1915768029', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('37', '19157681690', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('39', '19157681691', '123456', '2024-03-08 17:10:36', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('41', '191576181699', 'pariatur Ut laboris', '2024-03-09 17:29:04', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('42', '19157681773', 'minim', '2024-03-09 21:01:43', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('44', '19157681699', '123456', '2024-03-14 08:22:54', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('45', '19157681700', '123456', '2024-03-14 08:24:13', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('46', '19157681701', '123456', '2024-03-14 08:26:28', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('47', '19157681689', '123456aaAA', '2024-03-14 09:04:35', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('48', '19157681666', '123456', '2024-03-17 13:30:19', '2024-03-17 16:34:39', '0000000000');
INSERT INTO `user` VALUES ('49', '19157683000', '123456', '2024-03-18 11:35:10', '2024-03-18 11:35:10', '0000000000');
INSERT INTO `user` VALUES ('51', '19157683001', '123456', '2024-03-18 11:36:56', '2024-03-18 11:36:56', '0000000000');

-- ----------------------------
-- Table structure for user_chat
-- ----------------------------
DROP TABLE IF EXISTS `user_chat`;
CREATE TABLE `user_chat` (
  `user_chat_id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_chat
-- ----------------------------
INSERT INTO `user_chat` VALUES ('1', '你好，今天天气真好！', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('2', '我们一起去公园散步吧。', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('3', '我最近在读一本很有趣的书。', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('4', '你最喜欢的电影是什么？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('5', '晚上有空一起吃饭吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('6', '这个周末有什么计划吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('7', '我打算去爬山，你有兴趣吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('8', '最近工作很忙，需要放松一下。', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('9', '你推荐的那家餐厅真的很不错！', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('10', '明天的会议你准备好了吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('11', '我昨天去了一个新的咖啡馆，环境很好。', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('12', '我们下次聚会可以在那里。', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('13', '你最近有没有看什么好电影推荐？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('14', '我在学习一门新的语言，感觉挺有挑战的。', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('15', '这个项目下周就要截止了，加油！', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('16', '你对这个新功能有什么看法？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('17', '我打算周末去海边，你想去吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('18', '最近健身房新开了一门课程，一起去试试吧。', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('19', '你对这个新出的科技产品感兴趣吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('20', '我听说你最近在学吉他，学得怎么样了？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('21', '我们公司的年会就要到了，你准备好表演了吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('22', '我最近在找新的租房，你有什么建议吗？', '2024-03-08 17:18:50');
INSERT INTO `user_chat` VALUES ('23', '你对这个新开的展览感兴趣吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('24', '我打算学习烹饪，你有什么好的食谱推荐吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('25', '这个周末我们去徒步旅行怎么样？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('26', '你对这个新出的纪录片有什么看法？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('27', '我最近在研究摄影，你有兴趣一起出去拍照吗？', '2024-03-08 17:20:48');
INSERT INTO `user_chat` VALUES ('28', '你对这个新出的旅行目的地感兴趣吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('29', '我打算学习编程，你有什么好的学习资源推荐吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('30', '这个新出的科幻小说你看过了吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('31', '你对这个新出的音乐节感兴趣吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('32', '我最近在研究心理学，你有什么书籍推荐吗？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('33', '这个周末我们去野餐怎么样？', '2024-03-08 17:18:48');
INSERT INTO `user_chat` VALUES ('34', '你好我是李林名minim nisi culpa', '2024-03-08 23:14:14');
INSERT INTO `user_chat` VALUES ('35', '你好我是李林名', '2024-03-08 23:17:25');
INSERT INTO `user_chat` VALUES ('36', '你好我是李林名', '2024-03-07 03:30:40');
INSERT INTO `user_chat` VALUES ('37', '你好我是李林大', '2024-03-07 03:30:46');
INSERT INTO `user_chat` VALUES ('38', '你好我是李林大', '2024-03-08 15:22:48');
INSERT INTO `user_chat` VALUES ('39', '你好我是李林大', '2024-03-08 15:27:11');
INSERT INTO `user_chat` VALUES ('40', '你好我是李林大', '2024-03-08 15:35:39');
INSERT INTO `user_chat` VALUES ('41', '你好我是李林大', '2024-03-08 15:40:23');
INSERT INTO `user_chat` VALUES ('42', '你好我是李林大', '2024-03-08 15:41:48');
INSERT INTO `user_chat` VALUES ('43', '你好我是李林大', '2024-03-08 15:48:17');
INSERT INTO `user_chat` VALUES ('44', '你好我是李林大', '2024-03-08 15:52:28');
INSERT INTO `user_chat` VALUES ('45', '你好', '2024-03-08 15:56:13');
INSERT INTO `user_chat` VALUES ('46', '你好', '2024-03-08 15:57:20');
INSERT INTO `user_chat` VALUES ('47', '你好', '2024-03-08 16:01:35');
INSERT INTO `user_chat` VALUES ('48', '你好', '2024-03-08 16:01:54');
INSERT INTO `user_chat` VALUES ('49', '你好', '2024-03-08 16:12:00');
INSERT INTO `user_chat` VALUES ('50', '你好', '2024-03-09 01:26:40');
INSERT INTO `user_chat` VALUES ('51', '你好', '2024-03-09 01:27:44');
INSERT INTO `user_chat` VALUES ('52', '你好', '2024-03-09 01:29:33');
INSERT INTO `user_chat` VALUES ('53', '你好', '2024-03-09 01:30:03');
INSERT INTO `user_chat` VALUES ('54', '你好', '2024-03-09 01:30:48');
INSERT INTO `user_chat` VALUES ('55', '你好', '2024-03-09 01:32:48');
INSERT INTO `user_chat` VALUES ('56', '你好', '2024-03-09 01:33:20');
INSERT INTO `user_chat` VALUES ('57', '你好', '2024-03-09 01:33:44');
INSERT INTO `user_chat` VALUES ('58', '你好', '2024-03-09 01:34:03');
INSERT INTO `user_chat` VALUES ('59', '你好', '2024-03-09 01:34:43');
INSERT INTO `user_chat` VALUES ('60', '你好我是李林大', '2024-03-09 01:50:13');
INSERT INTO `user_chat` VALUES ('61', '你好我是李林大', '2024-03-09 01:51:03');
INSERT INTO `user_chat` VALUES ('62', '你好我是李林大', '2024-03-09 01:51:34');
INSERT INTO `user_chat` VALUES ('63', '你好我是李林大', '2024-03-09 01:56:59');
INSERT INTO `user_chat` VALUES ('64', '你好我是李林大', '2024-03-09 01:59:56');
INSERT INTO `user_chat` VALUES ('65', '你好', '2024-03-09 02:10:10');
INSERT INTO `user_chat` VALUES ('66', '你好我是李林大', '2024-03-09 02:15:18');
INSERT INTO `user_chat` VALUES ('67', '你好我是李林大', '2024-03-09 02:19:26');
INSERT INTO `user_chat` VALUES ('68', '你好', '2024-03-09 02:21:14');
INSERT INTO `user_chat` VALUES ('69', '你好', '2024-03-09 03:11:42');
INSERT INTO `user_chat` VALUES ('70', '你好', '2024-03-09 03:11:42');
INSERT INTO `user_chat` VALUES ('71', 'ipsum et esse deserunt', '2024-03-09 04:03:18');
INSERT INTO `user_chat` VALUES ('72', 'nulla mollit', '2024-03-09 04:04:23');
INSERT INTO `user_chat` VALUES ('73', 'nulla mollit', '2024-03-09 04:05:11');
INSERT INTO `user_chat` VALUES ('74', 'nisi laboris officia', '2024-03-09 04:06:02');
INSERT INTO `user_chat` VALUES ('75', 'cupidatat fugiat irure aliquip enim', '2024-03-09 04:17:06');
INSERT INTO `user_chat` VALUES ('76', 'ea et esse in', '2024-03-09 04:26:34');
INSERT INTO `user_chat` VALUES ('77', '你好', '2024-03-09 23:51:17');
INSERT INTO `user_chat` VALUES ('78', '你好', '2024-03-09 23:51:17');
INSERT INTO `user_chat` VALUES ('89', '[\r\n  {\'role\': \'assistant\', \'content\': \'欢迎来到旅行咨询！您计划去哪里度假呢？\'},\r\n  {\'role\': \'user\', \'content\': \'我想去欧洲度假，有什么好的推荐吗？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'欧洲的话，巴黎是个不错的选择，卢浮宫和埃菲尔铁塔都是必游之地。\'},\r\n  {\'role\': \'user\', \'content\': \'那预算方面怎么控制呢？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'为了控制预算，您可以提前预订机票和酒店，并考虑购买通票游览各大景点，这样能节省不少开支。\'},\r\n  {\'role\': \'user\', \'content\': \'我听说巴塞罗那也很棒，那里的高迪建筑很有特色。\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'没错，巴塞罗那的高迪建筑如圣家堂、帕斯奇·格拉西亚大街上的米拉之家和巴特略之家都是独一无二的艺术品。\'},\r\n  {\'role\': \'user\', \'content\': \'如果我想去海岛度假，哪个地方比较好？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'如果您喜欢海岛，马尔代夫或希腊圣托里尼是全球知名的度假胜地，拥有绝美的海滩和浪漫氛围。\'},\r\n  {\'role\': \'user\', \'content\': \'我想了解一下日本的京都怎么样？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'京都是日本的文化之都，四季各有韵味，可以参观古寺神社如金阁寺、清水寺，体验茶道与和服文化。\'},\r\n  {\'role\': \'user\', \'content\': \'如果我想在国内旅游，有哪些适合带孩子去的地方？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'国内亲子游热门目的地包括迪士尼乐园、广州长隆野生动物园以及各类自然公园和科普教育基地，如北京的故宫博物院也有专门针对孩子的互动活动。\'},\r\n  {\'role\': \'assistant\', \'content\': \'另外，还可以选择一些户外探险类的目的地，比如桂林漓江的徒步游船，让孩子接触大自然的同时增长见识。\'}\r\n]', '2024-03-16 15:33:44');
INSERT INTO `user_chat` VALUES ('90', '[\r\n  {\'role\': \'assistant\', \'content\': \'你好！有什么编程相关的问题我可以帮助解答吗？\'},\r\n  {\'role\': \'user\', \'content\': \'Python和Java哪个更适合初学者？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'Python以其语法简洁、易读性强的特点，通常被认为更适合初学者入门；而Java在系统级编程和企业级应用中广泛应用，学习它有助于理解面向对象编程的核心概念。\'}, \r\n  {\'role\': \'user\', \'content\': \'我想了解什么是函数式编程？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'函数式编程是一种强调程序执行过程中的计算是通过数学函数进行，并且尽量避免改变状态和可变数据的编程范式，比如Haskell和Scala就支持这种编程方式。\'},\r\n  {\'role\': \'user\', \'content\': \'JavaScript和TypeScript有何区别？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'JavaScript是浏览器和Node.js环境下的主要脚本语言，而TypeScript是JavaScript的一个超集，提供了静态类型检查、接口等额外功能，提高了大型项目的可维护性和开发效率。\'},\r\n  {\'role\': \'user\', \'content\': \'我该如何选择一个合适的编程框架？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'选择编程框架时应考虑项目需求、社区活跃度、文档完善程度以及个人或团队技能匹配度。例如，Web开发中React适用于构建用户界面，Django则适合快速搭建后端服务。\'},\r\n  {\'role\': \'user\', \'content\': \'解释一下什么是递归算法？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'递归算法是一种解决问题的方法，其特点在于函数直接或间接地调用自身来解决问题的各个子问题，直至达到基本情况为止，如斐波那契数列和树的遍历常使用递归实现。\'},\r\n  {\'role\': \'user\', \'content\': \'并发和并行编程的区别是什么？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'并发编程是指在同一时间段内，多个任务交替执行，看起来像是同时进行；而并行编程则是指真正意义上的同一时刻多任务在多个处理器核心上同时执行。\'},\r\n  {\'role\': \'user\', \'content\': \'如何处理内存泄漏问题？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'处理内存泄漏问题通常包括合理管理资源（如及时释放不再使用的内存）、使用智能指针或其他自动管理机制、定期进行内存检测与分析，并遵循编程语言的最佳实践编写代码。\'}\r\n]', '2024-03-16 15:34:07');
INSERT INTO `user_chat` VALUES ('91', '[\r\n  {\'role\': \'assistant\', \'content\': \'你好！有什么美食方面的问题我可以帮助解答吗？\'},\r\n  {\'role\': \'user\', \'content\': \'川菜的特点是什么？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'川菜以其麻辣鲜香、口味多样著称，注重调味和烹饪技法，如火锅、麻婆豆腐等经典菜肴就充分体现了其独特的麻辣特色。\'}, \r\n  {\'role\': \'user\', \'content\': \'如何制作一道正宗的意大利面？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'制作正宗意大利面的基本步骤包括煮面至“al dente”（有嚼劲），准备新鲜的番茄酱或奶油酱汁，搭配肉类、海鲜或蔬菜，撒上帕玛森奶酪，最后可以点缀些罗勒叶提味。\'},\r\n  {\'role\': \'user\', \'content\': \'中餐八大菜系分别是什么？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'中餐的八大菜系分别是：川菜、鲁菜、粤菜、苏菜、闽菜、浙菜、湘菜和徽菜，它们各具地方特色，口味各异。\'},\r\n  {\'role\': \'user\', \'content\': \'请问什么是法国蓝带厨艺学院？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'法国蓝带厨艺学院是世界上最古老且著名的厨艺及酒店管理学校之一，提供专业烹饪培训课程，致力于培养高级厨师和餐饮业人才。\'},\r\n  {\'role\': \'user\', \'content\': \'怎样正确保存葡萄酒？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'葡萄酒应储存在阴暗、恒温（约12-18℃）、湿度适宜（60%-70%）的地方，瓶身保持水平放置，避免震动和温度剧烈变化，以保证酒质稳定并延长其寿命。\'},\r\n  {\'role\': \'user\', \'content\': \'我想了解日本寿司的种类有哪些？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'日本寿司主要有握寿司（ nigiri sushi）、手卷寿司（temaki sushi）、散寿司（chirashi sushi）和押寿司（oshi sushi）等多种类型，其中最常见的握寿司由醋米配上各类鱼生或其他食材制成。\'},\r\n  {\'role\': \'user\', \'content\': \'做烘焙时，高筋面粉和低筋面粉的区别是什么？\'},\r\n  \r\n  {\'role\': \'assistant\', \'content\': \'在烘焙中，高筋面粉蛋白质含量较高，形成的面筋强度大，适合做面包、披萨皮等需要较强弹性和拉伸性的食品；而低筋面粉则蛋白质含量较低，适用于蛋糕、饼干等需要蓬松口感的烘焙产品。\'}\r\n]', '2024-03-16 15:34:32');
INSERT INTO `user_chat` VALUES ('92', '[{\'role\': \'assistant\', \'content\': \'你好！有什么问题我可以帮助解答吗？\'}]', '2024-03-16 10:31:39');

-- ----------------------------
-- Table structure for user_chat_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_chat_relation`;
CREATE TABLE `user_chat_relation` (
  `user_chat_relation_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `user_chat_id` int DEFAULT NULL,
  PRIMARY KEY (`user_chat_relation_id`),
  KEY `user_id` (`user_id`),
  KEY `user_chat_id` (`user_chat_id`),
  CONSTRAINT `user_chat_relation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_chat_relation_ibfk_2` FOREIGN KEY (`user_chat_id`) REFERENCES `user_chat` (`user_chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_chat_relation
-- ----------------------------
INSERT INTO `user_chat_relation` VALUES ('1', '5', '1');
INSERT INTO `user_chat_relation` VALUES ('2', '6', '2');
INSERT INTO `user_chat_relation` VALUES ('3', '7', '3');
INSERT INTO `user_chat_relation` VALUES ('4', '8', '4');
INSERT INTO `user_chat_relation` VALUES ('5', '9', '5');
INSERT INTO `user_chat_relation` VALUES ('6', '10', '6');
INSERT INTO `user_chat_relation` VALUES ('7', '11', '7');
INSERT INTO `user_chat_relation` VALUES ('8', '12', '8');
INSERT INTO `user_chat_relation` VALUES ('9', '13', '9');
INSERT INTO `user_chat_relation` VALUES ('10', '14', '10');
INSERT INTO `user_chat_relation` VALUES ('11', '15', '11');
INSERT INTO `user_chat_relation` VALUES ('12', '16', '12');
INSERT INTO `user_chat_relation` VALUES ('13', '17', '13');
INSERT INTO `user_chat_relation` VALUES ('14', '18', '14');
INSERT INTO `user_chat_relation` VALUES ('15', '19', '15');
INSERT INTO `user_chat_relation` VALUES ('16', '20', '16');
INSERT INTO `user_chat_relation` VALUES ('17', '21', '17');
INSERT INTO `user_chat_relation` VALUES ('18', '22', '18');
INSERT INTO `user_chat_relation` VALUES ('19', '23', '19');
INSERT INTO `user_chat_relation` VALUES ('20', '24', '20');
INSERT INTO `user_chat_relation` VALUES ('21', '25', '21');
INSERT INTO `user_chat_relation` VALUES ('22', '26', '22');
INSERT INTO `user_chat_relation` VALUES ('23', '27', '23');
INSERT INTO `user_chat_relation` VALUES ('24', '28', '24');
INSERT INTO `user_chat_relation` VALUES ('25', '29', '25');
INSERT INTO `user_chat_relation` VALUES ('26', '30', '26');
INSERT INTO `user_chat_relation` VALUES ('27', '5', '27');
INSERT INTO `user_chat_relation` VALUES ('28', '6', '28');
INSERT INTO `user_chat_relation` VALUES ('29', '7', '29');
INSERT INTO `user_chat_relation` VALUES ('30', '8', '30');
INSERT INTO `user_chat_relation` VALUES ('31', '9', '1');
INSERT INTO `user_chat_relation` VALUES ('32', '10', '2');
INSERT INTO `user_chat_relation` VALUES ('33', '11', '3');
INSERT INTO `user_chat_relation` VALUES ('34', '12', '4');
INSERT INTO `user_chat_relation` VALUES ('35', '13', '5');
INSERT INTO `user_chat_relation` VALUES ('36', '14', '6');
INSERT INTO `user_chat_relation` VALUES ('37', '15', '7');
INSERT INTO `user_chat_relation` VALUES ('38', '16', '8');
INSERT INTO `user_chat_relation` VALUES ('39', '17', '9');
INSERT INTO `user_chat_relation` VALUES ('40', '18', '10');
INSERT INTO `user_chat_relation` VALUES ('41', '19', '11');
INSERT INTO `user_chat_relation` VALUES ('42', '20', '12');
INSERT INTO `user_chat_relation` VALUES ('43', '21', '13');
INSERT INTO `user_chat_relation` VALUES ('44', '22', '14');
INSERT INTO `user_chat_relation` VALUES ('45', '23', '15');
INSERT INTO `user_chat_relation` VALUES ('46', '24', '16');
INSERT INTO `user_chat_relation` VALUES ('47', '25', '17');
INSERT INTO `user_chat_relation` VALUES ('48', '26', '18');
INSERT INTO `user_chat_relation` VALUES ('49', '27', '19');
INSERT INTO `user_chat_relation` VALUES ('50', '28', '20');
INSERT INTO `user_chat_relation` VALUES ('51', '29', '21');
INSERT INTO `user_chat_relation` VALUES ('52', '30', '22');
INSERT INTO `user_chat_relation` VALUES ('53', '5', '22');
INSERT INTO `user_chat_relation` VALUES ('54', '2', '1');
INSERT INTO `user_chat_relation` VALUES ('55', '2', '1');
INSERT INTO `user_chat_relation` VALUES ('56', '2', '1');
INSERT INTO `user_chat_relation` VALUES ('57', '2', '1');
INSERT INTO `user_chat_relation` VALUES ('58', '2', null);
INSERT INTO `user_chat_relation` VALUES ('59', '2', null);
INSERT INTO `user_chat_relation` VALUES ('60', '2', null);
INSERT INTO `user_chat_relation` VALUES ('61', '2', null);
INSERT INTO `user_chat_relation` VALUES ('62', '2', '10');
INSERT INTO `user_chat_relation` VALUES ('63', '2', null);
INSERT INTO `user_chat_relation` VALUES ('64', '2', null);
INSERT INTO `user_chat_relation` VALUES ('69', '2', '63');
INSERT INTO `user_chat_relation` VALUES ('73', '2', null);
INSERT INTO `user_chat_relation` VALUES ('76', '10', '68');
INSERT INTO `user_chat_relation` VALUES ('77', '10', '70');
INSERT INTO `user_chat_relation` VALUES ('78', '19', '71');
INSERT INTO `user_chat_relation` VALUES ('81', '18', '74');
INSERT INTO `user_chat_relation` VALUES ('82', '25', '75');
INSERT INTO `user_chat_relation` VALUES ('83', '8', '76');
INSERT INTO `user_chat_relation` VALUES ('84', '10', '78');
INSERT INTO `user_chat_relation` VALUES ('94', '1', '89');
INSERT INTO `user_chat_relation` VALUES ('95', '1', '90');
INSERT INTO `user_chat_relation` VALUES ('96', '1', '91');
INSERT INTO `user_chat_relation` VALUES ('97', '1', '92');

-- ----------------------------
-- Table structure for user_roast
-- ----------------------------
DROP TABLE IF EXISTS `user_roast`;
CREATE TABLE `user_roast` (
  `user_roast_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `roast_id` int DEFAULT NULL,
  PRIMARY KEY (`user_roast_id`),
  KEY `user_id` (`user_id`),
  KEY `roast_id` (`roast_id`),
  CONSTRAINT `user_roast_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_roast_ibfk_2` FOREIGN KEY (`roast_id`) REFERENCES `roast` (`roast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_roast
-- ----------------------------
INSERT INTO `user_roast` VALUES ('1', '11', '31');
INSERT INTO `user_roast` VALUES ('2', '15', '32');
INSERT INTO `user_roast` VALUES ('3', '0', '33');
INSERT INTO `user_roast` VALUES ('4', '0', '71');
INSERT INTO `user_roast` VALUES ('5', '0', '72');

-- ----------------------------
-- Table structure for user_roast_comment
-- ----------------------------
DROP TABLE IF EXISTS `user_roast_comment`;
CREATE TABLE `user_roast_comment` (
  `user_roast_comment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `comment_id` int DEFAULT NULL,
  `roast_id` int DEFAULT NULL,
  PRIMARY KEY (`user_roast_comment_id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`),
  KEY `roast_id` (`roast_id`),
  CONSTRAINT `user_roast_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_roast_comment_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `roast_comment` (`roast_comment_id`),
  CONSTRAINT `user_roast_comment_ibfk_3` FOREIGN KEY (`roast_id`) REFERENCES `roast` (`roast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=848 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_roast_comment
-- ----------------------------
INSERT INTO `user_roast_comment` VALUES ('147', '31', '29', '24');
INSERT INTO `user_roast_comment` VALUES ('148', '10', '21', '15');
INSERT INTO `user_roast_comment` VALUES ('149', '19', '29', '30');
INSERT INTO `user_roast_comment` VALUES ('150', '11', '7', '27');
INSERT INTO `user_roast_comment` VALUES ('151', '35', '14', '24');
INSERT INTO `user_roast_comment` VALUES ('152', '30', '24', '1');
INSERT INTO `user_roast_comment` VALUES ('153', '31', '11', '23');
INSERT INTO `user_roast_comment` VALUES ('154', '31', '6', '24');
INSERT INTO `user_roast_comment` VALUES ('155', '24', '27', '3');
INSERT INTO `user_roast_comment` VALUES ('156', '33', '13', '27');
INSERT INTO `user_roast_comment` VALUES ('157', '16', '10', '1');
INSERT INTO `user_roast_comment` VALUES ('280', '32', '18', '24');
INSERT INTO `user_roast_comment` VALUES ('281', '14', '11', '11');
INSERT INTO `user_roast_comment` VALUES ('282', '30', '6', '27');
INSERT INTO `user_roast_comment` VALUES ('283', '11', '15', '8');
INSERT INTO `user_roast_comment` VALUES ('284', '35', '9', '27');
INSERT INTO `user_roast_comment` VALUES ('285', '34', '5', '12');
INSERT INTO `user_roast_comment` VALUES ('286', '24', '7', '19');
INSERT INTO `user_roast_comment` VALUES ('287', '23', '9', '3');
INSERT INTO `user_roast_comment` VALUES ('288', '29', '25', '11');
INSERT INTO `user_roast_comment` VALUES ('289', '17', '2', '17');
INSERT INTO `user_roast_comment` VALUES ('290', '28', '8', '17');
INSERT INTO `user_roast_comment` VALUES ('324', '20', '12', '24');
INSERT INTO `user_roast_comment` VALUES ('325', '39', '9', '19');
INSERT INTO `user_roast_comment` VALUES ('326', '16', '3', '26');
INSERT INTO `user_roast_comment` VALUES ('327', '11', '19', '3');
INSERT INTO `user_roast_comment` VALUES ('328', '23', '27', '6');
INSERT INTO `user_roast_comment` VALUES ('329', '18', '20', '19');
INSERT INTO `user_roast_comment` VALUES ('330', '14', '25', '19');
INSERT INTO `user_roast_comment` VALUES ('331', '33', '25', '28');
INSERT INTO `user_roast_comment` VALUES ('332', '16', '6', '10');
INSERT INTO `user_roast_comment` VALUES ('333', '39', '24', '4');
INSERT INTO `user_roast_comment` VALUES ('334', '16', '18', '11');
INSERT INTO `user_roast_comment` VALUES ('357', '18', '13', '10');
INSERT INTO `user_roast_comment` VALUES ('358', '19', '16', '20');
INSERT INTO `user_roast_comment` VALUES ('359', '33', '22', '12');
INSERT INTO `user_roast_comment` VALUES ('360', '35', '24', '20');
INSERT INTO `user_roast_comment` VALUES ('361', '35', '3', '29');
INSERT INTO `user_roast_comment` VALUES ('362', '29', '4', '24');
INSERT INTO `user_roast_comment` VALUES ('363', '29', '20', '12');
INSERT INTO `user_roast_comment` VALUES ('364', '11', '28', '20');
INSERT INTO `user_roast_comment` VALUES ('365', '22', '3', '5');
INSERT INTO `user_roast_comment` VALUES ('366', '25', '28', '9');
INSERT INTO `user_roast_comment` VALUES ('367', '29', '8', '13');
INSERT INTO `user_roast_comment` VALUES ('368', '17', '28', '2');
INSERT INTO `user_roast_comment` VALUES ('369', '20', '17', '22');
INSERT INTO `user_roast_comment` VALUES ('370', '39', '19', '8');
INSERT INTO `user_roast_comment` VALUES ('371', '19', '25', '8');
INSERT INTO `user_roast_comment` VALUES ('372', '34', '5', '13');
INSERT INTO `user_roast_comment` VALUES ('373', '29', '23', '29');
INSERT INTO `user_roast_comment` VALUES ('374', '27', '27', '26');
INSERT INTO `user_roast_comment` VALUES ('375', '29', '15', '16');
INSERT INTO `user_roast_comment` VALUES ('376', '16', '13', '16');
INSERT INTO `user_roast_comment` VALUES ('377', '21', '8', '3');
INSERT INTO `user_roast_comment` VALUES ('378', '32', '10', '12');
INSERT INTO `user_roast_comment` VALUES ('533', '27', '16', '29');
INSERT INTO `user_roast_comment` VALUES ('534', '18', '11', '28');
INSERT INTO `user_roast_comment` VALUES ('535', '29', '11', '27');
INSERT INTO `user_roast_comment` VALUES ('536', '22', '7', '29');
INSERT INTO `user_roast_comment` VALUES ('537', '14', '23', '15');
INSERT INTO `user_roast_comment` VALUES ('538', '13', '29', '19');
INSERT INTO `user_roast_comment` VALUES ('539', '18', '11', '2');
INSERT INTO `user_roast_comment` VALUES ('540', '12', '8', '29');
INSERT INTO `user_roast_comment` VALUES ('541', '16', '3', '22');
INSERT INTO `user_roast_comment` VALUES ('542', '21', '22', '14');
INSERT INTO `user_roast_comment` VALUES ('543', '12', '1', '26');
INSERT INTO `user_roast_comment` VALUES ('544', '20', '28', '21');
INSERT INTO `user_roast_comment` VALUES ('545', '33', '20', '2');
INSERT INTO `user_roast_comment` VALUES ('546', '17', '2', '13');
INSERT INTO `user_roast_comment` VALUES ('547', '10', '24', '27');
INSERT INTO `user_roast_comment` VALUES ('548', '13', '23', '16');
INSERT INTO `user_roast_comment` VALUES ('549', '22', '9', '11');
INSERT INTO `user_roast_comment` VALUES ('550', '35', '1', '19');
INSERT INTO `user_roast_comment` VALUES ('551', '12', '16', '10');
INSERT INTO `user_roast_comment` VALUES ('552', '12', '10', '12');
INSERT INTO `user_roast_comment` VALUES ('553', '11', '30', '26');
INSERT INTO `user_roast_comment` VALUES ('554', '21', '5', '20');
INSERT INTO `user_roast_comment` VALUES ('555', '37', '10', '2');
INSERT INTO `user_roast_comment` VALUES ('556', '18', '4', '23');
INSERT INTO `user_roast_comment` VALUES ('557', '25', '7', '15');
INSERT INTO `user_roast_comment` VALUES ('558', '35', '18', '18');
INSERT INTO `user_roast_comment` VALUES ('559', '14', '28', '10');
INSERT INTO `user_roast_comment` VALUES ('560', '30', '11', '24');
INSERT INTO `user_roast_comment` VALUES ('561', '39', '11', '25');
INSERT INTO `user_roast_comment` VALUES ('562', '14', '5', '10');
INSERT INTO `user_roast_comment` VALUES ('563', '16', '29', '10');
INSERT INTO `user_roast_comment` VALUES ('564', '31', '15', '11');
INSERT INTO `user_roast_comment` VALUES ('565', '20', '18', '29');
INSERT INTO `user_roast_comment` VALUES ('577', '19', '2', '11');
INSERT INTO `user_roast_comment` VALUES ('578', '28', '27', '20');
INSERT INTO `user_roast_comment` VALUES ('579', '32', '15', '10');
INSERT INTO `user_roast_comment` VALUES ('580', '15', '26', '27');
INSERT INTO `user_roast_comment` VALUES ('581', '34', '8', '28');
INSERT INTO `user_roast_comment` VALUES ('582', '37', '18', '10');
INSERT INTO `user_roast_comment` VALUES ('583', '33', '24', '24');
INSERT INTO `user_roast_comment` VALUES ('584', '27', '11', '2');
INSERT INTO `user_roast_comment` VALUES ('585', '15', '23', '9');
INSERT INTO `user_roast_comment` VALUES ('586', '14', '24', '17');
INSERT INTO `user_roast_comment` VALUES ('587', '23', '13', '26');
INSERT INTO `user_roast_comment` VALUES ('665', '21', '8', '2');
INSERT INTO `user_roast_comment` VALUES ('666', '27', '19', '12');
INSERT INTO `user_roast_comment` VALUES ('667', '15', '17', '11');
INSERT INTO `user_roast_comment` VALUES ('668', '11', '4', '15');
INSERT INTO `user_roast_comment` VALUES ('669', '13', '3', '4');
INSERT INTO `user_roast_comment` VALUES ('670', '16', '22', '2');
INSERT INTO `user_roast_comment` VALUES ('671', '11', '29', '24');
INSERT INTO `user_roast_comment` VALUES ('672', '13', '5', '11');
INSERT INTO `user_roast_comment` VALUES ('673', '18', '11', '29');
INSERT INTO `user_roast_comment` VALUES ('674', '33', '26', '2');
INSERT INTO `user_roast_comment` VALUES ('675', '29', '30', '4');
INSERT INTO `user_roast_comment` VALUES ('687', '22', '8', '1');
INSERT INTO `user_roast_comment` VALUES ('688', '19', '14', '12');
INSERT INTO `user_roast_comment` VALUES ('689', '27', '17', '5');
INSERT INTO `user_roast_comment` VALUES ('690', '13', '2', '26');
INSERT INTO `user_roast_comment` VALUES ('691', '18', '21', '20');
INSERT INTO `user_roast_comment` VALUES ('692', '16', '2', '16');
INSERT INTO `user_roast_comment` VALUES ('693', '29', '12', '6');
INSERT INTO `user_roast_comment` VALUES ('694', '31', '28', '18');
INSERT INTO `user_roast_comment` VALUES ('695', '13', '23', '14');
INSERT INTO `user_roast_comment` VALUES ('696', '11', '26', '6');
INSERT INTO `user_roast_comment` VALUES ('697', '17', '19', '13');
INSERT INTO `user_roast_comment` VALUES ('709', '20', '19', '2');
INSERT INTO `user_roast_comment` VALUES ('710', '19', '12', '2');
INSERT INTO `user_roast_comment` VALUES ('711', '11', '2', '4');
INSERT INTO `user_roast_comment` VALUES ('712', '23', '22', '11');
INSERT INTO `user_roast_comment` VALUES ('713', '27', '22', '29');
INSERT INTO `user_roast_comment` VALUES ('714', '29', '7', '9');
INSERT INTO `user_roast_comment` VALUES ('715', '30', '13', '7');
INSERT INTO `user_roast_comment` VALUES ('716', '33', '4', '11');
INSERT INTO `user_roast_comment` VALUES ('717', '21', '24', '25');
INSERT INTO `user_roast_comment` VALUES ('718', '33', '7', '24');
INSERT INTO `user_roast_comment` VALUES ('719', '23', '21', '8');
INSERT INTO `user_roast_comment` VALUES ('764', '26', '10', '3');
INSERT INTO `user_roast_comment` VALUES ('765', '24', '29', '14');
INSERT INTO `user_roast_comment` VALUES ('766', '22', '18', '23');
INSERT INTO `user_roast_comment` VALUES ('767', '11', '27', '14');
INSERT INTO `user_roast_comment` VALUES ('768', '24', '1', '19');
INSERT INTO `user_roast_comment` VALUES ('769', '15', '26', '25');
INSERT INTO `user_roast_comment` VALUES ('770', '27', '10', '28');
INSERT INTO `user_roast_comment` VALUES ('771', '32', '21', '11');
INSERT INTO `user_roast_comment` VALUES ('772', '30', '7', '5');
INSERT INTO `user_roast_comment` VALUES ('773', '14', '4', '6');
INSERT INTO `user_roast_comment` VALUES ('774', '27', '8', '16');
INSERT INTO `user_roast_comment` VALUES ('819', '15', '1', '18');
INSERT INTO `user_roast_comment` VALUES ('820', '37', '20', '20');
INSERT INTO `user_roast_comment` VALUES ('821', '21', '22', '17');
INSERT INTO `user_roast_comment` VALUES ('822', '30', '19', '3');
INSERT INTO `user_roast_comment` VALUES ('823', '25', '7', '19');
INSERT INTO `user_roast_comment` VALUES ('824', '26', '20', '21');
INSERT INTO `user_roast_comment` VALUES ('825', '26', '16', '4');
INSERT INTO `user_roast_comment` VALUES ('826', '37', '5', '2');
INSERT INTO `user_roast_comment` VALUES ('827', '32', '17', '17');
INSERT INTO `user_roast_comment` VALUES ('828', '12', '21', '9');
INSERT INTO `user_roast_comment` VALUES ('829', '20', '23', '25');
INSERT INTO `user_roast_comment` VALUES ('847', '26', '107', '22');

-- ----------------------------
-- Table structure for user_wish
-- ----------------------------
DROP TABLE IF EXISTS `user_wish`;
CREATE TABLE `user_wish` (
  `user_wish_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `wish_id` int DEFAULT NULL,
  PRIMARY KEY (`user_wish_id`),
  KEY `user_id` (`user_id`),
  KEY `wish_id` (`wish_id`),
  CONSTRAINT `user_wish_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_wish_ibfk_2` FOREIGN KEY (`wish_id`) REFERENCES `wish` (`wish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_wish
-- ----------------------------
INSERT INTO `user_wish` VALUES ('5', '21', '76');
INSERT INTO `user_wish` VALUES ('6', '21', '77');
INSERT INTO `user_wish` VALUES ('7', '0', '78');

-- ----------------------------
-- Table structure for user_wish_comment
-- ----------------------------
DROP TABLE IF EXISTS `user_wish_comment`;
CREATE TABLE `user_wish_comment` (
  `user_wish_comment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `comment_id` int DEFAULT NULL,
  `wish_id` int DEFAULT NULL,
  PRIMARY KEY (`user_wish_comment_id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`),
  KEY `wish_id` (`wish_id`),
  CONSTRAINT `user_wish_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_wish_comment_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `wish_comment` (`wish_comment_id`),
  CONSTRAINT `user_wish_comment_ibfk_3` FOREIGN KEY (`wish_id`) REFERENCES `wish` (`wish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1398 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_wish_comment
-- ----------------------------
INSERT INTO `user_wish_comment` VALUES ('780', '14', '6', '13');
INSERT INTO `user_wish_comment` VALUES ('781', '28', '23', '29');
INSERT INTO `user_wish_comment` VALUES ('782', '24', '14', '26');
INSERT INTO `user_wish_comment` VALUES ('783', '39', '4', '21');
INSERT INTO `user_wish_comment` VALUES ('784', '11', '7', '26');
INSERT INTO `user_wish_comment` VALUES ('785', '27', '10', '27');
INSERT INTO `user_wish_comment` VALUES ('786', '21', '7', '29');
INSERT INTO `user_wish_comment` VALUES ('787', '13', '23', '10');
INSERT INTO `user_wish_comment` VALUES ('788', '22', '1', '27');
INSERT INTO `user_wish_comment` VALUES ('789', '19', '27', '14');
INSERT INTO `user_wish_comment` VALUES ('790', '30', '26', '10');
INSERT INTO `user_wish_comment` VALUES ('791', '39', '24', '31');
INSERT INTO `user_wish_comment` VALUES ('792', '31', '15', '9');
INSERT INTO `user_wish_comment` VALUES ('793', '37', '20', '18');
INSERT INTO `user_wish_comment` VALUES ('836', '31', '14', '8');
INSERT INTO `user_wish_comment` VALUES ('837', '35', '10', '3');
INSERT INTO `user_wish_comment` VALUES ('838', '26', '10', '1');
INSERT INTO `user_wish_comment` VALUES ('839', '15', '22', '2');
INSERT INTO `user_wish_comment` VALUES ('840', '13', '13', '22');
INSERT INTO `user_wish_comment` VALUES ('841', '18', '8', '13');
INSERT INTO `user_wish_comment` VALUES ('842', '21', '17', '19');
INSERT INTO `user_wish_comment` VALUES ('843', '21', '2', '2');
INSERT INTO `user_wish_comment` VALUES ('844', '14', '18', '13');
INSERT INTO `user_wish_comment` VALUES ('845', '19', '11', '23');
INSERT INTO `user_wish_comment` VALUES ('846', '32', '12', '23');
INSERT INTO `user_wish_comment` VALUES ('847', '26', '14', '18');
INSERT INTO `user_wish_comment` VALUES ('848', '29', '11', '26');
INSERT INTO `user_wish_comment` VALUES ('849', '17', '19', '8');
INSERT INTO `user_wish_comment` VALUES ('850', '24', '16', '5');
INSERT INTO `user_wish_comment` VALUES ('851', '14', '11', '7');
INSERT INTO `user_wish_comment` VALUES ('852', '11', '18', '22');
INSERT INTO `user_wish_comment` VALUES ('853', '37', '6', '10');
INSERT INTO `user_wish_comment` VALUES ('854', '11', '6', '24');
INSERT INTO `user_wish_comment` VALUES ('855', '21', '17', '16');
INSERT INTO `user_wish_comment` VALUES ('856', '39', '7', '4');
INSERT INTO `user_wish_comment` VALUES ('857', '11', '23', '21');
INSERT INTO `user_wish_comment` VALUES ('858', '13', '16', '7');
INSERT INTO `user_wish_comment` VALUES ('859', '25', '24', '16');
INSERT INTO `user_wish_comment` VALUES ('860', '14', '4', '6');
INSERT INTO `user_wish_comment` VALUES ('861', '26', '2', '21');
INSERT INTO `user_wish_comment` VALUES ('862', '17', '6', '4');
INSERT INTO `user_wish_comment` VALUES ('863', '12', '2', '28');
INSERT INTO `user_wish_comment` VALUES ('920', '18', '29', '28');
INSERT INTO `user_wish_comment` VALUES ('921', '30', '20', '6');
INSERT INTO `user_wish_comment` VALUES ('922', '10', '17', '18');
INSERT INTO `user_wish_comment` VALUES ('923', '18', '17', '31');
INSERT INTO `user_wish_comment` VALUES ('924', '19', '17', '24');
INSERT INTO `user_wish_comment` VALUES ('925', '17', '26', '18');
INSERT INTO `user_wish_comment` VALUES ('926', '17', '16', '27');
INSERT INTO `user_wish_comment` VALUES ('927', '34', '8', '28');
INSERT INTO `user_wish_comment` VALUES ('928', '34', '6', '15');
INSERT INTO `user_wish_comment` VALUES ('929', '35', '22', '2');
INSERT INTO `user_wish_comment` VALUES ('930', '12', '10', '9');
INSERT INTO `user_wish_comment` VALUES ('931', '25', '19', '18');
INSERT INTO `user_wish_comment` VALUES ('932', '12', '18', '21');
INSERT INTO `user_wish_comment` VALUES ('933', '29', '3', '15');
INSERT INTO `user_wish_comment` VALUES ('976', '20', '14', '6');
INSERT INTO `user_wish_comment` VALUES ('977', '27', '10', '25');
INSERT INTO `user_wish_comment` VALUES ('978', '15', '10', '3');
INSERT INTO `user_wish_comment` VALUES ('979', '24', '2', '26');
INSERT INTO `user_wish_comment` VALUES ('980', '10', '18', '24');
INSERT INTO `user_wish_comment` VALUES ('981', '14', '13', '20');
INSERT INTO `user_wish_comment` VALUES ('982', '37', '17', '31');
INSERT INTO `user_wish_comment` VALUES ('983', '22', '1', '25');
INSERT INTO `user_wish_comment` VALUES ('984', '12', '28', '11');
INSERT INTO `user_wish_comment` VALUES ('985', '39', '23', '28');
INSERT INTO `user_wish_comment` VALUES ('986', '17', '13', '12');
INSERT INTO `user_wish_comment` VALUES ('987', '31', '7', '29');
INSERT INTO `user_wish_comment` VALUES ('988', '14', '24', '16');
INSERT INTO `user_wish_comment` VALUES ('989', '17', '17', '4');
INSERT INTO `user_wish_comment` VALUES ('1074', '29', '23', '28');
INSERT INTO `user_wish_comment` VALUES ('1075', '17', '16', '25');
INSERT INTO `user_wish_comment` VALUES ('1076', '24', '29', '10');
INSERT INTO `user_wish_comment` VALUES ('1077', '30', '13', '3');
INSERT INTO `user_wish_comment` VALUES ('1078', '15', '18', '14');
INSERT INTO `user_wish_comment` VALUES ('1079', '21', '17', '19');
INSERT INTO `user_wish_comment` VALUES ('1080', '23', '8', '29');
INSERT INTO `user_wish_comment` VALUES ('1081', '11', '9', '9');
INSERT INTO `user_wish_comment` VALUES ('1082', '27', '29', '2');
INSERT INTO `user_wish_comment` VALUES ('1083', '21', '21', '9');
INSERT INTO `user_wish_comment` VALUES ('1084', '22', '4', '13');
INSERT INTO `user_wish_comment` VALUES ('1085', '30', '2', '6');
INSERT INTO `user_wish_comment` VALUES ('1086', '34', '14', '25');
INSERT INTO `user_wish_comment` VALUES ('1087', '34', '13', '23');
INSERT INTO `user_wish_comment` VALUES ('1088', '26', '9', '25');
INSERT INTO `user_wish_comment` VALUES ('1089', '18', '25', '10');
INSERT INTO `user_wish_comment` VALUES ('1090', '11', '9', '9');
INSERT INTO `user_wish_comment` VALUES ('1091', '28', '4', '24');
INSERT INTO `user_wish_comment` VALUES ('1092', '27', '15', '19');
INSERT INTO `user_wish_comment` VALUES ('1093', '28', '5', '29');
INSERT INTO `user_wish_comment` VALUES ('1094', '19', '19', '6');
INSERT INTO `user_wish_comment` VALUES ('1095', '12', '23', '16');
INSERT INTO `user_wish_comment` VALUES ('1096', '20', '5', '22');
INSERT INTO `user_wish_comment` VALUES ('1097', '12', '8', '2');
INSERT INTO `user_wish_comment` VALUES ('1098', '23', '2', '26');
INSERT INTO `user_wish_comment` VALUES ('1099', '14', '4', '4');
INSERT INTO `user_wish_comment` VALUES ('1100', '16', '20', '22');
INSERT INTO `user_wish_comment` VALUES ('1101', '25', '13', '15');
INSERT INTO `user_wish_comment` VALUES ('1186', '10', '4', '13');
INSERT INTO `user_wish_comment` VALUES ('1187', '32', '12', '23');
INSERT INTO `user_wish_comment` VALUES ('1188', '27', '17', '4');
INSERT INTO `user_wish_comment` VALUES ('1189', '35', '24', '14');
INSERT INTO `user_wish_comment` VALUES ('1190', '35', '24', '12');
INSERT INTO `user_wish_comment` VALUES ('1191', '29', '30', '28');
INSERT INTO `user_wish_comment` VALUES ('1192', '30', '18', '29');
INSERT INTO `user_wish_comment` VALUES ('1193', '39', '26', '14');
INSERT INTO `user_wish_comment` VALUES ('1194', '29', '24', '1');
INSERT INTO `user_wish_comment` VALUES ('1195', '33', '21', '5');
INSERT INTO `user_wish_comment` VALUES ('1196', '31', '29', '22');
INSERT INTO `user_wish_comment` VALUES ('1197', '32', '15', '7');
INSERT INTO `user_wish_comment` VALUES ('1198', '28', '8', '16');
INSERT INTO `user_wish_comment` VALUES ('1199', '35', '16', '2');
INSERT INTO `user_wish_comment` VALUES ('1200', '33', '20', '27');
INSERT INTO `user_wish_comment` VALUES ('1201', '23', '15', '5');
INSERT INTO `user_wish_comment` VALUES ('1202', '20', '6', '28');
INSERT INTO `user_wish_comment` VALUES ('1203', '11', '15', '7');
INSERT INTO `user_wish_comment` VALUES ('1204', '27', '5', '2');
INSERT INTO `user_wish_comment` VALUES ('1205', '33', '19', '26');
INSERT INTO `user_wish_comment` VALUES ('1206', '20', '3', '15');
INSERT INTO `user_wish_comment` VALUES ('1207', '12', '31', '22');
INSERT INTO `user_wish_comment` VALUES ('1208', '28', '26', '11');
INSERT INTO `user_wish_comment` VALUES ('1209', '16', '2', '16');
INSERT INTO `user_wish_comment` VALUES ('1210', '25', '25', '21');
INSERT INTO `user_wish_comment` VALUES ('1211', '39', '20', '13');
INSERT INTO `user_wish_comment` VALUES ('1212', '11', '3', '6');
INSERT INTO `user_wish_comment` VALUES ('1213', '30', '23', '23');
INSERT INTO `user_wish_comment` VALUES ('1214', '23', '27', '6');
INSERT INTO `user_wish_comment` VALUES ('1215', '16', '17', '3');
INSERT INTO `user_wish_comment` VALUES ('1216', '31', '9', '7');
INSERT INTO `user_wish_comment` VALUES ('1217', '19', '24', '29');
INSERT INTO `user_wish_comment` VALUES ('1218', '23', '12', '15');
INSERT INTO `user_wish_comment` VALUES ('1219', '17', '22', '29');
INSERT INTO `user_wish_comment` VALUES ('1220', '24', '16', '7');
INSERT INTO `user_wish_comment` VALUES ('1221', '26', '31', '13');
INSERT INTO `user_wish_comment` VALUES ('1222', '11', '30', '21');
INSERT INTO `user_wish_comment` VALUES ('1223', '23', '7', '21');
INSERT INTO `user_wish_comment` VALUES ('1224', '31', '16', '14');
INSERT INTO `user_wish_comment` VALUES ('1225', '29', '25', '7');
INSERT INTO `user_wish_comment` VALUES ('1226', '29', '12', '3');
INSERT INTO `user_wish_comment` VALUES ('1227', '16', '26', '17');
INSERT INTO `user_wish_comment` VALUES ('1270', '22', '2', '3');
INSERT INTO `user_wish_comment` VALUES ('1271', '18', '4', '20');
INSERT INTO `user_wish_comment` VALUES ('1272', '39', '25', '6');
INSERT INTO `user_wish_comment` VALUES ('1273', '26', '30', '10');
INSERT INTO `user_wish_comment` VALUES ('1274', '28', '3', '16');
INSERT INTO `user_wish_comment` VALUES ('1275', '21', '10', '11');
INSERT INTO `user_wish_comment` VALUES ('1276', '37', '10', '27');
INSERT INTO `user_wish_comment` VALUES ('1277', '23', '15', '5');
INSERT INTO `user_wish_comment` VALUES ('1278', '16', '21', '23');
INSERT INTO `user_wish_comment` VALUES ('1279', '32', '12', '20');
INSERT INTO `user_wish_comment` VALUES ('1280', '13', '17', '12');
INSERT INTO `user_wish_comment` VALUES ('1281', '18', '7', '7');
INSERT INTO `user_wish_comment` VALUES ('1282', '25', '23', '8');
INSERT INTO `user_wish_comment` VALUES ('1283', '11', '13', '28');
INSERT INTO `user_wish_comment` VALUES ('1368', '11', '13', '30');
INSERT INTO `user_wish_comment` VALUES ('1369', '27', '30', '3');
INSERT INTO `user_wish_comment` VALUES ('1370', '25', '8', '22');
INSERT INTO `user_wish_comment` VALUES ('1371', '35', '29', '8');
INSERT INTO `user_wish_comment` VALUES ('1372', '23', '11', '15');
INSERT INTO `user_wish_comment` VALUES ('1373', '21', '13', '27');
INSERT INTO `user_wish_comment` VALUES ('1374', '14', '2', '26');
INSERT INTO `user_wish_comment` VALUES ('1375', '11', '20', '3');
INSERT INTO `user_wish_comment` VALUES ('1376', '24', '3', '30');
INSERT INTO `user_wish_comment` VALUES ('1377', '31', '14', '5');
INSERT INTO `user_wish_comment` VALUES ('1378', '20', '8', '6');
INSERT INTO `user_wish_comment` VALUES ('1379', '15', '10', '3');
INSERT INTO `user_wish_comment` VALUES ('1380', '24', '3', '28');
INSERT INTO `user_wish_comment` VALUES ('1381', '19', '26', '9');
INSERT INTO `user_wish_comment` VALUES ('1397', '15', '165', '50');

-- ----------------------------
-- Table structure for wish
-- ----------------------------
DROP TABLE IF EXISTS `wish`;
CREATE TABLE `wish` (
  `wish_id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `applause_number` int DEFAULT NULL,
  `is_deleted` int(10) unsigned zerofill DEFAULT '0000000000',
  PRIMARY KEY (`wish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of wish
-- ----------------------------
INSERT INTO `wish` VALUES ('1', '希望校务系统能自动处理请假申请，减少人工操作。', '2024-03-09 20:58:13', '178', '0000000000');
INSERT INTO `wish` VALUES ('2', '希望校务系统可以实时更新课程表，方便学生查看。', '2024-03-09 20:58:13', '78', '0000000000');
INSERT INTO `wish` VALUES ('3', '希望校务系统能提供在线选课功能，让选课更加便捷。', '2024-03-09 20:58:13', '522', '0000000000');
INSERT INTO `wish` VALUES ('4', '希望校务系统能自动发送成绩通知，及时了解学习情况。', '2024-03-09 20:58:13', '381', '0000000000');
INSERT INTO `wish` VALUES ('5', '希望校务系统能提供校园活动日历，不错过任何精彩活动。', '2024-03-09 20:58:13', '337', '0000000000');
INSERT INTO `wish` VALUES ('6', '希望校务系统能实现在线图书馆预约，节省排队时间。', '2024-03-09 20:58:13', '542', '0000000000');
INSERT INTO `wish` VALUES ('7', '希望校务系统能提供校园地图导航，帮助新生快速熟悉校园。', '2024-03-09 20:58:13', '371', '0000000000');
INSERT INTO `wish` VALUES ('8', '希望校务系统能实现在线缴费，简化学费支付流程。', '2024-03-09 20:58:13', '226', '0000000000');
INSERT INTO `wish` VALUES ('9', '希望校务系统能提供成绩查询，方便随时查看学习进度。', '2024-03-09 20:58:13', '20', '0000000000');
INSERT INTO `wish` VALUES ('10', '希望校务系统能实现校园新闻实时更新，了解校园动态。', '2024-03-09 20:58:13', '90', '0000000000');
INSERT INTO `wish` VALUES ('11', '希望校务系统能提供在线课程评价，帮助改进教学质量。', '2024-03-09 20:58:13', '387', '0000000000');
INSERT INTO `wish` VALUES ('12', '希望校务系统能实现校园卡在线充值，方便快捷。', '2024-03-09 20:58:13', '335', '0000000000');
INSERT INTO `wish` VALUES ('13', '希望校务系统能提供校园社团信息，方便学生加入。', '2024-03-09 20:58:13', '515', '0000000000');
INSERT INTO `wish` VALUES ('14', '希望校务系统能提供电子成绩单下载，方便求职和升学。', '2024-03-09 20:58:13', '239', '0000000000');
INSERT INTO `wish` VALUES ('15', '希望校务系统能实现在线考试报名，简化报名流程。', '2024-03-09 20:58:13', '315', '0000000000');
INSERT INTO `wish` VALUES ('16', '希望校务系统能提供课程资源下载，方便自主学习。', '2024-03-09 20:58:13', '192', '0000000000');
INSERT INTO `wish` VALUES ('17', '希望校务系统能实现教师评价系统，促进教学质量提升。', '2024-03-09 20:58:13', '15', '0000000000');
INSERT INTO `wish` VALUES ('18', '希望校务系统能提供学生档案管理，方便个人信息查询。', '2024-03-09 20:58:13', '166', '0000000000');
INSERT INTO `wish` VALUES ('19', '希望校务系统能实现在线课程咨询，提供即时帮助。', '2024-03-09 20:58:13', '121', '0000000000');
INSERT INTO `wish` VALUES ('20', '希望校务系统能提供校园安全报警系统，保障学生安全。', '2024-03-09 20:58:13', '105', '0000000000');
INSERT INTO `wish` VALUES ('21', '希望校务系统能实现校园环境监测，提供健康学习环境。', '2024-03-09 20:58:13', '162', '0000000000');
INSERT INTO `wish` VALUES ('22', '希望校务系统能提供校园周边设施查询，方便生活。', '2024-03-09 20:58:13', '496', '0000000000');
INSERT INTO `wish` VALUES ('23', '希望校务系统能实现在线心理咨询，关注学生心理健康。', '2024-03-09 20:58:13', '661', '0000000000');
INSERT INTO `wish` VALUES ('24', '希望校务系统能提供校园活动报名，方便参与各类活动。', '2024-03-09 20:58:13', '488', '0000000000');
INSERT INTO `wish` VALUES ('25', '希望校务系统能实现校园新闻推送，及时获取最新信息。', '2024-03-09 20:58:13', '456', '0000000000');
INSERT INTO `wish` VALUES ('26', 'in', '1984-05-22 04:39:50', '71', '0000000000');
INSERT INTO `wish` VALUES ('27', '希望校务系统能实现在线课程反馈，提升课程质量。', '2024-03-09 20:58:13', '49', '0000000000');
INSERT INTO `wish` VALUES ('28', '希望校务系统能提供校园社团活动日历，不错过任何精彩活动。', '2024-03-09 20:58:13', '463', '0000000000');
INSERT INTO `wish` VALUES ('29', '希望校务系统能实现在线课程表调整，适应不同学生需求。', '2024-03-09 20:58:13', '169', '0000000000');
INSERT INTO `wish` VALUES ('30', '希望校务系统能提供校园讲座信息，丰富学术生活。', '2024-03-09 20:58:13', '124', '0000000000');
INSERT INTO `wish` VALUES ('31', '希望校务系统能实现在线考试安排查询，方便安排学习计划。', '2024-03-09 20:58:13', '113', '0000000000');
INSERT INTO `wish` VALUES ('32', '希望校务系统能提供校园志愿者活动信息，参与社会服务。', '2024-03-09 20:58:13', '194', '0000000000');
INSERT INTO `wish` VALUES ('33', '希望校务系统能实现在线课程资源共享，促进学术交流。', '2024-03-09 20:58:13', '629', '0000000000');
INSERT INTO `wish` VALUES ('34', '希望校务系统能提供校园体育设施预约，方便体育锻炼。', '2024-03-09 20:58:13', '569', '0000000000');
INSERT INTO `wish` VALUES ('35', '希望校务系统能实现在线课程问答，及时解决学习疑惑。', '2024-03-09 20:58:13', '290', '0000000000');
INSERT INTO `wish` VALUES ('36', '希望校务系统能提供校园文化活动信息，丰富课余生活。', '2024-03-09 20:58:13', '409', '0000000000');
INSERT INTO `wish` VALUES ('37', 'ut reprehenderit in', '1975-04-01 08:49:37', '84', '0000000000');
INSERT INTO `wish` VALUES ('38', '希望校务系统能提供校园艺术展览信息，享受艺术熏陶。', '2024-03-09 20:58:13', '664', '0000000001');
INSERT INTO `wish` VALUES ('39', '希望校务系统能实现在线课程报名提醒，不错过任何课程。', '2024-03-09 20:58:13', '455', '0000000000');
INSERT INTO `wish` VALUES ('40', '希望校务系统能提供校园健康检查预约，关注学生健康。', '2024-03-09 20:58:13', '283', '0000000000');
INSERT INTO `wish` VALUES ('41', '希望校务系统能实现在线课程进度跟踪，监控学习效果。', '2024-03-09 20:58:13', '51', '0000000000');
INSERT INTO `wish` VALUES ('42', '希望校务系统能提供校园交通信息，方便出行。', '2024-03-09 20:58:13', '73', '0000000000');
INSERT INTO `wish` VALUES ('43', '希望校务系统能实现在线课程难度评估，合理选择课程。', '2024-03-09 20:58:13', '212', '0000000000');
INSERT INTO `wish` VALUES ('44', '希望校务系统能提供校园周边美食推荐，享受美食生活。', '2024-03-09 20:58:13', '175', '0000000000');
INSERT INTO `wish` VALUES ('45', '希望校务系统能实现在线课程互动讨论，提高学习兴趣。', '2024-03-09 20:58:13', '241', '0000000000');
INSERT INTO `wish` VALUES ('46', '希望校务系统能提供校园安全教育信息，提高安全意识。', '2024-03-09 20:58:13', '13', '0000000000');
INSERT INTO `wish` VALUES ('47', '希望校务系统能实现在线课程学习报告，总结学习成果。', '2024-03-09 20:58:13', '10', '0000000000');
INSERT INTO `wish` VALUES ('48', '希望校务系统能提供校园环保活动信息，参与环保行动。', '2024-03-09 20:58:13', '10', '0000000000');
INSERT INTO `wish` VALUES ('49', '希望校务系统能实现在线课程学习计划制定，提高学习效率。', '2024-03-09 20:58:13', '20', '0000000000');
INSERT INTO `wish` VALUES ('50', '希望校务系统能提供校园文化节活动信息，体验多元文化。', '2024-03-09 20:58:13', '70', '0000000000');
INSERT INTO `wish` VALUES ('51', '希望校务系统能实现在线课程学习笔记分享，促进知识交流。', '2024-03-09 20:58:13', '292', '0000000000');
INSERT INTO `wish` VALUES ('52', '希望校务系统能提供校园科技创新信息，激发创新思维。', '2024-03-09 20:58:13', '586', '0000000000');
INSERT INTO `wish` VALUES ('53', '希望校务系统能实现在线课程学习小组组建，促进团队合作。', '2024-03-09 20:58:13', '53', '0000000000');
INSERT INTO `wish` VALUES ('54', '希望校务系统能提供校园国际交流信息，拓宽国际视野。', '2024-03-09 20:58:13', '508', '0000000000');
INSERT INTO `wish` VALUES ('55', '希望校务系统能实现在线课程学习成果展示，展示学习成果。', '2024-03-09 20:58:13', '384', '0000000000');
INSERT INTO `wish` VALUES ('56', '希望校务系统能提供校园创业指导信息，支持学生创业。', '2024-03-09 20:58:13', '395', '0000000000');
INSERT INTO `wish` VALUES ('57', '希望校务系统能实现在线课程学习资源推荐，提高学习效率。', '2024-03-09 20:58:13', '160', '0000000000');
INSERT INTO `wish` VALUES ('58', '希望校务系统能提供校园文化活动志愿者招募，参与志愿服务。', '2024-03-09 20:58:13', '278', '0000000000');
INSERT INTO `wish` VALUES ('59', '希望校务系统能实现在线课程学习心得交流，分享学习经验。', '2024-03-09 20:58:13', '248', '0000000000');
INSERT INTO `wish` VALUES ('60', '希望校务系统能提供校园科技创新竞赛信息，激发创新热情。', '2024-03-09 20:58:13', '404', '0000000000');
INSERT INTO `wish` VALUES ('61', '希望校务系统能实现在线课程学习进度提醒，确保学习进度。', '2024-03-09 20:58:13', '611', '0000000000');
INSERT INTO `wish` VALUES ('62', '希望校务系统能提供校园文化节志愿者服务，体验文化节氛围。', '2024-03-09 20:58:13', '513', '0000000000');
INSERT INTO `wish` VALUES ('63', '希望校务系统能实现在线课程学习计划调整，适应学习需求变化。', '2024-03-09 20:58:13', '67', '0000000000');
INSERT INTO `wish` VALUES ('64', '希望校务系统能提供校园科技创新项目信息，参与科技创新。', '2024-03-09 20:58:13', '129', '0000000000');
INSERT INTO `wish` VALUES ('65', '希望校务系统能实现在线课程学习资源下载，方便自主学习。', '2024-03-09 20:58:13', '443', '0000000000');
INSERT INTO `wish` VALUES ('66', '希望校务系统能提供校园文化活动志愿者招募，参与文化活动。', '2024-03-09 20:58:13', '495', '0000000000');
INSERT INTO `wish` VALUES ('67', '希望校务系统能实现在线课程学习笔记整理，提高学习效率。', '2024-03-09 20:58:13', '482', '0000000000');
INSERT INTO `wish` VALUES ('68', '希望校务系统能提供校园科技创新竞赛报名，参与科技竞赛。', '2024-03-09 20:58:13', '261', '0000000000');
INSERT INTO `wish` VALUES ('69', '希望校务系统能实现在线课程学习进度跟踪，监控学习效果。', '2024-03-09 20:58:13', '524', '0000000000');
INSERT INTO `wish` VALUES ('70', '希望校务系统能提供校园文化节活动信息，体验多元文化。', '2024-03-09 20:58:13', '507', '0000000000');
INSERT INTO `wish` VALUES ('71', '希望校务系统能实现在线课程学习计划制定，提高学习效率。', '2024-03-09 20:58:13', '296', '0000000000');
INSERT INTO `wish` VALUES ('72', 'irure', null, null, '0000000000');
INSERT INTO `wish` VALUES ('73', 'irure', null, null, '0000000000');
INSERT INTO `wish` VALUES ('74', 'irure', null, null, '0000000000');
INSERT INTO `wish` VALUES ('75', 'irure', null, null, '0000000000');
INSERT INTO `wish` VALUES ('76', 'in ut consequat eu do', null, null, '0000000000');
INSERT INTO `wish` VALUES ('77', 'in ut consequat eu do', '2024-03-09 13:25:35', '0', '0000000000');
INSERT INTO `wish` VALUES ('78', 'officia et ut fugiat', '2024-03-09 22:03:48', '0', '0000000000');

-- ----------------------------
-- Table structure for wish_comment
-- ----------------------------
DROP TABLE IF EXISTS `wish_comment`;
CREATE TABLE `wish_comment` (
  `wish_comment_id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wish_comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of wish_comment
-- ----------------------------
INSERT INTO `wish_comment` VALUES ('1', '希望校务系统能增加在线选课功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('2', '建议校务系统提供成绩查询服务。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('3', '希望能在系统中查看课程表。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('4', '希望校务系统能实现校园卡在线充值。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('5', '建议增加一个校园活动日历功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('6', '希望校务系统能提供在线请假功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('7', '希望能查看图书馆的实时座位信息。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('8', '建议校务系统增加课程评价功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('9', '希望校务系统能提供校园新闻更新。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('10', '希望能在线下载课程资源。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('11', '建议校务系统提供校园周边商家优惠信息。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('12', '希望能在系统中查看校园社团活动。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('13', '建议增加在线心理咨询服务。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('14', '希望校务系统能提供校园安全报警功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('15', '希望能查看校园环境监测数据。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('16', '建议校务系统增加体育设施预约功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('17', '希望校务系统能提供在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('18', '希望能在系统中查看校园科技创新竞赛信息。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('19', '建议校务系统提供国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('20', '希望能查看校园文化活动信息。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('21', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('22', '希望能查看校园国际交流信息。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('23', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('24', '希望能在线查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('25', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('26', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('27', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('28', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('29', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('30', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('31', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('32', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('33', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('34', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('35', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('36', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('37', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('38', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('39', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('40', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('41', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('42', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('43', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('44', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('45', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('46', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('47', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('48', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('49', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('50', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('51', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('52', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('53', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('54', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('55', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('56', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('57', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('58', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('59', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('60', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('61', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('62', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('63', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('64', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('65', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('66', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('67', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('68', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('69', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('70', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('71', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('72', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('73', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('74', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('75', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('76', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('77', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('78', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('79', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('80', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('81', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('82', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('83', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('84', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('85', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('86', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('87', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('88', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('89', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('90', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('91', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('92', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('93', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('94', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('95', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('96', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('97', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('98', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('99', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('100', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('101', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('102', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('103', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('104', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('105', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('106', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('107', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('108', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('109', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('110', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('111', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('112', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('113', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('114', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('115', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('116', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('117', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('118', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('119', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('120', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('121', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('122', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('123', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('124', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('125', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('126', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('127', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('128', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('129', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('130', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('131', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('132', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('133', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('134', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('135', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('136', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('137', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('138', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('139', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('140', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('141', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('142', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('143', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('144', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('145', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('146', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('147', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('148', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('149', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('150', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('151', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('152', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('153', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('154', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('155', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('156', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('157', '希望能查看校园环境监测功能。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('158', '希望校务系统能提供校园体育设施预约系统。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('159', '建议校务系统提供一个在线课程问答平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('160', '希望能查看校园文化活动信息发布平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('161', '建议校务系统增加校园科技创新竞赛信息发布区。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('162', '希望能查看校园国际交流信息平台。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('163', '建议校务系统提供校园社团活动日历。', '2024-03-10 01:03:54');
INSERT INTO `wish_comment` VALUES ('164', 'laborum dolor incididunt magna', '2024-03-09 17:18:47');
INSERT INTO `wish_comment` VALUES ('165', 'laborum dolor incididunt magna', '2024-03-09 17:20:01');
