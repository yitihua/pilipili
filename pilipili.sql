/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : pilipili

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 06/06/2019 16:41:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_at` tinyblob NULL,
  `layer` int(11) NOT NULL,
  `level` bigint(20) NULL DEFAULT NULL,
  `author` bigint(20) NULL DEFAULT NULL,
  `father_comment` bigint(20) NULL DEFAULT NULL,
  `original` bigint(20) NULL DEFAULT NULL,
  `root_comment` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_5o3gedu0o11ixye4bka3dbhsb`(`author`) USING BTREE,
  INDEX `FK_q88p4wirm28ptjxcgp88rbihb`(`father_comment`) USING BTREE,
  INDEX `FK_g52m68amyltaufob1n473e5cp`(`original`) USING BTREE,
  INDEX `FK_8b15ry8eyciph1g3p0vesfm75`(`root_comment`) USING BTREE,
  CONSTRAINT `FK_5o3gedu0o11ixye4bka3dbhsb` FOREIGN KEY (`author`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_8b15ry8eyciph1g3p0vesfm75` FOREIGN KEY (`root_comment`) REFERENCES `t_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_g52m68amyltaufob1n473e5cp` FOREIGN KEY (`original`) REFERENCES `t_news` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_q88p4wirm28ptjxcgp88rbihb` FOREIGN KEY (`father_comment`) REFERENCES `t_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES (1, '女', 0, '性别');
INSERT INTO `t_dict` VALUES (2, '男', 0, '性别');
INSERT INTO `t_dict` VALUES (3, '保密', 0, '性别');
INSERT INTO `t_dict` VALUES (4, '无', 0, '学历');
INSERT INTO `t_dict` VALUES (5, '小学', 0, '学历');
INSERT INTO `t_dict` VALUES (6, '初中', 0, '学历');
INSERT INTO `t_dict` VALUES (7, '高中', 0, '学历');
INSERT INTO `t_dict` VALUES (8, '大学及以上', 0, '学历');

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_at` tinyblob NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` bigint(20) NULL DEFAULT NULL,
  `type` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_598uqt5jtjy1llmrvo69plld2`(`author`) USING BTREE,
  INDEX `FK_jiffpe1kcek1eug7p7b8nbjsu`(`type`) USING BTREE,
  CONSTRAINT `FK_598uqt5jtjy1llmrvo69plld2` FOREIGN KEY (`author`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_jiffpe1kcek1eug7p7b8nbjsu` FOREIGN KEY (`type`) REFERENCES `t_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'admin', 1);
INSERT INTO `t_role` VALUES (2, 'user', 1);
INSERT INTO `t_role` VALUES (3, 'guest', 1);

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (1, '动画');
INSERT INTO `t_type` VALUES (2, '番剧');
INSERT INTO `t_type` VALUES (3, '国创');
INSERT INTO `t_type` VALUES (4, '音乐');
INSERT INTO `t_type` VALUES (5, '舞蹈');
INSERT INTO `t_type` VALUES (6, '游戏');
INSERT INTO `t_type` VALUES (7, '科技');
INSERT INTO `t_type` VALUES (8, '数码');
INSERT INTO `t_type` VALUES (9, '生活');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_at` tinyblob NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `education` bigint(20) NULL DEFAULT NULL,
  `gender` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_jhib4legehrm4yscx9t3lirqi`(`username`) USING BTREE,
  INDEX `FK_fugfays187dqh1x4qm8l8xxj`(`education`) USING BTREE,
  INDEX `FK_cicyfsxs4lgxsro3ciaje0vg2`(`gender`) USING BTREE,
  CONSTRAINT `FK_cicyfsxs4lgxsro3ciaje0vg2` FOREIGN KEY (`gender`) REFERENCES `t_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_fugfays187dqh1x4qm8l8xxj` FOREIGN KEY (`education`) REFERENCES `t_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, NULL, 0xACED00057372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770E05000007E306061022063AF2F14078, 'df655ad8d3229f3269fad2a8bab59b6c', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FK_4uvv76e86ms8ru0kk9s01d3s2`(`role_id`) USING BTREE,
  CONSTRAINT `FK_4uvv76e86ms8ru0kk9s01d3s2` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_kefwen29p9h9ilvry31mgyc94` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (1, 2);

SET FOREIGN_KEY_CHECKS = 1;
