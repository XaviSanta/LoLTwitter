-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: ts1
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `uid` varchar(20) NOT NULL,
  `fid` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`,`fid`),
  KEY `fid_users_fk` (`fid`),
  CONSTRAINT `fid_users_fk` FOREIGN KEY (`fid`) REFERENCES `users` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `uid_users_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `tweet_ID` int NOT NULL,
  `uid` varchar(24) NOT NULL,
  `like_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `tweet_ID` (`tweet_ID`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweets` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) DEFAULT NULL,
  `postdatetime` timestamp NULL DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `likes` int DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `tweets_users_fk` (`uid`),
  KEY `tweets_tweets_fk` (`pid`),
  CONSTRAINT `tweets_tweets_fk` FOREIGN KEY (`pid`) REFERENCES `tweets` (`tid`),
  CONSTRAINT `tweets_users_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES (304,'Santa','2020-06-26 18:19:03','Han arruidando The Last Of Us 2 los de siempre. #SJW',NULL,0),(305,'Pau','2020-06-26 18:19:04','Este web es del lol, facha.',304,0),(306,'Natalia','2020-06-26 18:19:05','Que tal vuestro dia? Estoy en racha de victorias!',NULL,0),(307,'Santa','2020-06-26 18:19:06','He tirado mi fin de semana -.-',306,0),(308,'Santa','2020-06-26 18:19:07','Holaas',NULL,0),(309,'Ruachi','2020-06-26 18:19:08','Enseñame a jugaar!!',306,0),(310,'Santa','2020-06-26 18:19:09','Por qué siempre los nuevos champs están tan rotos...',NULL,0),(311,'Pau','2020-06-26 18:19:10','Habeis visto el nuevo parche?',NULL,0),(312,'Natalia','2020-06-26 18:19:11','Han nerfeado a Teemo. Soy feliz :D',311,0),(313,'Santa','2020-06-26 18:19:12','Echo de menos las pociones de maná',NULL,0),(314,'user1','2020-06-26 18:19:13','Alguien ranked?',NULL,0),(315,'user2','2020-06-26 18:19:14','Why I can\' stop listening to this haha <br><br> <iframe width=\'100%\' height=\'500\' src=\'https://www.youtube.com/embed/fmI_Ndrxy14\' frameborder=\'0\' allow=\'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\' allowfullscreen></iframe>',NULL,0),(316,'user3','2020-06-26 18:19:15','EU better than NA',NULL,0),(603,'Ruachi','2020-06-26 18:19:02','Is anyone there?',NULL,0);
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(24) NOT NULL,
  `lolUsername` varchar(24) DEFAULT NULL,
  `mainChampion` varchar(24) DEFAULT NULL,
  `email` varchar(24) NOT NULL,
  `profilePicture` varchar(1000) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(24) NOT NULL,
  `submission_date` datetime DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uid` (`uid`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ruachi','ruachi','Rumble','ruachi@ruachi.com','https://st.forocoches.com/foro/customavatars/avatar754652_4.gif','8e280f168949cbeea9f1a4e2b6795f86fcbb763d1ae57027cd68a978d08fd0f02c16edf820a67d2703e484b67e8a5d18ebfa5c4e806b30f42bb493742e0c7969','salt','2020-06-26 15:19:01',1),(2,'Pau','cacahuetnoob','Lucian','pau@pau.com','https://st.forocoches.com/foro/customavatars/avatar819153_3.gif','8e280f168949cbeea9f1a4e2b6795f86fcbb763d1ae57027cd68a978d08fd0f02c16edf820a67d2703e484b67e8a5d18ebfa5c4e806b30f42bb493742e0c7969','salt','2020-06-26 15:19:01',1),(3,'Natalia','natalieme','Lux','natalia@natalia.com','https://st.forocoches.com/foro/customavatars/avatar47148_8.gif','8e280f168949cbeea9f1a4e2b6795f86fcbb763d1ae57027cd68a978d08fd0f02c16edf820a67d2703e484b67e8a5d18ebfa5c4e806b30f42bb493742e0c7969','salt','2020-06-26 15:19:01',1),(4,'Santa','Santa','Bardo','santa@santa.com','https://st.forocoches.com/foro/customavatars/avatar540561_4.gif','8e280f168949cbeea9f1a4e2b6795f86fcbb763d1ae57027cd68a978d08fd0f02c16edf820a67d2703e484b67e8a5d18ebfa5c4e806b30f42bb493742e0c7969','salt','2020-06-26 15:19:01',1),(5,'user1','aaa','Thresh','user1@santa.com','https://st.forocoches.com/foro/customavatars/avatar795596_3.gif','8e280f168949cbeea9f1a4e2b6795f86fcbb763d1ae57027cd68a978d08fd0f02c16edf820a67d2703e484b67e8a5d18ebfa5c4e806b30f42bb493742e0c7969','salt','2020-06-26 15:19:01',0),(6,'user2','aaa','Thresh','user2@santa.com','https://st.forocoches.com/foro/customavatars/avatar795596_3.gif','8e280f168949cbeea9f1a4e2b6795f86fcbb763d1ae57027cd68a978d08fd0f02c16edf820a67d2703e484b67e8a5d18ebfa5c4e806b30f42bb493742e0c7969','salt','2020-06-26 15:19:01',0),(7,'user3','aaa','Thresh','user3@santa.com','https://st.forocoches.com/foro/customavatars/avatar795596_3.gif','8e280f168949cbeea9f1a4e2b6795f86fcbb763d1ae57027cd68a978d08fd0f02c16edf820a67d2703e484b67e8a5d18ebfa5c4e806b30f42bb493742e0c7969','salt','2020-06-26 15:19:01',0),(8,'user4','aaa','Thresh','user4@santa.com','https://st.forocoches.com/foro/customavatars/avatar795596_3.gif','8e280f168949cbeea9f1a4e2b6795f86fcbb763d1ae57027cd68a978d08fd0f02c16edf820a67d2703e484b67e8a5d18ebfa5c4e806b30f42bb493742e0c7969','salt','2020-06-26 15:19:01',0),(9,'user5','aaa','Thresh','user5@santa.com','https://st.forocoches.com/foro/customavatars/avatar795596_3.gif','8e280f168949cbeea9f1a4e2b6795f86fcbb763d1ae57027cd68a978d08fd0f02c16edf820a67d2703e484b67e8a5d18ebfa5c4e806b30f42bb493742e0c7969','salt','2020-06-26 15:19:01',0);
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

-- Dump completed on 2020-06-26 20:23:12
