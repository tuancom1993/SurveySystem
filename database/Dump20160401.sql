CREATE DATABASE  IF NOT EXISTS `SurveySystem` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `SurveySystem`;
-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: SurveySystem
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `idanswer` int(11) NOT NULL AUTO_INCREMENT,
  `idquestion` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idanswer`),
  KEY `fk_Answer_Question` (`idquestion`),
  CONSTRAINT `fk_Answer_Question` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idquestion`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,2,'a a b'),(2,2,'gdfgdf  grsg rgerge'),(3,2,'frsgfg'),(4,3,''),(5,4,'fsdfsd'),(6,4,'fsd'),(7,5,'fsfsd'),(8,5,'gfdgfd'),(9,5,'fgd'),(10,6,''),(11,7,'Male'),(12,7,'Female'),(13,8,'Family'),(14,8,'Girl (Boy) Friend'),(15,8,'Other...'),(16,9,'Yes'),(17,9,'No'),(18,10,''),(19,11,''),(20,12,'Yes'),(21,12,'No'),(22,13,'1'),(23,13,'2'),(24,13,'3'),(25,13,'4'),(26,13,'More than 4.'),(27,14,''),(28,15,'dasdas'),(29,15,'dasdas'),(30,16,'dasd'),(31,16,'ffds'),(32,17,'fdfds'),(33,17,'fsdfdfds'),(34,18,'ddasdsad'),(35,19,'fsdfs'),(36,19,'fsdfsd');
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answeruser`
--

DROP TABLE IF EXISTS `answeruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answeruser` (
  `idansweruser` int(11) NOT NULL AUTO_INCREMENT,
  `idquestion` int(11) NOT NULL,
  `content` text,
  PRIMARY KEY (`idansweruser`),
  KEY `fk_AnswerUser_Question` (`idquestion`),
  CONSTRAINT `fk_AnswerUser_Question` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idQuestion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answeruser`
--

