/*
created by Xiaoma
Date: 2023-6-20
*/

create database example_system;

use example_system;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cno` varchar(10) NOT NULL,
  `cname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cpno` varchar(10) DEFAULT NULL,
  `ccredit` smallint(6) DEFAULT NULL,
  `tno` varchar(10) NOT NULL,
  `capacity` smallint(6) NOT NULL,
  PRIMARY KEY (`cno`),
  KEY `course_ibfk_1` (`cpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('62517', '计算机网络', '62687', '4', '09001', '110');
INSERT INTO `course` VALUES ('62540', '数据库系统概论', null, '3', '09001', '110');
INSERT INTO `course` VALUES ('62640', '树立逻辑', '70511', '3', '09009', '80');
INSERT INTO `course` VALUES ('62647', '数据结构', null, '4', '09002', '120');
INSERT INTO `course` VALUES ('62687', 'JAVA程序设计', null, '3', '09004', '100');
INSERT INTO `course` VALUES ('62695', 'C#程序设计', null, '2', '09011', '60');
INSERT INTO `course` VALUES ('70504', '计算方法', '70514', '2', '09008', '40');
INSERT INTO `course` VALUES ('70510', '操作系统原理与设计', '70504', '2', '09005', '80');
INSERT INTO `course` VALUES ('70512', '深度学习导论', null, '3', '09009', '70');
INSERT INTO `course` VALUES ('70513', '移动应用开发基础', '62687', '3', '09007', '90');
INSERT INTO `course` VALUES ('70514', ' Web开发基础', '70510', '3', '09008', '60');
INSERT INTO `course` VALUES ('70515', ' 设计模式', '70514', '3', '09008', '50');
INSERT INTO `course` VALUES ('70534', '计算机图形学', null, '3', '09011', '70');
INSERT INTO `course` VALUES ('70535', '数据可视化', null, '3', '09005', '90');
INSERT INTO `course` VALUES ('70537', '机器学习概论', '62647', '3', '09012', '60');
INSERT INTO `course` VALUES ('70903', '多媒体应用基础', '70512', '3', '09008', '64');

