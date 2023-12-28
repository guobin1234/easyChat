/*
 Navicat Premium Data Transfer

 Source Server         : gb-mysql8
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : easychat

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 10/06/2023 00:09:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for easychat_friend
-- ----------------------------
DROP TABLE IF EXISTS `easychat_friend`;
CREATE TABLE `easychat_friend`  (
  `id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `user_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属用户 id',
  `session_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会话 id',
  `session_time` datetime(0) NULL DEFAULT NULL COMMENT '会话创建时间',
  `friend_user_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '好友用户 id',
  `friend_remark` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '好友备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easychat_friend
-- ----------------------------
INSERT INTO `easychat_friend` VALUES ('1661685157771403266', '1661619835450171394', '1661685157972680705', '2023-05-25 18:46:28', '1661642381335732226', '', '2023-05-25 18:46:28');
INSERT INTO `easychat_friend` VALUES ('1661685158387965954', '1661642381335732226', '1661685157972680705', '2023-05-25 18:46:28', '1661619835450171394', '', '2023-05-25 18:46:28');
INSERT INTO `easychat_friend` VALUES ('1663167360078483458', '1663166584610394113', '1663167360472731649', '2023-05-29 20:56:13', '1663149532524875777', '', '2023-05-29 20:56:13');
INSERT INTO `easychat_friend` VALUES ('1663167360812486657', '1663149532524875777', '1663167360472731649', '2023-05-29 20:56:13', '1663166584610394113', 'gb', '2023-05-29 20:56:13');
INSERT INTO `easychat_friend` VALUES ('1667006099477237762', '1663149532524875777', '0', '2023-06-09 11:10:00', '1661642381335732226', '', '2023-06-09 11:10:00');
INSERT INTO `easychat_friend` VALUES ('1667006100219629569', '1661642381335732226', '1667006099611521025', '2023-06-09 11:10:00', '1663149532524875777', '', '2023-06-09 11:10:00');
INSERT INTO `easychat_friend` VALUES ('1667196887893143553', '1667007319965175810', '1667196888111161345', '2023-06-09 23:48:07', '1667008270553845761', '', '2023-06-09 23:48:07');
INSERT INTO `easychat_friend` VALUES ('1667196888551649281', '1667008270553845761', '1667196888111161345', '2023-06-09 23:48:07', '1667007319965175810', '', '2023-06-09 23:48:07');

-- ----------------------------
-- Table structure for easychat_friend_verify
-- ----------------------------
DROP TABLE IF EXISTS `easychat_friend_verify`;
CREATE TABLE `easychat_friend_verify`  (
  `id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `sender_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发送者id',
  `receiver_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接收者id',
  `apply_reason` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请理由',
  `remark` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态，0 未处理 1 同意 2 拒绝 3 过期',
  `has_read` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否已读，0 未读 1 已读',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easychat_friend_verify
-- ----------------------------
INSERT INTO `easychat_friend_verify` VALUES ('1661684567033044994', '1661619835450171394', '1661642381335732226', 'hello', '', '1', '1', '2023-05-25 18:44:07');
INSERT INTO `easychat_friend_verify` VALUES ('1663167125373620226', '1663166584610394113', '1663149532524875777', '111', '', '1', '1', '2023-05-29 20:55:16');
INSERT INTO `easychat_friend_verify` VALUES ('1667005670731288577', '1663149532524875777', '1661642381335732226', '11111', '', '1', '1', '2023-06-09 11:08:17');
INSERT INTO `easychat_friend_verify` VALUES ('1667196299058999298', '1667007319965175810', '1667008270553845761', '123456', '', '1', '1', '2023-06-09 23:47:24');

-- ----------------------------
-- Table structure for easychat_group
-- ----------------------------
DROP TABLE IF EXISTS `easychat_group`;
CREATE TABLE `easychat_group`  (
  `id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `group_name` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '聊天组名',
  `member_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '成员 id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for easychat_history
-- ----------------------------
DROP TABLE IF EXISTS `easychat_history`;
CREATE TABLE `easychat_history`  (
  `id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `sender_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发送者 id',
  `receiver_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接收者 id',
  `session_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属会话 id',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容类型，0 文本 1 图片 2 文件 3 语音',
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `show_time` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否显示时间，1 显示 0 不显示',
  `has_read` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否已读，1 已读 0 未读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easychat_history
-- ----------------------------
INSERT INTO `easychat_history` VALUES ('1661685213664649218', '1661642381335732226', '1661619835450171394', '1661685157972680705', '0', '😂', '2023-05-25 18:46:42', '1', '1');
INSERT INTO `easychat_history` VALUES ('1661685359160860673', '1661642381335732226', '1661619835450171394', '1661685157972680705', '1', '/pictures/1661685157972680705/1661685348352139266.jpg', '2023-05-25 18:47:16', '0', '1');
INSERT INTO `easychat_history` VALUES ('1661688198868246530', '1661642381335732226', '1661619835450171394', '1661685157972680705', '0', '😅', '2023-05-25 18:58:33', '1', '1');
INSERT INTO `easychat_history` VALUES ('1661688410399580161', '1661619835450171394', '1661642381335732226', '1661685157972680705', '0', '🥰', '2023-05-25 18:59:24', '0', '1');
INSERT INTO `easychat_history` VALUES ('1661688439017316354', '1661642381335732226', '1661619835450171394', '1661685157972680705', '0', '😂', '2023-05-25 18:59:31', '0', '1');
INSERT INTO `easychat_history` VALUES ('1661691373717299202', '1661619835450171394', '1661642381335732226', '1661685157972680705', '0', 'hello😁', '2023-05-25 19:11:10', '1', '1');
INSERT INTO `easychat_history` VALUES ('1661696756619943938', '1661619835450171394', '1661642381335732226', '1661685157972680705', '1', '/pictures/1661685157972680705/1661696754086584321.jpg', '2023-05-25 19:32:34', '1', '1');
INSERT INTO `easychat_history` VALUES ('1661696757718851586', '1661619835450171394', '1661642381335732226', '1661685157972680705', '1', '/pictures/1661685157972680705/1661696756728995841.jpg', '2023-05-25 19:32:34', '0', '1');
INSERT INTO `easychat_history` VALUES ('1661697835944386562', '1661619835450171394', '1661642381335732226', '1661685157972680705', '2', '/files/1661685157972680705/英语四级 作文模板.pptx', '2023-05-25 19:36:49', '0', '1');
INSERT INTO `easychat_history` VALUES ('1661701660210110465', '1661619835450171394', '1661642381335732226', '1661685157972680705', '1', '/pictures/1661685157972680705/1661701654862372865.jpg', '2023-05-25 19:52:03', '1', '1');
INSERT INTO `easychat_history` VALUES ('1663167416126951425', '1663149532524875777', '1663166584610394113', '1663167360472731649', '0', '123456', '2023-05-29 20:56:26', '1', '1');
INSERT INTO `easychat_history` VALUES ('1663167577112727553', '1663166584610394113', '1663149532524875777', '1663167360472731649', '0', '123456', '2023-05-29 20:57:05', '0', '1');
INSERT INTO `easychat_history` VALUES ('1663167602920280066', '1663166584610394113', '1663149532524875777', '1663167360472731649', '0', '😀', '2023-05-29 20:57:11', '0', '1');
INSERT INTO `easychat_history` VALUES ('1666817712812204034', '1661619835450171394', '1661642381335732226', '1661685157972680705', '1', '/pictures/1661685157972680705/1666817705178570754.jpg', '2023-06-08 22:41:25', '1', '1');
INSERT INTO `easychat_history` VALUES ('1667002207456792577', '1661642381335732226', '1661619835450171394', '1661685157972680705', '0', '😇', '2023-06-09 10:54:31', '1', '0');
INSERT INTO `easychat_history` VALUES ('1667006158478577666', '1661642381335732226', '1663149532524875777', '1667006099611521025', '0', '😂', '2023-06-09 11:10:14', '1', '1');
INSERT INTO `easychat_history` VALUES ('1667011429586243585', '1663149532524875777', '1663166584610394113', '1663167360472731649', '1', '/pictures/1663167360472731649/1667011417779277826.jpg', '2023-06-09 11:31:11', '1', '0');
INSERT INTO `easychat_history` VALUES ('1667016728183377921', '1663149532524875777', '1663166584610394113', '1663167360472731649', '1', '/pictures/1663167360472731649/1667016723657723905.jpeg', '2023-06-09 11:52:14', '1', '0');
INSERT INTO `easychat_history` VALUES ('1667196940959391745', '1667008270553845761', '1667007319965175810', '1667196888111161345', '0', 'hello', '2023-06-09 23:48:20', '1', '1');
INSERT INTO `easychat_history` VALUES ('1667196973184229377', '1667008270553845761', '1667007319965175810', '1667196888111161345', '0', '😄', '2023-06-09 23:48:28', '0', '1');

-- ----------------------------
-- Table structure for easychat_user
-- ----------------------------
DROP TABLE IF EXISTS `easychat_user`;
CREATE TABLE `easychat_user`  (
  `id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户 id',
  `username` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别，0 女 1 男 2 保密',
  `age` int(4) NULL DEFAULT NULL COMMENT '年龄',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `region` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '电子邮箱',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `introduction` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态，0 隐身 1在线',
  `tags` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `group_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加入的聊天组 id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_easychat_user_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easychat_user
-- ----------------------------
INSERT INTO `easychat_user` VALUES ('1663149532524875777', 'guobin', '1rFKMZKSSN5f+yJtzbAmXA==', 'guobin', '/avatar/default.jpg', '2', NULL, NULL, NULL, '1293246722@qq.com', NULL, NULL, '1', NULL, NULL, '2023-05-29 19:45:23', NULL);
INSERT INTO `easychat_user` VALUES ('1663166584610394113', 'guobin12345', 'PIZIJBklOMkhqncX0NpLVA==', 'guobin12345', '/avatar/default.jpg', '1', 0, '2023-05-01', '北京市 北京市', '3105979073@qq.com', NULL, '1111', '1', NULL, NULL, '2023-05-29 20:53:08', '2023-05-29 20:54:18');
INSERT INTO `easychat_user` VALUES ('1667007319965175810', 'admin1', 'yTzNeLIHZSg0YhazsvcB5g==', 'admin1', '/avatar/default.jpg', '1', 0, '2023-06-09', '江西省 景德镇市', '1293246722@qq.com', '13123132121', '11111111', '1', NULL, NULL, '2023-06-09 11:14:51', '2023-06-09 23:49:16');
INSERT INTO `easychat_user` VALUES ('1667008270553845761', 'admin2', 'yTzNeLIHZSg0YhazsvcB5g==', 'admin2', '/avatar/default.jpg', '2', NULL, NULL, NULL, '1293246722@qq.com', NULL, NULL, '1', NULL, NULL, '2023-06-09 11:18:37', NULL);
INSERT INTO `easychat_user` VALUES ('1667009531449708546', 'admin3', 'yTzNeLIHZSg0YhazsvcB5g==', 'admin3', '/avatar/default.jpg', '2', NULL, NULL, NULL, '1293246722@qq.com', NULL, NULL, '1', NULL, NULL, '2023-06-09 11:23:38', NULL);

SET FOREIGN_KEY_CHECKS = 1;
