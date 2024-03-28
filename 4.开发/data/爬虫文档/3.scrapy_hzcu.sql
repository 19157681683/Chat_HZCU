/*
Navicat MySQL Data Transfer

Source Server         : llm1
Source Server Version : 80030
Source Host           : localhost:3306
Source Database       : scrapy_hzcu

Target Server Type    : MYSQL
Target Server Version : 80030
File Encoding         : 65001

Date: 2024-03-28 14:29:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for other_link
-- ----------------------------
DROP TABLE IF EXISTS `other_link`;
CREATE TABLE `other_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `text_description` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object` varchar(255) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `question` text,
  `answer` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for website
-- ----------------------------
DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `main_content` text,
  `other_content` text,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for website_other_link_relation
-- ----------------------------
DROP TABLE IF EXISTS `website_other_link_relation`;
CREATE TABLE `website_other_link_relation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `website_id` int DEFAULT NULL,
  `other_link_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_id` (`website_id`),
  KEY `other_link_id` (`other_link_id`),
  CONSTRAINT `website_other_link_relation_ibfk_1` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`),
  CONSTRAINT `website_other_link_relation_ibfk_2` FOREIGN KEY (`other_link_id`) REFERENCES `other_link` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for website_website_relation
-- ----------------------------
DROP TABLE IF EXISTS `website_website_relation`;
CREATE TABLE `website_website_relation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `source_website_id` int DEFAULT NULL,
  `target_website_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_website_id` (`source_website_id`),
  KEY `target_website_id` (`target_website_id`),
  CONSTRAINT `website_website_relation_ibfk_1` FOREIGN KEY (`source_website_id`) REFERENCES `website` (`id`),
  CONSTRAINT `website_website_relation_ibfk_2` FOREIGN KEY (`target_website_id`) REFERENCES `website` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
