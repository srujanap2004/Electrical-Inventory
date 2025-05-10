-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: elecinv
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_no` int NOT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `supplier_id` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bill_no`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1000,NULL,'2005-05-20','SUP1','2025-05-07 05:23:19'),(1001,NULL,'2005-05-20','SUP1','2025-05-07 05:38:40'),(1002,NULL,'2005-05-20','SUP1','2025-05-07 05:40:54'),(1003,NULL,'2005-05-20','SUP1','2025-05-07 05:53:22'),(1004,NULL,'2007-05-20','SUP1','2025-05-08 13:46:06'),(1005,NULL,'2006-05-20','SUP1','2025-05-08 14:08:14'),(1006,NULL,'2005-05-20','SUP1','2025-05-08 14:09:34'),(1007,NULL,'2006-05-20','SUP1','2025-05-08 14:10:30'),(1008,NULL,'2018-05-20','SUP1','2025-05-10 14:10:17');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issued_items`
--

DROP TABLE IF EXISTS `issued_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issued_items` (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `issued_by` varchar(255) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `issued_to` varchar(255) DEFAULT NULL,
  `item_id` int NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `units` varchar(50) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `expiry_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issued_items`
--

LOCK TABLES `issued_items` WRITE;
/*!40000 ALTER TABLE `issued_items` DISABLE KEYS */;
INSERT INTO `issued_items` VALUES (41,'1 sqmm blue',10,'manager','2025-05-07','it',131,'Finolex','mtrs',50.00,'Electrical Inventory','Wire Coils',NULL),(42,'1 sqmm blue',5,'Unknown User','2025-05-06','it',131,'Finolex','mtrs',50.00,'Electrical Inventory','Wire Coils',NULL),(43,'1 sqmm blue',5,'issuer','2025-05-10','it',131,'Finolex','mtrs',50.00,'Electrical Inventory','Wire Coils',NULL),(44,'1 sqmm blue',5,'issuer','2025-05-10','it',132,'Finolex','mtrs',50.00,'Electrical Inventory','Wire Coils',NULL);
/*!40000 ALTER TABLE `issued_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `name` varchar(100) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `units` varchar(50) DEFAULT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `description` text,
  `domain` varchar(100) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
  `supplier_id` varchar(255) DEFAULT NULL,
  `expiry_date` varchar(20) DEFAULT NULL,
  `SED` date DEFAULT NULL,
  `SPN` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES ('1 sqmm blue','Finolex',250,'mtrs',50.00,NULL,'Electrical Inventory',130,'Cables','SUP1',NULL,NULL,NULL),('1 sqmm blue','Finolex',0,'mtrs',50.00,NULL,'Electrical Inventory',131,'Wire Coils','SUP1',NULL,'2025-05-07',30),('1 sqmm blue','Finolex',4,'mtrs',50.00,NULL,'Electrical Inventory',132,'Wire Coils','SUP1',NULL,'2025-05-07',30),('1 sqmm blue','Finolex',25,'mtrs',50.00,NULL,'Electrical Inventory',133,'Wire Coils','SUP1',NULL,'2025-05-07',30),('1 sqmm blue','Finolex',25,'mtrs',50.00,NULL,'Electrical Inventory',134,'Wire Coils','SUP1',NULL,'2025-05-06',30),('1 sqmm blue','Finolex',25,'mtrs',50.00,NULL,'Electrical Inventory',135,'Wire Coils','SUP1',NULL,'2025-05-05',30),('1 sqmm blue','Finolex',25,'mtrs',50.00,NULL,'Electrical Inventory',136,'Wire Coils','SUP1',NULL,'2025-05-05',30);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `purchase_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `supplier_id` varchar(10) NOT NULL,
  `purchase_date` date NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_cost` decimal(10,2) NOT NULL,
  `expiry_date` varchar(100) DEFAULT NULL,
  `bill_no` int DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `units` varchar(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `description` text,
  `SED` date DEFAULT NULL,
  `SPN` int DEFAULT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (56,'1 sqmm blue','SUP1','2025-05-05',250,50.00,12500.00,NULL,1000,'Finolex','mtrs','Electrical Inventory','Cables',NULL,NULL,NULL),(57,'1 sqmm blue','SUP1','2025-05-05',250,50.00,12500.00,NULL,1001,'Finolex','mtrs','Electrical Inventory','Cables',NULL,'2025-05-07',30),(58,'1 sqmm blue','SUP1','2025-05-05',20,50.00,1000.00,NULL,1002,'Finolex','mtrs','Electrical Inventory','Wire Coils',NULL,'2025-05-07',30),(59,'1 sqmm blue','SUP1','2025-05-05',20,50.00,1000.00,NULL,1003,'Finolex','mtrs','Electrical Inventory','Wire Coils',NULL,'2025-05-07',30),(60,'1 sqmm blue','SUP1','2025-05-07',9,50.00,450.00,NULL,1004,'Finolex','mtrs','Electrical Inventory','Wire Coils',NULL,'2025-05-07',30),(61,'1 sqmm blue','SUP1','2025-05-06',25,50.00,1250.00,NULL,1005,'Finolex','mtrs','Electrical Inventory','Wire Coils',NULL,'2025-05-07',30),(62,'1 sqmm blue','SUP1','2025-05-05',25,50.00,1250.00,NULL,1006,'Finolex','mtrs','Electrical Inventory','Wire Coils',NULL,'2025-05-06',30),(63,'1 sqmm blue','SUP1','2025-05-06',25,50.00,1250.00,NULL,1007,'Finolex','mtrs','Electrical Inventory','Wire Coils',NULL,'2025-05-05',30),(64,'1 sqmm blue','SUP1','2025-05-18',25,50.00,1250.00,NULL,1008,'Finolex','mtrs','Electrical Inventory','Wire Coils',NULL,'2025-05-05',30);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `request_date` date NOT NULL,
  `quantity_requested` int NOT NULL,
  `status` enum('Pending','Approved','Rejected','Issued') DEFAULT 'Pending',
  `manager_notes` text,
  PRIMARY KEY (`request_id`),
  KEY `user_id` (`user_id`),
  KEY `item_name` (`item_name`),
  CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplier_id` varchar(10) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES ('SUP1','Nataraj Electronics','Nataraj','6304309039','Vijayawada');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('Admin','Manager','Staff','Issuer') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (33,'hodit','hodit@gmail.com','6304309908','$2b$10$MM1pWglZWe8NWlMCi1wOceRNzyuNAoXZZW1pMjEWLMTUkVRUHZvzi','Manager','2025-05-07 05:07:44'),(34,'issuer','issuer@gmail.com','6304309030','$2b$10$pyyIxsUU8s0f9NcVHxQML.yyNEo43YueO1R./ZD26kLB37Scj1oeC','Staff','2025-05-10 13:46:21'),(37,'issuer1','srujana@gmail.com','6304309789','$2b$10$D/p6gVKcqJVHXe8WOpaYTugXCNHU9XoYbPjXoLiOaYx20ff1QHn86','Issuer','2025-05-10 13:52:55');
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

-- Dump completed on 2025-05-10 20:19:14