-- ----------------------------
-- Table structure for management
-- ----------------------------
DROP TABLE IF EXISTS `management`;
CREATE TABLE `management` (
  `mno` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` smallint(6) NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `intro` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`mno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of management
-- ----------------------------
INSERT INTO `management` VALUES ('150001', '管理员1', '女', '28', null, null, null, 'aaaaaa', null);
INSERT INTO `management` VALUES ('150002', '管理员2', '男', '28', null, null, null, 'aaaaaa', null);
INSERT INTO `management` VALUES ('150003', '管理员3', '男', '28', null, null, null, 'aaaaaa', null);
INSERT INTO `management` VALUES ('150004', '管理员4', '男', '28', null, null, null, 'aaaaaa', null);
INSERT INTO `management` VALUES ('150005', '管理员5', '男', '28', null, null, null, 'aaaaaa', null);
INSERT INTO `management` VALUES ('150006', '管理员6', '女', '28', null, null, null, 'aaaaaa', null);
INSERT INTO `management` VALUES ('150007', '管理员7', '女', '28', null, null, null, 'aaaaaa', null);
INSERT INTO `management` VALUES ('150008', '管理员8', '女', '28', null, null, null, 'aaaaaa', null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sno` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sage` smallint(6) NOT NULL,
  `admi_date` varchar(10) NOT NULL,
  `school` varchar(20) DEFAULT NULL,
  `sdept` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `hobby` varchar(50) DEFAULT NULL,
  `intro` varchar(200) DEFAULT NULL,
  `password` varchar(20) DEFAULT '123456',
  `avatar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2018327113028', '学生1', '男', '22', '2018/9/10', '信息学院', '数字媒体技术', null, '13035097298', null, null, '123456', null);
INSERT INTO `student` VALUES ('2018327130012', '学生2', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329600051', '学生3', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329600060', '学生4', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329600124', '学生5', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621001', '学生6', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621002', '学生7', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621009', '学生8', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621014', '学生9', '女', '22', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621018', '学生10', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621024', '学生11', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621025', '学生12', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621030', '学生13', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', '948324533@qq.com', null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621036', '学生14', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621037', '学生15', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621042', '学生16', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621043', '学生17', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621045', '学生18', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621047', '学生19', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621051', '学生20', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621058', '学生21', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621065', '学生22', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621071', '学生23', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621073', '学生24', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621079', '学生25', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621081', '学生26', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621084', '学生27', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621085', '学生28', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621089', '学生29', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621100', '学生30', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621101', '学生31', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621216', '学生32', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621226', '学生33', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018329621243', '学生34', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018331200240', '学生35', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018332871024', '学生36', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018333503190', '学生37', '男', '20', '2018/9/10', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018336711157', '学生38', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);
INSERT INTO `student` VALUES ('2018339960004', '学生39', '女', '19', '2018/9/9', '信息学院', '数字媒体技术', null, null, null, null, '123456', null);







-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc` (
  `sno` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cno` varchar(10) NOT NULL,
  `grade` smallint(6) DEFAULT NULL,
  `gradepo` float DEFAULT NULL,
  PRIMARY KEY (`sno`,`cno`),
  KEY `FK_STUDENT_SC02` (`cno`),
  KEY `sno` (`sno`),
  CONSTRAINT `sc_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('2018329621014', '62540', '79', '2.9');
INSERT INTO `sc` VALUES ('2018329621014', '70511', '90', '4');
INSERT INTO `sc` VALUES ('2018329621018', '70511', '91', '4.1');
INSERT INTO `sc` VALUES ('2018329621024', '62517', '88', '3.8');
INSERT INTO `sc` VALUES ('2018329621024', '62540', '80', '3');
INSERT INTO `sc` VALUES ('2018329621024', '62647', null, null);
INSERT INTO `sc` VALUES ('2018329621024', '62687', '88', '3.8');
INSERT INTO `sc` VALUES ('2018329621024', '70510', null, null);
INSERT INTO `sc` VALUES ('2018329621024', '70511', '80', '3');
INSERT INTO `sc` VALUES ('2018329621024', '70535', null, null);
INSERT INTO `sc` VALUES ('2018329621025', '70511', '89', '3.9');
INSERT INTO `sc` VALUES ('2018329621025', '70512', null, null);
INSERT INTO `sc` VALUES ('2018329621025', '70513', '88', '3.8');
INSERT INTO `sc` VALUES ('2018329621025', '70534', null, null);
INSERT INTO `sc` VALUES ('2018329621025', '70537', null, null);
INSERT INTO `sc` VALUES ('2018329621030', '62517', '94', '4.4');
INSERT INTO `sc` VALUES ('2018329621030', '62540', '90', '4');
INSERT INTO `sc` VALUES ('2018329621030', '62647', '82', '3.2');
INSERT INTO `sc` VALUES ('2018329621030', '62687', '78', '2.8');
INSERT INTO `sc` VALUES ('2018329621030', '62695', null, null);
INSERT INTO `sc` VALUES ('2018329621030', '70514', '85', '3.5');



-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tno` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` smallint(6) NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `intro` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '123456',
  `avatar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('09001', '教师1', '男', '20', null, null, null, '信息学院', 'aaaaaa', null);
INSERT INTO `teacher` VALUES ('09002', '教师2', '男', '21', null, null, null, '信息学院', 'aaaaaa', null);
INSERT INTO `teacher` VALUES ('09003', '教师3', '男', '22', null, null, null, '信息学院', 'aaaaaa', null);
INSERT INTO `teacher` VALUES ('09004', '教师4', '女', '23', null, null, null, '信息学院', 'aaaaaa', null);
INSERT INTO `teacher` VALUES ('09005', '教师5', '男', '24', null, null, null, '信息学院', 'aaaaaa', null);
INSERT INTO `teacher` VALUES ('09006', '教师6', '男', '25', null, null, null, '信息学院', 'aaaaaa', null);
INSERT INTO `teacher` VALUES ('09007', '教师7', '男', '26', null, null, null, '信息学院', 'aaaaaa', null);
INSERT INTO `teacher` VALUES ('09008', '教师8', '女', '27', null, null, null, '信息学院', 'aaaaaa', null);
INSERT INTO `teacher` VALUES ('09009', '教师9', '女', '28', null, null, null, '信息学院', 'aaaaaa', null);
INSERT INTO `teacher` VALUES ('09010', '教师10', '男', '29', null, null, null, '信息学院', 'aaaaaa', null);
INSERT INTO `teacher` VALUES ('09011', '教师11', '男', '30', null, null, null, '信息学院', 'aaaaaa', null);
INSERT INTO `teacher` VALUES ('09012', '教师12', '女', '31', null, null, null, '信息学院', 'aaaaaa', null);
INSERT INTO `teacher` VALUES ('09013', '教师13', '女', '32', null, null, null, '信息学院', 'aaaaaa', null);


-- ----------------------------
-- Table structure for teaching_eval
-- ----------------------------
DROP TABLE IF EXISTS `teaching_eval`;
CREATE TABLE `teaching_eval` (
  `tno` varchar(15) NOT NULL,
  `evaluation` varchar(20) DEFAULT NULL,
  `sno` varchar(15) NOT NULL,
  PRIMARY KEY (`tno`,`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of teaching_eval
-- ----------------------------
INSERT INTO `teaching_eval` VALUES ('09001', '满意', '2018329621030');
INSERT INTO `teaching_eval` VALUES ('09002', '非常满意', '2018329621030');
INSERT INTO `teaching_eval` VALUES ('09003', '非常满意', '2018329621030');
INSERT INTO `teaching_eval` VALUES ('09004', '非常满意', '2018329621030');
INSERT INTO `teaching_eval` VALUES ('09008', '非常满意', '2018329621030');

-- ----------------------------
-- Table structure for teaching_tasks
-- ----------------------------
DROP TABLE IF EXISTS `teaching_tasks`;
CREATE TABLE `teaching_tasks` (
  `tno` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cno` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `time` varchar(50) NOT NULL,
  PRIMARY KEY (`time`,`tno`,`cno`),
  KEY `cno` (`cno`),
  CONSTRAINT `teaching_tasks_ibfk_1` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of teaching_tasks
-- ----------------------------
INSERT INTO `teaching_tasks` VALUES ('09001', '62540', '课程设计', '按照题目', '2023/5/30 12:00');
INSERT INTO `teaching_tasks` VALUES ('09001', '62540', '第二课', '视频观看，并完成练习题', '2023/6/1 19:30');
INSERT INTO `teaching_tasks` VALUES ('09001', '62517', '本', '如果', '2023/6/29 22:09');
INSERT INTO `teaching_tasks` VALUES ('09001', '62517', '计算机网络', '？', '2023/7/8 20:55');
