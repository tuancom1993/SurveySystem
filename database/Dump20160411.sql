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
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idanswer`),
  KEY `fk_Answer_Question` (`idquestion`),
  CONSTRAINT `fk_Answer_Question` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idquestion`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,2,'a a b'),(2,2,'gdfgdf  grsg rgerge'),(3,2,'frsgfg'),(4,3,''),(5,4,'fsdfsd'),(6,4,'fsd'),(7,5,'fsfsd'),(8,5,'gfdgfd'),(9,5,'fgd'),(10,6,''),(11,7,'Male'),(12,7,'Female'),(13,8,'Family'),(14,8,'Girl (Boy) Friend'),(15,8,'Other...'),(16,9,'Yes'),(17,9,'No'),(18,10,''),(19,11,''),(20,12,'Yes'),(21,12,'No'),(22,13,'1'),(23,13,'2'),(24,13,'3'),(25,13,'4'),(26,13,'More than 4.'),(27,14,''),(28,15,'dasdas'),(29,15,'dasdas'),(30,16,'dasd'),(31,16,'ffds'),(32,17,'fdfds'),(33,17,'fsdfdfds'),(34,18,'ddasdsad'),(35,19,'fsdfs'),(36,19,'fsdfsd'),(37,20,'Abc'),(38,20,'XZY'),(39,20,'GHT'),(40,21,''),(41,22,''),(42,23,''),(43,24,''),(44,25,'5345'),(45,25,'fsdfs'),(46,25,'fsdf'),(47,25,'rehrth'),(48,26,'fdsfsd'),(49,27,''),(50,28,''),(51,29,'gdfgdf'),(52,30,'gfdg'),(53,30,'gdfgdf'),(54,31,'gfd g'),(55,31,'g fdg f'),(56,32,'aaa'),(57,32,'aaa'),(58,32,'aaaaaa'),(59,33,''),(60,34,'123'),(61,34,'456'),(62,35,'789'),(63,36,''),(64,37,'bb'),(65,37,'bbb'),(66,38,'bbb'),(67,38,'bbb'),(68,39,''),(69,40,''),(70,41,'Yes'),(71,41,'No'),(72,42,'Mother'),(73,42,'Dad'),(74,42,'Boy or Girl friend'),(75,43,''),(76,44,'aaa'),(77,44,'bbbb'),(78,44,'cccc'),(79,45,'1'),(80,45,'2'),(81,45,'3'),(82,45,'4'),(83,46,'sdfsd'),(84,46,'fsdfsd'),(85,46,'fsdfsd'),(86,47,'asf'),(87,47,'aht'),(88,47,'gss'),(89,48,'9'),(90,48,'10'),(91,48,'28'),(92,49,'aaa'),(93,49,'123'),(94,49,'678'),(95,50,'123'),(96,50,'aaa'),(97,50,'bbbb'),(98,51,'');
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
  `iddatasurvey` int(11) NOT NULL,
  `idquestion` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`idansweruser`),
  KEY `fk_AnswerUser_Question` (`idquestion`),
  KEY `fk_AnswerUser_DataSurvey` (`iddatasurvey`),
  CONSTRAINT `fk_AnswerUser_DataSurvey` FOREIGN KEY (`iddatasurvey`) REFERENCES `datasurvey` (`iddatasurvey`),
  CONSTRAINT `fk_AnswerUser_Question` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idQuestion`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answeruser`
--

