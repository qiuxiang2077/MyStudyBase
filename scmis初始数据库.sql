-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.43 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 导出  表 scmis.course 结构
DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `CNO` char(2) COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程号',
  `CNAME` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名',
  `CREDIT` int DEFAULT NULL COMMENT '学分',
  `C_TOTAL` int DEFAULT NULL COMMENT '选课人数',
  `CPNO` char(2) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '先修课程',
  PRIMARY KEY (`CNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程表';

-- 正在导出表  scmis.course 的数据：~6 rows (大约)
DELETE FROM `course`;
INSERT INTO `course` (`CNO`, `CNAME`, `CREDIT`, `C_TOTAL`, `CPNO`) VALUES
	('C1', '数据库', 3, 3, 'C5'),
	('C2', '数学', 3, 2, NULL),
	('C3', '信息系统', 4, 2, 'C1'),
	('C4', '操作系统', 2, 2, NULL),
	('C5', '数据结构', 3, 1, 'C6'),
	('C6', 'C语言', 2, 1, NULL);

-- 导出  表 scmis.sc 结构
DROP TABLE IF EXISTS `sc`;
CREATE TABLE IF NOT EXISTS `sc` (
  `SNO` char(5) COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号',
  `CNO` char(2) COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程号',
  `SCORE` int DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`SNO`,`CNO`),
  KEY `FK_c_sc` (`CNO`),
  CONSTRAINT `FK_c_sc` FOREIGN KEY (`CNO`) REFERENCES `course` (`CNO`),
  CONSTRAINT `FK_stu_sc` FOREIGN KEY (`SNO`) REFERENCES `student` (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='学习表';

-- 正在导出表  scmis.sc 的数据：~10 rows (大约)
DELETE FROM `sc`;
INSERT INTO `sc` (`SNO`, `CNO`, `SCORE`) VALUES
	('24001', 'C1', 92),
	('24001', 'C2', 85),
	('24001', 'C3', 88),
	('24002', 'C2', 90),
	('24002', 'C3', 80),
	('24003', 'C1', 76),
	('24003', 'C4', 82),
	('24004', 'C1', 55),
	('24004', 'C5', 75),
	('24004', 'C6', 77);

-- 导出  表 scmis.student 结构
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `sno` char(5) COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号',
  `sname` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `SSEX` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '男' COMMENT '性别',
  `SDEPT` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '系别',
  `SMAJOR` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '专业',
  `SAGE` int DEFAULT NULL COMMENT '年龄',
  `NATIVE` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '籍贯',
  `PHONE` char(7) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`sno`),
  CONSTRAINT `CC2` CHECK (((`SSEX` = _utf8mb4'男') or (`SSEX` = _utf8mb4'女')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  scmis.student 的数据：~4 rows (大约)
DELETE FROM `student`;
INSERT INTO `student` (`sno`, `sname`, `SSEX`, `SDEPT`, `SMAJOR`, `SAGE`, `NATIVE`, `PHONE`) VALUES
	('24001', '李勇', '男', 'CS', '软件工程', 20, '福建', '2692032'),
	('24002', '刘晨', '女', 'IS', '信息管理', 19, '福建', '2692437'),
	('24003', '王名', '女', 'MA', '计算数学', 18, '山东', '2690050'),
	('24004', '张立', '男', 'IS', '电子商务', 19, '湖北', '2692812');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
