-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: cyberawareness
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_completed`
--

LOCK TABLES `content_completed` WRITE;
/*!40000 ALTER TABLE `content_completed` DISABLE KEYS */;
INSERT INTO `content_completed` VALUES (1,8,3,1,'2023-09-18 19:47:28','2023-09-18 19:47:28');
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
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `content` text COLLATE utf8mb4_general_ci,
  `explanation` text COLLATE utf8mb4_general_ci,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`module`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,3,'Value of information','How to not share your data with scammers','The most valuable commodity in the modern world is information. Information is the fuel enterprises and financial markets,simultaneously supporting each individual person and entire nations. That means information is expensive. it a product you can buy or sell. or Ofcouse,steal.',0,'2023-09-17 12:54:03',NULL);
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
  `icon` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'https://cdn-icons-png.flaticon.com/128/10433/10433048.png',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'48PWFiLFa9sXivs1yxxxZaYgTLd7uXfa','Basic',0,'2023-09-17 12:31:16',NULL),(2,'BROq9tXencPne2v1HIdw0QycKflm8FMK','Intermediate',0,'2023-09-17 12:31:54',NULL),(3,'eV4fB8W0Pe5YKbUjJ5M0aKQ2qkeIvhne','Advanced',0,'2023-09-17 12:32:04',NULL);
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
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` VALUES (1,'admin@yopmail.com','success','2023-09-02 13:46:34'),(2,'admin@yopmail.com','success','2023-09-02 13:46:40'),(3,'damn@yopmail.com','success','2023-09-02 13:46:59'),(4,'damn@yopmail.com','success','2023-09-02 13:47:03'),(5,'damn@yopmail.com','success','2023-09-17 12:43:20'),(6,'kamana@yopmail.com','success','2023-09-17 12:59:29'),(7,'damn@yopmail.com','success','2023-10-11 18:05:22'),(8,'moses@yopmail.com','success','2023-10-11 18:10:04'),(9,'moses@yopamil.com','success','2023-10-11 18:10:19'),(10,'damn@yopmail.com','success','2023-10-11 18:11:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_enrolled`
--

LOCK TABLES `module_enrolled` WRITE;
/*!40000 ALTER TABLE `module_enrolled` DISABLE KEYS */;
INSERT INTO `module_enrolled` VALUES (1,3,8,0,0,0,0,'2023-09-18 19:41:58',NULL);
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
  `icon` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'https://cdn-icons-png.flaticon.com/128/10433/10433048.png',
  `level` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`level`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'LLKcGT9T45WxO1gmXW1Kz64iRa3t4TpG',1,'Email',0,'2023-09-17 12:37:00',NULL),(2,'Fdmk6apJzal629FEka90nzvDOK0mbN91',1,'Password and account',0,'2023-09-17 12:37:16',NULL),(3,'NRKBMDEI0SUeOQfcPkYTxZbvtj7fMEOl',1,'Website and Internet',0,'2023-09-17 12:37:33',NULL),(4,'1D4scOGiQS9qJmaNeqZCsK9XZZa53p3B',2,'Social media',0,'2023-09-17 12:38:17',NULL),(5,'qPi2ELBuJq5JunMILwsXVkx5uRHBR5wZ',2,'Mobile devices',0,'2023-09-17 12:39:46',NULL),(6,'NRsXPMh8KezrC6FiNFx10jlpICS2poH0',2,'Personal data',0,'2023-09-17 12:39:57',NULL),(7,'etxSXPYu2YL0pWYGPBCnrd3cDwqagza7',1,'Phshing',0,'2023-10-11 18:09:25',NULL);
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
  `question` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_general_ci NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  CONSTRAINT `quizes_ibfk_1` FOREIGN KEY (`module`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_type` enum('Admin','Learner') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Roger','damn@yopmail.com','Admin','12345',0,'2023-07-09 17:49:10','2023-07-09 17:52:35'),(2,'Moses','moses@yopamil.com','Learner','12345',0,'2023-07-09 17:50:16','2023-09-17 12:41:06'),(3,'Eric','eric@yopamil.com','Learner','12345',0,'2023-07-11 16:28:55','2023-09-17 12:41:32'),(8,'Kamana','kamana@yopmail.com','Learner','12345',0,'2023-08-28 13:54:21',NULL);
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

-- Dump completed on 2023-10-14 21:00:32
