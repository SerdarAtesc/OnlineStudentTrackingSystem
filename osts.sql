-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 28 Kas 2020, 18:16:33
-- Sunucu sürümü: 8.0.17
-- PHP Sürümü: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `osts`
--

DELIMITER $$
--
-- Yordamlar
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_HOMEWORK_ASSIGN` (IN `_title` TEXT, IN `_detail` TEXT, IN `_assignerid` INT, IN `_lectureid` INT, IN `_studentid` INT)  BEGIN

INSERT INTO homeworks(homeworks.homework_title,homeworks.homework_detail,
homeworks.homework_assigner_id,homeworks.homework_lecture_id,homeworks.homework_student_id,homeworks.homework_last_publish_date) VALUES (_title,_detail,_assignerid,_lectureid,_studentid,DATE_ADD(NOW(), INTERVAL 7 DAY));
  SELECT * FROM homeworks WHERE homeworks.homework_id=LAST_INSERT_ID();

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_HOMEWORK_DELETE` (IN `_id` INT)  MODIFIES SQL DATA
BEGIN

UPDATE homeworks set homeworks.isActive=0 WHERE homeworks.homework_id=_id;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LECTURES_LIST` ()  READS SQL DATA
BEGIN

SELECT lectures.lecture_id,lectures.lecture_year,lectures.lecture_title,lectures.lecture_detail from lectures WHERE lectures.isActive=1;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LOGIN` (IN `_username` VARCHAR(50), IN `_password` INT(50))  READS SQL DATA
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
       
       
       
      
   


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SHOW_STUDENTS` (IN `_class` INT)  READS SQL DATA
BEGIN

IF _class!=0 THEN

SELECT 
students.student_number,
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
students.student_number,
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


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_STUDENT_ADD` (IN `_name` TEXT, IN `_lastname` TEXT, IN `_mail` TEXT, IN `_phone` TEXT, IN `_classid` INT, IN `_username` TEXT, IN `_password` TEXT)  BEGIN

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

  
  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_STUDENT_DELETE` (IN `_id` INT)  MODIFIES SQL DATA
BEGIN

UPDATE students SET students.isActive=0 WHERE students.isActive=0 AND students.student_id=_id;
UPDATE login SET login.isActive=0 WHERE 

login.login_detail_id=_id AND login.login_type=1;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_STUDENT_UPDATE` (IN `_id` INT, IN `_username` TEXT, IN `_password` TEXT, IN `_mail` TEXT, IN `_phone` TEXT, IN `_classid` INT)  MODIFIES SQL DATA
BEGIN

UPDATE students SET 

students.student_mail=_mail,
students.student_phone=_phone,
students.student_class_id=_classid WHERE students.student_id=_id;


UPDATE login SET 
login.login_name=_username,
login.login_password=_password

WHERE login.login_type=3 AND login.login_detail_id=_id;


END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ateachers`
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
-- Tablo için tablo yapısı `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `class_year` int(11) NOT NULL,
  `class_title` varchar(75) NOT NULL,
  `class_detail` text NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `classes`
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
-- Tablo için tablo yapısı `homeworks`
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
-- Tablo döküm verisi `homeworks`
--

