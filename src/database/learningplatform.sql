-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: learningplatform
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `content_completed`
--

DROP TABLE IF EXISTS `content_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_completed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `learner` int DEFAULT NULL,
  `module` int DEFAULT NULL,
  `content` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `learner` (`learner`),
  KEY `module` (`module`),
  KEY `content` (`content`),
  CONSTRAINT `content_completed_ibfk_1` FOREIGN KEY (`learner`) REFERENCES `users` (`id`),
  CONSTRAINT `content_completed_ibfk_2` FOREIGN KEY (`module`) REFERENCES `modules` (`id`),
  CONSTRAINT `content_completed_ibfk_3` FOREIGN KEY (`content`) REFERENCES `contents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_completed`
--

LOCK TABLES `content_completed` WRITE;
/*!40000 ALTER TABLE `content_completed` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module` int DEFAULT NULL,
  `ntibavuga` varchar(255) DEFAULT '',
  `bavuga` varchar(255) DEFAULT '',
  `ubusobanuro` text,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`module`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,1,'Gusubiza inyuma ','Gukumira','',0,'2023-09-02 14:34:17',NULL),(2,1,'Kurangiza gukama','Guhumuza','',0,'2023-09-02 14:34:17',NULL),(3,1,'Kurangiza gushitura','Guhaza','',0,'2023-09-02 14:34:17',NULL),(4,1,'Kurorera gukama','Guteka','',0,'2023-09-02 14:34:17',NULL),(5,1,'Gukamana ingoga','Gukama kera','',0,'2023-09-02 14:34:17',NULL),(6,1,'Gukomereka','Gusarika','',0,'2023-09-02 14:34:17',NULL),(7,1,'Kuzijyana kuziragira','Kuzahura','',0,'2023-09-02 14:34:17',NULL),(8,2,'Ingoma zigize umukino,umuriri w\'ingoma','Umutagara','',0,'2023-09-02 14:37:02',NULL),(9,2,'Kuzitera amaraso y\'inka ngo zitamungwa','Gusiga ingoma','',0,'2023-09-02 14:37:02',NULL),(10,2,'Kuzigura','Gukosha ingoma','',0,'2023-09-02 14:37:02',NULL),(11,2,'Kuzibaza','Kuramvura ingoma','',0,'2023-09-02 14:37:02',NULL),(12,2,'Kuzibambaho uruhu','Kurema ingoma','',0,'2023-09-02 14:37:02',NULL),(13,2,'Kuzikorera','Kuremera ingoma','',0,'2023-09-02 14:37:02',NULL),(14,2,'Kuzitura','Kururutsa ingoma','',0,'2023-09-02 14:37:02',NULL),(15,2,'Gutaha','Kuza kw\'ingoma','',0,'2023-09-02 14:37:02',NULL),(16,2,'Kuzibika','Kuzijisha','iyo hari ahantu hegutse zagenewe',0,'2023-09-02 14:37:02',NULL),(17,2,'Kuzitaba mu gitaka','Kuzibyarira','',0,'2023-09-02 14:37:02',NULL),(18,2,'Kuzibika','Kuzibikira','',0,'2023-09-02 14:37:02',NULL),(19,2,'Gusaza kwazo','Gukura','',0,'2023-09-02 14:37:02',NULL),(20,2,'Gusaduka iyo zikiri nshya','Kurara','',0,'2023-09-02 14:37:02',NULL),(21,2,'Gusaduka iyo zishaje','Kuribora','',0,'2023-09-02 14:37:02',NULL),(22,3,'Kuyasuka mu gisabo','Kuyabuganiza','',0,'2023-09-02 14:37:12',NULL),(23,3,'Kuyavanamo amavuta','Gusobanura','',0,'2023-09-02 14:37:12',NULL),(24,3,'Kubika icyansi, igisabo','Kukiranga','',0,'2023-09-02 14:37:12',NULL),(25,3,'Kurangiza koza icyansi','Guhumuza','',0,'2023-09-02 14:37:12',NULL),(26,3,'Kurangiza gukama','Guhumuza','',0,'2023-09-02 14:37:12',NULL),(27,3,'Kumena amata ubishatse','Kuyabyarira','',0,'2023-09-02 14:37:12',NULL),(28,3,'Kumena amata utabishatse','Kuyabogora','',0,'2023-09-02 14:37:12',NULL),(29,3,'Kumena Igisabo','Kukibyarira','',0,'2023-09-02 14:37:12',NULL),(30,3,'Kumara amata mu kintu','Kuyagwizamo','',0,'2023-09-02 14:37:12',NULL),(31,3,'Kurekeraho gukamwa','Guteka','',0,'2023-09-02 14:37:12',NULL),(32,3,'Uduta','Amata','',0,'2023-09-02 14:37:12',NULL),(33,3,'Amata y\'inka ikibyara','Umuhondo','',0,'2023-09-02 14:37:12',NULL),(34,3,'Amata y\'inka yenda guteka','Amagonera/Amanga/Amasunga','',0,'2023-09-02 14:37:12',NULL),(35,4,'Aho umwami yabonaniraga n\'abaturage','Ku karubanda','',0,'2023-09-02 14:38:56',NULL),(36,4,'Aho umwami yaciraga imanza','Ku gitabo cy\'intarengwa','',0,'2023-09-02 14:38:56',NULL),(37,4,'Irembo ryo mu gikari','Icyanzu','',0,'2023-09-02 14:38:56',NULL),(38,4,'Imbere mu nzu','Mu mbere','',0,'2023-09-02 14:38:56',NULL),(39,4,'Aho abantu baganirira mu rugo','Mu mbuga','',0,'2023-09-02 14:38:56',NULL),(40,4,'Aho basohokera bataha','Ku irembo','',0,'2023-09-02 14:38:56',NULL),(41,4,'Ibiti 2 banyuramo hagati bajya ku irembo','Ibikingi by\'amarembo','',0,'2023-09-02 14:38:56',NULL),(42,4,'Ibiti bakingisha mu irembo','Imyugariro','',0,'2023-09-02 14:38:56',NULL),(43,4,'Igitandukanya icyumba n\'ikindi mu nzu ya kinyarwanda','Inyegamo','',0,'2023-09-02 14:38:56',NULL),(44,4,'Igiti bakwikiramo isuka','Umuhini','',0,'2023-09-02 14:38:56',NULL),(45,4,'Imbere h\'umuheto','Ku ruhembe','',0,'2023-09-02 14:38:56',NULL),(46,5,'Inka nyinshi','Ishyo','Zigeze ku munani',0,'2023-09-02 14:39:03',NULL),(48,5,'Ishyo ryinshi','Amashyo','umwikubo w\'ishyo rirenze rimwe ',0,'2023-09-02 14:39:03',NULL),(50,5,'Intama,ihene nyinshi','Umukumbi','Zigeze ku munani ',0,'2023-09-02 14:39:03',NULL),(52,5,'Umukumbi mwinshi','Imikumbi','umwikubo w’umukumbi urenze umwe',0,'2023-09-02 14:39:03',NULL),(54,5,'Ingurube nyinshi','Umugana','zirenze imwe',0,'2023-09-02 14:39:03',NULL),(56,5,'Umugana mwinshi','Imigana','Umwikubo w\'umugana urenze umwe',0,'2023-09-02 14:39:03',NULL),(58,5,'Imbwa nyinshi','Umukeno','zirenze imwe',0,'2023-09-02 14:39:03',NULL),(60,5,'Umukeno mwinshi','Imikeno','Umwikubo w\'umukeno urenze umwe',0,'2023-09-02 14:39:03',NULL),(62,5,'Amashyi menshi','Urufaya','',0,'2023-09-02 14:39:03',NULL),(64,5,'Indirimbo nyinshi','Urwunge','',0,'2023-09-02 14:39:03',NULL),(66,5,'Amajwi menshi','Urwunge','',0,'2023-09-02 14:39:03',NULL),(68,5,'Impundu nyinshi','Urwanaga','',0,'2023-09-02 14:39:03',NULL),(69,6,'Nyina w\'umwami','Umugabekazi','',0,'2023-09-02 14:39:34',NULL),(70,6,'Umugore w\'umwami','Umwamikazi','',0,'2023-09-02 14:39:34',NULL),(71,6,'Abana b\'umwami','Ibikomangoma','',0,'2023-09-02 14:39:34',NULL),(72,6,'Umurambo w\'umwami','Umugogo','',0,'2023-09-02 14:39:34',NULL),(73,6,'Kumubyutsa','Kumubambura','',0,'2023-09-02 14:39:34',NULL),(74,6,'Kumusinziriza','Kumubikira','',0,'2023-09-02 14:39:34',NULL),(75,6,'Kugenda','Kurambagira','',0,'2023-09-02 14:39:34',NULL),(76,6,'Kurya','Gufungura','',0,'2023-09-02 14:39:34',NULL),(77,7,'Kwiruka cyane ubutareba inyuma','Kwiruka amasiga-Mana','',0,'2023-09-02 14:40:51',NULL),(78,7,'Kwiruka cyane utishinze ibyo utwaye cyangwa abo utwaye','Kurambika inda mu muyaga','',0,'2023-09-02 14:40:51',NULL),(79,7,'Kwihuta ufite ikikwirukansa','Gutwita ibiyaga','',0,'2023-09-02 14:40:51',NULL),(80,7,'Kugera ahantu ukagenda ubuticara','Kubambwa utanyuka','',0,'2023-09-02 14:40:51',NULL),(81,7,'Kugenda wihuta kubera ahantu ugiye kure','Gusera mu birere','',0,'2023-09-02 14:40:51',NULL),(82,7,'Gutumwa ahantu ukabanguka','Kuraswa yo','',0,'2023-09-02 14:40:51',NULL),(83,7,'Kutumva','Kugira umutwe munini','',0,'2023-09-02 14:40:51',NULL),(84,7,'Akaboko gakorakora, akaboko kiba','Akaboko karekare','',0,'2023-09-02 14:40:51',NULL),(85,7,'Amaguru anyaraguriza,adahama hamwe','Amaguru maremare','',0,'2023-09-02 14:40:51',NULL),(86,7,'Amaso arebuzwa,areba ibyo atatumwe','Amaso maremare','',0,'2023-09-02 14:40:51',NULL);
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) DEFAULT 'https://cdn-icons-png.flaticon.com/128/10433/10433048.png',
  `name` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'mdLspOhOLdMPvwWqTxIkmZ8GaOVBjM98','Ikiciro cy\'ibanze',0,'2023-09-02 14:32:24',NULL),(2,'GAmBLj2r4moMwF0ByHqZRLdZffvnL0Oj','Ikiciro cy\'isumbuye',0,'2023-09-02 14:32:40',NULL),(3,'RH0Hcx0URCndaDfxsDFl7LVF6wbLzrWd','Ikiciro gikuru',0,'2023-09-02 14:32:53',NULL);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT '',
  `status` varchar(255) DEFAULT '',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` VALUES (1,'admin@yopmail.com','success','2023-09-02 13:46:34'),(2,'admin@yopmail.com','success','2023-09-02 13:46:40'),(3,'damn@yopmail.com','success','2023-09-02 13:46:59'),(4,'damn@yopmail.com','success','2023-09-02 13:47:03');
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_enrolled`
--

