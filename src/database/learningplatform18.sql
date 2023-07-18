-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: learningplatform
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_completed`
--

LOCK TABLES `content_completed` WRITE;
/*!40000 ALTER TABLE `content_completed` DISABLE KEYS */;
INSERT INTO `content_completed` VALUES (1,3,7,5,'2023-07-18 16:42:18','2023-07-18 16:42:18'),(2,3,7,3,'2023-07-18 16:42:24','2023-07-18 16:42:24');
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
  `eng_word` varchar(255) NOT NULL,
  `kiny_word` varchar(255) NOT NULL,
  `explanation` varchar(255) DEFAULT '',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`module`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,1,'Greetings','Gusuhuzanya','',0,'2023-07-09 18:16:15','2023-07-09 18:17:12'),(2,1,'Hello','Muraho','',0,'2023-07-09 18:16:42',NULL),(3,7,'Rectangle','Urukiramende','',0,'2023-07-12 14:57:54',NULL),(4,9,'Orange','Ironji','',0,'2023-07-12 15:05:48',NULL),(5,7,'Square','Mpande enye zingana','Ni impande enye zingana zose kandi zifite inguni igororotse',0,'2023-07-18 11:31:07',NULL),(6,1,'undefined','undefined','undefined',0,'2023-07-18 15:38:56',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'https://cdn-icons-png.flaticon.com/128/10433/10433048.png','Naiive',0,'2023-07-09 18:01:22','2023-07-09 18:02:06'),(2,'https://cdn-icons-png.flaticon.com/128/10433/10433048.png','Beginner',0,'2023-07-12 14:08:31',NULL);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
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
  `is_completed` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  KEY `learner` (`learner`),
  CONSTRAINT `module_enrolled_ibfk_1` FOREIGN KEY (`module`) REFERENCES `modules` (`id`),
  CONSTRAINT `module_enrolled_ibfk_2` FOREIGN KEY (`learner`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_enrolled`
--

LOCK TABLES `module_enrolled` WRITE;
/*!40000 ALTER TABLE `module_enrolled` DISABLE KEYS */;
INSERT INTO `module_enrolled` VALUES (1,7,3,0,0,'2023-07-18 16:14:07',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'https://cdn-icons-png.flaticon.com/128/10433/10433048.png',1,'Colours',0,'2023-07-09 18:08:43','2023-07-09 18:09:14'),(6,'fx6TxDjdDA6XSZUz0GCoxw20isAXtMWq',1,'Animals',0,'2023-07-11 15:40:10',NULL),(7,'garPmCwVrioGegI1IIooFwGPTfq9ndwZ',1,'Shapes',0,'2023-07-11 15:42:56',NULL),(8,'HLqxqaJRtYFqScqYR1yebBDgB9sWWVXb',1,'Simple Math',0,'2023-07-12 13:02:30',NULL),(9,'MjRRm00jYBhigCqBQ8DY5C6tJTq6FHrf',2,'Fruit',0,'2023-07-12 15:05:19',NULL);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz` int DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `options` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `mark` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `quiz` (`quiz`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz`) REFERENCES `quizes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
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
  `code` varchar(255) NOT NULL,
  `marks` varchar(255) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Roger','damn@yopmail.com','Admin','12345',0,'2023-07-09 17:49:10','2023-07-09 17:52:35'),(2,'Yves Iradukunda','yves.iradukunda@yopmail.com','Learner','12345',0,'2023-07-09 17:50:16','2023-07-09 17:52:51'),(3,'Archange Umugabe','umugabe@gmail.com','Learner','12345',0,'2023-07-11 16:28:55',NULL);
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

-- Dump completed on 2023-07-18 17:03:22
