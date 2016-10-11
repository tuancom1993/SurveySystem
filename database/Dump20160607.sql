-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: surveysystem
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.9-MariaDB

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
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (10,6,''),(11,7,'Male'),(12,7,'Female'),(13,8,'Family'),(14,8,'Girl (Boy) Friend'),(15,8,'Other...'),(16,9,'Yes'),(17,9,'No'),(18,10,''),(20,12,'Yes'),(21,12,'No 2'),(22,13,'1'),(23,13,'2'),(24,13,'3'),(25,13,'4'),(50,28,''),(51,29,'Nam'),(52,30,'Vấn đề cấp bách của môi trường'),(170,12,'Don\'t know'),(171,13,'5'),(186,9,'Don\'t know'),(223,8,'Not sure'),(236,112,''),(237,113,'fsdf'),(282,12,'Not sure'),(283,138,''),(292,147,'fhgf'),(293,147,'hfghfg'),(296,150,''),(372,190,''),(375,13,'More than 5'),(376,30,'Mục tiêu đặt ra'),(377,191,''),(378,192,''),(379,193,'Male'),(380,193,'Female'),(381,194,'Dislike'),(382,194,'Rather like'),(383,194,'Like'),(384,195,'Change teacher'),(385,195,'Change the course content'),(386,195,'Upgrade equipment to practice'),(387,195,'Extra hours to practice'),(388,195,'Update new technology'),(389,195,'Do nothing'),(390,196,''),(391,197,''),(392,198,'Yes'),(393,198,'No'),(394,198,'Thinking'),(395,199,'Family'),(396,199,'Girl or Boy friend'),(397,199,'Someone'),(398,200,''),(399,201,'11T'),(400,201,'12T'),(401,201,'13T'),(402,201,'14T'),(403,201,'15T'),(404,202,''),(405,203,'Áo quần thi đấu'),(406,203,'Giày thi đấu'),(407,203,'Bóng'),(408,204,''),(409,205,''),(410,206,''),(411,207,'2011'),(412,207,'2012'),(413,207,'2013'),(414,207,'2014'),(415,208,'Máy tính cá nhân'),(416,208,'Giáo Án'),(417,209,''),(418,29,'Nữ'),(419,30,'Quyết định của chính quyền'),(420,30,'Trao quà hoặc phần thường'),(421,210,''),(422,211,''),(423,212,'Male'),(424,212,'Female'),(425,213,''),(426,214,''),(427,215,'Red'),(428,215,'Blue'),(429,215,'Yellow'),(430,215,'Green'),(431,215,'Brow');
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
  CONSTRAINT `fk_AnswerUser_Question` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idquestion`)
) ENGINE=InnoDB AUTO_INCREMENT=2750 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answeruser`
--

