/*
 Navicat Premium Data Transfer

 Source Server         : 0_localhost_5.7
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : 0_80205mingtifuzhu

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 19/03/2026 14:44:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for py_announcements
-- ----------------------------
DROP TABLE IF EXISTS `py_announcements`;
CREATE TABLE `py_announcements`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告内容',
  `summary` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公告摘要',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布人',
  `authorId` int(11) NOT NULL COMMENT '发布人ID',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：1-发布，0-草稿',
  `isTop` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶：1-是，0-否',
  `viewCount` int(11) NOT NULL DEFAULT 0 COMMENT '浏览次数',
  `createTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_isTop`(`isTop`) USING BTREE,
  INDEX `idx_createTime`(`createTime`) USING BTREE,
  INDEX `idx_authorId`(`authorId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '新闻公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of py_announcements
-- ----------------------------
INSERT INTO `py_announcements` VALUES (1, '系统维护通知', '系统将于本周六凌晨2:00-4:00进行维护升级，期间可能影响正常使用，请提前做好准备。', '系统将于本周六凌晨2:00-4:00进行维护升级，期间可能影响正常使用，请提前做好准备。...', '系统管理员', 1, 1, 1, 0, '2025-11-11 14:51:26', '2025-11-11 14:52:19');
INSERT INTO `py_announcements` VALUES (2, '新功能上线', '用户头像上传功能已正式上线，用户可以在个人中心上传和更换头像。', '用户头像上传功能已正式上线，用户可以在个人中心上传和更换头像。', '产品经理', 1, 1, 0, 0, '2025-11-11 14:51:26', '2025-11-11 14:52:19');
INSERT INTO `py_announcements` VALUES (3, '安全提醒', '请定期修改密码，确保账号安全。建议使用包含字母、数字和特殊字符的强密码。', '请定期修改密码，确保账号安全。建议使用包含字母、数字和特殊字符的强密码。...', '安全管理员', 1, 1, 0, 0, '2025-11-11 14:51:26', '2025-11-11 14:52:19');
INSERT INTO `py_announcements` VALUES (4, '新闻公告管理功能上线', '新闻公告管理功能已正式上线，管理员可以在后台管理系统中发布、编辑和管理公告信息。', '新闻公告管理功能已正式上线，管理员可以在后台管理系统中发布、编辑和管理公告信息。...', '系统管理员', 1, 1, 0, 0, '2025-11-11 14:51:26', '2025-11-11 14:52:19');

-- ----------------------------
-- Table structure for py_answer_record
-- ----------------------------
DROP TABLE IF EXISTS `py_answer_record`;
CREATE TABLE `py_answer_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '答题记录ID',
  `examRecordId` int(11) NOT NULL COMMENT '考试记录ID',
  `questionId` int(11) NOT NULL COMMENT '题目ID',
  `questionType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '题型（冗余字段）',
  `studentAnswer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '学生答案',
  `correctAnswer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '正确答案（冗余字段）',
  `isCorrect` tinyint(1) DEFAULT NULL COMMENT '是否正确（0-错误，1-正确，NULL-未判题或主观题）',
  `score` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '题目分值（字符串存储）',
  `obtainedScore` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '获得分数（字符串存储）',
  `teacherScore` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '老师评分（主观题，字符串存储）',
  `teacherRemark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '老师评语',
  `isWrong` tinyint(1) DEFAULT 0 COMMENT '是否错题（0-否，1-是）',
  `createTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_exam_question`(`examRecordId`, `questionId`) USING BTREE COMMENT '防止重复记录',
  INDEX `idx_examRecordId`(`examRecordId`) USING BTREE,
  INDEX `idx_questionId`(`questionId`) USING BTREE,
  INDEX `idx_isCorrect`(`isCorrect`) USING BTREE,
  INDEX `idx_isWrong`(`isWrong`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '答题记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of py_answer_record
-- ----------------------------
INSERT INTO `py_answer_record` VALUES (1, 1, 22, 'single_choice', 'A', 'C', 0, '10', '0', NULL, NULL, 0, '2025-12-06 16:59:25', '2025-12-06 17:05:51');
INSERT INTO `py_answer_record` VALUES (2, 1, 2, 'multiple_choice', 'C', 'A,C', 0, '10', '0', NULL, NULL, 0, '2025-12-06 16:59:25', '2025-12-06 17:05:55');
INSERT INTO `py_answer_record` VALUES (3, 1, 75, 'fill_blank', '1', '35', 0, '10', '0', NULL, NULL, 0, '2025-12-06 16:59:25', '2025-12-06 17:06:15');
INSERT INTO `py_answer_record` VALUES (4, 1, 34, 'essay', '', '乘法是加法的简便运算。例如：3×4表示3个4相加，即4+4+4=12。乘法可以快速计算相同数的多次相加。', 0, '15', '0', NULL, NULL, 0, '2025-12-06 16:59:25', '2025-12-06 17:08:20');
INSERT INTO `py_answer_record` VALUES (5, 1, 35, 'judge', 'A', 'A', 1, '5', '5', NULL, NULL, 0, '2025-12-06 16:59:25', '2025-12-06 17:06:24');
INSERT INTO `py_answer_record` VALUES (6, 1, 69, 'single_choice', 'B', 'B', 1, '10', '10', NULL, NULL, 0, '2025-12-06 16:59:25', '2025-12-06 17:06:27');
INSERT INTO `py_answer_record` VALUES (13, 3, 22, 'single_choice', 'B', 'C', 0, '10', '0', NULL, NULL, 0, '2025-12-06 19:09:19', '2025-12-06 19:09:26');
INSERT INTO `py_answer_record` VALUES (14, 3, 2, 'multiple_choice', 'B', 'A,C', 0, '10', '0', NULL, NULL, 0, '2025-12-06 19:09:19', '2025-12-06 19:09:30');
INSERT INTO `py_answer_record` VALUES (15, 3, 75, 'fill_blank', '1', '35', 0, '10', '0', NULL, NULL, 0, '2025-12-06 19:09:19', '2025-12-06 19:09:33');
INSERT INTO `py_answer_record` VALUES (16, 3, 34, 'essay', '121', '乘法是加法的简便运算。例如：3×4表示3个4相加，即4+4+4=12。乘法可以快速计算相同数的多次相加。', NULL, '15', '1', '1', NULL, 0, '2025-12-06 19:09:19', '2025-12-06 19:11:42');
INSERT INTO `py_answer_record` VALUES (17, 3, 35, 'judge', 'A', 'A', 1, '5', '5', NULL, NULL, 0, '2025-12-06 19:09:19', '2025-12-06 19:09:41');
INSERT INTO `py_answer_record` VALUES (18, 3, 69, 'single_choice', 'B', 'B', 1, '10', '10', NULL, NULL, 0, '2025-12-06 19:09:19', '2025-12-06 19:09:48');
INSERT INTO `py_answer_record` VALUES (19, 4, 6, 'single_choice', 'B', 'B', 1, '10', '10', NULL, NULL, 0, '2026-02-05 20:51:45', '2026-02-05 20:51:48');
INSERT INTO `py_answer_record` VALUES (20, 4, 68, 'single_choice', 'B', 'B', 1, '10', '10', NULL, NULL, 0, '2026-02-05 20:51:45', '2026-02-05 20:51:50');
INSERT INTO `py_answer_record` VALUES (21, 4, 69, 'single_choice', 'B', 'B', 1, '10', '10', NULL, NULL, 0, '2026-02-05 20:51:45', '2026-02-05 20:51:52');
INSERT INTO `py_answer_record` VALUES (22, 4, 10, 'multiple_choice', 'B', 'A,B', 0, '10', '0', NULL, NULL, 0, '2026-02-05 20:51:45', '2026-02-05 20:51:54');
INSERT INTO `py_answer_record` VALUES (23, 5, 6, 'single_choice', 'B', 'B', 1, '10', '10', NULL, NULL, 0, '2026-03-10 11:28:34', '2026-03-10 11:28:36');
INSERT INTO `py_answer_record` VALUES (24, 5, 68, 'single_choice', 'B', 'B', 1, '10', '10', NULL, NULL, 0, '2026-03-10 11:28:34', '2026-03-10 11:28:38');
INSERT INTO `py_answer_record` VALUES (25, 5, 69, 'single_choice', 'B', 'B', 1, '10', '10', NULL, NULL, 0, '2026-03-10 11:28:34', '2026-03-10 11:28:41');
INSERT INTO `py_answer_record` VALUES (26, 5, 10, 'multiple_choice', 'A,B', 'A,B', 1, '10', '10', NULL, NULL, 0, '2026-03-10 11:28:34', '2026-03-10 11:28:46');

-- ----------------------------
-- Table structure for py_exam_record
-- ----------------------------
DROP TABLE IF EXISTS `py_exam_record`;
CREATE TABLE `py_exam_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考试记录ID',
  `paperId` int(11) NOT NULL COMMENT '试卷ID',
  `paperName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '试卷名称（冗余字段，便于查询）',
  `studentId` int(11) NOT NULL COMMENT '学生ID',
  `studentName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名（冗余字段，便于查询）',
  `startTime` datetime(0) NOT NULL COMMENT '开始时间',
  `endTime` datetime(0) DEFAULT NULL COMMENT '结束时间',
  `submitTime` datetime(0) DEFAULT NULL COMMENT '提交时间',
  `totalScore` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '试卷总分（字符串存储）',
  `obtainedScore` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '获得分数（字符串存储）',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'in_progress' COMMENT '状态：in_progress-进行中，submitted-已提交，graded-已批阅',
  `reviewStatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pending' COMMENT '批阅状态：pending-待批阅，reviewing-批阅中，completed-已完成',
  `reviewerId` int(11) DEFAULT NULL COMMENT '批阅人ID',
  `reviewerName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批阅人姓名',
  `reviewTime` datetime(0) DEFAULT NULL COMMENT '批阅时间',
  `reviewRemark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '批阅备注',
  `createTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_paperId`(`paperId`) USING BTREE,
  INDEX `idx_studentId`(`studentId`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_reviewStatus`(`reviewStatus`) USING BTREE,
  INDEX `idx_submitTime`(`submitTime`) USING BTREE,
  INDEX `idx_createTime`(`createTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '考试记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of py_exam_record
-- ----------------------------
INSERT INTO `py_exam_record` VALUES (1, 1, '小学一年级试卷', 1, 'admin', '2025-12-06 16:59:25', NULL, '2025-12-06 17:08:20', '60.00', '15.00', 'graded', 'completed', 1, 'admin', '2025-12-06 19:07:58', NULL, '2025-12-06 16:59:25', '2025-12-06 19:07:58');
INSERT INTO `py_exam_record` VALUES (3, 1, '小学一年级试卷', 10, 'user222', '2025-12-06 19:09:19', NULL, '2025-12-06 19:09:53', '60.00', '16.00', 'graded', 'completed', 1, 'admin', '2025-12-06 19:11:46', NULL, '2025-12-06 19:09:19', '2025-12-06 19:11:46');
INSERT INTO `py_exam_record` VALUES (4, 3, '测试社区', 2, 'user1', '2026-02-05 20:51:45', NULL, '2026-02-05 20:51:59', '40.00', '30.00', 'graded', 'completed', 1, 'admin', '2026-02-05 20:52:43', NULL, '2026-02-05 20:51:45', '2026-02-05 20:52:43');
INSERT INTO `py_exam_record` VALUES (5, 3, '测试社区', 11, '123123', '2026-03-10 11:28:34', NULL, '2026-03-10 11:28:48', '40.00', '40.00', 'graded', 'completed', 3, 't1', '2026-03-10 11:29:21', NULL, '2026-03-10 11:28:34', '2026-03-10 11:29:21');

-- ----------------------------
-- Table structure for py_knowledge_base
-- ----------------------------
DROP TABLE IF EXISTS `py_knowledge_base`;
CREATE TABLE `py_knowledge_base`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '知识库ID',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `summary` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '摘要',
  `knowledgePoint` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '知识点（JSON数组或逗号分隔）',
  `subject` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学科（数学、语文、英语等）',
  `grade` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '年级（一年级、二年级等）',
  `attachmentUrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '知识附件URL（JSON数组，支持多个附件）',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '详细内容',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `authorId` int(11) NOT NULL COMMENT '创建人ID',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'enabled' COMMENT '状态：enabled-启用，disabled-禁用',
  `viewCount` int(11) NOT NULL DEFAULT 0 COMMENT '浏览次数',
  `createTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE,
  INDEX `idx_grade`(`grade`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_authorId`(`authorId`) USING BTREE,
  INDEX `idx_createTime`(`createTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '知识库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of py_knowledge_base
-- ----------------------------
INSERT INTO `py_knowledge_base` VALUES (1, '加法运算基础', '学习加法的基本概念和运算方法', '[\"加法\", \"运算\", \"基础\"]', '数学', '一年级', '[\"/upload/1136aa3121e7475e940235ff92acd6f0.doc\"]', '加法是数学中最基本的运算之一，通过本知识点学习加法的概念、运算方法和应用。', '系统管理员', 1, 'enabled', 7, '2025-11-11 16:00:00', '2026-03-10 11:27:29');
INSERT INTO `py_knowledge_base` VALUES (2, '减法运算基础', '学习减法的基本概念和运算方法', '[\"减法\",\"运算\",\"基础\"]', '数学', '一年级', '[\"/upload/knowledge/sub_basic.pdf\"]', '减法是加法的逆运算，通过本知识点学习减法的概念、运算方法和应用。', '系统管理员', 1, 'enabled', 1, '2025-11-11 16:00:00', '2026-02-05 20:50:30');
INSERT INTO `py_knowledge_base` VALUES (3, '乘法口诀表', '学习乘法口诀，掌握1-9的乘法运算', '[\"乘法\",\"口诀\",\"运算\"]', '数学', '二年级', '[\"/upload/knowledge/multiplication_table.pdf\"]', '乘法口诀是学习乘法的基础，通过背诵和练习掌握乘法运算。', '系统管理员', 1, 'enabled', 1, '2025-11-11 16:00:00', '2025-12-06 18:46:05');

-- ----------------------------
-- Table structure for py_knowledge_relation
-- ----------------------------
DROP TABLE IF EXISTS `py_knowledge_relation`;
CREATE TABLE `py_knowledge_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `sourceId` int(11) NOT NULL COMMENT '源知识ID',
  `targetId` int(11) NOT NULL COMMENT '目标知识ID',
  `relationType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'related' COMMENT '关联类型：prerequisite-前置知识，related-相关，similar-相似，extends-扩展',
  `weight` decimal(5, 2) DEFAULT 1.00 COMMENT '关联权重（0-1之间）',
  `createTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_source_target`(`sourceId`, `targetId`, `relationType`) USING BTREE COMMENT '防止重复关联',
  INDEX `idx_sourceId`(`sourceId`) USING BTREE,
  INDEX `idx_targetId`(`targetId`) USING BTREE,
  INDEX `idx_relationType`(`relationType`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '知识图谱关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of py_knowledge_relation
-- ----------------------------
INSERT INTO `py_knowledge_relation` VALUES (1, 1, 2, 'related', 0.80, '2025-11-11 16:00:00');
INSERT INTO `py_knowledge_relation` VALUES (2, 1, 3, 'prerequisite', 0.60, '2025-11-11 16:00:00');
INSERT INTO `py_knowledge_relation` VALUES (3, 2, 3, 'prerequisite', 0.60, '2025-11-11 16:00:00');

-- ----------------------------
-- Table structure for py_paper
-- ----------------------------
DROP TABLE IF EXISTS `py_paper`;
CREATE TABLE `py_paper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试卷ID',
  `paperName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '试卷名称',
  `duration` int(11) DEFAULT 60 COMMENT '考试时长（分钟）',
  `startTime` datetime(0) DEFAULT NULL COMMENT '开放开始时间',
  `endTime` datetime(0) DEFAULT NULL COMMENT '开放结束时间',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '试卷介绍',
  `imageUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '试卷图片URL',
  `totalScore` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '试卷总分（字符串存储）',
  `questionCount` int(11) DEFAULT 0 COMMENT '题目数量',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'enabled' COMMENT '状态：enabled-启用，disabled-禁用',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `authorId` int(11) DEFAULT NULL COMMENT '创建人ID',
  `createTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_authorId`(`authorId`) USING BTREE,
  INDEX `idx_createTime`(`createTime`) USING BTREE,
  INDEX `idx_startTime`(`startTime`) USING BTREE,
  INDEX `idx_endTime`(`endTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of py_paper
-- ----------------------------
INSERT INTO `py_paper` VALUES (1, '小学一年级试卷', 60, '2026-02-01 20:25:34', '2026-02-28 20:25:36', '小学一年级试卷小学一年级试卷', '/upload/df4cea1bfe6b46609aef283199ca79a0.jpg', '60.00', 6, 'enabled', 'admin', 1, '2025-12-06 14:52:45', '2026-02-05 20:25:45');
INSERT INTO `py_paper` VALUES (2, '12312测试试卷', 60, '2026-02-06 04:29:11', '2026-03-01 04:29:20', '测试', '/upload/f4110ada4c6640d8b9bd2d14c50957ab.jpg', '20.00', 2, 'enabled', 'admin', 1, '2025-12-06 19:07:05', '2026-02-05 20:32:54');
INSERT INTO `py_paper` VALUES (3, '测试社区', 60, '2026-02-04 08:00:00', '2026-03-20 11:28:17', '测试测试', '/upload/50bdb87430c549208e264bbd272a12f6.jpg', '40.00', 4, 'enabled', 't1', 3, '2026-02-05 20:50:08', '2026-03-10 11:28:20');

-- ----------------------------
-- Table structure for py_paper_question
-- ----------------------------
DROP TABLE IF EXISTS `py_paper_question`;
CREATE TABLE `py_paper_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关系ID',
  `paperId` int(11) NOT NULL COMMENT '试卷ID',
  `questionId` int(11) NOT NULL COMMENT '题目ID',
  `orderNum` int(11) DEFAULT 0 COMMENT '题目顺序',
  `score` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '题目分值（字符串存储，如果为空则使用题目默认分值）',
  `createTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_paper_question`(`paperId`, `questionId`) USING BTREE COMMENT '防止重复添加同一题目',
  INDEX `idx_paperId`(`paperId`) USING BTREE,
  INDEX `idx_questionId`(`questionId`) USING BTREE,
  INDEX `idx_orderNum`(`orderNum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试卷题目关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of py_paper_question
-- ----------------------------
INSERT INTO `py_paper_question` VALUES (1, 1, 22, 1, '10', '2025-12-06 14:53:04');
INSERT INTO `py_paper_question` VALUES (2, 1, 2, 2, '10', '2025-12-06 14:53:04');
INSERT INTO `py_paper_question` VALUES (3, 1, 75, 3, '10', '2025-12-06 14:53:04');
INSERT INTO `py_paper_question` VALUES (4, 1, 34, 4, '15', '2025-12-06 14:53:04');
INSERT INTO `py_paper_question` VALUES (5, 1, 35, 5, '5', '2025-12-06 14:53:04');
INSERT INTO `py_paper_question` VALUES (6, 1, 69, 6, '10', '2025-12-06 14:53:51');
INSERT INTO `py_paper_question` VALUES (7, 2, 47, 1, '10', '2025-12-06 19:12:08');
INSERT INTO `py_paper_question` VALUES (8, 2, 82, 2, '10', '2025-12-06 19:12:08');
INSERT INTO `py_paper_question` VALUES (9, 3, 6, 1, '10', '2026-02-05 20:51:20');
INSERT INTO `py_paper_question` VALUES (10, 3, 68, 2, '10', '2026-02-05 20:51:20');
INSERT INTO `py_paper_question` VALUES (11, 3, 69, 3, '10', '2026-02-05 20:51:20');
INSERT INTO `py_paper_question` VALUES (12, 3, 10, 4, '10', '2026-02-05 20:51:20');

-- ----------------------------
-- Table structure for py_question_bank
-- ----------------------------
DROP TABLE IF EXISTS `py_question_bank`;
CREATE TABLE `py_question_bank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题目ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题目内容',
  `questionType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题型：single_choice-单选题，multiple_choice-多选题，fill_blank-填空题，essay-解答题，judge-判断题',
  `optionA` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '选项A',
  `optionB` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '选项B',
  `optionC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '选项C',
  `optionD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '选项D',
  `score` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '10' COMMENT '分值（字符串存储）',
  `imageUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '题目图片URL',
  `correctAnswer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '正确答案（多选题用逗号分隔，如：A,B）',
  `analysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '题目解析',
  `subject` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属学科（可选）',
  `grade` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属年级（可选）',
  `knowledgeId` int(11) DEFAULT NULL COMMENT '关联知识库ID（可选）',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '题型分类（可选）：四则运算、代数方程、几何证明、函数分析等',
  `difficultyLevel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'AI评估的难度等级：简单、中等、困难',
  `difficultyScore` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'AI评估的难度系数（0-1）',
  `aiKnowledgePoints` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'AI分析的知识点（JSON数组）',
  `aiAnalysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'AI分析说明',
  `isAIGenerated` tinyint(1) DEFAULT 0 COMMENT '是否AI生成（0-否，1-是）',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'enabled' COMMENT '状态：enabled-启用，disabled-禁用',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `authorId` int(11) DEFAULT NULL COMMENT '创建人ID',
  `createTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_questionType`(`questionType`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE,
  INDEX `idx_grade`(`grade`) USING BTREE,
  INDEX `idx_knowledgeId`(`knowledgeId`) USING BTREE,
  INDEX `idx_category`(`category`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_createTime`(`createTime`) USING BTREE,
  INDEX `idx_difficultyLevel`(`difficultyLevel`) USING BTREE,
  INDEX `idx_isAIGenerated`(`isAIGenerated`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '题库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of py_question_bank
-- ----------------------------
INSERT INTO `py_question_bank` VALUES (1, '计算：2 + 3 = ?', 'single_choice', '4', '5', '6', '7', '10', NULL, 'B', '2加3等于5', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-11-11 16:00:00', '2025-11-11 16:00:00');
INSERT INTO `py_question_bank` VALUES (2, '以下哪些是偶数？', 'multiple_choice', '2', '3', '4', '5', '10', NULL, 'A,C', '偶数是能被2整除的数，2和4都是偶数', '数学', '二年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-11-11 16:00:00', '2025-11-11 16:00:00');
INSERT INTO `py_question_bank` VALUES (3, '1 + 1 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '2', '1加1等于2', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-11-11 16:00:00', '2025-11-11 16:00:00');
INSERT INTO `py_question_bank` VALUES (4, '请说明加法和减法的关系', 'essay', NULL, NULL, NULL, NULL, '20', NULL, '加法和减法是互为逆运算的关系。加法是将两个数合并，减法是已知和与其中一个加数，求另一个加数。', '加法和减法是互为逆运算的关系。加法是将两个数合并，减法是已知和与其中一个加数，求另一个加数。', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-11-11 16:00:00', '2025-11-11 16:00:00');
INSERT INTO `py_question_bank` VALUES (5, '2是偶数', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '2能被2整除，所以2是偶数', '数学', '二年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-11-11 16:00:00', '2025-11-11 16:00:00');
INSERT INTO `py_question_bank` VALUES (6, '计算：3 + 4 = ?', 'single_choice', '6', '7', '8', '9', '10', NULL, 'B', '3加4等于7', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (7, '计算：8 - 3 = ?', 'single_choice', '4', '5', '6', '7', '10', NULL, 'B', '8减3等于5', '数学', '一年级', 2, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (8, '5 + 2 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '7', '5加2等于7', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (9, '9 - 4 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '5', '9减4等于5', '数学', '一年级', 2, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (10, '以下哪些数字小于5？', 'multiple_choice', '3', '4', '6', '7', '10', NULL, 'A,B', '3和4都小于5', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (11, '1是奇数', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '1不能被2整除，所以是奇数', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (12, '计算：6 + 1 = ?', 'single_choice', '5', '6', '7', '8', '10', NULL, 'C', '6加1等于7', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (13, '10 - 5 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '5', '10减5等于5', '数学', '一年级', 2, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (14, '2 + 3 + 4 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '9', '先算2+3=5，再算5+4=9', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (15, '以下哪些是单数？', 'multiple_choice', '1', '2', '3', '4', '10', NULL, 'A,C', '1和3都是单数（奇数）', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (16, '0是偶数', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '0能被2整除，所以是偶数', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (17, '计算：7 + 2 = ?', 'single_choice', '8', '9', '10', '11', '10', NULL, 'B', '7加2等于9', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (18, '8 - 2 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '6', '8减2等于6', '数学', '一年级', 2, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (19, '请说明什么是加法', 'essay', NULL, NULL, NULL, NULL, '15', NULL, '加法是把两个或多个数合并在一起，得到它们的总和。例如：2+3=5，就是把2和3合并得到5。', '加法是把两个或多个数合并在一起，得到它们的总和。例如：2+3=5，就是把2和3合并得到5。', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (20, '5比3大', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '5确实比3大', '数学', '一年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (21, '计算：3 × 4 = ?', 'single_choice', '10', '12', '14', '16', '10', NULL, 'B', '3乘以4等于12', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (22, '计算：15 ÷ 3 = ?', 'single_choice', '3', '4', '5', '6', '10', NULL, 'C', '15除以3等于5', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (23, '2 × 5 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '10', '2乘以5等于10', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (24, '18 ÷ 2 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '9', '18除以2等于9', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (25, '以下哪些是3的倍数？', 'multiple_choice', '6', '7', '9', '10', '10', NULL, 'A,C', '6和9都是3的倍数', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (26, '4 × 3 = 3 × 4', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '乘法满足交换律，4×3=3×4', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (27, '计算：6 × 7 = ?', 'single_choice', '40', '42', '44', '46', '10', NULL, 'B', '6乘以7等于42', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (28, '24 ÷ 4 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '6', '24除以4等于6', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (29, '计算：5 × 8 = ?', 'single_choice', '38', '40', '42', '45', '10', NULL, 'B', '5乘以8等于40', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (30, '以下哪些是偶数？', 'multiple_choice', '12', '13', '14', '15', '10', NULL, 'A,C', '12和14都是偶数', '数学', '二年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (31, '任何数乘以0都等于0', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '0乘以任何数都等于0', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (32, '计算：9 × 6 = ?', 'single_choice', '52', '54', '56', '58', '10', NULL, 'B', '9乘以6等于54', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (33, '35 ÷ 5 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '7', '35除以5等于7', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (34, '请说明乘法和加法的关系', 'essay', NULL, NULL, NULL, NULL, '15', NULL, '乘法是加法的简便运算。例如：3×4表示3个4相加，即4+4+4=12。乘法可以快速计算相同数的多次相加。', '乘法是加法的简便运算。例如：3×4表示3个4相加，即4+4+4=12。乘法可以快速计算相同数的多次相加。', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (35, '任何数除以1都等于它本身', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '例如：5÷1=5，任何数除以1都等于它本身', '数学', '二年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (36, '计算：125 + 237 = ?', 'single_choice', '350', '362', '372', '382', '10', NULL, 'B', '125+237=362', '数学', '三年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (37, '计算：456 - 189 = ?', 'single_choice', '257', '267', '277', '287', '10', NULL, 'B', '456-189=267', '数学', '三年级', 2, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (38, '234 + 567 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '801', '234+567=801', '数学', '三年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (39, '789 - 456 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '333', '789-456=333', '数学', '三年级', 2, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (40, '以下哪些数大于500？', 'multiple_choice', '498', '501', '499', '502', '10', NULL, 'B,D', '501和502都大于500', '数学', '三年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (41, '1000是四位数', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '1000确实有4个数字', '数学', '三年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (42, '计算：23 × 4 = ?', 'single_choice', '88', '90', '92', '94', '10', NULL, 'C', '23×4=92', '数学', '三年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (43, '计算：84 ÷ 4 = ?', 'single_choice', '19', '20', '21', '22', '10', NULL, 'C', '84÷4=21', '数学', '三年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (44, '56 × 3 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '168', '56×3=168', '数学', '三年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (45, '96 ÷ 6 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '16', '96÷6=16', '数学', '三年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (46, '以下哪些是5的倍数？', 'multiple_choice', '25', '26', '30', '31', '10', NULL, 'A,C', '25和30都是5的倍数', '数学', '三年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (47, '一个正方形的边长是5厘米，它的周长是多少厘米？', 'single_choice', '15', '20', '25', '30', '10', NULL, 'B', '正方形周长=边长×4=5×4=20厘米', '数学', '三年级', NULL, '几何证明', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (48, '一个长方形的长是8米，宽是5米，它的面积是多少平方米？', 'single_choice', '35', '38', '40', '45', '10', NULL, 'C', '长方形面积=长×宽=8×5=40平方米', '数学', '三年级', NULL, '几何证明', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (49, '请说明什么是周长', 'essay', NULL, NULL, NULL, NULL, '15', NULL, '周长是指封闭图形一周的长度。例如，正方形的周长等于4条边的长度之和，长方形的周长等于（长+宽）×2。', '周长是指封闭图形一周的长度。例如，正方形的周长等于4条边的长度之和，长方形的周长等于（长+宽）×2。', '数学', '三年级', NULL, '几何证明', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (50, '所有正方形的边长都相等', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '正方形定义就是四条边都相等的四边形', '数学', '三年级', NULL, '几何证明', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (51, '计算：1234 + 5678 = ?', 'single_choice', '6800', '6900', '6912', '7000', '10', NULL, 'C', '1234+5678=6912', '数学', '四年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (52, '计算：9876 - 5432 = ?', 'single_choice', '4444', '4445', '4446', '4447', '10', NULL, 'A', '9876-5432=4444', '数学', '四年级', 2, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (53, '计算：234 × 5 = ?', 'single_choice', '1150', '1160', '1170', '1180', '10', NULL, 'C', '234×5=1170', '数学', '四年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (54, '计算：648 ÷ 8 = ?', 'single_choice', '79', '80', '81', '82', '10', NULL, 'C', '648÷8=81', '数学', '四年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (55, '以下哪些数是3的倍数？', 'multiple_choice', '123', '124', '126', '127', '10', NULL, 'A,C', '123和126都是3的倍数', '数学', '四年级', 3, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (56, '解方程：x + 5 = 12，x = ?', 'single_choice', '5', '6', '7', '8', '10', NULL, 'C', 'x+5=12，所以x=12-5=7', '数学', '四年级', NULL, '代数方程', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (57, '解方程：x - 8 = 15，x = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '23', 'x-8=15，所以x=15+8=23', '数学', '四年级', NULL, '代数方程', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (58, '解方程：3x = 18，x = ?', 'single_choice', '5', '6', '7', '8', '10', NULL, 'B', '3x=18，所以x=18÷3=6', '数学', '四年级', NULL, '代数方程', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (59, 'x ÷ 4 = 9，x = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '36', 'x÷4=9，所以x=9×4=36', '数学', '四年级', NULL, '代数方程', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (60, '一个三角形的三个内角分别是60°、70°、50°，这个三角形是什么三角形？', 'single_choice', '锐角三角形', '直角三角形', '钝角三角形', '无法确定', '10', NULL, 'A', '三个角都小于90°，所以是锐角三角形', '数学', '四年级', NULL, '几何证明', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (61, '一个圆的半径是5厘米，它的直径是多少厘米？', 'single_choice', '8', '10', '12', '15', '10', NULL, 'B', '直径=半径×2=5×2=10厘米', '数学', '四年级', NULL, '几何证明', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (62, '以下哪些是质数？', 'multiple_choice', '7', '8', '11', '12', '10', NULL, 'A,C', '7和11都是质数', '数学', '四年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (63, '所有偶数都是合数', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'B', '2是偶数，但2是质数，不是合数', '数学', '四年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (64, '请说明什么是质数', 'essay', NULL, NULL, NULL, NULL, '15', NULL, '质数是大于1的自然数，除了1和它本身外，不能被其他自然数整除的数。例如：2、3、5、7、11等都是质数。', '质数是大于1的自然数，除了1和它本身外，不能被其他自然数整除的数。例如：2、3、5、7、11等都是质数。', '数学', '四年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (65, '三角形的内角和等于180°', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '这是三角形的基本性质', '数学', '四年级', NULL, '几何证明', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (66, '计算：12.5 + 8.7 = ?', 'single_choice', '20.2', '21.2', '21.3', '22.2', '10', NULL, 'B', '12.5+8.7=21.2', '数学', '五年级', 1, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (67, '计算：15.6 - 7.8 = ?', 'single_choice', '7.6', '7.8', '8.6', '8.8', '10', NULL, 'B', '15.6-7.8=7.8', '数学', '五年级', 2, '四则运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:06:12', '2025-12-05 23:06:12');
INSERT INTO `py_question_bank` VALUES (68, '2 + 3 = ?', 'single_choice', '4', '5', '6', '7', '10', NULL, 'B', '2加3等于5', '数学', '一年级', 1, '加法', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (69, '7 - 4 = ?', 'single_choice', '2', '3', '4', '5', '10', NULL, 'B', '7减4等于3', '数学', '一年级', 1, '减法', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (70, '4 + __ = 6', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '2', '4加2等于6', '数学', '一年级', 1, '加法', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (71, '数字5比3大', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '5 > 3，说法正确', '数学', '一年级', 1, '数的大小', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (72, '以下哪些是奇数？', 'multiple_choice', '1', '2', '3', '4', '10', NULL, 'A,C', '1和3不能被2整除，是奇数', '数学', '一年级', 1, '奇偶性', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (73, '计算：9 + 6 = ?', 'single_choice', '14', '15', '16', '17', '10', NULL, 'B', '9加6等于15', '数学', '二年级', 1, '进位加法', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (74, '56 - 28 = ?', 'single_choice', '26', '27', '28', '29', '10', NULL, 'C', '56减28等于28', '数学', '二年级', 2, '退位减法', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (75, '7 × 5 = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '35', '五七三十五', '数学', '二年级', 1, '乘法口诀', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (76, '把18颗糖平均分给6个小朋友，每人分__颗', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '3', '18 ÷ 6 = 3', '数学', '二年级', 2, '除法', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (77, '下列算式结果等于12的是？', 'multiple_choice', '6+6', '8+5', '9+3', '10+1', '10', NULL, 'A,C', '6+6=12，9+3=12', '数学', '二年级', 2, '加法', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (78, '305 + 298 = ?', 'single_choice', '600', '603', '613', '623', '10', NULL, 'B', '305+298=603', '数学', '三年级', 2, '三位数加法', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (79, '正方形边长为4厘米，周长是__厘米', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '16', '周长 = 4 × 4 = 16', '数学', '三年级', 2, '图形周长', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (80, '1/4 和 1/5 哪个更大？', 'single_choice', '1/4', '1/5', '一样大', '无法比较', '10', NULL, 'A', '分子相同，分母小的分数更大', '数学', '三年级', 2, '分数比较', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (81, '1小时 = __分钟', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '60', '1小时等于60分钟', '数学', '三年级', 1, '时间单位', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (82, '以下哪些是长度单位？', 'multiple_choice', '米', '千克', '厘米', '秒', '10', NULL, 'A,C', '米和厘米是长度单位', '数学', '三年级', 2, '计量单位', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (83, '48 × 25 = ?', 'single_choice', '1000', '1100', '1200', '1300', '10', NULL, 'C', '48×25=1200', '数学', '四年级', 2, '两位数乘法', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (84, '三角形内角和是__度', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '180', '任意三角形内角和为180度', '数学', '四年级', 2, '几何基础', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (85, '0.75 等于几分之几？', 'single_choice', '1/4', '3/4', '2/3', '4/5', '10', NULL, 'B', '0.75 = 3/4', '数学', '四年级', 2, '小数与分数', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (86, '16和24的最大公因数是__', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '8', '16的因数：1,2,4,8,16；24的因数：1,2,3,4,6,8,12,24；最大公因数是8', '数学', '四年级', 3, '因数', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (87, '下列哪些数是合数？', 'multiple_choice', '4', '5', '6', '7', '10', NULL, 'A,C', '4和6除了1和自身还有其他因数，是合数', '数学', '四年级', 3, '质数与合数', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (88, '解方程：3x - 5 = 10，x = ?', 'single_choice', '3', '4', '5', '6', '10', NULL, 'C', '3x=15，x=5', '数学', '五年级', 3, '简易方程', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (89, '圆的面积公式是__', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, 'πr²', '圆的面积 = π × 半径的平方', '数学', '五年级', 3, '圆', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (90, '1升 = __毫升', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '1000', '1升等于1000毫升', '数学', '五年级', 2, '容积单位', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (91, '下列图形中，对称轴最多的是？', 'single_choice', '长方形', '正方形', '等边三角形', '圆', '10', NULL, 'D', '圆有无数条对称轴', '数学', '五年级', 3, '对称图形', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (92, '假分数的分子大于或等于分母', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '这是假分数的定义', '数学', '五年级', 2, '分数', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (93, '-3 + 7 = ?', 'single_choice', '-10', '4', '-4', '10', '10', NULL, 'B', '-3加7等于4', '数学', '六年级', 2, '负数运算', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (94, '一件商品打八折后售价80元，原价是__元', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '100', '80 ÷ 0.8 = 100', '数学', '六年级', 3, '百分数应用', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (95, '如果 3 : x = 6 : 10，那么 x = ?', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '5', '3/x = 6/10 → x = 5', '数学', '六年级', 3, '比例', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (96, '下列哪些数小于0？', 'multiple_choice', '-2', '0', '-0.1', '1', '10', NULL, 'A,C', '-2和-0.1是负数，小于0', '数学', '六年级', 2, '有理数', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (97, '圆锥体积是同底同高圆柱体积的三分之一', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', 'V_圆锥 = (1/3)πr²h，V_圆柱 = πr²h', '数学', '六年级', 3, '立体几何', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (98, '若 a < b，则 a - 5 < b - 5', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '不等式两边同减5，方向不变', '数学', '七年级', 3, '不等式性质', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (99, '化简：5a - 2a + 4 = ?', 'single_choice', '3a + 4', '7a + 4', '3a - 4', '5a - 2', '10', NULL, 'A', '5a - 2a = 3a，结果为3a+4', '数学', '七年级', 2, '整式加减', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (100, '(-3)² = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '9', '负数的偶次幂为正', '数学', '七年级', 3, '有理数乘方', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (101, '下列哪些是代数式？', 'multiple_choice', '2x + 1', '3 + 5 = 8', 'a²', 'x = 2', '10', NULL, 'A,C', '代数式不含等号，2x+1和a²是代数式', '数学', '七年级', 2, '代数初步', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (102, '等式两边同时加同一个数，等式仍然成立', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '这是等式的基本性质', '数学', '七年级', 2, '方程基础', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (103, '函数 y = -x + 2 的图像经过第__象限', 'single_choice', '一、二、三', '一、二、四', '二、三、四', '一、三、四', '10', NULL, 'B', '斜率为负，截距为正，过一、二、四象限', '数学', '八年级', 3, '一次函数', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (104, '直角三角形两直角边分别为3和4，斜边长为__', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '5', '由勾股定理：√(3²+4²)=5', '数学', '八年级', 3, '勾股定理', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (105, '点 (-2, 3) 在第__象限', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '二', 'x<0, y>0，第二象限', '数学', '八年级', 2, '坐标系', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (106, '下列哪些是最简二次根式？', 'multiple_choice', '√8', '√3', '√12', '√5', '10', NULL, 'B,D', '√3和√5不能再开方，是最简二次根式', '数学', '八年级', 3, '二次根式', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (107, '矩形的对角线相等', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '这是矩形的重要性质', '数学', '八年级', 2, '特殊四边形', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (108, '方程 x² = 9 的解是？', 'single_choice', 'x=3', 'x=-3', 'x=±3', '无解', '10', NULL, 'C', 'x²=9 ⇒ x=3 或 x=-3', '数学', '九年级', 3, '一元二次方程', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (109, '抛物线 y = -x² + 4 的顶点坐标是__', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '(0,4)', 'y = -x² + 4 是顶点式，顶点为(0,4)', '数学', '九年级', 4, '二次函数', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (110, 'cos60° = ?', 'single_choice', '0', '1/2', '√2/2', '√3/2', '10', NULL, 'B', 'cos60° = 1/2', '数学', '九年级', 3, '锐角三角函数', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (111, '两个相似三角形的面积比等于相似比的平方', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '这是相似图形的重要性质', '数学', '九年级', 3, '相似', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (112, '掷一枚均匀骰子，出现偶数点的概率是？', 'single_choice', '1/6', '1/3', '1/2', '2/3', '10', NULL, 'C', '偶数点有2,4,6，共3种，概率=3/6=1/2', '数学', '九年级', 2, '概率', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (113, 'tan45° = __', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '1', 'tan45° = 对边/邻边 = 1', '数学', '九年级', 3, '三角函数', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (114, '下列事件中，属于必然事件的是？', 'multiple_choice', '太阳从西边升起', '水加热到100℃会沸腾（标准大气压）', '明天不下雨', '掷硬币正面朝上', '10', NULL, 'B', '在标准大气压下，水100℃沸腾是必然事件', '数学', '九年级', 2, '概率', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (115, '反比例函数 y = k/x（k>0）的图象在第__象限', 'fill_blank', NULL, NULL, NULL, NULL, '10', NULL, '一、三', 'k>0时，图象在一、三象限', '数学', '九年级', 4, '反比例函数', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (116, '一元二次方程 x² - 4x + 4 = 0 的根的情况是？', 'single_choice', '有两个不等实根', '有两个相等实根', '无实根', '无法判断', '10', NULL, 'B', '判别式 Δ = (-4)² - 4×1×4 = 0，有两个相等实根', '数学', '九年级', 4, '一元二次方程', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (117, 'sin²θ + cos²θ = 1 对任意角θ都成立', 'judge', '正确', '错误', NULL, NULL, '5', NULL, 'A', '这是三角恒等式', '数学', '九年级', 4, '三角函数', NULL, NULL, NULL, NULL, 0, 'enabled', '系统管理员', 1, '2025-12-05 23:19:36', '2025-12-05 23:19:36');
INSERT INTO `py_question_bank` VALUES (121, '小明去水果店买了3个苹果，每个苹果5元，他给了收银员20元，收银员应该找回给小明多少钱？', 'single_choice', '5元', '10元', '15元', '20元', '10', NULL, 'A', '首先，我们需要计算小明买苹果的总价。小明买了3个苹果，每个苹果5元，所以总价是3乘以5等于15元。然后，小明给了收银员20元，所以收银员应该找回的钱是20元减去15元，等于5元。', '数学', '一年级', NULL, NULL, '中等', '0.5', NULL, '本题需要学生先进行乘法运算得出苹果的总价，然后再进行减法运算得出找回的钱数。涉及两个基础运算步骤，对于一年级学生来说，需要一定的思维转换和计算能力，因此难度中等。', 1, 'enabled', 't1', 3, '2026-02-05 20:48:56', '2026-02-05 20:48:56');
INSERT INTO `py_question_bank` VALUES (122, '小明买了3个苹果，每个苹果的价格是5元，他付了20元后，还剩下多少钱没有用来买苹果？', 'single_choice', '0元', '5元', '10元', '15元', '10', NULL, 'B', '首先，我们计算小明买苹果所花费的总金额，即3个苹果每个5元，总共是15元。然后，我们从小明付的20元中减去这个金额，就可以得到他还剩下的钱，即20元减去15元等于5元。', '数学', '一年级', NULL, NULL, '中等', '0.5', NULL, '本题同样需要学生先进行乘法运算，再进行减法运算。虽然问题表述略有不同，但核心运算步骤和难度与上一题相似，需要学生具备一定的思维转换和计算能力，因此难度中等。', 1, 'enabled', 't1', 3, '2026-02-05 20:48:56', '2026-02-05 20:48:56');

-- ----------------------------
-- Table structure for py_user
-- ----------------------------
DROP TABLE IF EXISTS `py_user`;
CREATE TABLE `py_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生日',
  `card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学历',
  `profession` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '职业',
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公司/单位',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简介',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色(admin/teacher/user)',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'active' COMMENT '状态(active/locked/disabled)',
  `last_login_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后登录IP',
  `createtime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建时间',
  `updatetime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新时间',
  `reserve1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备用字段1',
  `reserve2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备用字段2',
  `reserve3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE COMMENT '用户名唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of py_user
-- ----------------------------
INSERT INTO `py_user` VALUES (1, 'admin', '123123', '系统管理员1', '/upload\\43033c616a13418ea4c6abeabfa549a5.jpg', '男', 30, '13211112222', 'admin@example.com', '1995-01-01', '110101199501010011', '北京市海淀区', '硕士', '系统管理员', '科技有限公司', '系统超级管理员，负责系统维护和用户管理', '系统内置管理员账号', 'admin', 'active', '2026-03-10 11:29:04', '127.0.0.1', '2025-07-20 10:10:10', '2026-03-10 11:29:04', NULL, NULL, NULL);
INSERT INTO `py_user` VALUES (2, 'user1', '123456', '王同学', '/upload/4ab1f74ddc9b40d683e563a4a9f98c6a.png', '男', 20, '13800138003', 'user1@example.com', '2005-05-15', '310101200505150033', '上海市浦东新区', '本科', '学生', '上海大学', '普通用户，系统测试账号', '测试账号', 'user', 'active', '2026-02-05 20:51:41', '127.0.0.1', '2025-07-20 10:10:10', '2026-02-05 20:51:41', NULL, NULL, NULL);
INSERT INTO `py_user` VALUES (3, 't1', '123456', '张老师', '/upload/4ab1f74ddc9b40d683e563a4a9f98c6a.png', NULL, NULL, '13922223333', 'teacher1@example.com', '1990-03-15', '330101199003150022', '杭州市西湖区', '博士', '大学教授', '浙江大学计算机科学系', '计算机科学教授，专注于人工智能和数据科学研究', '资深教师账号', 'doctor', 'active', '2026-03-10 11:29:14', '127.0.0.1', '2025-07-20 10:10:10', '2026-03-10 11:29:14', '高级讲师', '计算机科学', NULL);
INSERT INTO `py_user` VALUES (10, 'user222', '123456', 'user222', NULL, NULL, NULL, '13211112222', '123@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'user', 'active', '2025-12-06 19:12:24', '127.0.0.1', '2025-12-06 19:08:36', '2025-12-06 19:12:24', NULL, NULL, NULL);
INSERT INTO `py_user` VALUES (11, '123123', '123123', '123123', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'user', 'active', '2026-03-10 11:28:29', '127.0.0.1', '2026-03-10 11:27:18', '2026-03-10 11:28:29', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for py_class
-- ----------------------------
CREATE TABLE IF NOT EXISTS `py_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) NOT NULL COMMENT '班级名称',
  `description` varchar(255) DEFAULT NULL COMMENT '班级描述',
  `status` varchar(20) NOT NULL DEFAULT 'active' COMMENT '状态',
  `createtime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `updatetime` varchar(255) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_class_name` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级表';

ALTER TABLE `py_user`
ADD COLUMN `class_id` int(11) DEFAULT NULL COMMENT '班级ID' AFTER `status`;

ALTER TABLE `py_user`
ADD COLUMN `grade` varchar(50) DEFAULT NULL COMMENT '年级' AFTER `class_id`;

INSERT INTO `py_class` (`class_name`, `description`, `status`, `createtime`, `updatetime`)
VALUES
('高一(1)班', '系统初始化班级', 'active', '2026-04-21 00:00:00', '2026-04-21 00:00:00'),
('高一(2)班', '系统初始化班级', 'active', '2026-04-21 00:00:00', '2026-04-21 00:00:00'),
('高二(1)班', '系统初始化班级', 'active', '2026-04-21 00:00:00', '2026-04-21 00:00:00')
ON DUPLICATE KEY UPDATE `updatetime` = VALUES(`updatetime`);

SET FOREIGN_KEY_CHECKS = 1;
