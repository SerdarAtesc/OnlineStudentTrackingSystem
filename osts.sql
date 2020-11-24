-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
<<<<<<< Updated upstream
-- Host: localhost
-- Generation Time: Nov 23, 2020 at 08:14 PM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

=======
-- Host: 127.0.0.1    Database: osts
-- ------------------------------------------------------
-- Server version	8.0.17
>>>>>>> Stashed changes

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ateachers`
--

DROP TABLE IF EXISTS `ateachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ateachers` (
  `ateacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `ateacher_name` varchar(75) NOT NULL,
  `ateacher_lastname` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ateacher_phone` varchar(50) NOT NULL,
  `ateacher_mail` varchar(50) NOT NULL,
  PRIMARY KEY (`ateacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ateachers`
--

LOCK TABLES `ateachers` WRITE;
/*!40000 ALTER TABLE `ateachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ateachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_year` int(11) NOT NULL,
  `class_title` varchar(75) NOT NULL,
  `class_detail` text NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,2020,'1. Sınıf','1. Sınıflar burada yer almaktadır.',1),(2,2020,'2. Sınıf','2. Sınıflar burada yer almaktadır.',1),(3,2020,'3. Sınıf','3. Sınıflar burada yer almaktadır.',1),(4,2020,'4. Sınıf','4. Sınıflar burada yer almaktadır.',1),(5,2020,'5. Sınıf','5. Sınıflar burada yer almaktadır.',1),(6,2020,'6. Sınıf','6. Sınıflar burada yer almaktadır.',1),(7,2020,'7. Sınıf','7. Sınıflar burada yer almaktadır.',1),(8,2020,'8. Sınıf','8. Sınıflar burada yer almaktadır.',1);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework_publishs`
--

