CREATE DATABASE  IF NOT EXISTS `clothing_store_dw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clothing_store_dw`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: clothing_store_dw
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `channel_dim`
--

DROP TABLE IF EXISTS `channel_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_dim` (
  `channel_key` int NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(45) NOT NULL,
  `channel_id` int NOT NULL,
  PRIMARY KEY (`channel_key`),
  UNIQUE KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_dim`
--

LOCK TABLES `channel_dim` WRITE;
/*!40000 ALTER TABLE `channel_dim` DISABLE KEYS */;
INSERT INTO `channel_dim` VALUES (4,'Physical Store 1',1),(5,'Physical Store 2',2),(6,'Online',3);
/*!40000 ALTER TABLE `channel_dim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_dim`
--

DROP TABLE IF EXISTS `customer_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_dim` (
  `customer_key` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `age` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`customer_key`),
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_dim`
--

LOCK TABLES `customer_dim` WRITE;
/*!40000 ALTER TABLE `customer_dim` DISABLE KEYS */;
INSERT INTO `customer_dim` VALUES (21,'Brent Rhodes','New Timothy','Argentina',58,1),(22,'Amber Alexander','New Steven','Mexico',48,2),(23,'Nicole Jenkins','Lake Mitchellton','Argentina',65,3),(24,'Kevin Castro','North Scottbury','Colombia',67,4),(25,'Sheri Manning','South Christopherfurt','Colombia',50,5),(26,'Mary Jackson','Lake Michael','Colombia',46,6),(27,'Andrew Hutchinson','Port Lindsay','Mexico',41,7),(28,'Connor Wright','Grahamland','Mexico',22,8),(29,'Jessica Miller','Larryfurt','Mexico',53,9),(30,'Luis Trujillo','East Stevenville','Mexico',32,10),(31,'Ronald Reed','Kevinview','Colombia',41,11),(32,'Amber Ross','Nicoleburgh','Colombia',66,12),(33,'Michael Collins','Howardside','Argentina',33,13),(34,'Jeffrey Odonnell PhD','Michelleberg','Mexico',70,14),(35,'Mary Bennett','Port Yvetteland','Colombia',60,15),(36,'Brenda Blevins','Fernandoview','Colombia',29,16),(37,'Billy Conley','Lake Jessica','Colombia',66,17),(38,'Jesus Mejia','Jeffreybury','Argentina',48,18),(39,'Lori Brown','New Johnfort','Mexico',42,19),(40,'Matthew Woods','North Michaelville','Mexico',27,20);
/*!40000 ALTER TABLE `customer_dim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_dim`
--

DROP TABLE IF EXISTS `product_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_dim` (
  `product_key` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`product_key`),
  UNIQUE KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_dim`
--

LOCK TABLES `product_dim` WRITE;
/*!40000 ALTER TABLE `product_dim` DISABLE KEYS */;
INSERT INTO `product_dim` VALUES (101,'Clothing Item 1','Accessories','ClassyWear',1),(102,'Clothing Item 2','Pants','FashionX',2),(103,'Clothing Item 3','Accessories','ClassyWear',3),(104,'Clothing Item 4','Pants','StreetVibe',4),(105,'Clothing Item 5','Accessories','FashionX',5),(106,'Clothing Item 6','Jackets','ClassyWear',6),(107,'Clothing Item 7','Shirts','TrendyStyle',7),(108,'Clothing Item 8','Jackets','TrendyStyle',8),(109,'Clothing Item 9','Pants','TrendyStyle',9),(110,'Clothing Item 10','Jackets','ClassyWear',10),(111,'Clothing Item 11','Accessories','TrendyStyle',11),(112,'Clothing Item 12','Jackets','FashionX',12),(113,'Clothing Item 13','Accessories','FashionX',13),(114,'Clothing Item 14','Accessories','FashionX',14),(115,'Clothing Item 15','Shirts','StreetVibe',15),(116,'Clothing Item 16','Pants','ClassyWear',16),(117,'Clothing Item 17','Pants','FashionX',17),(118,'Clothing Item 18','Accessories','ClassyWear',18),(119,'Clothing Item 19','Accessories','FashionX',19),(120,'Clothing Item 20','Accessories','StreetVibe',20),(121,'Clothing Item 21','Shirts','FashionX',21),(122,'Clothing Item 22','Shirts','StreetVibe',22),(123,'Clothing Item 23','Accessories','TrendyStyle',23),(124,'Clothing Item 24','Shirts','StreetVibe',24),(125,'Clothing Item 25','Jackets','StreetVibe',25),(126,'Clothing Item 26','Accessories','ClassyWear',26),(127,'Clothing Item 27','Pants','TrendyStyle',27),(128,'Clothing Item 28','Accessories','TrendyStyle',28),(129,'Clothing Item 29','Jackets','TrendyStyle',29),(130,'Clothing Item 30','Pants','TrendyStyle',30),(131,'Clothing Item 31','Shirts','ClassyWear',31),(132,'Clothing Item 32','Accessories','FashionX',32),(133,'Clothing Item 33','Jackets','FashionX',33),(134,'Clothing Item 34','Accessories','StreetVibe',34),(135,'Clothing Item 35','Pants','TrendyStyle',35),(136,'Clothing Item 36','Accessories','FashionX',36),(137,'Clothing Item 37','Accessories','ClassyWear',37),(138,'Clothing Item 38','Jackets','ClassyWear',38),(139,'Clothing Item 39','Accessories','ClassyWear',39),(140,'Clothing Item 40','Pants','TrendyStyle',40),(141,'Clothing Item 41','Jackets','StreetVibe',41),(142,'Clothing Item 42','Accessories','FashionX',42),(143,'Clothing Item 43','Jackets','TrendyStyle',43),(144,'Clothing Item 44','Pants','ClassyWear',44),(145,'Clothing Item 45','Accessories','FashionX',45),(146,'Clothing Item 46','Shirts','TrendyStyle',46),(147,'Clothing Item 47','Pants','StreetVibe',47),(148,'Clothing Item 48','Accessories','TrendyStyle',48),(149,'Clothing Item 49','Shirts','ClassyWear',49),(150,'Clothing Item 50','Pants','TrendyStyle',50),(151,'Clothing Item 51','Accessories','FashionX',51),(152,'Clothing Item 52','Shirts','StreetVibe',52),(153,'Clothing Item 53','Pants','ClassyWear',53),(154,'Clothing Item 54','Shirts','TrendyStyle',54),(155,'Clothing Item 55','Pants','ClassyWear',55),(156,'Clothing Item 56','Shirts','StreetVibe',56),(157,'Clothing Item 57','Pants','StreetVibe',57),(158,'Clothing Item 58','Jackets','TrendyStyle',58),(159,'Clothing Item 59','Shirts','StreetVibe',59),(160,'Clothing Item 60','Pants','TrendyStyle',60),(161,'Clothing Item 61','Pants','TrendyStyle',61),(162,'Clothing Item 62','Accessories','FashionX',62),(163,'Clothing Item 63','Jackets','ClassyWear',63),(164,'Clothing Item 64','Shirts','StreetVibe',64),(165,'Clothing Item 65','Accessories','ClassyWear',65),(166,'Clothing Item 66','Accessories','FashionX',66),(167,'Clothing Item 67','Pants','ClassyWear',67),(168,'Clothing Item 68','Jackets','ClassyWear',68),(169,'Clothing Item 69','Pants','ClassyWear',69),(170,'Clothing Item 70','Shirts','ClassyWear',70),(171,'Clothing Item 71','Shirts','FashionX',71),(172,'Clothing Item 72','Jackets','FashionX',72),(173,'Clothing Item 73','Pants','StreetVibe',73),(174,'Clothing Item 74','Pants','FashionX',74),(175,'Clothing Item 75','Accessories','FashionX',75),(176,'Clothing Item 76','Accessories','TrendyStyle',76),(177,'Clothing Item 77','Pants','FashionX',77),(178,'Clothing Item 78','Jackets','StreetVibe',78),(179,'Clothing Item 79','Shirts','TrendyStyle',79),(180,'Clothing Item 80','Jackets','TrendyStyle',80),(181,'Clothing Item 81','Pants','StreetVibe',81),(182,'Clothing Item 82','Jackets','TrendyStyle',82),(183,'Clothing Item 83','Jackets','TrendyStyle',83),(184,'Clothing Item 84','Accessories','TrendyStyle',84),(185,'Clothing Item 85','Shirts','TrendyStyle',85),(186,'Clothing Item 86','Jackets','FashionX',86),(187,'Clothing Item 87','Jackets','ClassyWear',87),(188,'Clothing Item 88','Shirts','TrendyStyle',88),(189,'Clothing Item 89','Jackets','StreetVibe',89),(190,'Clothing Item 90','Shirts','StreetVibe',90),(191,'Clothing Item 91','Accessories','StreetVibe',91),(192,'Clothing Item 92','Shirts','TrendyStyle',92),(193,'Clothing Item 93','Accessories','FashionX',93),(194,'Clothing Item 94','Accessories','TrendyStyle',94),(195,'Clothing Item 95','Jackets','TrendyStyle',95),(196,'Clothing Item 96','Accessories','ClassyWear',96),(197,'Clothing Item 97','Accessories','TrendyStyle',97),(198,'Clothing Item 98','Jackets','FashionX',98),(199,'Clothing Item 99','Pants','FashionX',99),(200,'Clothing Item 100','Pants','FashionX',100);
/*!40000 ALTER TABLE `product_dim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_fact`
--

DROP TABLE IF EXISTS `sales_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_fact` (
  `quantity` bigint DEFAULT NULL,
  `unit_price_sale` double DEFAULT NULL,
  `product_dim_product_key` bigint DEFAULT NULL,
  `customer_dim_customer_key` bigint DEFAULT NULL,
  `channel_dim_channel_key` bigint DEFAULT NULL,
  `time_dim_time_key` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_fact`
--

LOCK TABLES `sales_fact` WRITE;
/*!40000 ALTER TABLE `sales_fact` DISABLE KEYS */;
INSERT INTO `sales_fact` VALUES (5,120.33,173,22,5,9),(5,166.49,108,40,5,10),(2,190.19,138,38,6,11),(2,80.82,172,39,4,11),(3,190.05,128,32,4,11),(1,124.93,128,32,4,10),(1,22.81,144,23,4,11),(4,97.54,199,32,5,12),(2,19.7,107,31,6,10),(3,118.25,134,28,6,10),(5,190.29,160,35,4,10),(5,191.29,129,30,4,11),(4,95.14,135,36,5,11),(1,109.18,163,25,6,11),(3,60.77,139,37,6,10),(2,128.51,119,40,5,11),(4,95.99,196,40,6,11),(2,108.29,141,38,5,11),(4,105.28,191,38,5,10),(2,93.68,166,31,4,12),(2,185.05,187,26,4,11),(4,13.16,148,34,6,9),(4,77.97,105,31,4,9),(4,53.14,179,23,6,11),(4,167.16,167,35,4,10),(3,146.14,140,24,5,9),(2,118.4,177,37,5,12),(5,86.4,119,39,5,10),(4,187.47,151,32,6,12),(3,78.37,188,30,4,11),(5,128.71,110,21,6,9),(1,88.88,183,38,4,9),(1,94.44,197,31,4,9),(5,34.24,107,25,4,10),(4,151.71,101,38,5,9),(3,48.54,116,31,4,9),(1,171.7,147,31,5,10),(5,97.38,107,37,4,12),(4,46.97,175,30,5,11),(5,49.48,144,30,4,12),(1,75.05,192,35,4,12),(3,108.14,120,26,5,11),(1,188.98,184,40,6,11),(1,68.53,153,38,5,9),(3,137.81,105,33,4,11),(5,22.88,197,21,5,10),(5,161.21,180,32,6,10),(3,59.29,123,28,4,12),(4,74.25,187,26,4,12),(2,115.28,107,25,6,12),(4,174.76,126,23,5,11),(5,91.72,114,33,6,9),(5,156.49,177,35,5,9),(1,40.65,134,33,5,11),(1,16.48,147,26,6,12),(3,61.89,117,38,4,11),(5,152.5,142,26,4,11),(1,180.05,126,36,5,9),(4,10.31,169,35,5,12),(2,98.03,194,27,6,10),(5,129.47,105,31,5,11),(3,13.57,137,28,5,12),(5,134.66,196,24,6,10),(2,195.51,198,22,4,10),(5,117.04,121,32,5,10),(4,159.74,158,28,5,10),(3,109.35,152,34,4,12),(3,118.1,169,34,6,12),(3,60.1,129,23,6,12),(5,160.66,183,37,5,11),(1,175.73,182,30,4,10),(4,136.39,156,26,6,9),(3,25.28,191,28,5,9),(3,176.28,179,27,5,12),(5,162.79,197,29,5,10),(4,135.33,114,36,5,12),(2,28.99,171,28,5,10),(4,169.78,110,26,6,12),(4,80.02,151,34,6,9),(4,92.29,197,37,6,11),(4,73.55,111,32,4,11),(5,64.67,111,23,4,12),(1,62.51,199,23,4,10),(4,135.93,107,30,6,10),(1,144.5,157,25,6,10),(5,140.89,120,24,5,12),(3,175.65,174,25,6,9),(4,148,137,36,6,10),(4,126.61,196,33,5,12),(2,41.76,179,27,6,9),(3,60.49,168,25,4,10),(2,152.58,109,38,5,10),(5,48.06,160,36,4,10),(5,156.38,143,23,4,11),(1,195.66,153,40,4,9),(2,184.76,155,34,4,12),(4,15.5,140,25,5,10),(3,163.69,168,28,5,11),(4,115.26,144,24,6,12),(4,122.53,191,21,5,10),(3,126.02,105,35,6,12),(4,155.92,140,23,4,10),(3,193.97,103,22,5,10),(4,187.72,145,25,5,10),(2,140.52,104,38,6,11),(3,195.17,109,25,6,9),(3,153.47,145,34,5,10),(3,149.16,106,28,4,9),(2,31.92,152,40,5,9),(2,165.22,164,31,4,12),(4,58.27,119,36,6,12),(3,87.39,178,23,4,12),(2,194.79,154,33,5,10),(2,71.22,159,30,5,11),(5,58.1,183,26,5,9),(1,63.3,162,26,4,11),(2,21.36,165,31,4,11),(5,68.07,189,36,5,12),(4,54.09,135,22,6,12),(1,176.09,175,23,4,12),(2,71.8,185,36,6,9),(2,58.32,124,23,5,11),(1,144.57,189,35,4,12),(5,35.25,157,31,6,11),(1,10.68,112,21,4,10),(2,163.86,151,26,5,10),(3,152.84,140,36,6,12),(3,34.68,119,32,4,9),(2,101.8,152,32,5,12),(4,155.26,142,28,5,11),(1,20.63,160,34,5,11),(5,181.67,141,38,5,11),(3,152.49,199,22,5,9),(4,83.71,159,36,4,11),(4,39.98,144,31,5,11),(1,13.97,145,32,5,12),(1,87.34,146,27,4,12),(4,194.66,136,36,5,10),(5,20.32,109,35,6,11),(4,77.3,200,25,4,11),(3,114.68,137,22,4,12),(4,83.52,167,26,5,11),(4,134.23,153,26,5,12),(4,135.72,123,34,6,10),(2,195.45,165,24,6,12),(5,34.06,114,33,5,11),(2,124.83,106,27,4,9),(3,126.22,119,35,4,11),(1,155.6,169,21,6,10),(4,92.14,199,28,4,12),(2,52.3,124,36,4,10),(5,128.26,110,32,4,9),(4,91.91,142,26,6,12),(2,179.62,139,24,6,10),(4,84.28,137,26,6,11),(2,164.78,125,28,6,11),(1,168.48,160,23,6,9),(4,197.49,173,37,4,11),(1,47.06,183,29,5,10),(4,139.95,173,34,5,9),(3,116.12,114,36,6,12),(5,160.32,163,38,6,10),(3,146.98,147,33,6,10),(2,130.46,125,26,6,11),(4,199.96,127,26,5,10),(3,163.47,111,29,6,11),(2,48.4,151,31,6,12),(2,10.48,141,22,5,12),(4,60.56,188,27,6,12),(5,92.93,142,28,4,12),(5,51.93,157,33,5,9),(1,178.51,124,39,5,11),(4,176.86,138,32,5,11),(1,36.6,143,33,5,12),(5,31.05,104,25,5,9),(4,69.33,137,31,5,11),(1,40.91,141,32,6,11),(4,149.97,172,24,5,10),(5,59.29,164,33,6,10),(1,90.99,161,29,6,12),(1,150.74,104,40,5,9),(3,89.67,104,32,4,12),(5,197.53,139,31,4,11),(4,13.98,101,23,4,9),(2,74.36,139,32,5,10),(2,54.19,176,23,6,11),(5,106.7,184,37,6,9),(2,13.09,110,25,6,9),(1,91.1,175,35,5,9),(4,174.67,177,31,5,11),(3,88.72,171,36,5,10),(1,178.2,130,32,5,10),(3,23.16,127,36,4,11),(3,144.62,187,40,4,9),(2,25.4,167,30,5,12),(4,102.11,104,29,6,11),(5,109.1,185,38,6,9),(2,21.23,121,24,4,12),(1,175.61,164,32,5,11),(4,29.04,150,23,6,9);
/*!40000 ALTER TABLE `sales_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_dim`
--

DROP TABLE IF EXISTS `time_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_dim` (
  `time_key` int NOT NULL AUTO_INCREMENT,
  `day` int NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`time_key`),
  UNIQUE KEY `day` (`day`,`month`,`year`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_dim`
--

LOCK TABLES `time_dim` WRITE;
/*!40000 ALTER TABLE `time_dim` DISABLE KEYS */;
INSERT INTO `time_dim` VALUES (11,1,1,2026),(10,1,2,2026),(12,1,3,2026),(9,1,4,2026);
/*!40000 ALTER TABLE `time_dim` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 11:18:31
