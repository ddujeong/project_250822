-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: projectdb
-- ------------------------------------------------------
-- Server version	8.4.6

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `bnum` int NOT NULL AUTO_INCREMENT,
  `btitle` varchar(45) DEFAULT NULL,
  `bcontent` varchar(45) DEFAULT NULL,
  `member_id` varchar(45) DEFAULT NULL,
  `bdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `bhit` int DEFAULT '0',
  `category` varchar(10) DEFAULT 'general',
  PRIMARY KEY (`bnum`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (2,'첫번째 글 테스트입니다','안녕!','tiger','2025-08-24 14:40:36',121,'general'),(3,'두 번쨰 테스트','반가워','cat','2025-08-24 14:40:36',12,'general'),(11,'공지사항 입니다','공지','admin','2025-08-24 16:27:06',0,'notice'),(13,'두번째 공지사항입니다','안녕하세요','admin','2025-08-24 17:02:01',0,'notice'),(14,'세번째 공지입니다','반가워요','admin','2025-08-24 17:02:16',0,'notice'),(15,'관리자만 공지를 작성할 수 있어요','감사합니다','admin','2025-08-24 17:02:43',1,'notice'),(16,'관리자입니다','반갑습니다','admin','2025-08-24 17:03:47',0,'notice'),(17,'저는 관리자 입니다','반갑습','admin','2025-08-24 17:04:42',0,'notice'),(18,'수정했어요','수정입니다','admin','2025-08-24 17:09:00',0,'notice'),(19,'마지막','마지막수정','admin','2025-08-24 17:10:40',0,'notice'),(20,'찐','찐막','admin','2025-08-24 17:12:52',0,'notice'),(21,'진짜 마지막','ㅁ','admin','2025-08-24 17:14:18',0,'notice'),(22,'수정했어요','ㅌ','admin','2025-08-24 17:14:35',0,'notice'),(23,'안녕','12345\r\n','admin','2025-08-24 17:14:53',0,'notice'),(24,'하이','하이\r\n','admin','2025-08-24 17:16:31',0,'notice'),(25,'하이','항ㅇ이\r\n','admin','2025-08-24 17:19:33',5,'notice'),(26,'저는 tiger입니다','방가워요\r\n관리자가 수정한 글입니다!','tiger','2025-08-24 17:20:10',14,'general');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `cnum` int NOT NULL AUTO_INCREMENT,
  `bnum` int DEFAULT NULL,
  `member_id` varchar(45) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `cdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cnum`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,2,'lion','댓글','2025-08-25 09:12:23');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` varchar(45) NOT NULL,
  `member_pw` varchar(45) DEFAULT NULL,
  `member_name` varchar(10) DEFAULT NULL,
  `member_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('admin','11111','관리자','admin@abc.com'),('cat','12345','강감찬','cat@abc.com'),('kim12','12345','김길동','kim12@abc.com'),('lion','12345','이순신','lion@abc.com'),('tiger','88888','홍길동','tiger@abc.com');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `rnum` int NOT NULL AUTO_INCREMENT,
  `member_id` varchar(45) DEFAULT NULL,
  `rdate` date NOT NULL,
  `rtime` time NOT NULL,
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-25 11:52:49