DROP TABLE IF EXISTS `module_enrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_enrolled` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module` int DEFAULT NULL,
  `learner` int DEFAULT NULL,
  `marks` int DEFAULT '0',
  `marks_total` int DEFAULT '0',
  `is_completed` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  KEY `learner` (`learner`),
  CONSTRAINT `module_enrolled_ibfk_1` FOREIGN KEY (`module`) REFERENCES `modules` (`id`),
  CONSTRAINT `module_enrolled_ibfk_2` FOREIGN KEY (`learner`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_enrolled`
--

LOCK TABLES `module_enrolled` WRITE;
/*!40000 ALTER TABLE `module_enrolled` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_enrolled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) DEFAULT 'https://cdn-icons-png.flaticon.com/128/10433/10433048.png',
  `level` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`level`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'C0Oz98Ip5xoy17B6xsvKqFVwZ5n1UoC7',1,'Ku Nka',0,'2023-09-02 14:33:34',NULL),(2,'h9IsVoWDohu8eoHvqWD6EUWPJqwY8Xuh',1,'Ku ngoma',0,'2023-09-02 14:33:41',NULL),(3,'bZre22dwRTNC8hJtd4Uq1xonpybolHSL',1,'Amata',0,'2023-09-02 14:33:51',NULL),(4,'WuAoRxubnr6a0lIol3G28BezngUX6J15',2,'Ahantu n\'ibintu',0,'2023-09-02 14:38:15',NULL),(5,'PacTSTRupP42Kzhw9JcW8dLnPBE2Byu3',2,'Ubwinshi bw\'ahantu n\'ibintu',0,'2023-09-02 14:38:30',NULL),(6,'BS4qprmxI2bL6GO0KtslJukYc1gTSyai',2,'Umwami',0,'2023-09-02 14:38:39',NULL),(7,'M1mfovBWT3KhpBuy6Xo8cw6xTlLmb4JC',3,'Inshoberamahanga',0,'2023-09-02 14:40:41',NULL);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizes`
--

DROP TABLE IF EXISTS `quizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module` int DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `options` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  CONSTRAINT `quizes_ibfk_1` FOREIGN KEY (`module`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizes`
--

LOCK TABLES `quizes` WRITE;
/*!40000 ALTER TABLE `quizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizes_completed`
--

DROP TABLE IF EXISTS `quizes_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizes_completed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz` int DEFAULT NULL,
  `learner` int DEFAULT NULL,
  `marks` int DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `quiz` (`quiz`),
  KEY `learner` (`learner`),
  CONSTRAINT `quizes_completed_ibfk_1` FOREIGN KEY (`quiz`) REFERENCES `quizes` (`id`),
  CONSTRAINT `quizes_completed_ibfk_2` FOREIGN KEY (`learner`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizes_completed`
--

LOCK TABLES `quizes_completed` WRITE;
/*!40000 ALTER TABLE `quizes_completed` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizes_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_type` enum('Admin','Learner') DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Roger','damn@yopmail.com','Admin','12345',0,'2023-07-09 17:49:10','2023-07-09 17:52:35'),(2,'Yves Iradukunda','yves.iradukunda@yopmail.com','Learner','12345',0,'2023-07-09 17:50:16','2023-07-09 17:52:51'),(3,'Archange Umugabe','umugabe@gmail.com','Learner','12345',0,'2023-07-11 16:28:55',NULL),(8,'Kamana','kamana@yopmail.com','Learner','12345',0,'2023-08-28 13:54:21',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-02 14:48:03
