-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: minishop
-- ------------------------------------------------------
-- Server version	5.7.35-log

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Fullname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Birthdate` date NOT NULL,
  `Address` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Photo` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('hocthmpc00723','123','Thái Hoàng Mai Học','2001-07-08','Sa Đéc','hoc@gmail.com','useradmin.png'),('nghialtpc00727','123','Lương Trọng Nghĩa','2001-05-04','Cần Thơ','nghia@gmail.com','useradmin.png'),('nguyenteo','123','nguyenteo','2021-09-05','Lang la','teo@gmail.com','useradmin.png'),('taidtpc00726','123','Đỗ Tấn Tài','2001-04-30','Phong Điền','tai@gmail.com','useradmin.png'),('thanhttkpc00724','123','Trần Thị Kim Thanh','2001-05-30','Sóc Trăng','thanh@gmail.com','useradmin.png'),('uyenhnppc00728','123','Huỳnh Nguyễn Phương Uyên','2021-09-12','Vinh Long','uyen@gmail.com','useradmin.png');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `RoleId` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  KEY `username_idx` (`Username`),
  KEY `roleid_idx` (`RoleId`),
  CONSTRAINT `roleid` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`),
  CONSTRAINT `username` FOREIGN KEY (`Username`) REFERENCES `accounts` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (2,'taidtpc00726','USER'),(5,'taidtpc00726','PM'),(7,'hocthmpc00723','USER'),(8,'thanhttkpc00724','USER'),(9,'nghialtpc00727','USER'),(10,'nghialtpc00727','ADMIN'),(13,'uyenhnppc00728','USER'),(15,'nguyenteo','USER'),(16,'thanhttkpc00724','PM');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `Id` varchar(50) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('1','Clock'),('2','Laptop'),('3','Phone'),('4','Jewels'),('5','Clothes');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `Price` float NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `orderdetail_order_idx` (`OrderId`),
  KEY `orderdetail_product_idx` (`ProductId`),
  CONSTRAINT `orderdetail_order` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`Id`),
  CONSTRAINT `orderdetail_product` FOREIGN KEY (`ProductId`) REFERENCES `products` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,1,2,140,5),(2,1,3,210,8),(3,2,6,300,1),(4,2,9,1500,1),(5,3,3,210,1),(6,3,2,140,2),(7,3,1,100,2),(8,4,5,468,1),(9,4,6,300,1),(10,5,6,300,1),(11,6,3,210,1),(12,6,2,140,1);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `CreateDate` date NOT NULL,
  `Address` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `order_account_idx` (`Username`),
  CONSTRAINT `order_account` FOREIGN KEY (`Username`) REFERENCES `accounts` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'nghialtpc00727','2021-09-08','Can Tho'),(2,'nghialtpc00727','2021-09-08','Vinh Long'),(3,'taidtpc00726','2021-09-08','Phong Dien'),(4,'uyenhnppc00728','2021-09-08','Binh Minh'),(5,'nguyenteo','2021-09-08','KOL'),(6,'nghialtpc00727','2021-09-10','');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Image` varchar(50) NOT NULL,
  `Price` float NOT NULL,
  `CreateDate` date NOT NULL,
  `CategoryId` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `product_category_idx` (`CategoryId`),
  CONSTRAINT `product_category` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Áo Thun','1127.png',100,'2021-09-07','5'),(2,'Áo Sơ-Mi','1125.png',140,'2021-09-07','5'),(3,'Áo Khoác','1126.png',210,'2021-09-07','5'),(4,'Dell - 250','1003.jpg',460,'2021-09-07','2'),(5,'Hp - Loki','1004.jpg',468,'2021-09-07','2'),(6,'Iphone 6 Plus','1033.png',300,'2021-09-07','3'),(7,'Samsung Galaxy','1012.jpg',400,'2021-09-07','3'),(8,'Nhẫn Kim Cương Pilo','1017.jpg',980,'2021-09-07','4'),(9,'Nhẫn Kim Cương PNJ','1029.jpg',1500,'2021-09-07','4'),(10,'Đồng Hồ Casio','1001.jpg',200,'2021-09-07','1'),(11,'Đồng Hồ Hublot','1002.jpg',2000,'2021-09-07','1'),(12,'Nhẫn Hồng Hạc','1053.jpg',1400,'2021-09-07','4'),(13,'Laptop Gaming','1008.jpg',2500,'2021-09-07','2'),(14,'Đồng Hồ Classic','1038.jpg',400,'2021-09-07','1'),(15,'Nokia','1059.jpg',600,'2021-09-07','3');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `Id` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('ADMIN','Quan Tri'),('PM','Nhan Vien'),('USER','Nguoi Dung');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-10 12:56:33