LOCK TABLES `answeruser` WRITE;
/*!40000 ALTER TABLE `answeruser` DISABLE KEYS */;
INSERT INTO `answeruser` VALUES (22,1,6,'tuan anh'),(23,1,10,'my feedback is.....'),(24,1,8,'13'),(25,1,8,'14'),(26,1,7,'11'),(27,1,9,'16'),(28,2,6,'tuan anh 23'),(29,2,10,'my feedback is..... 21 21'),(30,2,8,'13'),(31,2,8,'14'),(32,2,8,'15'),(33,2,7,'12'),(34,2,9,'17'),(35,3,6,'tuan anh 23'),(36,3,10,'my feedback is..... 21 21'),(37,3,8,'13'),(38,3,8,'14'),(39,3,8,'15'),(40,3,7,'12'),(41,3,9,'17'),(42,4,40,'tuan com'),(43,4,43,'no feed back :v'),(44,4,42,'72'),(45,4,42,'73'),(46,4,42,'74'),(47,4,41,'70'),(48,5,6,'tuan anh 1993'),(49,5,10,'123'),(50,5,8,'13'),(51,5,8,'14'),(52,5,8,'15'),(53,5,7,'11'),(54,5,9,'16'),(55,6,6,'2121'),(56,6,10,''),(57,6,7,'11'),(58,6,9,'16'),(59,7,6,'Davy'),(60,7,10,'212121'),(61,7,8,'13'),(62,7,8,'14'),(63,7,7,'12'),(64,7,9,'17'),(65,8,6,'tu'),(66,8,10,''),(67,8,8,'13'),(68,8,8,'14'),(69,8,7,'12'),(70,8,9,'17'),(71,9,33,''),(72,9,35,'62'),(73,9,34,'60'),(74,10,33,'2121'),(75,10,35,'62'),(76,10,34,'61'),(77,11,33,'2121 21 2121'),(78,11,35,'62'),(79,11,34,'60'),(80,12,6,'Su'),(81,12,10,'No feedback in here'),(82,12,8,'14'),(83,12,7,'12'),(84,12,9,'16'),(85,13,11,'Tuan Anh'),(86,13,12,'20'),(87,13,13,'26'),(88,14,12,'21'),(89,14,13,'25'),(90,15,11,'DaVy'),(91,15,12,'20'),(92,15,13,'23'),(93,16,11,'Vũ Xuân Tuấn Còm'),(94,16,12,'20'),(95,16,13,'24'),(96,17,6,'Tuấn Còm'),(97,17,10,'Không có feedback gì cả :v :v :v'),(98,17,8,'14'),(99,17,7,'11'),(100,17,9,'16'),(101,18,6,'2121'),(102,18,10,' asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa '),(103,18,8,'14'),(104,18,7,'11'),(105,18,9,'16'),(106,19,6,'2121'),(107,19,10,'1221'),(108,19,8,'14'),(109,19,7,'11'),(110,19,9,'16'),(111,20,24,'fg f'),(112,20,26,'48'),(113,20,25,'45'),(114,21,24,'11111111111111111'),(115,21,25,'46'),(116,22,40,'Khong biet'),(117,22,43,'O o O o'),(118,22,42,'72'),(119,22,42,'74'),(120,22,41,'70'),(121,23,40,'Khong biet'),(122,23,43,'O o O o'),(123,23,42,'72'),(124,23,42,'74'),(125,23,41,'71'),(126,24,6,'121'),(127,24,10,'gdfgfd'),(128,24,8,'13'),(129,24,8,'14'),(130,24,7,'12'),(131,24,9,'16'),(132,25,6,'121'),(133,25,10,'gdfgfd'),(134,25,8,'13'),(135,25,8,'14'),(136,25,7,'12'),(137,25,9,'16'),(138,26,6,'121'),(139,26,10,'gdfgfd'),(140,26,8,'13'),(141,26,8,'14'),(142,26,7,'12'),(143,26,9,'16'),(144,27,11,'12121'),(145,27,12,'20'),(146,27,13,'26'),(147,28,11,'12121'),(148,28,12,'20'),(149,28,13,'22'),(150,29,11,'12121'),(151,29,12,'20'),(152,29,13,'22'),(153,30,11,'12121'),(154,30,12,'20'),(155,30,13,'22'),(156,31,47,'87'),(157,31,47,'88'),(158,31,48,'89'),(159,31,48,'90'),(160,31,48,'91'),(161,31,44,'76'),(162,31,45,'80'),(163,31,46,'84'),(164,32,47,'88'),(165,32,48,'89'),(166,32,48,'91'),(167,32,44,'77'),(168,32,45,'81'),(169,32,46,'85'),(170,33,47,'86'),(171,33,47,'87'),(172,33,47,'88'),(173,33,48,'89'),(174,33,48,'90'),(175,33,48,'91'),(176,33,44,'76'),(177,33,45,'79'),(178,33,46,'83'),(179,34,49,'92'),(180,35,49,'93'),(181,36,49,'94'),(182,37,49,'93'),(183,38,49,'93'),(184,39,50,'95'),(185,40,50,'96'),(186,41,50,'97'),(187,42,50,'97'),(188,43,50,'95'),(189,44,50,'95'),(190,45,50,'95'),(191,46,50,'95'),(192,47,20,'37'),(193,47,20,'38'),(194,48,20,'37'),(195,48,20,'38'),(196,48,20,'39'),(197,49,14,''),(198,49,16,'30'),(199,49,16,'31'),(200,49,15,'29'),(201,50,14,'212'),(202,50,16,'31'),(203,50,15,'28'),(204,51,14,'212'),(205,51,16,'31'),(206,51,15,'28'),(207,52,14,'212'),(208,52,16,'31'),(209,53,14,'212'),(210,52,15,'28'),(211,53,16,'31'),(212,53,15,'28'),(213,54,14,'212'),(214,54,16,'31'),(215,54,15,'28'),(216,55,14,'212'),(217,55,16,'31'),(218,55,15,'28'),(219,56,14,'212'),(220,56,16,'31'),(221,56,15,'28'),(222,57,14,'212'),(223,57,16,'31'),(224,57,15,'28'),(225,58,51,'hfghgghfg');
/*!40000 ALTER TABLE `answeruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datasurvey`
--

DROP TABLE IF EXISTS `datasurvey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datasurvey` (
  `iddatasurvey` int(11) NOT NULL AUTO_INCREMENT,
  `idsurvey` int(11) NOT NULL,
  `surveydate` date DEFAULT NULL,
  PRIMARY KEY (`iddatasurvey`),
  KEY `fk_Datasurvey_Survey` (`idsurvey`),
  CONSTRAINT `fk_Datasurvey_Survey` FOREIGN KEY (`idsurvey`) REFERENCES `survey` (`idsurvey`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datasurvey`
--

LOCK TABLES `datasurvey` WRITE;
/*!40000 ALTER TABLE `datasurvey` DISABLE KEYS */;
INSERT INTO `datasurvey` VALUES (1,13,'2016-04-07'),(2,13,'2016-04-07'),(3,13,'2016-04-07'),(4,35,'2016-04-07'),(5,13,'2016-04-07'),(6,13,'2016-04-07'),(7,13,'2016-04-07'),(8,13,'2016-04-07'),(9,33,'2016-04-07'),(10,33,'2016-04-07'),(11,33,'2016-04-07'),(12,13,'2016-04-07'),(13,14,'2016-04-08'),(14,14,'2016-04-08'),(15,14,'2016-04-08'),(16,14,'2016-04-08'),(17,13,'2016-04-08'),(18,13,'2016-04-08'),(19,13,'2016-04-08'),(20,28,'2016-04-08'),(21,28,'2016-04-08'),(22,35,'2016-04-11'),(23,35,'2016-04-11'),(24,13,'2016-04-11'),(25,13,'2016-04-11'),(26,13,'2016-04-11'),(27,14,'2016-04-11'),(28,14,'2016-04-11'),(29,14,'2016-04-11'),(30,14,'2016-04-11'),(31,36,'2016-04-11'),(32,36,'2016-04-11'),(33,36,'2016-04-11'),(34,37,'2016-04-11'),(35,37,'2016-04-11'),(36,37,'2016-04-11'),(37,37,'2016-04-11'),(38,37,'2016-04-11'),(39,38,'2016-04-11'),(40,38,'2016-04-11'),(41,38,'2016-04-11'),(42,38,'2016-04-11'),(43,38,'2016-04-11'),(44,38,'2016-04-11'),(45,38,'2016-04-11'),(46,38,'2016-04-11'),(47,26,'2016-04-11'),(48,26,'2016-04-11'),(49,15,'2016-04-11'),(50,15,'2016-04-11'),(51,15,'2016-04-11'),(52,15,'2016-04-11'),(53,15,'2016-04-11'),(54,15,'2016-04-11'),(55,15,'2016-04-11'),(56,15,'2016-04-11'),(57,15,'2016-04-11'),(58,39,'2016-04-11'),(59,9,'2016-04-11');
/*!40000 ALTER TABLE `datasurvey` ENABLE KEYS */;
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
  `contentquestion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idquestion`),
  KEY `fk_Question_Survey` (`idsurvey`),
  KEY `fk_Question_KindQuestion` (`idkindquestion`),
  CONSTRAINT `fk_Question_KindQuestion` FOREIGN KEY (`idkindquestion`) REFERENCES `kindquestion` (`idkindquestion`),
  CONSTRAINT `fk_Question_Survey` FOREIGN KEY (`idsurvey`) REFERENCES `survey` (`idSurvey`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,5,1,'123121',0),(2,5,2,'fdgdf',1),(3,12,1,'wwww',1),(4,12,4,'fdfs',0),(5,12,3,'fsd',1),(6,13,1,'What\'s your name?',1),(7,13,4,'Your sex:',1),(8,13,3,'You will go with?',0),(9,13,4,'You will join?',1),(10,13,2,'Your feedback...',0),(11,14,1,'What\'s your name?',1),(12,14,4,'Do you wanna join with us?',1),(13,14,4,'How many performance you want to join',0),(14,15,1,'dasdsa',0),(15,15,4,'dsadsa',0),(16,15,3,'dasdsa',1),(17,24,3,'21211',1),(18,25,4,'sadsadas',1),(19,25,3,'fsdfds',0),(20,26,3,'What\'s your name?',1),(21,27,1,'',0),(22,27,4,'',0),(23,27,3,'',0),(24,28,1,'fd',0),(25,28,4,'fdss',0),(26,28,3,'dfsfs',0),(27,29,1,'111',0),(28,30,1,'gdf',0),(29,30,4,'gdfgfd',1),(30,30,3,'gfdgf',0),(31,31,3,'g dfg fdg',1),(32,32,3,'aaaaaa',0),(33,33,1,'cau hoi 1',0),(34,33,4,'cau hoi 2',1),(35,33,3,'cau hoi 3',1),(36,34,1,'bbb',0),(37,34,4,'bbb',1),(38,34,3,'bbbb',0),(39,34,2,'bbbbbb',0),(40,35,1,'Who are you',1),(41,35,4,'Will join',1),(42,35,3,'Who with',1),(43,35,2,'Your feedback',0),(44,36,4,'121',0),(45,36,4,'123',0),(46,36,4,'fds',0),(47,36,3,'333',0),(48,36,3,'334',0),(49,37,4,'12121',0),(50,38,4,'12121',0),(51,39,1,'hgj',0);
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
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `surveydescribe` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `maincolor` varchar(45) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `stopsurvey` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idsurvey`),
  KEY `fk_Survey_User` (`iduser`),
  CONSTRAINT `fk_Survey_User` FOREIGN KEY (`iduser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (5,2,'2016-03-22','3213','3241','324',NULL,0),(6,2,'0000-00-00','xyz','345','456','123',0),(7,2,'2016-01-24','xyz','345','456','123',0),(8,3,'2016-04-01','2121','321312','#4a62bb','Cover_2016_03_30_08_46_31.png',0),(9,3,'2016-04-01','211','dfds','#23bcc3','Cover_2016_03_30_08_53_53.jpg',0),(10,3,'2016-04-01','Work','fdfdsf','#7b4444','Cover_2016_03_30_09_20_54.png',0),(11,3,'2016-04-01','gdfg','gdfgfd','#7b4444','Cover_2016_03_30_09_20_54.png',0),(12,3,'2016-04-01','wwww','wwww','#7b4444','Cover_2016_03_30_09_20_54.png',0),(13,3,'2016-04-01','Year End Party','Survey for the Year End Party of Enclave 2016 \\m/','#fd0000','Cover_2016_03_30_08_46_49.jpg',0),(14,1,'2016-04-01','Music Event ','Survey for music event on 25/4/1026.\nLet join with us. \nIn here, you can find a lot of beautiful girl \\m/','#3b3b52','Cover_2016_03_30_08_47_02.png',0),(15,3,'2016-04-01','2121','sdasd','#fd0000','Cover_admin_2016_04_01_12_03_26.jpg',0),(16,3,'2016-04-01','12121','','#2da52f','Cover_admin_2016_04_01_13_18_40.jpg',0),(17,3,'2016-04-01','17','17','#3b3b52','Cover_admin_2016_04_01_13_21_30.png',0),(18,3,'2016-04-01','18','fdsfs','#4a62bb','Cover_admin_2016_04_01_13_22_54.png',0),(19,3,'2016-04-01','19','dáá','#fd0000','Cover_admin_2016_04_01_14_46_59.jpg',0),(20,3,'2016-04-01','20','20','#fd0000','Cover_admin_2016_04_01_14_58_22.jpg',0),(21,3,'2016-04-01','21','21','#fd0000','Cover_admin_2016_04_01_15_45_30.jpg',0),(22,3,'2016-04-01','3123','31231','#3b3b52','Cover_admin_2016_04_01_15_49_23.png',0),(23,3,'2016-04-01','76575','sdffd','#7b4444','Cover_admin_2016_04_01_15_50_44.png',0),(24,3,'2016-04-01','gdfgfdg','gfdgdf','#7b4444','Cover_admin_2016_04_01_15_57_11.png',0),(25,3,'2016-04-01','Survey 121212 ','21543rgdsf','#2da52f','Cover_admin_2016_04_01_15_59_43.jpg',0),(26,3,'2016-04-04','Survey Cuz','Survey Cuz','#2196F3','#2196F3',0),(27,3,'2016-04-04','','','#2196F3','#2196F3',0),(28,3,'2016-04-04','12121','dfg','#2196F3','#2196F3',0),(29,3,'2016-04-04','1111111','1111','#3b3b52','Cover_admin_2016_04_04_16_44_27.png',0),(30,1,'2016-04-04','2121','fdsf','#23bcc3','Cover_user_2016_04_04_16_49_59.jpg',0),(31,6,'2016-04-04','2121','dgfbfgb b fg fdg fdg fdg dfg fdg dg df','#fd0000','Cover_tuancom1993_2016_04_04_17_05_41.jpg',0),(32,3,'2016-04-05','aaaaaaaa','','#fd0000','Cover_admin_2016_04_05_15_22_52.jpg',0),(33,3,'2016-04-05','tuancom','tuancom day','#4a62bb','Cover_admin_2016_04_05_16_20_58.png',0),(34,3,'2016-04-05','bbbb','bbbb','#2da52f','Cover_admin_2016_04_05_17_24_12.jpg',0),(35,3,'2016-04-07','My wedding','1211','#23bcc3','Cover_admin_2016_04_07_09_46_13.jpg',0),(36,3,'2016-04-11','Test','','#4a62bb','Cover_admin_2016_04_11_11_37_54.png',0),(37,3,'2016-04-11','Test 2','','#fd0000','Cover_admin_2016_04_11_11_41_55.jpg',0),(38,3,'2016-04-11','Test 3','','#2da52f','Cover_admin_2016_04_11_11_43_14.jpg',0),(39,3,'2016-04-11','ghjghj','','#12760d','Cover_admin_2016_04_11_16_06_54.jpg',0);
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
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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

-- Dump completed on 2016-04-11 17:25:09