DROP TABLE IF EXISTS `homework_publishs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homework_publishs` (
  `publish_id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `publisher_text` text NOT NULL,
  `has_file` tinyint(1) NOT NULL,
  `file_path` varchar(75) NOT NULL,
  `publish_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`publish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework_publishs`
--

LOCK TABLES `homework_publishs` WRITE;
/*!40000 ALTER TABLE `homework_publishs` DISABLE KEYS */;
/*!40000 ALTER TABLE `homework_publishs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeworks`
--

DROP TABLE IF EXISTS `homeworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homeworks` (
  `homework_id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_title` varchar(75) NOT NULL,
  `homework_detail` text NOT NULL,
  `homework_create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `homework_assigner_id` int(11) NOT NULL,
  `homework_lecture_id` int(11) NOT NULL,
  `homework_student_id` int(11) NOT NULL,
  `homework_last_publish_date` datetime NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`homework_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeworks`
--

LOCK TABLES `homeworks` WRITE;
/*!40000 ALTER TABLE `homeworks` DISABLE KEYS */;
INSERT INTO `homeworks` VALUES (1,'Ödev başlığı','Ödev deneme ','2020-11-23 23:07:31',1,1,1,'0000-00-00 00:00:00',0),(2,'Test','detay','2020-11-23 23:10:10',1,1,1,'2020-11-30 23:10:10',1);
/*!40000 ALTER TABLE `homeworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture_teachers`
--

DROP TABLE IF EXISTS `lecture_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture_teachers` (
  `lecture_teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `lecture_id` int(11) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`lecture_teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture_teachers`
--

LOCK TABLES `lecture_teachers` WRITE;
/*!40000 ALTER TABLE `lecture_teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecture_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectures`
--

DROP TABLE IF EXISTS `lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lectures` (
  `lecture_id` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_year` int(11) NOT NULL,
  `lecture_title` varchar(75) NOT NULL,
  `lecture_detail` text NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`lecture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectures`
--

LOCK TABLES `lectures` WRITE;
/*!40000 ALTER TABLE `lectures` DISABLE KEYS */;
INSERT INTO `lectures` VALUES (1,2020,'Fen Bilgisi','Fen Eğitimi verilmektedir',1),(2,2020,'Türk Edebiyatı','Yeni nesil Türk Edebiyatından bahsedilir.',1),(3,2020,'Matematik','Limit ve Türev konuları ele alınmaktadır.',1);
/*!40000 ALTER TABLE `lectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) NOT NULL,
  `login_password` varchar(50) NOT NULL,
  `login_detail_id` int(11) NOT NULL,
  `login_type` tinyint(4) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'kullanici_adi','sifre',1,1,1),(2,'ahmet_bey','ahmet123',1,2,1),(3,'hakann','hakan123',2,1,1),(4,'serdar2','serdar',1,2,1),(6,'serdar','123',3,1,1),(7,'bilal','sifre',4,1,1),(9,'bilal2','sifre',6,1,1),(10,'asda','sdas',7,1,1),(11,'dsfgfdg','fghfgh',8,1,1),(12,'fghfgj','fgjfgjfg',9,1,1),(13,'asdas','asdas',10,1,1),(15,'sdfsdf','serdar',12,1,1),(16,'vbnvbnv','vbnvbn',13,1,1),(18,'yenibniir','dfhdfhfd',15,1,1),(19,'dfhdfh','dfhfgh',16,1,1),(22,'serdar353','dfgdf',19,1,1),(33,'serdar123','dfgdfg',30,1,1),(41,'serdar35','dsfgdf',38,1,1),(44,'serdar356','dsfgdf',41,1,1),(49,'serdartryrty','dsfgdf',46,1,1),(52,'sdfsd','serdar',49,1,1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_number` varchar(20) NOT NULL,
  `student_name` varchar(75) NOT NULL,
  `student_lastname` varchar(75) NOT NULL,
  `student_mail` varchar(75) NOT NULL,
  `student_phone` varchar(75) NOT NULL,
  `student_class_id` int(11) NOT NULL,
  `isActive` int(11) DEFAULT '1',
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_number` (`student_number`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'62244414','Test','Test','test@mail.com','5312456123',1,1),(2,'55181667','Ze','Te','zeze@mail.com','123456',4,1),(3,'12344','serdar','ates','serdar@gmail.çcom','123123',1,1),(4,'25865321','bilal','bilal','test@mail.com','5312456123',1,1),(5,'63139029','bilal2','bilal','test@mail.com','5312456123',1,1),(6,'21252775','bilal2','bilal','test@mail.com','5312456123',1,1),(7,'88868288','asd','asdas','asdas','123123',1,1),(8,'83520057','yenii','asdas','sdfsdf','4234234',1,1),(9,'50995425','asddfg','asda','dfgdfg','5654654',2,1),(10,'4416956','asd','asdasd','asdas','1231',1,1),(11,'69098507','sdf','sdfs','dsfsdf','324234',1,1),(12,'32241674','sdfsd','fsdfs','sdfsdf','34234',1,1),(13,'53912851','vbnbv','nvb','vbnvn','978987',2,1),(14,'53547681','vbnbv','nvb','vbnvn','978987',2,1),(15,'55493508','yenisss','hdfhd','dfgdfg','54654654',3,1),(16,'71540945','yenikayıt','kaı','dsgsdg','54645754',5,1),(17,'56964881','yenikayıt','kaı','dsgsdg','54645754',5,1),(18,'70201571','dfgd','fgdf','gdfgdfg','sdfsdf',1,1),(19,'80113218','dfgd','fgdf','gdfgdfg','sdfsdf',1,1),(20,'89961379','sdg','sdgsdfsd','fsdfsd','fsdfsd',1,1),(21,'9467245','sdg','sdgsdfsd','fsdfsd','fsdfsd',1,1),(22,'77452093','sdg','sdgsdfsd','fsdfsd','fsdfsd',1,1),(23,'58858735','sdg','sdgsdfsd','fsdfsd','fsdfsd',1,1),(24,'61937397','sdg','sdgsdfsd','fsdfsd','fsdfsd',1,1),(25,'33110784','sdg','sdgsdfsd','fsdfsd','fsdfsd',1,1),(26,'79741732','sdg','sdgsdfsd','fsdfsd','fsdfsd',1,1),(27,'99376312','sdg','sdgsdfsd','fsdfsd','fsdfsd',1,1),(28,'57656366','sdg','sdgsdfsd','fsdfsd','fsdfsd',1,1),(29,'90152898','sdg','sdgsdfsd','fsdfsd','fsdfsd',1,1),(30,'77795396','sdg','sdgsdfsd','fsdfsd','fsdfsd',1,1),(31,'18518290','dsf','sdfsdfs','dfsdfsd','fsdfsd',2,1),(32,'59205266','dfgdf','gdfgdf','gdfgdfg','4353454',1,1),(33,'8739821','sdf','sdfsdf','sdfsdfds','sdfsdf',1,1),(34,'65056176','sdf','sdfsdf','sdfsdfds','sdfsdf',1,1),(35,'99061422','sdf','sdfsdf','sdfsdfds','sdfsdf',1,1),(36,'138585','sdf','sdfsdf','sdfsdfds','sdfsdf',1,1),(37,'3508663','sdf','sdfsdf','sdfsdf','sdfsdf',2,1),(38,'17127563','sdf','sdfsdf','sdfsdf','sdfsdf',2,1),(39,'40659791','sdf','sdfsdf','sdfsdf','sdfsdf',2,1),(40,'719991','sdf','sdfsdf','sdfsdf','sdfsdf',2,1),(41,'81620584','sdf','sdfsdf','sdfsdf','sdfsdf',2,1),(42,'88789100','sdf','sdfsdf','sdfsdf','sdfsdf',2,1),(43,'55269557','sdf','sdfsdf','sdfsdf','sdfsdf',2,1),(44,'9980488','sdf','sdfsdf','sdfsdf','sdfsdf',2,1),(45,'84093774','sdf','sdfsdf','sdfsdf','sdfsdf',2,1),(46,'90527408','sdf','sdfsdf','sdfsdf','sdfsdf',2,1),(47,'355721','sdfsd','fsdf','sdfsdf','435345',1,1),(48,'30196387','sdfsd','fsdf','sdfsdf','435345',1,1),(49,'49914772','asdas','dasda','sdasd','435345',1,1),(50,'58984706','dsfs','fsdf','sdfsdf','4535',1,1),(51,'45179217','sdf','sdfsdf','sdfsdfsd','435345',1,1),(52,'33634782','sdf','sdfsdf','sdfsdf','34534',2,1);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--
<<<<<<< Updated upstream
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_HOMEWORK_ASSIGN` (IN `_title` TEXT, IN `_detail` TEXT, IN `_assignerid` INT, IN `_lectureid` INT, IN `_studentid` INT)  BEGIN
=======

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(75) NOT NULL,
  `teacher_lastname` varchar(75) NOT NULL,
  `teacher_mail` varchar(50) NOT NULL,
  `teacher_phone` varchar(50) NOT NULL,
  `teacher_detail` text NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Ahmet Hoca','Bey','ahmetmail@mail.com','5325520','Matematik ve Fen alanlarında uzman ayrıca edebiyat eğitimi almış.',1),(2,'Hakan','Hoca','hakan@mail.com','02132102','Hakan bey Edebiyat uzmanıdır.',1);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_all_students`
--

DROP TABLE IF EXISTS `view_all_students`;
/*!50001 DROP VIEW IF EXISTS `view_all_students`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_all_students` AS SELECT 
 1 AS `student_id`,
 1 AS `student_name`,
 1 AS `student_lastname`,
 1 AS `student_mail`,
 1 AS `student_phone`,
 1 AS `student_class_id`,
 1 AS `login_name`,
 1 AS `login_password`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'osts'
--

--
-- Dumping routines for database 'osts'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_HOMEWORK_ASSIGN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_HOMEWORK_ASSIGN`(IN `_title` TEXT, IN `_detail` TEXT, IN `_assignerid` INT, IN `_lectureid` INT, IN `_studentid` INT)
BEGIN
>>>>>>> Stashed changes

INSERT INTO homeworks(homeworks.homework_title,homeworks.homework_detail,
homeworks.homework_assigner_id,homeworks.homework_lecture_id,homeworks.homework_student_id,homeworks.homework_last_publish_date) VALUES (_title,_detail,_assignerid,_lectureid,_studentid,DATE_ADD(NOW(), INTERVAL 7 DAY));
  SELECT * FROM homeworks WHERE homeworks.homework_id=LAST_INSERT_ID();

<<<<<<< Updated upstream
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_HOMEWORK_DELETE` (IN `_id` INT)  MODIFIES SQL DATA
=======
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_HOMEWORK_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_HOMEWORK_DELETE`(IN `_id` INT)
    MODIFIES SQL DATA
>>>>>>> Stashed changes
BEGIN

UPDATE homeworks set homeworks.isActive=0 WHERE homeworks.homework_id=_id;



<<<<<<< Updated upstream
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LOGIN` (IN `_username` VARCHAR(50), IN `_password` INT(50))  READS SQL DATA
=======
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LOGIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LOGIN`(IN `_username` VARCHAR(50), IN `_password` INT(50))
    READS SQL DATA
>>>>>>> Stashed changes
BEGIN

DECLARE _usertype INT DEFAULT 0;
DECLARE _userdetail INT DEFAULT 0;

SET _usertype=(SELECT login.login_type from login WHERE
            
              login.login_name=_username AND
               login.login_password=_password AND login.isActive=1
              );
              
    SET _userdetail=(SELECT login.login_detail_id from login WHERE
              
              login.login_name=_username AND
               login.login_password=_password AND
                     login.isActive=1
              );      
       IF _usertype=1 THEN
              
       SELECT  login.login_id,login.login_name,login.login_password,
       login.login_type,students.student_number,students.student_name,students.student_lastname,students.student_mail,students.student_class_id,classes.class_title from login 
       LEFT JOIN students on students.student_id=login.login_detail_id
       LEFT JOIN classes on students.student_class_id=classes.class_id  
       WHERE login.login_name=_username AND login.login_password=_password;
       
       END IF; 
              
        IF _usertype=2 THEN
              
       SELECT login.login_name,login.login_password,login.login_type,login.login_id,teachers.teacher_name,teachers.teacher_lastname,
       teachers.teacher_mail,teachers.teacher_phone,teachers.teacher_id
       from login left JOIN teachers  on teachers.teacher_id=login.login_detail_id WHERE login.isActive=1 And teachers.isActive=1 And login.login_name=_username AND
       login.login_password=_password;
       
       END IF;      
       
       
       IF _usertype=3 THEN
              
       SELECT login.login_name,login.login_password,login.login_id,
ateachers.ateacher_id,ateachers.ateacher_name,login.login_type,ateachers.ateacher_lastname,ateachers.ateacher_phone,ateachers.ateacher_mail
from login left JOIN ateachers on login.login_detail_id=ateachers.ateacher_id WHERE login.isActive=1 And login.login_name=_username AND
       login.login_password=_password;
       
       END IF;    
       
       
       
      
   


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SHOW_STUDENTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SHOW_STUDENTS`(IN `_class` INT)
    READS SQL DATA
BEGIN

IF _class!=0 THEN

SELECT 
student_number,
student_id,
student_name,
student_lastname,
student_mail,
student_phone,
student_class_id,
login.login_name,
login_password
FROM students 
LEFT JOIN login on login.login_detail_id=students.student_id
WHERE login.login_type=1 
AND students.isActive=1 
AND students.student_class_id=_class;
ELSE

SELECT 
student_number,
student_id,
student_name,
student_lastname,
student_mail,
student_phone,
student_class_id,
login.login_name,
login_password
FROM students 
LEFT JOIN login on login.login_detail_id=students.student_id
WHERE login.login_type=1 
AND students.isActive=1;

END IF ;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_STUDENT_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_STUDENT_ADD`(IN `_name` TEXT, IN `_lastname` TEXT, IN `_mail` TEXT, IN `_phone` TEXT, IN `_classid` INT, IN `_username` TEXT, IN `_password` TEXT)
BEGIN

DECLARE _studentid INT;
DECLARE _studentdetailid INT;

SET _studentid=(SELECT FLOOR(RAND() * 99999999.99));


INSERT INTO students
(students.student_number,
 students.student_name,
 students.student_lastname,
  students.student_phone,
 students.student_mail,
 students.student_class_id)
 VALUES
 (_studentid,
  _name,
  _lastname,
  _phone,
 _mail
  ,_classid);
 
SET _studentdetailid=LAST_INSERT_ID();
 
INSERT INTO login
(login.login_name,
 login.login_password,
 login.login_type,
 login.login_detail_id)
 VALUES
 (_username,
  _password,
  1,
  _studentdetailid);
  
  
  SELECT * FROM login WHERE login.login_id=LAST_INSERT_ID();

  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_STUDENT_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_STUDENT_DELETE`(IN `_id` INT)
    MODIFIES SQL DATA
BEGIN

UPDATE students SET students.isActive=0 WHERE students.isActive=0 AND students.student_id=_id;
UPDATE login SET login.isActive=0 WHERE 

login.login_detail_id=_id AND login.login_type=1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_STUDENT_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_STUDENT_UPDATE`(IN `_id` INT, IN `_username` TEXT, IN `_password` TEXT, IN `_mail` TEXT, IN `_phone` TEXT, IN `_classid` INT)
    MODIFIES SQL DATA
BEGIN

UPDATE students SET 

students.student_mail=_mail,
students.student_phone=_phone,
students.student_class_id=_classid WHERE students.student_id=_id;


UPDATE login SET 
login.login_name=_username,
login.login_password=_password

WHERE login.login_type=3 AND login.login_detail_id=_id;


END ;;
DELIMITER ;
<<<<<<< Updated upstream

-- --------------------------------------------------------

--
-- Table structure for table `ateachers`
--

CREATE TABLE `ateachers` (
  `ateacher_id` int(11) NOT NULL,
  `ateacher_name` varchar(75) NOT NULL,
  `ateacher_lastname` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ateacher_phone` varchar(50) NOT NULL,
  `ateacher_mail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `class_year` int(11) NOT NULL,
  `class_title` varchar(75) NOT NULL,
  `class_detail` text NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_year`, `class_title`, `class_detail`, `isActive`) VALUES
(1, 2020, '1. Sınıf', '1. Sınıflar burada yer almaktadır.', 1),
(2, 2020, '2. Sınıf', '2. Sınıflar burada yer almaktadır.', 1),
(3, 2020, '3. Sınıf', '3. Sınıflar burada yer almaktadır.', 1),
(4, 2020, '4. Sınıf', '4. Sınıflar burada yer almaktadır.', 1),
(5, 2020, '5. Sınıf', '5. Sınıflar burada yer almaktadır.', 1),
(6, 2020, '6. Sınıf', '6. Sınıflar burada yer almaktadır.', 1),
(7, 2020, '7. Sınıf', '7. Sınıflar burada yer almaktadır.', 1),
(8, 2020, '8. Sınıf', '8. Sınıflar burada yer almaktadır.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `homeworks`
--

CREATE TABLE `homeworks` (
  `homework_id` int(11) NOT NULL,
  `homework_title` varchar(75) NOT NULL,
  `homework_detail` text NOT NULL,
  `homework_create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `homework_assigner_id` int(11) NOT NULL,
  `homework_lecture_id` int(11) NOT NULL,
  `homework_student_id` int(11) NOT NULL,
  `homework_last_publish_date` datetime NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `homeworks`
--

INSERT INTO `homeworks` (`homework_id`, `homework_title`, `homework_detail`, `homework_create_date`, `homework_assigner_id`, `homework_lecture_id`, `homework_student_id`, `homework_last_publish_date`, `isActive`) VALUES
(1, 'Ödev başlığı', 'Ödev deneme ', '2020-11-23 23:07:31', 1, 1, 1, '0000-00-00 00:00:00', 0),
(2, 'Test', 'detay', '2020-11-23 23:10:10', 1, 1, 1, '2020-11-30 23:10:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `homework_publishs`
--

CREATE TABLE `homework_publishs` (
  `publish_id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `publisher_text` text NOT NULL,
  `has_file` tinyint(1) NOT NULL,
  `file_path` varchar(75) NOT NULL,
  `publish_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE `lectures` (
  `lecture_id` int(11) NOT NULL,
  `lecture_year` int(11) NOT NULL,
  `lecture_title` varchar(75) NOT NULL,
  `lecture_detail` text NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lectures`
--

INSERT INTO `lectures` (`lecture_id`, `lecture_year`, `lecture_title`, `lecture_detail`, `isActive`) VALUES
(1, 2020, 'Fen Bilgisi', 'Fen Eğitimi verilmektedir', 1),
(2, 2020, 'Türk Edebiyatı', 'Yeni nesil Türk Edebiyatından bahsedilir.', 1),
(3, 2020, 'Matematik', 'Limit ve Türev konuları ele alınmaktadır.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lecture_teachers`
--

CREATE TABLE `lecture_teachers` (
  `lecture_teacher_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `lecture_id` int(11) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `login_name` varchar(50) NOT NULL,
  `login_password` varchar(50) NOT NULL,
  `login_detail_id` int(11) NOT NULL,
  `login_type` tinyint(4) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `login_name`, `login_password`, `login_detail_id`, `login_type`, `isActive`) VALUES
(1, 'kullanici_adi', 'sifre', 1, 1, 1),
(2, 'ahmet_bey', 'ahmet123', 1, 2, 1),
(3, 'hakann', 'hakan123', 2, 2, 1),
(4, 'name', 'pass', 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `student_number` varchar(20) NOT NULL,
  `student_name` varchar(75) NOT NULL,
  `student_lastname` varchar(75) NOT NULL,
  `student_mail` varchar(75) NOT NULL,
  `student_phone` varchar(75) NOT NULL,
  `student_class_id` int(11) NOT NULL,
  `isActive` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `student_number`, `student_name`, `student_lastname`, `student_mail`, `student_phone`, `student_class_id`, `isActive`) VALUES
(1, '62244414', 'Test', 'Test', 'test@mail.com', '5312456123', 1, 1),
(2, '55181667', 'Ze', 'Te', 'zeze@mail.com', '123456', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `teacher_name` varchar(75) NOT NULL,
  `teacher_lastname` varchar(75) NOT NULL,
  `teacher_mail` varchar(50) NOT NULL,
  `teacher_phone` varchar(50) NOT NULL,
  `teacher_detail` text NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `teacher_name`, `teacher_lastname`, `teacher_mail`, `teacher_phone`, `teacher_detail`, `isActive`) VALUES
(1, 'Ahmet Hoca', 'Bey', 'ahmetmail@mail.com', '5325520', 'Matematik ve Fen alanlarında uzman ayrıca edebiyat eğitimi almış.', 1),
(2, 'Hakan', 'Hoca', 'hakan@mail.com', '02132102', 'Hakan bey Edebiyat uzmanıdır.', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_all_students`
-- (See below for the actual view)
--
CREATE TABLE `view_all_students` (
`student_id` int(11)
,`student_name` varchar(75)
,`student_lastname` varchar(75)
,`student_mail` varchar(75)
,`student_phone` varchar(75)
,`student_class_id` int(11)
,`login_name` varchar(50)
,`login_password` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `view_all_students`
--
DROP TABLE IF EXISTS `view_all_students`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_all_students`  AS  select `students`.`student_id` AS `student_id`,`students`.`student_name` AS `student_name`,`students`.`student_lastname` AS `student_lastname`,`students`.`student_mail` AS `student_mail`,`students`.`student_phone` AS `student_phone`,`students`.`student_class_id` AS `student_class_id`,`login`.`login_name` AS `login_name`,`login`.`login_password` AS `login_password` from (`students` left join `login` on((`students`.`student_id` = `login`.`login_detail_id`))) where (`login`.`login_type` = 3) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ateachers`
--
ALTER TABLE `ateachers`
  ADD PRIMARY KEY (`ateacher_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `homeworks`
--
ALTER TABLE `homeworks`
  ADD PRIMARY KEY (`homework_id`);

--
-- Indexes for table `homework_publishs`
--
ALTER TABLE `homework_publishs`
  ADD PRIMARY KEY (`publish_id`);

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`lecture_id`);

--
-- Indexes for table `lecture_teachers`
--
ALTER TABLE `lecture_teachers`
  ADD PRIMARY KEY (`lecture_teacher_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `login_name` (`login_name`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_number` (`student_number`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ateachers`
--
ALTER TABLE `ateachers`
  MODIFY `ateacher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `homeworks`
--
ALTER TABLE `homeworks`
  MODIFY `homework_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `homework_publishs`
--
ALTER TABLE `homework_publishs`
  MODIFY `publish_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `lecture_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lecture_teachers`
--
ALTER TABLE `lecture_teachers`
  MODIFY `lecture_teacher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

=======
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_all_students`
--

/*!50001 DROP VIEW IF EXISTS `view_all_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_all_students` AS select `students`.`student_id` AS `student_id`,`students`.`student_name` AS `student_name`,`students`.`student_lastname` AS `student_lastname`,`students`.`student_mail` AS `student_mail`,`students`.`student_phone` AS `student_phone`,`students`.`student_class_id` AS `student_class_id`,`login`.`login_name` AS `login_name`,`login`.`login_password` AS `login_password` from (`students` left join `login` on((`students`.`student_id` = `login`.`login_detail_id`))) where (`login`.`login_type` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
>>>>>>> Stashed changes
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-24 17:17:53
