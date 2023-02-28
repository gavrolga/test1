CREATE DATABASE  IF NOT EXISTS `test1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `test1`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: .    Database: test1
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_categories_parent_id_idx` (`parent_id`),
  CONSTRAINT `fk_categories_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,'Продукты питания','2023-02-17 12:48:10','2023-02-17 12:48:51'),(2,NULL,'Зоотовары','2023-02-17 12:48:10',NULL),(3,NULL,'Техника','2023-02-17 12:52:11',NULL),(4,NULL,'Красота и здоровье','2023-02-17 12:52:11',NULL),(5,NULL,'Одежда','2023-02-17 12:52:12',NULL),(6,NULL,'Аксессуары','2023-02-17 12:52:12',NULL),(7,5,'Женская одежда','2023-02-17 12:53:43',NULL),(8,5,'Мужская одежда ','2023-02-17 12:53:43',NULL),(9,NULL,'Товары для дома','2023-02-17 12:53:44','2023-02-20 09:18:18'),(10,2,'Собаки','2023-02-17 12:59:51',NULL),(11,2,'Кошки','2023-02-17 12:59:51',NULL),(12,3,'Компьютеры','2023-02-17 12:59:51','2023-02-17 13:00:04'),(13,12,'Комплектующие','2023-02-17 13:00:37',NULL),(14,13,'Процессоры','2023-02-17 13:00:37',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`test_ext_user`@`%`*/ /*!50003 TRIGGER `livemaster`.`categories_BEFORE_UPDATE` BEFORE UPDATE ON `categories` FOR EACH ROW
BEGIN
SET new.updated_at = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Майка-боксёрка','2023-02-17 13:26:10',NULL),(2,'Джинсы \"Сюрприз\"','2023-02-17 13:26:10',NULL),(3,'Джинсы \"Красотка\"','2023-02-17 13:26:10',NULL),(4,'Печенье \"Любимое\"','2023-02-17 13:26:10',NULL),(5,'Сухой корм для кошек \"Пушистик\"','2023-02-17 13:26:11',NULL),(6,'Влажный корм для собак \"Лакомка\"','2023-02-17 13:26:11',NULL),(7,'Процессор Inel Core I100500','2023-02-17 13:26:11',NULL),(8,'Процессор Ryzen 800','2023-02-17 13:26:11',NULL),(9,'Сыр \"Пармезан\"','2023-02-20 10:05:02',NULL),(10,'Сыр \"Чеддер\"','2023-02-20 10:05:02',NULL),(11,'Колбаса \"Салями\"','2023-02-20 10:05:03',NULL),(12,'Серьги-кольца','2023-02-20 10:05:03',NULL),(13,'Сумка ','2023-02-20 10:05:03',NULL),(14,'Косметичка дорожная','2023-02-20 10:05:03',NULL),(15,'Фитнес-браслет Xiaomi','2023-02-20 10:05:03',NULL),(16,'Набор полотенец','2023-02-20 10:05:03',NULL),(17,'Придверный коврик','2023-02-20 10:05:03',NULL),(18,'Свечи ','2023-02-20 10:05:03',NULL),(19,'Конфеты-суфле','2023-02-20 10:05:03',NULL),(20,'Когеточка','2023-02-20 10:05:03',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`test_ext_user`@`%`*/ /*!50003 TRIGGER `livemaster`.`products_BEFORE_UPDATE` BEFORE UPDATE ON `products` FOR EACH ROW
BEGIN
SET new.updated_at = NOW;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products_categories`
--

DROP TABLE IF EXISTS `products_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_categories`
--

LOCK TABLES `products_categories` WRITE;
/*!40000 ALTER TABLE `products_categories` DISABLE KEYS */;
INSERT INTO `products_categories` VALUES (1,1,5,'2023-02-20 13:46:02'),(2,2,7,'2023-02-20 13:46:02'),(3,3,5,'2023-02-20 13:46:02'),(4,4,1,'2023-02-20 13:46:02'),(5,5,11,'2023-02-20 13:46:02'),(6,6,10,'2023-02-20 13:46:02'),(7,7,14,'2023-02-20 13:46:02'),(8,8,14,'2023-02-20 13:46:02'),(9,9,1,'2023-02-20 13:46:02'),(10,10,1,'2023-02-20 13:46:03'),(11,11,1,'2023-02-20 13:46:03'),(12,12,6,'2023-02-20 13:46:03'),(13,13,9,'2023-02-20 13:46:03'),(14,14,4,'2023-02-20 13:46:03'),(15,15,3,'2023-02-20 13:46:03'),(16,16,9,'2023-02-20 13:46:03'),(17,17,9,'2023-02-20 13:46:03'),(18,18,9,'2023-02-20 13:46:03'),(19,19,1,'2023-02-20 13:46:03'),(20,20,11,'2023-02-20 13:46:03'),(21,1,7,'2023-02-20 13:46:04'),(22,2,8,'2023-02-20 13:46:04'),(23,3,8,'2023-02-20 13:46:04'),(24,4,2,'2023-02-20 13:46:04'),(25,5,2,'2023-02-20 13:46:04'),(26,7,3,'2023-02-20 13:46:04'),(27,12,4,'2023-02-20 13:46:04'),(28,13,6,'2023-02-20 13:46:04');
/*!40000 ALTER TABLE `products_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'livemaster'
--

--
-- Dumping routines for database 'livemaster'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-21 22:24:38
