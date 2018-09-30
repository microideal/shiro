/*
 Navicat Premium Data Transfer

 Source Server         : microideal
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : shiro

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 30/09/2018 10:13:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PASSWORD` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LOGIN_IP` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` tinyint(1) NOT NULL DEFAULT 1,
  `CREATE_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `LAST_UPDATE_TIME` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LAST_LOGIN_TIME` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `ROLE_ID` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE` tinyint(255) NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `username`(`USERNAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (7, 'microideal', '123456', NULL, 1, '2018-09-29 17:17:05', '2018-09-27 20:36:10', '2018-09-27 20:36:10', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_authority
-- ----------------------------
DROP TABLE IF EXISTS `t_authority`;
CREATE TABLE `t_authority`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parentId` bigint(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority
-- ----------------------------
INSERT INTO `t_authority` VALUES (1, '活动管理', 0, 1, 0, 'activity');
INSERT INTO `t_authority` VALUES (2, 'banner管理', 1, 2, 1, '/backend/banner/list');
INSERT INTO `t_authority` VALUES (3, '活动管理', 1, 3, 1, '/backend/activity/list');
INSERT INTO `t_authority` VALUES (4, '推送管理', 1, 4, 1, '/backend/messageRecord/list');
INSERT INTO `t_authority` VALUES (5, '运营管理', 0, 5, 0, 'operation');
INSERT INTO `t_authority` VALUES (6, '客户管理', 5, 6, 1, '/backend/customer/list');
INSERT INTO `t_authority` VALUES (7, '贷款产品管理', 5, 7, 1, '/backend/loan/list');
INSERT INTO `t_authority` VALUES (8, '信用卡产品管理', 5, 8, 1, '/backend/creditCard/list');
INSERT INTO `t_authority` VALUES (9, '数据分析', 0, 9, 0, 'data');
INSERT INTO `t_authority` VALUES (10, '贷款数据统计', 9, 10, 1, '/backend/loan/statistics');
INSERT INTO `t_authority` VALUES (11, '信用卡数据统计', 9, 11, 1, '/backend/creditCard/statistics');
INSERT INTO `t_authority` VALUES (12, '用户反馈', 9, 12, 1, '/backend/feedback/list');
INSERT INTO `t_authority` VALUES (13, '系统设置', 0, 13, 0, 'system');
INSERT INTO `t_authority` VALUES (14, '贷款分类管理', 13, 14, 1, '/backend/dictionary/loan/category/list');
INSERT INTO `t_authority` VALUES (15, '信用卡分类管理', 13, 15, 1, '/backend/dictionary/creditCard/category/list');
INSERT INTO `t_authority` VALUES (16, '标签管理', 13, 16, 1, '/backend/dictionary/tag/list');
INSERT INTO `t_authority` VALUES (17, '适应人群管理', 13, 17, 1, '/backend/dictionary/own/list');
INSERT INTO `t_authority` VALUES (18, '供应商管理', 13, 18, 1, '/backend/supplier/list');
INSERT INTO `t_authority` VALUES (19, '投放渠道号管理', 13, 19, 1, '/backend/dictionary/channel/list');
INSERT INTO `t_authority` VALUES (20, '系统配置', 13, 20, 1, '/backend/systemConfig/view');
INSERT INTO `t_authority` VALUES (22, '权限管理', 0, 22, 0, 'authority');
INSERT INTO `t_authority` VALUES (23, '用户管理', 22, 23, 1, '/backend/admin/list');
INSERT INTO `t_authority` VALUES (24, '角色管理', 22, 24, 1, '/backend/role/list');
INSERT INTO `t_authority` VALUES (25, '权限管理', 22, 25, 1, '/backend/authority/list');
INSERT INTO `t_authority` VALUES (26, '添加账号', 23, 26, 2, '/backend/admin/add');
INSERT INTO `t_authority` VALUES (27, '账号添加角色', 23, 27, 2, '/backend/admin/addRole');
INSERT INTO `t_authority` VALUES (28, '账号编辑', 23, 28, 2, '/backend/admin/edit');
INSERT INTO `t_authority` VALUES (29, '账号删除', 23, 29, 2, '/backend/admin/delete');
INSERT INTO `t_authority` VALUES (30, '增加角色', 24, 30, 2, '/backend/role/add');
INSERT INTO `t_authority` VALUES (31, '删除角色', 24, 31, 2, '/backend/role/delete');
INSERT INTO `t_authority` VALUES (32, '编辑角色', 24, 32, 2, '/backend/role/edit');
INSERT INTO `t_authority` VALUES (33, '角色分配权限', 24, 33, 2, '/backend/role/addAuthority');
INSERT INTO `t_authority` VALUES (34, '增加权限', 25, 34, 2, '/backend/authority/add');
INSERT INTO `t_authority` VALUES (35, '编辑权限', 25, 35, 2, '/backend/authority/edit');
INSERT INTO `t_authority` VALUES (36, '删除权限', 25, 36, 2, '/backend/authority/edit');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '超级管理员', 'superadmin');
INSERT INTO `t_role` VALUES (9, '代理商', 'agency');
INSERT INTO `t_role` VALUES (10, '管理员', 'admin');
INSERT INTO `t_role` VALUES (11, '业务员', 'salesman');

-- ----------------------------
-- Table structure for t_role_authorities
-- ----------------------------
DROP TABLE IF EXISTS `t_role_authorities`;
CREATE TABLE `t_role_authorities`  (
  `role_id` bigint(20) NOT NULL,
  `authority_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `authority_id`) USING BTREE,
  INDEX `FK4cy1svku5asbuvksc7ap47iyi`(`authority_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_authorities
-- ----------------------------
INSERT INTO `t_role_authorities` VALUES (1, 22);
INSERT INTO `t_role_authorities` VALUES (10, 22);
INSERT INTO `t_role_authorities` VALUES (1, 23);
INSERT INTO `t_role_authorities` VALUES (10, 23);
INSERT INTO `t_role_authorities` VALUES (1, 24);
INSERT INTO `t_role_authorities` VALUES (10, 24);
INSERT INTO `t_role_authorities` VALUES (1, 25);
INSERT INTO `t_role_authorities` VALUES (1, 26);
INSERT INTO `t_role_authorities` VALUES (1, 27);
INSERT INTO `t_role_authorities` VALUES (1, 28);
INSERT INTO `t_role_authorities` VALUES (1, 29);
INSERT INTO `t_role_authorities` VALUES (1, 30);
INSERT INTO `t_role_authorities` VALUES (1, 31);
INSERT INTO `t_role_authorities` VALUES (1, 32);
INSERT INTO `t_role_authorities` VALUES (1, 33);
INSERT INTO `t_role_authorities` VALUES (1, 34);
INSERT INTO `t_role_authorities` VALUES (1, 35);
INSERT INTO `t_role_authorities` VALUES (1, 36);

-- ----------------------------
-- Table structure for t_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `t_user_roles`;
CREATE TABLE `t_user_roles`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FKj9553ass9uctjrmh0gkqsmv0d`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_roles
-- ----------------------------
INSERT INTO `t_user_roles` VALUES (7, 1);

-- ----------------------------
-- Procedure structure for init_shiro_demo
-- ----------------------------
DROP PROCEDURE IF EXISTS `init_shiro_demo`;
delimiter ;;
CREATE PROCEDURE `init_shiro_demo`()
BEGIN	
/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.16-log : Database - 
*********************************************************************
*/
/*表结构插入*/
DROP TABLE IF EXISTS `u_permission`;
CREATE TABLE `u_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*Table structure for table `u_role` */
DROP TABLE IF EXISTS `u_role`;
CREATE TABLE `u_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*Table structure for table `u_role_permission` */
DROP TABLE IF EXISTS `u_role_permission`;
CREATE TABLE `u_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*Table structure for table `u_user` */
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*Table structure for table `u_user_role` */
DROP TABLE IF EXISTS `u_user_role`;
CREATE TABLE `u_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.16-log : Database - i_wenyiba_com
*********************************************************************
*/
/*所有的表数据插入*/
/*Data for the table `u_permission` */
insert  into `u_permission`(`id`,`url`,`name`) values (4,'/permission/index.shtml','权限列表'),(6,'/permission/addPermission.shtml','权限添加'),(7,'/permission/deletePermissionById.shtml','权限删除'),(8,'/member/list.shtml','用户列表'),(9,'/member/online.shtml','在线用户'),(10,'/member/changeSessionStatus.shtml','用户Session踢出'),(11,'/member/forbidUserById.shtml','用户激活&禁止'),(12,'/member/deleteUserById.shtml','用户删除'),(13,'/permission/addPermission2Role.shtml','权限分配'),(14,'/role/clearRoleByUserIds.shtml','用户角色分配清空'),(15,'/role/addRole2User.shtml','角色分配保存'),(16,'/role/deleteRoleById.shtml','角色列表删除'),(17,'/role/addRole.shtml','角色列表添加'),(18,'/role/index.shtml','角色列表'),(19,'/permission/allocation.shtml','权限分配'),(20,'/role/allocation.shtml','角色分配');
/*Data for the table `u_role` */
insert  into `u_role`(`id`,`name`,`type`) values (1,'系统管理员','888888'),(3,'权限角色','100003'),(4,'用户中心','100002');
/*Data for the table `u_role_permission` */
insert  into `u_role_permission`(`rid`,`pid`) values (4,8),(4,9),(4,10),(4,11),(4,12),(3,4),(3,6),(3,7),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(1,4),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20);
/*Data for the table `u_user` */
insert  into `u_user`(`id`,`nickname`,`email`,`pswd`,`create_time`,`last_login_time`,`status`) values (1,'管理员','admin','9c3250081c7b1f5c6cbb8096e3e1cd04','2016-06-16 11:15:33','2016-06-16 11:24:10',1),(11,'soso','8446666@qq.com','d57ffbe486910dd5b26d0167d034f9ad','2016-05-26 20:50:54','2016-06-16 11:24:35',1),(12,'8446666','8446666','4afdc875a67a55528c224ce088be2ab8','2016-05-27 22:34:19','2016-06-15 17:03:16',1);
/*Data for the table `u_user_role` */
insert  into `u_user_role`(`uid`,`rid`) values (12,4),(11,3),(11,4),(1,1);
   
    END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
