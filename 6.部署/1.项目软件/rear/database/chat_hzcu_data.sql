/*
Navicat MySQL Data Transfer

Source Server         : llm1
Source Server Version : 80030
Source Host           : localhost:3306
Source Database       : chat_hzcu

Target Server Type    : MYSQL
Target Server Version : 80030
File Encoding         : 65001

Date: 2024-03-10 06:28:28
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
INSERT INTO `admin` VALUES ('30', '19157681683', '110110aaAA', '尘光', '2024-03-10 02:04:10', '2024-03-09 18:06:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin_chat
-- ----------------------------
INSERT INTO `admin_chat` VALUES ('1', '你好，今天工作顺利吗？', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('2', '最近有点忙，但还算顺利。', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('3', '晚上有什么计划吗？', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('4', '打算去健身房锻炼一下。', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('5', '听起来不错，我也该运动了。', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('6', '你最近在看什么书？', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('7', '我在读《百年孤独》。', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('8', '那是一本好书，我也很喜欢。', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('9', '周末有什么安排？', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('10', '想去郊外走走，放松一下。', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('11', '听起来很惬意，祝你周末愉快！', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('12', '谢谢，你也是！', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('13', '最近有什么新鲜事吗？', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('14', '公司下周有个大项目要启动。elit sint proident nostrud', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('15', '听起来很有挑战性，加油！', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('16', '你平时喜欢做什么？', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('17', '我喜欢画画，业余时间会练习。', '2024-03-11 04:05:43');
INSERT INTO `admin_chat` VALUES ('18', '真有才华，能看看你的作品吗？', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('19', '当然可以，下次带给你看。', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('20', '你最近有没有旅行的计划？', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('21', '计划去日本赏樱，你呢？', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('22', '我还没想好，不过我也很喜欢旅行。', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('23', '我们下次一起去吧！', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('24', '太好了，期待和你一起旅行！', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('25', '你平时喜欢听什么音乐？', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('26', '我喜欢听古典音乐，感觉很放松。', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('27', '我也喜欢，尤其是莫扎特的作品。', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('28', '我们有共同的爱好，真棒！', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('29', '是的，音乐总能给人带来愉悦。', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('30', '你对未来有什么规划吗？', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('31', '我想提升自己的专业技能。', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('32', '这是很好的目标，祝你成功！', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('33', '谢谢你，我们一起努力吧！', '2024-03-10 04:05:43');
INSERT INTO `admin_chat` VALUES ('34', 'commodo Ut consequat veniam', '2024-03-09 20:26:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin_chat_relation
-- ----------------------------
INSERT INTO `admin_chat_relation` VALUES ('149', '6', '10');
INSERT INTO `admin_chat_relation` VALUES ('150', '29', '28');
INSERT INTO `admin_chat_relation` VALUES ('151', '20', '18');
INSERT INTO `admin_chat_relation` VALUES ('152', '27', '25');
INSERT INTO `admin_chat_relation` VALUES ('153', '11', '11');
INSERT INTO `admin_chat_relation` VALUES ('154', '23', '23');
INSERT INTO `admin_chat_relation` VALUES ('155', '13', '28');
INSERT INTO `admin_chat_relation` VALUES ('156', '8', '20');
INSERT INTO `admin_chat_relation` VALUES ('157', '13', '7');
INSERT INTO `admin_chat_relation` VALUES ('158', '26', '18');
INSERT INTO `admin_chat_relation` VALUES ('159', '12', '7');
INSERT INTO `admin_chat_relation` VALUES ('160', '30', '8');
INSERT INTO `admin_chat_relation` VALUES ('161', '9', '20');
INSERT INTO `admin_chat_relation` VALUES ('162', '12', '3');
INSERT INTO `admin_chat_relation` VALUES ('163', '9', '4');
INSERT INTO `admin_chat_relation` VALUES ('164', '25', '23');
INSERT INTO `admin_chat_relation` VALUES ('165', '12', '17');
INSERT INTO `admin_chat_relation` VALUES ('166', '22', '26');
INSERT INTO `admin_chat_relation` VALUES ('167', '6', '12');
INSERT INTO `admin_chat_relation` VALUES ('168', '10', '17');
INSERT INTO `admin_chat_relation` VALUES ('169', '24', '7');
INSERT INTO `admin_chat_relation` VALUES ('170', '26', '18');
INSERT INTO `admin_chat_relation` VALUES ('171', '11', '2');
INSERT INTO `admin_chat_relation` VALUES ('172', '5', '19');
INSERT INTO `admin_chat_relation` VALUES ('173', '22', '21');
INSERT INTO `admin_chat_relation` VALUES ('174', '9', '12');
INSERT INTO `admin_chat_relation` VALUES ('175', '2', '5');
INSERT INTO `admin_chat_relation` VALUES ('176', '20', '25');
INSERT INTO `admin_chat_relation` VALUES ('177', '6', '14');
INSERT INTO `admin_chat_relation` VALUES ('178', '23', '12');
INSERT INTO `admin_chat_relation` VALUES ('179', '23', '18');
INSERT INTO `admin_chat_relation` VALUES ('180', '22', '25');
INSERT INTO `admin_chat_relation` VALUES ('181', '29', '11');
INSERT INTO `admin_chat_relation` VALUES ('182', '29', '22');
INSERT INTO `admin_chat_relation` VALUES ('183', '23', '20');
INSERT INTO `admin_chat_relation` VALUES ('184', '2', '7');
INSERT INTO `admin_chat_relation` VALUES ('185', '2', '19');
INSERT INTO `admin_chat_relation` VALUES ('186', '26', '16');
INSERT INTO `admin_chat_relation` VALUES ('187', '1', '16');
INSERT INTO `admin_chat_relation` VALUES ('188', '19', '16');
INSERT INTO `admin_chat_relation` VALUES ('189', '25', '15');
INSERT INTO `admin_chat_relation` VALUES ('190', '2', '24');
INSERT INTO `admin_chat_relation` VALUES ('191', '23', '13');
INSERT INTO `admin_chat_relation` VALUES ('192', '24', '24');
INSERT INTO `admin_chat_relation` VALUES ('193', '19', '20');
INSERT INTO `admin_chat_relation` VALUES ('194', '13', '4');
INSERT INTO `admin_chat_relation` VALUES ('195', '13', '21');
INSERT INTO `admin_chat_relation` VALUES ('196', '8', '7');
INSERT INTO `admin_chat_relation` VALUES ('197', '9', '25');
INSERT INTO `admin_chat_relation` VALUES ('198', '8', '23');
INSERT INTO `admin_chat_relation` VALUES ('199', '4', '10');
INSERT INTO `admin_chat_relation` VALUES ('200', '7', '6');
INSERT INTO `admin_chat_relation` VALUES ('201', '7', '19');
INSERT INTO `admin_chat_relation` VALUES ('202', '15', '19');
INSERT INTO `admin_chat_relation` VALUES ('203', '19', '6');
INSERT INTO `admin_chat_relation` VALUES ('204', '6', '10');
INSERT INTO `admin_chat_relation` VALUES ('205', '3', '14');
INSERT INTO `admin_chat_relation` VALUES ('206', '30', '18');
INSERT INTO `admin_chat_relation` VALUES ('207', '3', '17');
INSERT INTO `admin_chat_relation` VALUES ('208', '20', '16');
INSERT INTO `admin_chat_relation` VALUES ('209', '20', '21');
INSERT INTO `admin_chat_relation` VALUES ('210', '16', '19');
INSERT INTO `admin_chat_relation` VALUES ('211', '14', '16');
INSERT INTO `admin_chat_relation` VALUES ('212', '6', '12');
INSERT INTO `admin_chat_relation` VALUES ('213', '14', '4');
INSERT INTO `admin_chat_relation` VALUES ('214', '7', '21');
INSERT INTO `admin_chat_relation` VALUES ('215', '26', '5');
INSERT INTO `admin_chat_relation` VALUES ('216', '6', '18');
INSERT INTO `admin_chat_relation` VALUES ('217', '10', '27');
INSERT INTO `admin_chat_relation` VALUES ('218', '16', '26');
INSERT INTO `admin_chat_relation` VALUES ('219', '24', '10');
INSERT INTO `admin_chat_relation` VALUES ('220', '10', '18');
INSERT INTO `admin_chat_relation` VALUES ('221', '2', '17');
INSERT INTO `admin_chat_relation` VALUES ('222', '16', '30');
INSERT INTO `admin_chat_relation` VALUES ('223', '11', '24');
INSERT INTO `admin_chat_relation` VALUES ('224', '29', '14');
INSERT INTO `admin_chat_relation` VALUES ('225', '11', '12');
INSERT INTO `admin_chat_relation` VALUES ('226', '30', '22');
INSERT INTO `admin_chat_relation` VALUES ('227', '20', '2');
INSERT INTO `admin_chat_relation` VALUES ('228', '13', '29');
INSERT INTO `admin_chat_relation` VALUES ('229', '17', '28');
INSERT INTO `admin_chat_relation` VALUES ('230', '28', '27');
INSERT INTO `admin_chat_relation` VALUES ('231', '18', '12');
INSERT INTO `admin_chat_relation` VALUES ('232', '7', '26');
INSERT INTO `admin_chat_relation` VALUES ('261', '27', '16');
INSERT INTO `admin_chat_relation` VALUES ('262', '29', '4');
INSERT INTO `admin_chat_relation` VALUES ('263', '25', '22');
INSERT INTO `admin_chat_relation` VALUES ('264', '7', '27');
INSERT INTO `admin_chat_relation` VALUES ('265', '24', '11');
INSERT INTO `admin_chat_relation` VALUES ('266', '13', '30');
INSERT INTO `admin_chat_relation` VALUES ('267', '20', '13');
INSERT INTO `admin_chat_relation` VALUES ('268', '6', '18');
INSERT INTO `admin_chat_relation` VALUES ('269', '14', '15');
INSERT INTO `admin_chat_relation` VALUES ('270', '4', '7');
INSERT INTO `admin_chat_relation` VALUES ('271', '19', '17');
INSERT INTO `admin_chat_relation` VALUES ('272', '26', '18');
INSERT INTO `admin_chat_relation` VALUES ('273', '13', '11');
INSERT INTO `admin_chat_relation` VALUES ('274', '15', '15');
INSERT INTO `admin_chat_relation` VALUES ('275', '27', '3');
INSERT INTO `admin_chat_relation` VALUES ('276', '21', '6');
INSERT INTO `admin_chat_relation` VALUES ('277', '28', '4');
INSERT INTO `admin_chat_relation` VALUES ('278', '24', '18');
INSERT INTO `admin_chat_relation` VALUES ('279', '19', '9');
INSERT INTO `admin_chat_relation` VALUES ('280', '21', '15');
INSERT INTO `admin_chat_relation` VALUES ('281', '11', '13');
INSERT INTO `admin_chat_relation` VALUES ('282', '3', '4');
INSERT INTO `admin_chat_relation` VALUES ('283', '13', '20');
INSERT INTO `admin_chat_relation` VALUES ('284', '4', '18');
INSERT INTO `admin_chat_relation` VALUES ('285', '19', '9');
INSERT INTO `admin_chat_relation` VALUES ('286', '19', '7');
INSERT INTO `admin_chat_relation` VALUES ('287', '7', '16');
INSERT INTO `admin_chat_relation` VALUES ('288', '27', '29');
INSERT INTO `admin_chat_relation` VALUES ('289', '8', '34');

-- ----------------------------
-- Table structure for roast
-- ----------------------------
DROP TABLE IF EXISTS `roast`;
CREATE TABLE `roast` (
  `roast_id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `applause_number` int DEFAULT '0',
  PRIMARY KEY (`roast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of roast
-- ----------------------------
INSERT INTO `roast` VALUES ('1', '今天的天气真是太糟糕了，就像我的心情一样。', '2024-03-09 13:03:55', '608');
INSERT INTO `roast` VALUES ('2', '我尝试了新的咖啡，但味道似乎有点...特别。', '2024-03-09 13:03:55', '406');
INSERT INTO `roast` VALUES ('3', 'officia veniam esse', '1987-04-27 19:37:37', '53');
INSERT INTO `roast` VALUES ('4', '我昨天在公园散步，结果被一只松鼠抢了面包。', '2024-03-09 13:03:55', '482');
INSERT INTO `roast` VALUES ('5', '我决定开始健身，但健身房的镜子总是让我分心。', '2024-03-09 13:03:55', '457');
INSERT INTO `roast` VALUES ('6', '我尝试了新的烹饪食谱，结果厨房变成了灾难现场。', '2024-03-09 13:03:55', '175');
INSERT INTO `roast` VALUES ('7', '我在网上买了一件衣服，但收到的尺寸似乎有点...小。', '2024-03-09 13:03:55', '168');
INSERT INTO `roast` VALUES ('8', '我今天在地铁上遇到了一个有趣的人，我们聊了一路。', '2024-03-09 13:03:55', '317');
INSERT INTO `roast` VALUES ('9', '我昨晚做了一个奇怪的梦，梦见自己变成了一只猫。', '2024-03-09 13:03:55', '412');
INSERT INTO `roast` VALUES ('10', '我尝试了新的瑜伽课程，但我的平衡感似乎不太好。', '2024-03-09 13:03:55', '446');
INSERT INTO `roast` VALUES ('11', '我今天在图书馆找到了一本非常有趣的书。', '2024-03-09 13:03:55', '325');
INSERT INTO `roast` VALUES ('12', '我昨天去电影院看电影，结果旁边的人一直在讲话。', '2024-03-09 13:03:55', '288');
INSERT INTO `roast` VALUES ('13', '我尝试了新的发型，但似乎不是每个人都欣赏。', '2024-03-09 13:03:55', '466');
INSERT INTO `roast` VALUES ('14', '我今天在公园里看到了一只非常可爱的狗狗。', '2024-03-09 13:03:55', '134');
INSERT INTO `roast` VALUES ('15', '我昨天在超市排队，结果前面的人在结账时找不到钱包。', '2024-03-09 13:03:55', '605');
INSERT INTO `roast` VALUES ('16', '我尝试了新的手机应用，但似乎有点上瘾了。', '2024-03-09 13:03:55', '624');
INSERT INTO `roast` VALUES ('17', '我今天在办公室遇到了一个难题，但最终解决了。', '2024-03-09 13:03:55', '640');
INSERT INTO `roast` VALUES ('18', '我昨天在公园里跑步，结果跑丢了一只鞋。', '2024-03-09 13:03:55', '661');
INSERT INTO `roast` VALUES ('19', '我尝试了新的烘焙技巧，但蛋糕似乎没有发起来。', '2024-03-09 13:03:55', '52');
INSERT INTO `roast` VALUES ('20', 'dolor proident dolor mollit', '1974-12-26 15:21:10', '64');
INSERT INTO `roast` VALUES ('21', '我昨天在餐厅吃饭，结果服务员把菜上错了。', '2024-03-09 13:03:55', '560');
INSERT INTO `roast` VALUES ('22', '我尝试了新的绘画风格，但似乎有点...抽象。', '2024-03-09 13:03:55', '640');
INSERT INTO `roast` VALUES ('23', '我今天在公园里看到了一场精彩的街头表演。', '2024-03-09 13:03:55', '188');
INSERT INTO `roast` VALUES ('24', '我昨天在商场购物，结果买的东西比预期的多。', '2024-03-09 13:03:55', '352');
INSERT INTO `roast` VALUES ('25', '我尝试了新的旅行路线，但似乎有点迷路了。', '2024-03-09 13:03:55', '531');
INSERT INTO `roast` VALUES ('26', '我今天在办公室里完成了一个大项目，感觉非常满足。', '2024-03-09 13:03:55', '267');
INSERT INTO `roast` VALUES ('27', '我昨天在健身房锻炼，结果第二天全身酸痛。', '2024-03-09 13:03:55', '408');
INSERT INTO `roast` VALUES ('28', '我尝试了新的摄影技巧，但似乎有点...模糊。', '2024-03-09 13:03:55', '574');
INSERT INTO `roast` VALUES ('29', '我今天在图书馆里找到了一本非常珍贵的旧书。', '2024-03-09 13:03:55', '311');
INSERT INTO `roast` VALUES ('30', '我昨天在公园里看到了一场非常有趣的亲子活动。', '2024-03-09 13:03:55', '501');
INSERT INTO `roast` VALUES ('31', 'laboris ut cillum', null, null);
INSERT INTO `roast` VALUES ('32', 'sint', null, null);
INSERT INTO `roast` VALUES ('33', 'cupidatat irure', '2024-03-09 21:38:21', '0');

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
  `last_login_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0', '11111111111', '123456', '2024-03-05 21:20:36', null);
INSERT INTO `user` VALUES ('1', '19157681683', 'id', '2024-03-05 21:21:01', '2024-03-09 17:23:45');
INSERT INTO `user` VALUES ('2', '19157681684', '123456aaAA', '2024-03-08 06:56:21', '2024-03-08 06:56:21');
INSERT INTO `user` VALUES ('5', '19157681685', '123456aaAA', '2024-03-08 08:18:33', '2024-03-08 08:18:33');
INSERT INTO `user` VALUES ('6', '1915768000', '123456', '2024-03-08 17:10:36', '2024-03-10 03:01:41');
INSERT INTO `user` VALUES ('7', '1915768001', '123456', '2024-03-08 17:10:36', '2024-03-07 03:01:46');
INSERT INTO `user` VALUES ('8', '1915768002', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('9', '1915768003', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('10', '1915768004', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('11', '1915768005', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('12', '1915768006', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('13', '1915768007', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('14', '1915768008', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('15', '1915768009', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('16', '1915768010', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('17', '1915768011', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('18', '', 'ea', '1976-01-24 17:30:58', '1996-03-10 08:03:09');
INSERT INTO `user` VALUES ('19', '1915768013', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('20', '1915768014', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('21', '1915768015', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('22', '1915768016', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('23', '1915768017', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('24', '1915768018', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('25', '1915768019', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('26', '1915768020', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('27', '1915768021', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('28', '1915768022', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('29', '1915768023', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('30', '1915768024', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('31', '1915768025', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('32', '1915768026', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('33', '1915768027', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('34', '1915768028', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('35', '1915768029', '123456', '2024-03-08 17:10:36', null);
INSERT INTO `user` VALUES ('37', '19157681690', '123456', null, null);
INSERT INTO `user` VALUES ('39', '19157681691', '123456', null, null);
INSERT INTO `user` VALUES ('41', '191576181699', 'pariatur Ut laboris', '2024-03-09 17:29:04', '2024-03-09 17:29:04');
INSERT INTO `user` VALUES ('42', '19157681773', 'minim', '2024-03-09 21:01:43', '2024-03-09 21:01:43');

-- ----------------------------
-- Table structure for user_chat
-- ----------------------------
DROP TABLE IF EXISTS `user_chat`;
CREATE TABLE `user_chat` (
  `user_chat_id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
INSERT INTO `user_chat_relation` VALUES ('54', '1', '1');
INSERT INTO `user_chat_relation` VALUES ('55', '1', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_roast
-- ----------------------------
INSERT INTO `user_roast` VALUES ('1', '11', '31');
INSERT INTO `user_roast` VALUES ('2', '15', '32');
INSERT INTO `user_roast` VALUES ('3', '0', '33');

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
  PRIMARY KEY (`wish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of wish
-- ----------------------------
INSERT INTO `wish` VALUES ('1', '希望校务系统能自动处理请假申请，减少人工操作。', '2024-03-09 20:58:13', '178');
INSERT INTO `wish` VALUES ('2', '希望校务系统可以实时更新课程表，方便学生查看。', '2024-03-09 20:58:13', '78');
INSERT INTO `wish` VALUES ('3', '希望校务系统能提供在线选课功能，让选课更加便捷。', '2024-03-09 20:58:13', '522');
INSERT INTO `wish` VALUES ('4', '希望校务系统能自动发送成绩通知，及时了解学习情况。', '2024-03-09 20:58:13', '381');
INSERT INTO `wish` VALUES ('5', '希望校务系统能提供校园活动日历，不错过任何精彩活动。', '2024-03-09 20:58:13', '337');
INSERT INTO `wish` VALUES ('6', '希望校务系统能实现在线图书馆预约，节省排队时间。', '2024-03-09 20:58:13', '542');
INSERT INTO `wish` VALUES ('7', '希望校务系统能提供校园地图导航，帮助新生快速熟悉校园。', '2024-03-09 20:58:13', '371');
INSERT INTO `wish` VALUES ('8', '希望校务系统能实现在线缴费，简化学费支付流程。', '2024-03-09 20:58:13', '226');
INSERT INTO `wish` VALUES ('9', '希望校务系统能提供成绩查询，方便随时查看学习进度。', '2024-03-09 20:58:13', '20');
INSERT INTO `wish` VALUES ('10', '希望校务系统能实现校园新闻实时更新，了解校园动态。', '2024-03-09 20:58:13', '90');
INSERT INTO `wish` VALUES ('11', '希望校务系统能提供在线课程评价，帮助改进教学质量。', '2024-03-09 20:58:13', '387');
INSERT INTO `wish` VALUES ('12', '希望校务系统能实现校园卡在线充值，方便快捷。', '2024-03-09 20:58:13', '335');
INSERT INTO `wish` VALUES ('13', '希望校务系统能提供校园社团信息，方便学生加入。', '2024-03-09 20:58:13', '515');
INSERT INTO `wish` VALUES ('14', '希望校务系统能提供电子成绩单下载，方便求职和升学。', '2024-03-09 20:58:13', '239');
INSERT INTO `wish` VALUES ('15', '希望校务系统能实现在线考试报名，简化报名流程。', '2024-03-09 20:58:13', '315');
INSERT INTO `wish` VALUES ('16', '希望校务系统能提供课程资源下载，方便自主学习。', '2024-03-09 20:58:13', '192');
INSERT INTO `wish` VALUES ('17', '希望校务系统能实现教师评价系统，促进教学质量提升。', '2024-03-09 20:58:13', '15');
INSERT INTO `wish` VALUES ('18', '希望校务系统能提供学生档案管理，方便个人信息查询。', '2024-03-09 20:58:13', '166');
INSERT INTO `wish` VALUES ('19', '希望校务系统能实现在线课程咨询，提供即时帮助。', '2024-03-09 20:58:13', '121');
INSERT INTO `wish` VALUES ('20', '希望校务系统能提供校园安全报警系统，保障学生安全。', '2024-03-09 20:58:13', '105');
INSERT INTO `wish` VALUES ('21', '希望校务系统能实现校园环境监测，提供健康学习环境。', '2024-03-09 20:58:13', '162');
INSERT INTO `wish` VALUES ('22', '希望校务系统能提供校园周边设施查询，方便生活。', '2024-03-09 20:58:13', '496');
INSERT INTO `wish` VALUES ('23', '希望校务系统能实现在线心理咨询，关注学生心理健康。', '2024-03-09 20:58:13', '661');
INSERT INTO `wish` VALUES ('24', '希望校务系统能提供校园活动报名，方便参与各类活动。', '2024-03-09 20:58:13', '488');
INSERT INTO `wish` VALUES ('25', '希望校务系统能实现校园新闻推送，及时获取最新信息。', '2024-03-09 20:58:13', '456');
INSERT INTO `wish` VALUES ('26', 'in', '1984-05-22 04:39:50', '71');
INSERT INTO `wish` VALUES ('27', '希望校务系统能实现在线课程反馈，提升课程质量。', '2024-03-09 20:58:13', '49');
INSERT INTO `wish` VALUES ('28', '希望校务系统能提供校园社团活动日历，不错过任何精彩活动。', '2024-03-09 20:58:13', '463');
INSERT INTO `wish` VALUES ('29', '希望校务系统能实现在线课程表调整，适应不同学生需求。', '2024-03-09 20:58:13', '169');
INSERT INTO `wish` VALUES ('30', '希望校务系统能提供校园讲座信息，丰富学术生活。', '2024-03-09 20:58:13', '124');
INSERT INTO `wish` VALUES ('31', '希望校务系统能实现在线考试安排查询，方便安排学习计划。', '2024-03-09 20:58:13', '113');
INSERT INTO `wish` VALUES ('32', '希望校务系统能提供校园志愿者活动信息，参与社会服务。', '2024-03-09 20:58:13', '194');
INSERT INTO `wish` VALUES ('33', '希望校务系统能实现在线课程资源共享，促进学术交流。', '2024-03-09 20:58:13', '629');
INSERT INTO `wish` VALUES ('34', '希望校务系统能提供校园体育设施预约，方便体育锻炼。', '2024-03-09 20:58:13', '569');
INSERT INTO `wish` VALUES ('35', '希望校务系统能实现在线课程问答，及时解决学习疑惑。', '2024-03-09 20:58:13', '290');
INSERT INTO `wish` VALUES ('36', '希望校务系统能提供校园文化活动信息，丰富课余生活。', '2024-03-09 20:58:13', '409');
INSERT INTO `wish` VALUES ('37', '希望校务系统能实现在线课程评价反馈，提升教学互动。', '2024-03-09 20:58:13', '512');
INSERT INTO `wish` VALUES ('38', '希望校务系统能提供校园艺术展览信息，享受艺术熏陶。', '2024-03-09 20:58:13', '664');
INSERT INTO `wish` VALUES ('39', '希望校务系统能实现在线课程报名提醒，不错过任何课程。', '2024-03-09 20:58:13', '455');
INSERT INTO `wish` VALUES ('40', '希望校务系统能提供校园健康检查预约，关注学生健康。', '2024-03-09 20:58:13', '283');
INSERT INTO `wish` VALUES ('41', '希望校务系统能实现在线课程进度跟踪，监控学习效果。', '2024-03-09 20:58:13', '51');
INSERT INTO `wish` VALUES ('42', '希望校务系统能提供校园交通信息，方便出行。', '2024-03-09 20:58:13', '73');
INSERT INTO `wish` VALUES ('43', '希望校务系统能实现在线课程难度评估，合理选择课程。', '2024-03-09 20:58:13', '212');
INSERT INTO `wish` VALUES ('44', '希望校务系统能提供校园周边美食推荐，享受美食生活。', '2024-03-09 20:58:13', '175');
INSERT INTO `wish` VALUES ('45', '希望校务系统能实现在线课程互动讨论，提高学习兴趣。', '2024-03-09 20:58:13', '241');
INSERT INTO `wish` VALUES ('46', '希望校务系统能提供校园安全教育信息，提高安全意识。', '2024-03-09 20:58:13', '13');
INSERT INTO `wish` VALUES ('47', '希望校务系统能实现在线课程学习报告，总结学习成果。', '2024-03-09 20:58:13', '10');
INSERT INTO `wish` VALUES ('48', '希望校务系统能提供校园环保活动信息，参与环保行动。', '2024-03-09 20:58:13', '10');
INSERT INTO `wish` VALUES ('49', '希望校务系统能实现在线课程学习计划制定，提高学习效率。', '2024-03-09 20:58:13', '20');
INSERT INTO `wish` VALUES ('50', '希望校务系统能提供校园文化节活动信息，体验多元文化。', '2024-03-09 20:58:13', '70');
INSERT INTO `wish` VALUES ('51', '希望校务系统能实现在线课程学习笔记分享，促进知识交流。', '2024-03-09 20:58:13', '292');
INSERT INTO `wish` VALUES ('52', '希望校务系统能提供校园科技创新信息，激发创新思维。', '2024-03-09 20:58:13', '586');
INSERT INTO `wish` VALUES ('53', '希望校务系统能实现在线课程学习小组组建，促进团队合作。', '2024-03-09 20:58:13', '53');
INSERT INTO `wish` VALUES ('54', '希望校务系统能提供校园国际交流信息，拓宽国际视野。', '2024-03-09 20:58:13', '508');
INSERT INTO `wish` VALUES ('55', '希望校务系统能实现在线课程学习成果展示，展示学习成果。', '2024-03-09 20:58:13', '384');
INSERT INTO `wish` VALUES ('56', '希望校务系统能提供校园创业指导信息，支持学生创业。', '2024-03-09 20:58:13', '395');
INSERT INTO `wish` VALUES ('57', '希望校务系统能实现在线课程学习资源推荐，提高学习效率。', '2024-03-09 20:58:13', '160');
INSERT INTO `wish` VALUES ('58', '希望校务系统能提供校园文化活动志愿者招募，参与志愿服务。', '2024-03-09 20:58:13', '278');
INSERT INTO `wish` VALUES ('59', '希望校务系统能实现在线课程学习心得交流，分享学习经验。', '2024-03-09 20:58:13', '248');
INSERT INTO `wish` VALUES ('60', '希望校务系统能提供校园科技创新竞赛信息，激发创新热情。', '2024-03-09 20:58:13', '404');
INSERT INTO `wish` VALUES ('61', '希望校务系统能实现在线课程学习进度提醒，确保学习进度。', '2024-03-09 20:58:13', '611');
INSERT INTO `wish` VALUES ('62', '希望校务系统能提供校园文化节志愿者服务，体验文化节氛围。', '2024-03-09 20:58:13', '513');
INSERT INTO `wish` VALUES ('63', '希望校务系统能实现在线课程学习计划调整，适应学习需求变化。', '2024-03-09 20:58:13', '67');
INSERT INTO `wish` VALUES ('64', '希望校务系统能提供校园科技创新项目信息，参与科技创新。', '2024-03-09 20:58:13', '129');
INSERT INTO `wish` VALUES ('65', '希望校务系统能实现在线课程学习资源下载，方便自主学习。', '2024-03-09 20:58:13', '443');
INSERT INTO `wish` VALUES ('66', '希望校务系统能提供校园文化活动志愿者招募，参与文化活动。', '2024-03-09 20:58:13', '495');
INSERT INTO `wish` VALUES ('67', '希望校务系统能实现在线课程学习笔记整理，提高学习效率。', '2024-03-09 20:58:13', '482');
INSERT INTO `wish` VALUES ('68', '希望校务系统能提供校园科技创新竞赛报名，参与科技竞赛。', '2024-03-09 20:58:13', '261');
INSERT INTO `wish` VALUES ('69', '希望校务系统能实现在线课程学习进度跟踪，监控学习效果。', '2024-03-09 20:58:13', '524');
INSERT INTO `wish` VALUES ('70', '希望校务系统能提供校园文化节活动信息，体验多元文化。', '2024-03-09 20:58:13', '507');
INSERT INTO `wish` VALUES ('71', '希望校务系统能实现在线课程学习计划制定，提高学习效率。', '2024-03-09 20:58:13', '296');
INSERT INTO `wish` VALUES ('72', 'irure', null, null);
INSERT INTO `wish` VALUES ('73', 'irure', null, null);
INSERT INTO `wish` VALUES ('74', 'irure', null, null);
INSERT INTO `wish` VALUES ('75', 'irure', null, null);
INSERT INTO `wish` VALUES ('76', 'in ut consequat eu do', null, null);
INSERT INTO `wish` VALUES ('77', 'in ut consequat eu do', '2024-03-09 13:25:35', '0');
INSERT INTO `wish` VALUES ('78', 'officia et ut fugiat', '2024-03-09 22:03:48', '0');

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