LOCK TABLES `answeruser` WRITE;
/*!40000 ALTER TABLE `answeruser` DISABLE KEYS */;
INSERT INTO `answeruser` VALUES (1,2,'3');
/*!40000 ALTER TABLE `answeruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `idfeedback` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `content` text,
  `feedbackdate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfeedback`),
  KEY `fk_Feedback_User` (`iduser`),
  CONSTRAINT `fk_Feedback_User` FOREIGN KEY (`iduser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,3,'aloooo','2016/03/14');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kindquestion`
--

DROP TABLE IF EXISTS `kindquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kindquestion` (
  `idkindquestion` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(45) NOT NULL,
  PRIMARY KEY (`idkindquestion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kindquestion`
--

LOCK TABLES `kindquestion` WRITE;
/*!40000 ALTER TABLE `kindquestion` DISABLE KEYS */;
INSERT INTO `kindquestion` VALUES (1,'Text Box'),(2,'Text Area'),(3,'Check Box'),(4,'Radio'),(5,'Date');
/*!40000 ALTER TABLE `kindquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `idquestion` int(11) NOT NULL AUTO_INCREMENT,
  `idsurvey` int(11) NOT NULL,
  `idkindquestion` int(11) NOT NULL,
  `contentquestion` varchar(255) DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idquestion`),
  KEY `fk_Question_Survey` (`idsurvey`),
  KEY `fk_Question_KindQuestion` (`idkindquestion`),
  CONSTRAINT `fk_Question_KindQuestion` FOREIGN KEY (`idkindquestion`) REFERENCES `kindquestion` (`idkindquestion`),
  CONSTRAINT `fk_Question_Survey` FOREIGN KEY (`idsurvey`) REFERENCES `survey` (`idSurvey`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,5,1,'123121',0),(2,5,2,'fdgdf',1),(3,12,1,'wwww',1),(4,12,4,'fdfs',0),(5,12,3,'fsd',1),(6,13,1,'What\'s your name?',1),(7,13,4,'Your sex:',1),(8,13,3,'You will go with?',0),(9,13,4,'You will join?',1),(10,13,2,'Your feedback...',0),(11,14,1,'What\'s your name?',1),(12,14,4,'Do you wanna join with us?',1),(13,14,4,'How many performance you want to join',0),(14,15,1,'dasdsa',0),(15,15,4,'dsadsa',0),(16,15,3,'dasdsa',1),(17,24,3,'21211',1),(18,25,4,'sadsadas',1),(19,25,3,'fsdfds',0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `idrole` int(11) NOT NULL AUTO_INCREMENT,
  `namerole` varchar(45) NOT NULL,
  PRIMARY KEY (`idrole`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `idsurvey` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `createdate` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `surveydescribe` text,
  `maincolor` varchar(45) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `stopsurvey` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idsurvey`),
  KEY `fk_Survey_User` (`iduser`),
  CONSTRAINT `fk_Survey_User` FOREIGN KEY (`iduser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (5,2,'2016-03-22','3213','3241','324',NULL,0),(6,2,'0000-00-00','xyz','345','456','123',0),(7,2,'2016-01-24','xyz','345','456','123',0),(8,3,'2016-04-01','2121','321312','#4a62bb','Cover_2016_03_30_08_46_31.png',0),(9,3,'2016-04-01','211','dfds','#23bcc3','Cover_2016_03_30_08_53_53.jpg',0),(10,3,'2016-04-01','Work','fdfdsf','#7b4444','Cover_2016_03_30_09_20_54.png',0),(11,3,'2016-04-01','gdfg','gdfgfd','#7b4444','Cover_2016_03_30_09_20_54.png',0),(12,3,'2016-04-01','wwww','wwww','#7b4444','Cover_2016_03_30_09_20_54.png',0),(13,3,'2016-04-01','Year End Party','Survey for the Year End Party of Enclave 2016 \\m/','#fd0000','Cover_2016_03_30_08_46_49.jpg',0),(14,1,'2016-04-01','Music Event ','Survey for music event on 25/4/1026.\nLet join with us. \nIn here, you can find a lot of beautiful girl \\m/','#3b3b52','Cover_2016_03_30_08_47_02.png',0),(15,3,'2016-04-01','2121','sdasd','#fd0000','Cover_admin_2016_04_01_12_03_26.jpg',0),(16,3,'2016-04-01','12121','','#2da52f','Cover_admin_2016_04_01_13_18_40.jpg',0),(17,3,'2016-04-01','17','17','#3b3b52','Cover_admin_2016_04_01_13_21_30.png',0),(18,3,'2016-04-01','18','fdsfs','#4a62bb','Cover_admin_2016_04_01_13_22_54.png',0),(19,3,'2016-04-01','19','dáá','#fd0000','Cover_admin_2016_04_01_14_46_59.jpg',0),(20,3,'2016-04-01','20','20','#fd0000','Cover_admin_2016_04_01_14_58_22.jpg',0),(21,3,'2016-04-01','21','21','#fd0000','Cover_admin_2016_04_01_15_45_30.jpg',0),(22,3,'2016-04-01','3123','31231','#3b3b52','Cover_admin_2016_04_01_15_49_23.png',0),(23,3,'2016-04-01','76575','sdffd','#7b4444','Cover_admin_2016_04_01_15_50_44.png',0),(24,3,'2016-04-01','gdfgfdg','gfdgdf','#7b4444','Cover_admin_2016_04_01_15_57_11.png',0),(25,3,'2016-04-01','Survey 121212 ','21543rgdsf','#2da52f','Cover_admin_2016_04_01_15_59_43.jpg',0);
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `idtag` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idtag`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Color'),(2,'Work'),(3,'Music'),(4,'Event'),(5,'Wedding'),(6,'Football'),(7,'Other');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `idtag` int(11) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `maincolor` varchar(45) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  PRIMARY KEY (`idtemplate`),
  KEY `fk_Template_Tag` (`idtag`),
  CONSTRAINT `fk_Template_Tag` FOREIGN KEY (`idtag`) REFERENCES `tag` (`idtag`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
INSERT INTO `template` VALUES (5,'Color Template',1,'Cover_2016_03_30_08_46_31.png','#4a62bb','2016-03-29'),(6,'Event Template',4,'Cover_2016_03_30_08_46_49.jpg','#fd0000','2016-03-29'),(8,'Wedding Template',5,'Cover_2016_03_30_08_53_53.jpg','#23bcc3','2016-03-29'),(9,'Work',2,'Cover_2016_03_30_09_20_54.png','#7b4444','2016-03-29'),(10,'Music Template',3,'Cover_2016_03_30_08_47_02.png','#3b3b52','2016-03-29'),(11,'Football Template',6,'Cover_2016_03_30_09_18_50.jpg','#12760d','2016-03-30'),(12,'Other Template',7,'Cover_2016_03_30_08_55_01.jpg','#2da52f','2016-03-30');
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `idrole` int(11) NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `avata` text,
  `block` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  KEY `fk_User_Role` (`idrole`),
  CONSTRAINT `fk_User_Role` FOREIGN KEY (`idrole`) REFERENCES `role` (`idrole`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user','user',2,'User normal',0,'2016-03-15','2121@111','016565456','null_2016_03_28_13_15_26.jpg',0),(2,'tuancom','123',1,'Vũ Xuân Tuấn Anh',1,'1992-12-27','12122@1','0168745621','tuancom_2016_03_24_09_40_39.jpg',0),(3,'admin','admin',1,'admin',0,'1993-10-21','admin@enclave.vn','111111111','admin_2016_03_23_10_45_22.jpg',0),(4,'tuacom','123',1,'vu xuan tuan anh 4',1,'1992-12-27','123@321','01263759260','tuacom_2016_03_23_09_01_26.png',0),(5,'ahjhj','1234',2,'1212131',0,'2015-12-27','2121@111','12','new_2016_03_23_08_20_59.jpg',0),(6,'tuancom1993','huynung123',1,'Vũ Xuân Tuấn Anh',1,'1993-10-21','tuancom1993@gmail.com','01263759260','tuancom1993_2016_03_21_18_17_47.jpg',0),(7,'dore','dora',2,'dora',0,'2015-12-27','123@321','21213121112121','dore_2016_03_22_16_30_48.jpg',0),(9,'1','1',2,'1',0,'0002-12-31','1@1','1','User.png',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-01 17:10:27