INSERT INTO `homeworks` (`homework_id`, `homework_title`, `homework_detail`, `homework_create_date`, `homework_assigner_id`, `homework_lecture_id`, `homework_student_id`, `homework_last_publish_date`, `isActive`) VALUES
(1, 'Ödev başlığı', 'Ödev deneme ', '2020-11-23 23:07:31', 1, 1, 1, '0000-00-00 00:00:00', 0),
(2, 'Test', 'detay', '2020-11-23 23:10:10', 1, 1, 1, '2020-11-30 23:10:10', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `homework_publishs`
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
-- Tablo için tablo yapısı `lectures`
--

CREATE TABLE `lectures` (
  `lecture_id` int(11) NOT NULL,
  `lecture_year` int(11) NOT NULL,
  `lecture_title` varchar(75) NOT NULL,
  `lecture_detail` text NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `lectures`
--

INSERT INTO `lectures` (`lecture_id`, `lecture_year`, `lecture_title`, `lecture_detail`, `isActive`) VALUES
(1, 2020, 'Fen Bilgisi', 'Fen Eğitimi verilmektedir', 1),
(2, 2020, 'Türk Edebiyatı', 'Yeni nesil Türk Edebiyatından bahsedilir.', 1),
(3, 2020, 'Matematik', 'Limit ve Türev konuları ele alınmaktadır.', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lecture_teachers`
--

CREATE TABLE `lecture_teachers` (
  `lecture_teacher_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `lecture_id` int(11) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `login`
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
-- Tablo döküm verisi `login`
--

INSERT INTO `login` (`login_id`, `login_name`, `login_password`, `login_detail_id`, `login_type`, `isActive`) VALUES
(1, 'kullanici_adi', 'sifre', 1, 1, 1),
(2, 'ahmet_bey', 'ahmet123', 1, 2, 1),
(3, 'hakann', 'hakan123', 2, 2, 1),
(4, 'name', 'pass', 2, 1, 1),
(5, 'serdar', '123', 3, 1, 1),
(6, 'serdar2', 'serdar', 1, 2, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `students`
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
-- Tablo döküm verisi `students`
--

INSERT INTO `students` (`student_id`, `student_number`, `student_name`, `student_lastname`, `student_mail`, `student_phone`, `student_class_id`, `isActive`) VALUES
(1, '62244414', 'Test', 'Test', 'test@mail.com', '5312456123', 1, 1),
(2, '55181667', 'Ze', 'Te', 'zeze@mail.com', '123456', 4, 1),
(3, '32434233', 'serdar', 'ates', 'serdar@gmail.com', '534534534', 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teachers`
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
-- Tablo döküm verisi `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `teacher_name`, `teacher_lastname`, `teacher_mail`, `teacher_phone`, `teacher_detail`, `isActive`) VALUES
(1, 'Ahmet Hoca', 'Bey', 'ahmetmail@mail.com', '5325520', 'Matematik ve Fen alanlarında uzman ayrıca edebiyat eğitimi almış.', 1),
(2, 'Hakan', 'Hoca', 'hakan@mail.com', '02132102', 'Hakan bey Edebiyat uzmanıdır.', 1);

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `view_all_students`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `view_all_students` (
`login_name` varchar(50)
,`login_password` varchar(50)
,`student_class_id` int(11)
,`student_id` int(11)
,`student_lastname` varchar(75)
,`student_mail` varchar(75)
,`student_name` varchar(75)
,`student_phone` varchar(75)
);

-- --------------------------------------------------------

--
-- Görünüm yapısı `view_all_students`
--
DROP TABLE IF EXISTS `view_all_students`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_all_students`  AS  select `students`.`student_id` AS `student_id`,`students`.`student_name` AS `student_name`,`students`.`student_lastname` AS `student_lastname`,`students`.`student_mail` AS `student_mail`,`students`.`student_phone` AS `student_phone`,`students`.`student_class_id` AS `student_class_id`,`login`.`login_name` AS `login_name`,`login`.`login_password` AS `login_password` from (`students` left join `login` on((`students`.`student_id` = `login`.`login_detail_id`))) where (`login`.`login_type` = 3) ;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `ateachers`
--
ALTER TABLE `ateachers`
  ADD PRIMARY KEY (`ateacher_id`);

--
-- Tablo için indeksler `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Tablo için indeksler `homeworks`
--
ALTER TABLE `homeworks`
  ADD PRIMARY KEY (`homework_id`);

--
-- Tablo için indeksler `homework_publishs`
--
ALTER TABLE `homework_publishs`
  ADD PRIMARY KEY (`publish_id`);

--
-- Tablo için indeksler `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`lecture_id`);

--
-- Tablo için indeksler `lecture_teachers`
--
ALTER TABLE `lecture_teachers`
  ADD PRIMARY KEY (`lecture_teacher_id`);

--
-- Tablo için indeksler `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `login_name` (`login_name`);

--
-- Tablo için indeksler `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_number` (`student_number`);

--
-- Tablo için indeksler `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `ateachers`
--
ALTER TABLE `ateachers`
  MODIFY `ateacher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `homeworks`
--
ALTER TABLE `homeworks`
  MODIFY `homework_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `homework_publishs`
--
ALTER TABLE `homework_publishs`
  MODIFY `publish_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `lectures`
--
ALTER TABLE `lectures`
  MODIFY `lecture_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `lecture_teachers`
--
ALTER TABLE `lecture_teachers`
  MODIFY `lecture_teacher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