LOCK TABLES `answeruser` WRITE;
/*!40000 ALTER TABLE `answeruser` DISABLE KEYS */;
INSERT INTO `answeruser` VALUES (22,1,6,'tuan anh'),(23,1,10,'my feedback is.....'),(24,1,8,'13'),(25,1,8,'14'),(26,1,7,'11'),(27,1,9,'16'),(28,2,6,'tuan anh 23'),(29,2,10,'my feedback is..... 21 21'),(30,2,8,'13'),(31,2,8,'14'),(32,2,8,'15'),(33,2,7,'12'),(34,2,9,'17'),(35,3,6,'tuan anh 23'),(36,3,10,'my feedback is..... 21 21'),(37,3,8,'13'),(38,3,8,'14'),(39,3,8,'15'),(40,3,7,'12'),(41,3,9,'17'),(48,5,6,'tuan anh 1993'),(49,5,10,'123'),(50,5,8,'13'),(51,5,8,'14'),(52,5,8,'15'),(53,5,7,'11'),(54,5,9,'16'),(55,6,6,'2121'),(56,6,10,''),(57,6,7,'11'),(58,6,9,'16'),(59,7,6,'Davy'),(60,7,10,'212121'),(61,7,8,'13'),(62,7,8,'14'),(63,7,7,'12'),(64,7,9,'17'),(65,8,6,'tu'),(66,8,10,''),(67,8,8,'13'),(68,8,8,'14'),(69,8,7,'12'),(70,8,9,'17'),(80,12,6,'Su'),(81,12,10,'No feedback in here'),(82,12,8,'14'),(83,12,7,'12'),(84,12,9,'16'),(86,13,12,'20'),(88,14,12,'21'),(89,14,13,'25'),(91,15,12,'20'),(92,15,13,'23'),(94,16,12,'20'),(95,16,13,'24'),(96,17,6,'Tuấn Còm'),(97,17,10,'Không có feedback gì cả :v :v :v'),(98,17,8,'14'),(99,17,7,'11'),(100,17,9,'16'),(101,18,6,'2121'),(102,18,10,' asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa asas asa sa sa '),(103,18,8,'14'),(104,18,7,'11'),(105,18,9,'16'),(106,19,6,'2121'),(107,19,10,'1221'),(108,19,8,'14'),(109,19,7,'11'),(110,19,9,'16'),(126,24,6,'121'),(127,24,10,'gdfgfd'),(128,24,8,'13'),(129,24,8,'14'),(130,24,7,'12'),(131,24,9,'16'),(132,25,6,'121'),(133,25,10,'gdfgfd'),(134,25,8,'13'),(135,25,8,'14'),(136,25,7,'12'),(137,25,9,'16'),(138,26,6,'121'),(139,26,10,'gdfgfd'),(140,26,8,'13'),(141,26,8,'14'),(142,26,7,'12'),(143,26,9,'16'),(145,27,12,'20'),(148,28,12,'20'),(149,28,13,'22'),(151,29,12,'20'),(152,29,13,'22'),(154,30,12,'20'),(155,30,13,'22'),(225,58,6,''),(226,58,10,'dsada'),(230,58,7,'11'),(1995,498,6,'ddas'),(1996,498,10,'das'),(1997,498,8,'15'),(2000,498,7,'12'),(2002,499,6,'2121'),(2003,499,10,''),(2004,499,8,'15'),(2007,499,7,'12'),(2008,499,9,'17'),(2019,502,6,'2121'),(2020,502,10,'dsads'),(2021,502,8,'15'),(2025,502,9,'16'),(2026,503,6,'12121'),(2027,503,10,''),(2030,503,7,'11'),(2031,503,9,'17'),(2032,504,6,'fdsfsd'),(2033,504,10,'fdsfs'),(2036,504,7,'11'),(2037,504,9,'16'),(2048,507,12,'20'),(2049,507,13,'22'),(2055,509,6,'212'),(2057,509,10,''),(2059,509,8,'14'),(2060,509,8,'15'),(2061,509,7,'11'),(2062,509,9,'17'),(2063,510,6,'212'),(2064,510,10,'jhg'),(2065,510,8,'14'),(2066,511,6,'212'),(2067,510,7,'12'),(2068,511,10,'jhg'),(2069,510,9,'16'),(2070,511,8,'14'),(2071,511,7,'12'),(2072,511,9,'16'),(2073,512,6,'fds'),(2074,512,10,'212'),(2075,512,8,'14'),(2076,512,8,'15'),(2078,512,7,'12'),(2079,512,9,'186'),(2083,514,6,'Huy'),(2084,514,10,'2121'),(2085,514,8,'223'),(2086,514,7,'11'),(2087,514,9,'186'),(2147,533,138,'abc'),(2148,533,12,'282'),(2149,533,13,'25'),(2150,534,138,'65453'),(2151,534,12,'21'),(2153,535,138,''),(2154,535,12,'20'),(2155,535,13,'23'),(2156,536,6,'87654'),(2157,536,10,''),(2159,536,7,'12'),(2160,536,9,'16'),(2185,543,147,'292'),(2188,545,6,'bb'),(2189,545,150,'ahjhj'),(2190,545,10,'yybb'),(2191,545,8,'15'),(2192,545,7,'12'),(2193,545,9,'186'),(2211,550,6,'2121'),(2212,550,150,'hgfhfg'),(2213,550,10,'122'),(2214,550,8,'15'),(2216,550,7,'11'),(2217,550,9,'17'),(2218,551,138,'ytytrytrytryt'),(2219,551,12,'170'),(2220,551,13,'25'),(2221,552,138,'ht4'),(2222,552,12,'20'),(2223,552,13,'22'),(2224,553,6,'Mark'),(2225,553,150,'What\'s up?'),(2226,553,10,'Beautiful apps!'),(2227,553,8,'13'),(2228,553,8,'14'),(2229,553,8,'15'),(2232,553,8,'223'),(2233,553,7,'11'),(2234,553,9,'186'),(2250,565,6,'2121'),(2251,565,150,''),(2252,565,10,''),(2254,565,7,'11'),(2255,565,9,'186'),(2256,566,6,'43432'),(2257,566,150,'fdsfdsf ds'),(2258,566,10,''),(2260,566,7,'11'),(2261,566,9,'186'),(2262,567,6,'gfgd'),(2263,567,150,'dsf'),(2264,567,10,'fsdf'),(2265,567,8,'13'),(2266,567,8,'14'),(2267,567,7,'11'),(2268,567,9,'17'),(2269,568,6,'1111'),(2270,568,150,'11'),(2271,568,10,'11'),(2272,568,8,'13'),(2273,568,7,'11'),(2274,568,9,'16'),(2275,569,6,'121'),(2276,569,150,''),(2277,569,10,''),(2278,569,8,'14'),(2279,569,7,'12'),(2280,569,9,'17'),(2283,571,6,'21'),(2284,571,150,'21'),(2285,571,10,''),(2287,571,7,'12'),(2288,571,9,'17'),(2301,575,6,'tuancom'),(2302,575,150,'bbb'),(2303,575,10,'ggg'),(2304,575,8,'13'),(2305,575,8,'14'),(2306,575,7,'11'),(2307,575,9,'16'),(2308,576,6,'tuanco1993'),(2309,576,150,'2121'),(2310,576,10,'jyhkyjh'),(2311,576,8,'14'),(2312,576,7,'12'),(2313,576,9,'17'),(2314,577,6,'bbb'),(2315,577,150,'bbbbb'),(2316,577,10,'bbbbbbbbbbbb'),(2317,577,8,'13'),(2318,577,8,'14'),(2319,577,8,'15'),(2322,577,8,'223'),(2323,577,7,'11'),(2324,577,9,'186'),(2325,578,6,'nnnn'),(2326,578,150,'p'),(2327,578,10,''),(2329,578,7,'12'),(2330,578,9,'17'),(2331,579,6,'gdfgfd'),(2332,579,150,'fsd'),(2333,579,10,''),(2334,579,8,'14'),(2335,579,7,'12'),(2336,579,9,'186'),(2337,580,6,'fdss'),(2338,580,150,'fsdfds'),(2339,580,10,'fsdfsdfsdfsd'),(2341,580,8,'223'),(2342,580,7,'12'),(2343,580,9,'186'),(2344,581,6,'gdfgfd'),(2345,581,150,'gdf'),(2346,581,10,'21'),(2347,581,8,'15'),(2349,581,7,'12'),(2350,581,9,'17'),(2351,582,6,'fsdf'),(2352,582,150,'fds'),(2353,582,10,'fsd'),(2354,582,8,'14'),(2355,582,8,'15'),(2356,582,7,'12'),(2357,582,9,'17'),(2358,583,6,'21'),(2359,583,150,'2121'),(2360,583,10,'gdf'),(2361,583,8,'13'),(2362,583,8,'14'),(2363,583,7,'12'),(2364,583,9,'16'),(2365,584,6,'12'),(2366,584,150,'fgf'),(2367,584,10,'fgfddfg'),(2368,584,8,'14'),(2369,584,8,'15'),(2370,584,7,'12'),(2371,584,9,'16'),(2372,585,6,'1221'),(2373,585,150,'fsdfd'),(2374,585,10,'321321'),(2375,585,8,'15'),(2377,585,7,'11'),(2378,585,9,'17'),(2379,586,6,'yyy'),(2380,586,150,'gdfgf'),(2381,586,10,'757657'),(2383,586,7,'12'),(2384,586,9,'17'),(2385,587,6,'jgh'),(2386,587,150,''),(2387,587,10,''),(2388,587,8,'15'),(2389,587,7,'12'),(2390,587,9,'17'),(2391,588,6,'p[io'),(2392,588,150,''),(2393,588,10,'oui'),(2394,588,8,'13'),(2395,588,7,'12'),(2396,588,9,'17'),(2401,590,6,'fsfdsfdsf'),(2402,590,150,'kghjgh'),(2403,590,10,''),(2404,590,8,'14'),(2405,590,7,'12'),(2406,590,9,'17'),(2407,591,6,'gdfgf'),(2408,591,150,'ọblj'),(2409,591,10,''),(2410,591,8,'13'),(2411,591,8,'14'),(2413,591,7,'12'),(2414,591,9,'17'),(2415,592,6,'123'),(2416,592,150,'fsfds'),(2417,592,10,'123'),(2418,592,8,'14'),(2420,592,7,'11'),(2421,592,9,'17'),(2422,593,6,'2222'),(2423,593,150,'2222'),(2424,593,10,'33333'),(2426,593,8,'223'),(2427,593,7,'12'),(2428,593,9,'186'),(2443,597,6,'jklj'),(2444,597,150,''),(2445,597,10,''),(2446,597,8,'14'),(2447,597,8,'15'),(2449,597,7,'12'),(2450,597,9,'16'),(2451,598,6,'tuancom'),(2452,598,150,''),(2453,598,10,'tuancom'),(2454,598,8,'13'),(2455,598,8,'14'),(2456,598,8,'15'),(2457,598,7,'12'),(2458,598,9,'16'),(2470,601,6,'gfdgdf'),(2471,601,150,''),(2472,601,10,''),(2473,601,8,'14'),(2474,601,8,'15'),(2476,601,7,'12'),(2477,601,9,'186'),(2481,603,190,'tuancom'),(2482,603,138,''),(2483,603,12,'21'),(2484,603,13,'24'),(2485,604,190,'gsdf'),(2486,604,138,'3213'),(2487,604,12,'170'),(2488,604,13,'24'),(2489,605,190,'dsfds'),(2490,605,138,'2121'),(2491,605,12,'21'),(2492,605,13,'24'),(2493,606,190,'111'),(2494,606,138,'gdfgdgfg'),(2495,606,12,'282'),(2496,606,13,'374'),(2497,607,190,'2121'),(2498,607,138,'hgh'),(2499,607,12,'20'),(2500,607,13,'375'),(2501,608,190,'4233'),(2502,608,138,''),(2503,608,12,'20'),(2504,608,13,'22'),(2505,609,28,''),(2506,609,30,'52'),(2508,609,29,'51'),(2509,610,28,'211'),(2510,610,30,'52'),(2511,610,29,'51'),(2512,611,28,'11'),(2513,611,30,'52'),(2514,611,30,'376'),(2515,611,29,'51'),(2516,612,28,'gdf'),(2517,612,30,'52'),(2518,612,29,'51'),(2519,613,28,'2222'),(2520,613,30,'376'),(2521,613,29,'51'),(2593,630,6,'tuananh'),(2594,630,150,'jlnjj'),(2595,630,10,''),(2596,630,8,'14'),(2597,630,8,'15'),(2599,630,7,'11'),(2600,630,9,'17'),(2601,631,6,'fdgfdgfd'),(2602,631,150,'fsdfd'),(2603,631,10,''),(2604,631,8,'13'),(2605,631,8,'14'),(2606,631,7,'12'),(2607,631,9,'186'),(2608,632,6,'Vuuvvh'),(2609,632,150,''),(2610,632,10,''),(2612,632,7,'12'),(2613,632,9,'186'),(2614,633,6,'fdsfd'),(2615,633,150,'fdfds'),(2616,633,10,''),(2617,633,8,'14'),(2619,633,7,'11'),(2620,633,9,'17'),(2621,634,191,'Tuan Anh'),(2622,634,192,'11T4'),(2623,634,196,'no thing'),(2624,634,195,'385'),(2625,634,195,'386'),(2626,634,195,'388'),(2627,634,193,'380'),(2628,634,194,'382'),(2629,635,191,'Vu Hong Minh'),(2630,635,192,'12T4'),(2631,635,196,''),(2632,635,195,'384'),(2633,635,195,'386'),(2634,635,195,'388'),(2635,635,193,'379'),(2636,635,194,'383'),(2637,636,191,'Nguyen Hoang'),(2638,636,192,'11T3'),(2639,636,196,''),(2640,636,195,'389'),(2641,636,193,'379'),(2642,636,194,'381'),(2643,637,191,'Tuan Hùng'),(2644,637,192,'13C3'),(2645,637,196,''),(2646,637,195,'386'),(2647,637,195,'387'),(2648,637,193,'379'),(2649,637,194,'382'),(2650,638,191,'Tran Nghia Minh'),(2651,638,192,'13T1'),(2652,638,196,'Can you get more content in book'),(2653,638,195,'384'),(2654,638,195,'387'),(2655,638,193,'379'),(2656,638,194,'382'),(2657,639,191,'Tran The Hung'),(2658,639,192,'12T1'),(2659,639,196,''),(2660,639,195,'389'),(2661,639,193,'379'),(2662,639,194,'383'),(2663,640,191,'Nguyen The Hien'),(2664,640,192,'11T4'),(2665,640,196,'Please review more technology'),(2666,640,195,'386'),(2667,640,195,'388'),(2668,640,193,'379'),(2669,640,194,'382'),(2670,641,191,'Nguyen Thanh Cong'),(2671,641,192,'11T4'),(2672,641,196,''),(2673,641,195,'386'),(2674,641,195,'387'),(2675,641,193,'379'),(2676,641,194,'383'),(2677,642,191,'Tran Minh Huy Hoang'),(2678,642,192,'12TCLC'),(2679,642,196,''),(2680,642,195,'384'),(2681,642,195,'387'),(2682,642,195,'388'),(2683,642,193,'379'),(2684,642,194,'382'),(2685,643,200,'Tiger11T'),(2686,643,202,'11T4'),(2687,643,204,'Vũ Xuân Tuấn Anh\nNguyễn Thế Hiển\nLương Quang Hà\nNguyên Tấn Kiệt'),(2688,643,203,'406'),(2689,643,201,'399'),(2690,644,191,'Tran Dinh Tri'),(2691,644,192,'12CLC'),(2692,644,196,''),(2693,644,195,'384'),(2694,644,195,'385'),(2695,644,195,'386'),(2696,644,195,'387'),(2697,644,195,'388'),(2698,644,193,'380'),(2699,644,194,'381'),(2700,645,200,'Winner'),(2701,645,202,'14T2'),(2702,645,204,'Nguyen Thành Sự\nHò Đức Hợp\nTrần Hoàng Tùng\nPhù Chí Minh Quang\nHoàng Thiên Minh'),(2703,645,203,'406'),(2704,645,203,'407'),(2705,645,201,'402'),(2706,646,28,'Tran Minh Hoang'),(2707,646,210,'Không có ý kiến'),(2708,646,30,'52'),(2709,646,30,'420'),(2710,646,29,'51'),(2711,647,28,'Phan Quỳnh Anh'),(2712,647,210,''),(2713,647,30,'419'),(2714,647,29,'418'),(2715,648,191,'zad'),(2716,648,192,'11T4'),(2717,648,196,''),(2718,648,195,'386'),(2719,648,193,'380'),(2720,648,194,'382'),(2721,649,191,'tuan anh'),(2722,649,192,'11T4'),(2723,649,196,''),(2724,649,195,'387'),(2725,649,195,'388'),(2726,649,193,'379'),(2727,649,194,'383'),(2728,650,191,'Tuan Lam'),(2729,650,192,'11T4'),(2730,650,196,''),(2731,650,195,'384'),(2732,650,195,'385'),(2733,650,195,'386'),(2734,650,195,'387'),(2735,650,193,'379'),(2736,650,194,'381'),(2737,651,211,'Tuan Anh'),(2738,651,213,'Nothing'),(2739,651,212,'423'),(2740,652,214,'Tuan Anh'),(2741,652,215,'428'),(2742,652,215,'429'),(2743,652,215,'430'),(2744,653,6,'Negochenchalaka'),(2745,653,150,'for fun'),(2746,653,10,'Boring AF.'),(2747,653,8,'14'),(2748,653,7,'11'),(2749,653,9,'16');
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
) ENGINE=InnoDB AUTO_INCREMENT=654 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datasurvey`
--

LOCK TABLES `datasurvey` WRITE;
/*!40000 ALTER TABLE `datasurvey` DISABLE KEYS */;
INSERT INTO `datasurvey` VALUES (1,13,'2016-04-07'),(2,13,'2016-04-07'),(3,13,'2016-04-07'),(5,13,'2016-04-07'),(6,13,'2016-04-07'),(7,13,'2016-04-07'),(8,13,'2016-04-07'),(12,13,'2016-04-07'),(13,14,'2016-04-08'),(14,14,'2016-04-08'),(15,14,'2016-04-08'),(16,14,'2016-04-08'),(17,13,'2016-04-08'),(18,13,'2016-04-08'),(19,13,'2016-04-08'),(24,13,'2016-04-11'),(25,13,'2016-04-11'),(26,13,'2016-04-11'),(27,14,'2016-04-11'),(28,14,'2016-04-11'),(29,14,'2016-04-11'),(30,14,'2016-04-11'),(58,13,'2016-04-13'),(498,13,'2016-04-13'),(499,13,'2016-04-13'),(502,13,'2016-04-13'),(503,13,'2016-04-13'),(504,13,'2016-04-13'),(507,14,'2016-04-13'),(509,13,'2016-04-14'),(510,13,'2016-04-14'),(511,13,'2016-04-14'),(512,13,'2016-04-14'),(514,13,'2016-04-15'),(533,14,'2016-04-19'),(534,14,'2016-04-19'),(535,14,'2016-04-19'),(536,13,'2016-04-20'),(543,62,'2016-04-22'),(545,13,'2016-04-25'),(550,13,'2016-04-28'),(551,14,'2016-04-28'),(552,14,'2016-04-28'),(553,13,'2016-04-28'),(565,13,'2016-04-29'),(566,13,'2016-04-29'),(567,13,'2016-04-29'),(568,13,'2016-04-29'),(569,13,'2016-04-29'),(571,13,'2016-04-29'),(575,13,'2016-04-29'),(576,13,'2016-04-29'),(577,13,'2016-04-29'),(578,13,'2016-04-29'),(579,13,'2016-04-29'),(580,13,'2016-04-29'),(581,13,'2016-04-29'),(582,13,'2016-04-29'),(583,13,'2016-04-29'),(584,13,'2016-04-29'),(585,13,'2016-04-29'),(586,13,'2016-04-29'),(587,13,'2016-05-04'),(588,13,'2016-05-04'),(590,13,'2016-05-05'),(591,13,'2016-05-05'),(592,13,'2016-05-09'),(593,13,'2016-05-09'),(597,13,'2016-05-09'),(598,13,'2016-05-10'),(601,13,'2016-05-11'),(603,14,'2016-05-11'),(604,14,'2016-05-11'),(605,14,'2016-05-11'),(606,14,'2016-05-11'),(607,14,'2016-05-11'),(608,14,'2016-05-11'),(609,30,'2016-05-11'),(610,30,'2016-05-11'),(611,30,'2016-05-11'),(612,30,'2016-05-11'),(613,30,'2016-05-11'),(630,13,'2016-05-20'),(631,13,'2016-05-20'),(632,13,'2016-05-20'),(633,13,'2016-05-21'),(634,63,'2016-05-21'),(635,63,'2016-05-21'),(636,63,'2016-05-21'),(637,63,'2016-05-21'),(638,63,'2016-05-21'),(639,63,'2016-05-23'),(640,63,'2016-05-23'),(641,63,'2016-05-23'),(642,63,'2016-05-25'),(643,65,'2016-05-26'),(644,63,'2016-05-26'),(645,65,'2016-05-26'),(646,30,'2016-05-26'),(647,30,'2016-05-26'),(648,63,'2016-05-27'),(649,63,'2016-05-27'),(650,63,'2016-06-07'),(651,67,'2016-06-07'),(652,68,'2016-06-07'),(653,13,'2016-06-07');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'3','aloooo','2016-03-14','hgfh'),(2,'2','212121','2016-04-29','231'),(3,'2','12121','2016-04-27','gdf'),(4,'123','232  ggdfg df','2016-04-28',NULL),(5,'Vu Xuan Tuan Anh','why my account has been blocked??????','2016-04-29','tuancom1993@gmail.com'),(6,'Vũ Xuân Tuấn Anh','why my account has been blocked??????','2016-04-29','tuancom1993@gmail.com'),(7,'dssa','111','2016-04-29','fdsfdsfs'),(9,'fgfd','212','2016-04-29','dgfgd'),(10,'2121','Year 1','2016-04-29','2121@2121'),(13,'2121','fsd','2016-04-29','2121'),(16,'ghdf','3321','2016-04-29','gdf'),(20,'ggg','ggg','2016-04-29','ggg');
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
  `indexquestion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idquestion`),
  KEY `fk_Question_Survey` (`idsurvey`),
  KEY `fk_Question_KindQuestion` (`idkindquestion`),
  CONSTRAINT `fk_Question_KindQuestion` FOREIGN KEY (`idkindquestion`) REFERENCES `kindquestion` (`idkindquestion`),
  CONSTRAINT `fk_Question_Survey` FOREIGN KEY (`idsurvey`) REFERENCES `survey` (`idsurvey`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (6,13,1,'What\'s your name?',1,1),(7,13,4,'Your sex:',0,2),(8,13,3,'You will go with?',1,5),(9,13,4,'You will join?',1,3),(10,13,2,'Your feedback...',0,6),(12,14,4,'Do you wanna join with us?',1,2),(13,14,4,'How many performance you want to join',0,4),(28,30,1,'Họ và tên',0,1),(29,30,4,'Giới Tính',1,2),(30,30,3,'Bạn mong muốn điều gì ở hội thảo',0,3),(112,47,1,'21',0,1),(113,47,4,'fsdfds',0,2),(138,14,2,'Feedback',0,3),(147,62,3,'2121',1,1),(150,13,2,'Why?',0,4),(190,14,1,'Your name?',0,1),(191,63,1,'What is your name?',1,1),(192,63,1,'Your class?',0,2),(193,63,4,'Your gender?',0,3),(194,63,4,'Your review on this course',1,4),(195,63,3,'What do you want to improve this course?',1,5),(196,63,2,'Your feedback',0,6),(197,64,1,'Your name',0,1),(198,64,4,' Will you join with us?',0,2),(199,64,3,'Will you join with',0,3),(200,65,1,'Tên đội?',1,1),(201,65,4,'Khóa',1,2),(202,65,1,'Lớp',0,3),(203,65,3,'Đội sẽ tự trang bị',0,4),(204,65,2,'Tên các thành viên tham dự',0,5),(205,66,1,'Họ và tên',1,1),(206,66,1,'Trường đang theo học',0,2),(207,66,4,'Niên khóa',0,3),(208,66,3,'Bạn có khả năng tự trang bị',0,4),(209,66,2,'Ý kiến khác',0,5),(210,30,2,'Hãy để lại ý kiến nếu bạn có bất kì mong muốn gì khác',0,4),(211,67,1,'What is your name?',1,1),(212,67,4,'Your Sex',0,2),(213,67,2,'Your feedback',0,3),(214,68,1,'Your name?',0,1),(215,68,3,'Which color do you like?',0,2);
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
  `kindsurvey` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsurvey`),
  KEY `fk_Survey_User` (`iduser`),
  CONSTRAINT `fk_Survey_User` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (13,3,'2016-02-20','Year End Party','Survey for the Year End Party of Enclave 2016 \\m/\nMai zooo\nMai zooo \\m/\n<button class=\"btn btn-green\"> Button </button>\nEnter','#fd0000','Cover_2016_03_30_08_46_49.jpg',0,0),(14,3,'2016-04-19','Music Event','Survey for music event on 25/4/1026.\nLet join with us. \nIn here, you can find a lot of beautiful girl \\m/','#3b3b52','Cover_2016_03_30_08_47_02.png',0,1),(30,1,'2016-04-04','Đăng Ký Dự Hội Thảo Khoa Học','Hội thảo khoa học về vấn đề Môi trường biến đổi năm 2016\nĐược tổ chức tại đại học Bách Khoa Đà Nẵng','#23bcc3','Cover_user_2016_04_04_16_49_59.jpg',0,1),(47,3,'2016-04-15','Survey For Event','dá','#fd0000','Cover_tuancom1993_2016_04_15_12_03_03.jpg',0,0),(62,3,'2016-04-22','Tet survey','','#2da52f','Cover_tuancom_2016_04_22_13_31_58.jpg',0,0),(63,3,'2016-05-21','Course Evaluation','This is Survey Form for Android Programming course.\nPlease complete survey information.\nIt will help us in imporving course','#7b4444','Cover_admin_2016_05_21_16_18_13.png',0,1),(64,3,'2016-05-21','My Wedding','This is my wedding survey form','#23bcc3','Cover_admin_2016_05_21_16_21_42.jpg',0,0),(65,3,'2016-05-26','IT Football Cup - Open 9','Để chào mừng ngày quốc khánh 2-9-2016. Khoa CNTT tổ chức giải bòng đá IT Football Cup - Open 9.\nNhằm mang đến sân chơi cho các sinh viên khoa CNTT','#12760d','Cover_admin_2016_05_26_20_10_25.jpg',0,0),(66,3,'2016-05-26','Đăng Ký Dự Học Lập Trình JAVA','Đây là phiếu đăng kí dự học môn Lập trình Java\nGiảng viên: Nguyễn Đức Hoàng\nSố buổi: 20 buổi\nThời gian: 18h-20h','#8bc34a','#8bc34a',0,0),(67,3,'2016-06-07','My Life','This is Survey for me','#afd1b7','Cover_admin_2016_06_07_14_42_10.jpg',0,0),(68,3,'2016-06-07','Survey For Color','','#795548','#795548',0,1);
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
  `indexselect` int(11) DEFAULT NULL,
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
INSERT INTO `template` VALUES (5,'Color Template',1,'Cover_2016_03_30_08_46_31.png','#4a62bb','2016-03-29',6),(6,'Event Template',4,'Cover_2016_03_30_08_46_49.jpg','#fd0000','2016-03-29',4),(8,'Wedding Template',5,'Cover_2016_03_30_08_53_53.jpg','#23bcc3','2016-03-29',3),(9,'Work',2,'Cover_2016_03_30_09_20_54.png','#7b4444','2016-03-29',2),(10,'Music Template',3,'Cover_2016_03_30_08_47_02.png','#3b3b52','2016-03-29',5),(11,'Football Template',6,'Cover_2016_03_30_09_18_50.jpg','#12760d','2016-03-30',8),(12,'Other Template',7,'Cover_2016_03_30_08_55_01.jpg','#2da52f','2016-03-30',1),(13,'Beach Template',7,'Cover_2016_04_25_14_09_21.jpg','#e8e584','2016-04-15',1),(14,'My Life Template',7,'Cover_2016_06_07_14_39_25.jpg','#afd1b7','2016-04-15',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user','user',2,'User normal',1,'1994-01-14','tuancom1993@gmail.com','016565456','user_2016_05_26_20_05_01.png',0),(2,'tuancom1993','123',2,'Tuấn Anh',1,'1993-10-21','tuancom1993@gmail.com','0168452111','tuancom1993_2016_04_21_10_13_45.png',1),(3,'admin','admin',1,'Admin of System',0,'1993-10-21','admin@enclave.vn','123456789','admin_2016_05_21_16_37_48.png',0),(4,'tuancom','123',1,'vu xuan tuan anh 4',1,'1992-12-27','123@321','01263759260','tuacom_2016_03_23_09_01_26.png',0),(6,'tuancom1993','huynung123',1,'Vũ Xuân Tuấn Anh',1,'1993-10-21','tuancom1993@gmail.com','01263759260','tuancom1993_2016_03_21_18_17_47.jpg',0),(7,'doremon','dora',2,'doraemon ahjhj',0,'2015-12-25','3212@12121','21213121112121','dore_2016_03_22_16_30_48.jpg',0),(11,'anhhai','anh',2,'anh',1,'2016-04-20','anh@anh','874511','anhhai_2016_04_22_14_36_38.png',0),(12,'anh2','anh',2,'anh',0,'2016-04-22','w121@1212','2121','anh2_2016_04_19_16_07_10.jpg',0),(13,'bbb','bbb',2,'bbb',1,'2016-04-11','bbb@bbb','1221','User.png',0),(14,'123','123',2,'1111111111',1,'2016-04-19','123@123','2121212121','User.png',0),(15,'admin2','12121',2,'2121',0,'2016-04-19','212@1212','2121212121','User.png',0),(16,'ttttt','121,121',2,'ttt',0,'2016-04-21','quan@121','01112121','ttttt_2016_04_26_09_56_51.jpg',0),(19,'tuancomggg','huynung',2,'tuancom',1,'2016-04-25','2121@2121','12121','tuancomggg_2016_05_09_14_29_54.jpg',0),(21,'1211','123',2,'tuanmc',0,'2016-04-10','121@112','11','User.png',0),(22,'212121','123',2,'421',1,'2016-04-18','123@12','21','User.png',0),(23,'tuancom93','123',2,'666',0,'1993-10-20','121@12','2121','User.png',0),(24,'12321','321',2,'hsas a',1,'2016-04-25','121@21','21','12321_2016_04_27_10_50_48.jpg',0),(25,'gfgfgdfgdf','123',2,'212  21',0,'2016-05-09','212@r4443','212234213','User.png',0),(26,'gfgfgdfgdf2','123',2,'212  21',1,'1993-10-21','212@r4443','212234213','User.png',0),(27,'gfdgfdgfd21','1',2,'2231',0,'2016-05-12','212@212','2121','User.png',0),(28,'1232123','1',2,'fsdfsd',0,'2016-05-11','212@zsad','2111','User.png',0);
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

-- Dump completed on 2016-06-07 15:17:51
