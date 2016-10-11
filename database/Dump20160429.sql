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
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (10,6,''),(11,7,'Male'),(12,7,'Female'),(13,8,'Family'),(14,8,'Girl (Boy) Friend'),(15,8,'Other...'),(16,9,'Yes'),(17,9,'No'),(18,10,''),(20,12,'Yes'),(21,12,'No 2'),(22,13,'1'),(23,13,'2'),(24,13,'3'),(25,13,'4'),(27,14,''),(28,15,'Nam'),(29,15,'Nữ'),(30,16,'Anh Còm đẹp trai'),(31,16,'Anh còm thiên tài'),(50,28,''),(51,29,'gdfgdf'),(52,30,'gfdg'),(53,30,'gdfgdf'),(69,40,''),(70,41,'Yes'),(71,41,'No'),(72,42,'Mother'),(73,42,'Dad'),(74,42,'Boy or Girl friend'),(75,43,''),(99,52,''),(134,8,'Not Yet'),(138,70,'RỒi'),(139,70,'Chưa có đâu, ahihi'),(160,8,'Don\'t know'),(161,80,''),(162,81,'Male'),(163,81,'Female'),(164,82,'Yes'),(165,82,'Not yet'),(166,83,''),(167,84,'2121'),(170,12,'Don\'t know'),(171,13,'5'),(172,13,'6'),(173,87,''),(186,9,'Don\'t know'),(216,105,''),(221,107,''),(223,8,'Not sure'),(224,108,'ra 1'),(225,108,'ra 2'),(226,108,'ra 3'),(227,109,'check 1'),(229,109,'check 2'),(230,110,'ahihi'),(231,110,'hehehe'),(236,112,''),(237,113,'fsdf'),(262,130,''),(263,131,'gdfgfd'),(264,131,'jhjgh'),(265,131,'7654'),(266,132,''),(267,133,'gfdg'),(268,133,'gdf'),(269,134,'gdfg'),(270,134,'ỷtytr'),(271,134,'75465'),(272,134,'jdfgf'),(274,125,'jghj'),(275,125,'jghg'),(276,110,'sd'),(277,110,'876'),(278,136,'12121'),(279,136,'534534'),(280,136,'2121'),(281,137,''),(282,12,'Not sure'),(283,138,''),(284,139,''),(285,140,''),(286,141,'hfg'),(287,142,'hfgf'),(288,143,'gdfgf'),(289,144,''),(290,145,'hfghf'),(291,146,'uioyi'),(292,147,'fhgf'),(293,147,'hfghfg'),(294,148,'bb'),(295,149,''),(296,150,''),(297,151,''),(298,152,'hfghgf'),(299,152,'hfghgf'),(300,153,'2121'),(301,153,'2121'),(302,154,'2123'),(303,154,'hgfhf'),(304,155,''),(305,156,'hhh'),(306,156,'nnnn'),(313,162,'433'),(314,162,'hgfhfg'),(315,162,'2121'),(316,163,'fsdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=2281 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answeruser`
--

LOCK TABLES `answeruser` WRITE;
/*!40000 ALTER TABLE `answeruser` DISABLE KEYS */;
INSERT INTO `answeruser` VALUES (22,1,6,'tuan anh'),(23,1,10,'my feedback is.....'),(24,1,8,'13'),(25,1,8,'14'),(26,1,7,'11'),(27,1,9,'16'),(28,2,6,'tuan anh 23'),(29,2,10,'my feedback is..... 21 21'),(30,2,8,'13'),(31,2,8,'14'),(32,2,8,'15'),(33,2,7,'12'),(34,2,9,'17'),(35,3,6,'tuan anh 23'),(36,3,10,'my feedback is..... 21 21'),(37,3,8,'13'),(38,3,8,'14'),(39,3,8,'15'),(40,3,7,'12'),(41,3,9,'17'),(42,4,40,'tuan com'),(43,4,43,'no feed back :v'),(44,4,42,'72'),(45,4,42,'73'),(46,4,42,'74'),(47,4,41,'70'),(48,5,6,'tuan anh 1993'),(49,5,10,'123'),(50,5,8,'13'),(51,5,8,'14'),(52,5,8,'15'),(53,5,7,'11'),(54,5,9,'16'),(55,6,6,'2121'),(56,6,10,''),(57,6,7,'11'),(58,6,9,'16'),(59,7,6,'Davy'),(60,7,10,'212121'),(61,7,8,'13'),(62,7,8,'14'),(63,7,7,'12'),(64,7,9,'17'),(65,8,6,'tu'),(66,8,10,''),(67,8,8,'13'),(68,8,8,'14'),(69,8,7,'12'),(70,8,9,'17'),(80,12,6,'Su'),(81,12,10,'No feedback in here'),(82,12,8,'14'),(83,12,7,'12'),(84,12,9,'16'),(86,13,12,'20'),(88,14,12,'21'),(89,14,13,'25'),(91,15,12,'20'),(92,15,13,'23'),(94,16,12,'20'),(95,16,13,'24'),(96,17,6,'Tuấn Còm'),(97,17,10,'Không có feedback gì cả :v :v :v'),(98,17,8,'14'),(99,17,7,'11'),(100,17,9,'16'),(101,18,6,'2121'),(102,18,10,' asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa '),(103,18,8,'14'),(104,18,7,'11'),(105,18,9,'16'),(106,19,6,'2121'),(107,19,10,'1221'),(108,19,8,'14'),(109,19,7,'11'),(110,19,9,'16'),(116,22,40,'Khong biet'),(117,22,43,'O o O o'),(118,22,42,'72'),(119,22,42,'74'),(120,22,41,'70'),(121,23,40,'Khong biet'),(122,23,43,'O o O o'),(123,23,42,'72'),(124,23,42,'74'),(125,23,41,'71'),(126,24,6,'121'),(127,24,10,'gdfgfd'),(128,24,8,'13'),(129,24,8,'14'),(130,24,7,'12'),(131,24,9,'16'),(132,25,6,'121'),(133,25,10,'gdfgfd'),(134,25,8,'13'),(135,25,8,'14'),(136,25,7,'12'),(137,25,9,'16'),(138,26,6,'121'),(139,26,10,'gdfgfd'),(140,26,8,'13'),(141,26,8,'14'),(142,26,7,'12'),(143,26,9,'16'),(145,27,12,'20'),(148,28,12,'20'),(149,28,13,'22'),(151,29,12,'20'),(152,29,13,'22'),(154,30,12,'20'),(155,30,13,'22'),(197,49,14,''),(198,49,16,'30'),(199,49,16,'31'),(200,49,15,'29'),(201,50,14,'212'),(202,50,16,'31'),(203,50,15,'28'),(204,51,14,'212'),(205,51,16,'31'),(206,51,15,'28'),(207,52,14,'212'),(208,52,16,'31'),(209,53,14,'212'),(210,52,15,'28'),(211,53,16,'31'),(212,53,15,'28'),(213,54,14,'212'),(214,54,16,'31'),(215,54,15,'28'),(216,55,14,'212'),(217,55,16,'31'),(218,55,15,'28'),(219,56,14,'212'),(220,56,16,'31'),(221,56,15,'28'),(222,57,14,'212'),(223,57,16,'31'),(224,57,15,'28'),(225,58,6,''),(226,58,10,'dsada'),(230,58,7,'11'),(232,59,14,'2121'),(233,59,16,'30'),(234,59,16,'31'),(235,59,15,'29'),(236,59,70,'139'),(237,60,14,'Em xinh gái :\"3'),(238,60,16,'30'),(239,60,16,'31'),(240,60,15,'29'),(241,60,70,'138'),(1995,498,6,'ddas'),(1996,498,10,'das'),(1997,498,8,'15'),(2000,498,7,'12'),(2002,499,6,'2121'),(2003,499,10,''),(2004,499,8,'15'),(2007,499,7,'12'),(2008,499,9,'17'),(2009,500,40,'121'),(2010,500,43,''),(2011,500,42,'73'),(2012,500,42,'74'),(2013,500,41,'70'),(2014,501,40,'121'),(2015,501,43,''),(2016,501,42,'73'),(2017,501,42,'74'),(2018,501,41,'70'),(2019,502,6,'2121'),(2020,502,10,'dsads'),(2021,502,8,'15'),(2022,502,8,'134'),(2025,502,9,'16'),(2026,503,6,'12121'),(2027,503,10,''),(2028,503,8,'134'),(2030,503,7,'11'),(2031,503,9,'17'),(2032,504,6,'fdsfsd'),(2033,504,10,'fdsfs'),(2035,504,8,'160'),(2036,504,7,'11'),(2037,504,9,'16'),(2038,505,80,'w2121'),(2039,505,83,'dasd'),(2040,505,81,'162'),(2041,505,81,'163'),(2042,505,82,'164'),(2043,506,80,'gdfgfd'),(2044,506,83,''),(2045,506,81,'163'),(2046,506,82,'164'),(2048,507,12,'20'),(2049,507,13,'22'),(2050,508,14,'<form> <br> a<div></div> aaa'),(2051,508,16,'30'),(2052,508,16,'31'),(2053,508,15,'28'),(2054,508,70,'139'),(2055,509,6,'212'),(2057,509,10,''),(2059,509,8,'14'),(2060,509,8,'15'),(2061,509,7,'11'),(2062,509,9,'17'),(2063,510,6,'212'),(2064,510,10,'jhg'),(2065,510,8,'14'),(2066,511,6,'212'),(2067,510,7,'12'),(2068,511,10,'jhg'),(2069,510,9,'16'),(2070,511,8,'14'),(2071,511,7,'12'),(2072,511,9,'16'),(2073,512,6,'fds'),(2074,512,10,'212'),(2075,512,8,'14'),(2076,512,8,'15'),(2077,512,8,'134'),(2078,512,7,'12'),(2079,512,9,'186'),(2081,513,105,'hf'),(2083,514,6,'Huy'),(2084,514,10,'2121'),(2085,514,8,'223'),(2086,514,7,'11'),(2087,514,9,'186'),(2088,515,87,'dfgsd'),(2089,515,110,'230'),(2090,515,109,'227'),(2091,515,109,'229'),(2092,515,108,'225'),(2093,516,87,'jghfd'),(2094,516,110,'230'),(2095,516,110,'231'),(2096,516,109,'227'),(2097,516,108,'224'),(2098,517,87,''),(2099,517,108,'226'),(2100,518,87,''),(2101,518,108,'226'),(2113,522,130,'sdrds'),(2114,523,130,'fsdfds'),(2115,523,131,'263'),(2116,524,130,'554'),(2117,524,131,'264'),(2118,525,130,'999'),(2119,525,131,'263'),(2120,526,132,''),(2121,526,134,'269'),(2122,526,134,'270'),(2123,526,133,'267'),(2124,527,80,''),(2125,527,83,''),(2126,528,80,'fdsfds'),(2127,528,83,'fdsfd'),(2128,528,81,'162'),(2129,528,82,'165'),(2130,528,84,'167'),(2131,529,87,'fgd'),(2132,529,110,'276'),(2133,529,109,'227'),(2134,529,108,'226'),(2135,530,136,'278'),(2136,530,136,'279'),(2137,530,125,'274'),(2138,531,137,'gdf'),(2139,531,136,'278'),(2140,531,136,'279'),(2141,531,125,'275'),(2142,532,40,'jhggd'),(2143,532,43,''),(2144,532,42,'72'),(2145,532,42,'73'),(2146,532,41,'70'),(2147,533,138,'abc'),(2148,533,12,'282'),(2149,533,13,'25'),(2150,534,138,'65453'),(2151,534,12,'21'),(2152,534,13,'172'),(2153,535,138,''),(2154,535,12,'20'),(2155,535,13,'23'),(2156,536,6,'87654'),(2157,536,10,''),(2158,536,8,'134'),(2159,536,7,'12'),(2160,536,9,'16'),(2161,537,14,'121'),(2162,537,16,'31'),(2163,537,15,'28'),(2164,537,70,'139'),(2165,538,139,'2121'),(2166,538,140,'5465'),(2167,538,141,'286'),(2168,538,142,'287'),(2169,539,144,'gdf'),(2170,539,145,'290'),(2171,540,14,'121'),(2172,540,16,'30'),(2173,540,15,'28'),(2174,540,70,'139'),(2175,541,14,'11'),(2176,541,16,'30'),(2177,541,16,'31'),(2178,541,15,'28'),(2179,541,70,'139'),(2180,542,14,'ggggg'),(2181,542,16,'30'),(2182,542,16,'31'),(2183,542,15,'28'),(2184,542,70,'138'),(2185,543,147,'292'),(2186,544,52,'jhhjhk'),(2187,544,149,''),(2188,545,6,'bb'),(2189,545,150,'ahjhj'),(2190,545,10,'yybb'),(2191,545,8,'15'),(2192,545,7,'12'),(2193,545,9,'186'),(2194,546,151,'sdfsd'),(2195,546,155,'2121'),(2196,546,154,'302'),(2197,546,152,'298'),(2198,546,153,'300'),(2199,547,151,'1211'),(2200,547,155,'21'),(2201,547,156,'306'),(2202,547,154,'302'),(2203,547,154,'303'),(2204,547,152,'298'),(2205,547,153,'301'),(2206,548,14,'hhhhhhh'),(2207,548,16,'30'),(2208,548,15,'28'),(2209,548,70,'139'),(2210,549,14,''),(2211,550,6,'2121'),(2212,550,150,'hgfhfg'),(2213,550,10,'122'),(2214,550,8,'15'),(2215,550,8,'134'),(2216,550,7,'11'),(2217,550,9,'17'),(2218,551,138,'ytytrytrytryt'),(2219,551,12,'170'),(2220,551,13,'25'),(2221,552,138,'ht4'),(2222,552,12,'20'),(2223,552,13,'22'),(2224,553,6,'Mark'),(2225,553,150,'What\'s up?'),(2226,553,10,'Beautiful apps!'),(2227,553,8,'13'),(2228,553,8,'14'),(2229,553,8,'15'),(2230,553,8,'134'),(2231,553,8,'160'),(2232,553,8,'223'),(2233,553,7,'11'),(2234,553,9,'186'),(2235,554,87,''),(2236,554,110,'231'),(2237,554,109,'229'),(2238,555,87,''),(2239,555,110,'276'),(2240,555,109,'227'),(2250,565,6,'2121'),(2251,565,150,''),(2252,565,10,''),(2253,565,8,'134'),(2254,565,7,'11'),(2255,565,9,'186'),(2256,566,6,'43432'),(2257,566,150,'fdsfdsf ds'),(2258,566,10,''),(2259,566,8,'160'),(2260,566,7,'11'),(2261,566,9,'186'),(2262,567,6,'gfgd'),(2263,567,150,'dsf'),(2264,567,10,'fsdf'),(2265,567,8,'13'),(2266,567,8,'14'),(2267,567,7,'11'),(2268,567,9,'17'),(2269,568,6,'1111'),(2270,568,150,'11'),(2271,568,10,'11'),(2272,568,8,'13'),(2273,568,7,'11'),(2274,568,9,'16'),(2275,569,6,'121'),(2276,569,150,''),(2277,569,10,''),(2278,569,8,'14'),(2279,569,7,'12'),(2280,569,9,'17');
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
) ENGINE=InnoDB AUTO_INCREMENT=570 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datasurvey`
--

LOCK TABLES `datasurvey` WRITE;
/*!40000 ALTER TABLE `datasurvey` DISABLE KEYS */;
INSERT INTO `datasurvey` VALUES (1,13,'2016-04-07'),(2,13,'2016-04-07'),(3,13,'2016-04-07'),(4,35,'2016-04-07'),(5,13,'2016-04-07'),(6,13,'2016-04-07'),(7,13,'2016-04-07'),(8,13,'2016-04-07'),(12,13,'2016-04-07'),(13,14,'2016-04-08'),(14,14,'2016-04-08'),(15,14,'2016-04-08'),(16,14,'2016-04-08'),(17,13,'2016-04-08'),(18,13,'2016-04-08'),(19,13,'2016-04-08'),(22,35,'2016-04-11'),(23,35,'2016-04-11'),(24,13,'2016-04-11'),(25,13,'2016-04-11'),(26,13,'2016-04-11'),(27,14,'2016-04-11'),(28,14,'2016-04-11'),(29,14,'2016-04-11'),(30,14,'2016-04-11'),(47,26,'2016-04-11'),(48,26,'2016-04-11'),(49,15,'2016-04-11'),(50,15,'2016-04-11'),(51,15,'2016-04-11'),(52,15,'2016-04-11'),(53,15,'2016-04-11'),(54,15,'2016-04-11'),(55,15,'2016-04-11'),(56,15,'2016-04-11'),(57,15,'2016-04-11'),(58,13,'2016-04-13'),(59,15,'2016-04-13'),(60,15,'2016-04-13'),(498,13,'2016-04-13'),(499,13,'2016-04-13'),(500,35,'2016-04-13'),(501,35,'2016-04-13'),(502,13,'2016-04-13'),(503,13,'2016-04-13'),(504,13,'2016-04-13'),(505,26,'2016-04-13'),(506,26,'2016-04-13'),(507,14,'2016-04-13'),(508,15,'2016-04-14'),(509,13,'2016-04-14'),(510,13,'2016-04-14'),(511,13,'2016-04-14'),(512,13,'2016-04-14'),(513,46,'2016-04-15'),(514,13,'2016-04-15'),(515,45,'2016-04-15'),(516,45,'2016-04-15'),(517,45,'2016-04-15'),(518,45,'2016-04-15'),(521,54,'2016-04-15'),(522,57,'2016-04-15'),(523,57,'2016-04-15'),(524,57,'2016-04-15'),(525,57,'2016-04-15'),(526,58,'2016-04-19'),(527,26,'2016-04-19'),(528,26,'2016-04-19'),(529,45,'2016-04-19'),(530,54,'2016-04-19'),(531,54,'2016-04-19'),(532,35,'2016-04-19'),(533,14,'2016-04-19'),(534,14,'2016-04-19'),(535,14,'2016-04-19'),(536,13,'2016-04-20'),(537,15,'2016-04-21'),(538,60,'2016-04-21'),(539,61,'2016-04-21'),(540,15,'2016-04-21'),(541,15,'2016-04-21'),(542,15,'2016-04-21'),(543,62,'2016-04-22'),(544,40,'2016-04-25'),(545,13,'2016-04-25'),(546,63,'2016-04-27'),(547,63,'2016-04-27'),(548,15,'2016-04-28'),(549,15,'2016-04-28'),(550,13,'2016-04-28'),(551,14,'2016-04-28'),(552,14,'2016-04-28'),(553,13,'2016-04-28'),(554,45,'2016-04-29'),(555,45,'2016-04-29'),(565,13,'2016-04-29'),(566,13,'2016-04-29'),(567,13,'2016-04-29'),(568,13,'2016-04-29'),(569,13,'2016-04-29');
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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `feedbackdate` date DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idfeedback`),
  KEY `fk_Feedback_User` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'3','aloooo','2016-03-14','hgfh'),(2,'2','212121','0000-00-00','231'),(3,'2','12121','2016-04-27','gdf'),(4,'123','232  ggdfg df','2016-04-28',NULL),(5,'Vu Xuan Tuan Anh','why my account has been blocked??????',NULL,'tuancom1993@gmail.com'),(6,'Vũ Xuân Tuấn Anh','why my account has been blocked??????',NULL,'tuancom1993@gmail.com'),(7,'dssa','111','2016-04-29','fdsfdsfs'),(8,'','','2016-04-29',''),(9,'fgfd','212','2016-04-29','dgfgd'),(10,'2121','Year 1','2016-04-29','2121@2121'),(11,'11','11','2016-04-29','11'),(12,'','','2016-04-29',''),(13,'2121','fsd','2016-04-29','2121'),(14,'','bb','2016-04-29',''),(15,'','','2016-04-29',''),(16,'ghdf','3321','2016-04-29','gdf');
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
  `mandatory` int(11) DEFAULT NULL,
  `indexq` int(11) DEFAULT NULL,
  PRIMARY KEY (`idquestion`),
  KEY `fk_Question_Survey` (`idsurvey`),
  KEY `fk_Question_KindQuestion` (`idkindquestion`),
  CONSTRAINT `fk_Question_KindQuestion` FOREIGN KEY (`idkindquestion`) REFERENCES `kindquestion` (`idkindquestion`),
  CONSTRAINT `fk_Question_Survey` FOREIGN KEY (`idsurvey`) REFERENCES `survey` (`idSurvey`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (6,13,1,'What\'s your name?',1,1),(7,13,4,'Your sex:',1,2),(8,13,3,'You will go with?',1,3),(9,13,4,'You will join?',1,4),(10,13,2,'Your feedback...',0,6),(12,14,4,'Do you wanna join with us?',1,1),(13,14,4,'How many performance you want to join',0,2),(14,15,1,'Who are you?',1,1),(15,15,4,'Your Sex :\"3',0,2),(16,15,3,'Bạn thích ai?',1,3),(28,30,1,'gdf',0,1),(29,30,4,'gdfgfd',1,1),(30,30,3,'gfdgf',0,1),(40,35,1,'Who are you',1,1),(41,35,4,'Will join',1,2),(42,35,3,'Who with',1,3),(43,35,2,'Your feedback',0,4),(52,40,1,'hhh',1,1),(70,15,4,'Bạn có bồ chưa?',0,4),(80,26,1,'Who are you?',1,1),(81,26,3,'You are',0,2),(82,26,4,'Get married',0,3),(83,26,2,'Your feedback.',0,4),(84,26,4,'12121',0,5),(87,45,1,'fsdf',0,1),(105,46,1,'sôsososo',0,1),(107,46,2,'yutut',0,2),(108,45,4,'Radio',0,3),(109,45,3,'Check box',1,4),(110,45,3,'Check first',1,2),(112,47,1,'21',0,1),(113,47,4,'fsdfds',0,2),(125,54,4,'fsdfdsfds',1,1),(130,57,1,'gdf',0,1),(131,57,4,'2121',0,2),(132,58,1,'Hoo',0,1),(133,58,4,'21',0,2),(134,58,3,'hfghfg',0,3),(136,54,3,'gfd',0,3),(137,54,2,'area',0,2),(138,14,2,'Feedback',0,3),(139,60,1,'3253',0,1),(140,60,1,'rw',0,2),(141,60,3,'321',0,3),(142,60,4,'gdf',0,4),(143,60,3,'dfgdf',0,5),(144,61,1,'fgd',0,1),(145,61,4,'ủtwt',0,2),(146,61,3,'dfgdggfd',0,3),(147,62,3,'2121',1,1),(148,40,4,'gg',0,3),(149,40,2,'feed',0,2),(150,13,2,'Why?',0,5),(151,63,1,'gdf',1,1),(152,63,4,'2121',1,2),(153,63,4,'gfgdf',0,4),(154,63,3,'7676',0,5),(155,63,2,'gfdgdf',0,6),(156,63,3,'hhhhh',0,3),(162,69,3,'fdsds',0,1),(163,69,4,'efdfds',0,2);
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
  `stopsurvey` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsurvey`),
  KEY `fk_Survey_User` (`iduser`),
  CONSTRAINT `fk_Survey_User` FOREIGN KEY (`iduser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (13,3,'2016-02-20','Year End Party','Survey for the Year End Party of Enclave 2016 \\m/\nMai zooo\nMai zooo \\m/','#fd0000','Cover_2016_03_30_08_46_49.jpg',0),(14,1,'2016-04-19','Music Event','Survey for music event on 25/4/1026.\nLet join with us. \nIn here, you can find a lot of beautiful girl \\m/','#3b3b52','Cover_2016_03_30_08_47_02.png',0),(15,3,'2016-03-24','Survey 2','sasa \n sa sa\n sas\na\ns','#fd0000','Cover_admin_2016_04_01_12_03_26.jpg',0),(26,3,'2016-04-19','Survey Cuz 2','Survey Cuz','#2196F3','#2196F3',0),(30,1,'2016-04-04','2121','fdsf','#23bcc3','Cover_user_2016_04_04_16_49_59.jpg',0),(35,3,'2016-04-07','My wedding','1211','#23bcc3','Cover_admin_2016_04_07_09_46_13.jpg',0),(40,3,'2016-04-12','hhh uu','','#fd0000','Cover_admin_2016_04_12_16_35_31.jpg',0),(45,3,'2016-04-13','Vũ Xuân Tuấn Anh','fds','#7b4444','Cover_admin_2016_04_13_16_17_11.png',0),(46,3,'2016-04-15','Color','ghgfhfgh','#2da52f','Cover_admin_2016_04_14_10_28_18.jpg',0),(47,6,'2016-04-15','gdfgfd','dá','#fd0000','Cover_tuancom1993_2016_04_15_12_03_03.jpg',0),(54,3,'2016-04-15','fdsfsd 2312','fds','#f44336','#f44336',0),(57,3,'2016-04-15','fdfsd','gfdgfd','#319e30','Cover_admin_2016_04_15_15_08_32.jpg',0),(58,3,'2016-04-15','Do You Wanna Learn','','#fd3e00','Cover_admin_2016_04_15_15_13_50.jpg',0),(60,3,'2016-04-21','123456789','09876543','#f44336','#f44336',0),(61,3,'2016-04-21','2121','ghfhgf','#2da52f','Cover_admin_2016_04_21_13_10_50.jpg',0),(62,4,'2016-04-22','ggg','','#2da52f','Cover_tuancom_2016_04_22_13_31_58.jpg',0),(63,3,'2016-04-27','Foot BAll','dfsd','#12760d','Cover_admin_2016_04_27_10_51_42.jpg',0),(69,3,'2016-04-29','ABC','212121','#7b4444','Cover_admin_2016_04_29_09_30_20.png',0);
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
  `getnumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtemplate`),
  KEY `fk_Template_Tag` (`idtag`),
  CONSTRAINT `fk_Template_Tag` FOREIGN KEY (`idtag`) REFERENCES `tag` (`idtag`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
INSERT INTO `template` VALUES (5,'Color Template',1,'Cover_2016_03_30_08_46_31.png','#4a62bb','2016-03-29',1),(6,'Event Template',4,'Cover_2016_03_30_08_46_49.jpg','#fd0000','2016-03-29',2),(8,'Wedding Template',5,'Cover_2016_03_30_08_53_53.jpg','#23bcc3','2016-03-29',0),(9,'Work',2,'Cover_2016_03_30_09_20_54.png','#7b4444','2016-03-29',1),(10,'Music Template',3,'Cover_2016_03_30_08_47_02.png','#3b3b52','2016-03-29',5),(11,'Football Template',6,'Cover_2016_03_30_09_18_50.jpg','#12760d','2016-03-30',7),(12,'Other Template',7,'Cover_2016_03_30_08_55_01.jpg','#2da52f','2016-03-30',1),(13,'Beach Templat',7,'Cover_2016_04_25_14_09_21.jpg','#319e30','2016-04-15',3),(14,'Học Hành Gì??',2,'Cover_2016_04_15_15_12_54.jpg','#8c8987','2016-04-15',12);
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
  `sex` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `avata` text,
  `block` int(11) DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  KEY `fk_User_Role` (`idrole`),
  CONSTRAINT `fk_User_Role` FOREIGN KEY (`idrole`) REFERENCES `role` (`idrole`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user','user',2,'User normal',0,'2016-03-15','2121@111','016565456','null_2016_03_28_13_15_26.jpg',0),(2,'tuancom1993','123',2,'Tuấn Anh',1,'1992-12-27','121@41','0168452111','tuancom1993_2016_04_21_10_13_45.png',1),(3,'admin','admin',1,'Admin of System',1,'1993-10-20','admin@enclave.vn','123456789','admin_2016_04_22_13_43_15.png',0),(4,'tuancom','123',1,'vu xuan tuan anh 4',1,'1992-12-27','123@321','01263759260','tuacom_2016_03_23_09_01_26.png',0),(6,'tuancom1993','huynung123',1,'Vũ Xuân Tuấn Anh',1,'1993-10-21','tuancom1993@gmail.com','01263759260','tuancom1993_2016_03_21_18_17_47.jpg',0),(7,'doremon','dora',2,'doraemon ahjhj',0,'2015-12-25','3212@12121','21213121112121','dore_2016_03_22_16_30_48.jpg',0),(11,'anhhai','anh',2,'anh',1,'2016-04-20','anh@anh','874511','anhhai_2016_04_22_14_36_38.png',0),(12,'anh2','anh',2,'anh',0,'2016-04-22','w121@1212','2121','anh2_2016_04_19_16_07_10.jpg',0),(13,'bbb','bbb',2,'bbb',1,'2016-04-11','bbb@bbb','1221','User.png',0),(14,'123','123',2,'1111111111',1,'2016-04-19','123@123','2121212121','User.png',0),(15,'admin2','12121',2,'2121',0,'2016-04-19','212@1212','2121212121','User.png',0),(16,'ttttt','121,121',2,'ttt',0,'2016-04-21','quan@121','01112121','ttttt_2016_04_26_09_56_51.jpg',0),(17,'bbbb','2121,2121',1,'bbbb',0,'2016-04-17','r121@121','21213243','User.png',0),(19,'tuancomggg','huynung',2,'tuancom',1,'2016-04-25','2121@2121','12121','User.png',0),(21,'1211','123',2,'tuanmc',0,'2016-04-10','121@112','11','User.png',0),(22,'212121','123',2,'421',1,'2016-04-18','123@12','21','User.png',0),(23,'tuancom93','123',2,'666',0,'1993-10-20','121@12','2121','User.png',0),(24,'12321','321',2,'hsas a',1,'2016-04-25','121@21','21','12321_2016_04_27_10_50_48.jpg',0);
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

-- Dump completed on 2016-04-29 13:15:20
