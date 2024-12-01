-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: bank_db
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AccountTypeId` int DEFAULT NULL,
  `CustomerId` int DEFAULT NULL,
  `BranchId` int DEFAULT NULL,
  `Balance` decimal(12,2) DEFAULT '0.00',
  `TPIN` char(24) NOT NULL DEFAULT 'j3kSBFIkeina5eMI6KUefw==',
  `Date` date NOT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  `Status` enum('Active','InActive') DEFAULT 'Active',
  PRIMARY KEY (`Id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `BranchId` (`BranchId`),
  KEY `AccountTypeId` (`AccountTypeId`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`Id`),
  CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`BranchId`) REFERENCES `branches` (`Id`),
  CONSTRAINT `accounts_ibfk_3` FOREIGN KEY (`AccountTypeId`) REFERENCES `accountstype` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=900001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (900000,1,1,1,20000.00,'j3kSBFIkeina5eMI6KUefw==','2024-11-30','2024-11-30 13:39:04',1,'Active');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountstype`
--

DROP TABLE IF EXISTS `accountstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountstype` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Type` enum('Savings','Checking') NOT NULL,
  `MinBalance` decimal(7,2) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountstype`
--

LOCK TABLES `accountstype` WRITE;
/*!40000 ALTER TABLE `accountstype` DISABLE KEYS */;
INSERT INTO `accountstype` VALUES (1,'Savings',0.00,'2024-11-30 13:11:46',1);
/*!40000 ALTER TABLE `accountstype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Address1` varchar(100) NOT NULL,
  `Address2` varchar(100) DEFAULT NULL,
  `City` varchar(20) NOT NULL,
  `District` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `ZipCode` varchar(10) NOT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  `Country` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'303, Inland Encore, Kadri Kambala Road',NULL,'Mangalore','DK','Karnataka','575004','2024-11-30 12:14:41',1,'India'),(2,'TEJASVINI HOSPITAL ANNEXE, Kadri Temple Rd, Mallikatte',NULL,'Mangalore','DK','Karnataka','575003','2024-11-30 13:21:00',1,'India');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `IFSC` varchar(11) NOT NULL,
  `AddressId` int DEFAULT NULL,
  `SupervisorId` int DEFAULT NULL,
  `NoOFEmployees` int DEFAULT '0',
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IFSC` (`IFSC`),
  KEY `AddressId` (`AddressId`),
  CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`AddressId`) REFERENCES `addresses` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'Kadri, Mangalore','AB000000001',2,NULL,20,'0824 2421055','ebank@nittebank.com','2024-11-30 13:22:16',1);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardbrands`
--

DROP TABLE IF EXISTS `cardbrands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cardbrands` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardbrands`
--

LOCK TABLES `cardbrands` WRITE;
/*!40000 ALTER TABLE `cardbrands` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardbrands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardlimits`
--

DROP TABLE IF EXISTS `cardlimits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cardlimits` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CardId` int DEFAULT NULL,
  `DomesticAmount` int DEFAULT '0',
  `International` tinyint(1) DEFAULT '0',
  `Contactless` tinyint(1) DEFAULT '0',
  `Online` tinyint(1) DEFAULT '0',
  `ATM` tinyint(1) DEFAULT '0',
  `PosQr` tinyint(1) DEFAULT '0',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `CardId` (`CardId`),
  CONSTRAINT `cardlimits_ibfk_1` FOREIGN KEY (`CardId`) REFERENCES `cards` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardlimits`
--

LOCK TABLES `cardlimits` WRITE;
/*!40000 ALTER TABLE `cardlimits` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardlimits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CardTypeId` int DEFAULT NULL,
  `Number` varchar(16) DEFAULT NULL,
  `CustomerId` int DEFAULT NULL,
  `CardBrandId` int DEFAULT NULL,
  `IssueDate` date DEFAULT NULL,
  `Balance` decimal(12,2) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `CardLimit` decimal(15,2) DEFAULT NULL,
  `CVV` int DEFAULT NULL,
  `PIN` varchar(6) DEFAULT NULL,
  `AccountId` int DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  `Status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `AccountId` (`AccountId`),
  KEY `CardTypeId` (`CardTypeId`),
  KEY `CardBrandId` (`CardBrandId`),
  CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`Id`),
  CONSTRAINT `cards_ibfk_2` FOREIGN KEY (`AccountId`) REFERENCES `accounts` (`Id`),
  CONSTRAINT `cards_ibfk_3` FOREIGN KEY (`CardTypeId`) REFERENCES `cardtypes` (`Id`),
  CONSTRAINT `cards_ibfk_4` FOREIGN KEY (`CardBrandId`) REFERENCES `cardbrands` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardtypes`
--

DROP TABLE IF EXISTS `cardtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cardtypes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardtypes`
--

LOCK TABLES `cardtypes` WRITE;
/*!40000 ALTER TABLE `cardtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcardpayments`
--

DROP TABLE IF EXISTS `creditcardpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcardpayments` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CardId` int DEFAULT NULL,
  `CustomerId` int DEFAULT NULL,
  `Amount` decimal(15,2) NOT NULL,
  `BalanceBefore` decimal(10,2) DEFAULT NULL,
  `BalanceAfter` decimal(10,2) DEFAULT NULL,
  `Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `CardId` (`CardId`),
  KEY `CustomerId` (`CustomerId`),
  CONSTRAINT `creditcardpayments_ibfk_1` FOREIGN KEY (`CardId`) REFERENCES `cards` (`Id`),
  CONSTRAINT `creditcardpayments_ibfk_2` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcardpayments`
--

LOCK TABLES `creditcardpayments` WRITE;
/*!40000 ALTER TABLE `creditcardpayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditcardpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerlogins`
--

DROP TABLE IF EXISTS `customerlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerlogins` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CustomerId` int NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` char(24) DEFAULT 'ilWR0Hyiprqe2+NlIcZ70A==',
  `LastLogin` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `PreviousPassword` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `Email` (`Email`),
  CONSTRAINT `customerlogins_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`Id`),
  CONSTRAINT `customerlogins_ibfk_2` FOREIGN KEY (`Email`) REFERENCES `customers` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=500001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerlogins`
--

LOCK TABLES `customerlogins` WRITE;
/*!40000 ALTER TABLE `customerlogins` DISABLE KEYS */;
INSERT INTO `customerlogins` VALUES (500000,1,'nidhish.shettigar.06@gmail.com','ilWR0Hyiprqe2+NlIcZ70A==','2024-11-30 13:37:56','2024-11-30 13:37:56','2024-11-30 13:37:56',1);
/*!40000 ALTER TABLE `customerlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) NOT NULL,
  `MiddleName` varchar(10) DEFAULT NULL,
  `LastName` varchar(20) NOT NULL,
  `Gender` enum('Male','Female','Other') NOT NULL,
  `DOB` date NOT NULL,
  `MobileNo` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `AadhaarNo` char(14) NOT NULL,
  `PanCardNo` char(10) NOT NULL,
  `AddressId` int NOT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `AadhaarNo` (`AadhaarNo`),
  UNIQUE KEY `PanCardNo` (`PanCardNo`),
  UNIQUE KEY `Email` (`Email`),
  KEY `AddressId` (`AddressId`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`AddressId`) REFERENCES `addresses` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Nidhish','','Shettigar','Male','2004-05-06','9901062621','nidhish.shettigar.06@gmail.com','1234 5678 9102','HPPSN1234A',1,'2024-11-30 12:20:33',1);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeelogins`
--

DROP TABLE IF EXISTS `employeelogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeelogins` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EmployeeId` int DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` char(24) DEFAULT 'J15zTpZeGcT6DIMUNuPx+w==',
  `LastLogin` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `PreviousPassword` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `EmployeeId` (`EmployeeId`),
  CONSTRAINT `employeelogins_ibfk_1` FOREIGN KEY (`EmployeeId`) REFERENCES `employees` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeelogins`
--

LOCK TABLES `employeelogins` WRITE;
/*!40000 ALTER TABLE `employeelogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeelogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) NOT NULL,
  `MiddleName` varchar(10) DEFAULT NULL,
  `LastName` varchar(20) NOT NULL,
  `Gender` enum('Male','Female','Other') NOT NULL,
  `BranchId` int NOT NULL,
  `MobileNo` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `AddressId` int NOT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `DOB` date NOT NULL,
  `SupervisorId` int DEFAULT NULL,
  `DesignationId` int DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `SupervisorId` (`SupervisorId`),
  KEY `BranchId` (`BranchId`),
  KEY `DesignationId` (`DesignationId`),
  KEY `AddressId` (`AddressId`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`SupervisorId`) REFERENCES `employees` (`Id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`BranchId`) REFERENCES `branches` (`Id`),
  CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`DesignationId`) REFERENCES `employeesdesignation` (`Id`),
  CONSTRAINT `employees_ibfk_4` FOREIGN KEY (`AddressId`) REFERENCES `addresses` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeesdesignation`
--

DROP TABLE IF EXISTS `employeesdesignation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeesdesignation` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Designation` varchar(50) DEFAULT NULL,
  `Description` text,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeesdesignation`
--

LOCK TABLES `employeesdesignation` WRITE;
/*!40000 ALTER TABLE `employeesdesignation` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeesdesignation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loanapplication`
--

DROP TABLE IF EXISTS `loanapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loanapplication` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) NOT NULL,
  `MiddleName` varchar(10) DEFAULT NULL,
  `LastName` varchar(20) NOT NULL,
  `MobileNo` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `AadhaarNo` char(14) NOT NULL,
  `PanCardNo` char(10) NOT NULL,
  `LoanTypeId` int DEFAULT NULL,
  `IssuedAmount` decimal(12,2) DEFAULT NULL,
  `Tenure` int DEFAULT NULL,
  `ROI` decimal(5,2) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `AadhaarNo` (`AadhaarNo`),
  UNIQUE KEY `PanCardNo` (`PanCardNo`),
  KEY `LoanTypeId` (`LoanTypeId`),
  CONSTRAINT `loanapplication_ibfk_1` FOREIGN KEY (`LoanTypeId`) REFERENCES `loantypes` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanapplication`
--

LOCK TABLES `loanapplication` WRITE;
/*!40000 ALTER TABLE `loanapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `loanapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `Id` int NOT NULL,
  `LoanApplicationId` int DEFAULT NULL,
  `BranchId` int DEFAULT NULL,
  `CustomerId` int DEFAULT NULL,
  `LoanTypeId` int DEFAULT NULL,
  `AccountId` int DEFAULT NULL,
  `Tenure` int DEFAULT NULL,
  `ROI` decimal(5,2) DEFAULT NULL,
  `RemainingAmount` decimal(12,2) DEFAULT NULL,
  `IssuedAmount` decimal(12,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `AccountId` (`AccountId`),
  KEY `BranchId` (`BranchId`),
  KEY `LoanTypeId` (`LoanTypeId`),
  KEY `LoanApplicationId` (`LoanApplicationId`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`Id`),
  CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`AccountId`) REFERENCES `accounts` (`Id`),
  CONSTRAINT `loans_ibfk_3` FOREIGN KEY (`BranchId`) REFERENCES `branches` (`Id`),
  CONSTRAINT `loans_ibfk_4` FOREIGN KEY (`LoanTypeId`) REFERENCES `loantypes` (`Id`),
  CONSTRAINT `loans_ibfk_5` FOREIGN KEY (`LoanApplicationId`) REFERENCES `loanapplication` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loantypes`
--

DROP TABLE IF EXISTS `loantypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loantypes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loantypes`
--

LOCK TABLES `loantypes` WRITE;
/*!40000 ALTER TABLE `loantypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `loantypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lockers`
--

DROP TABLE IF EXISTS `lockers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lockers` (
  `LockerNumber` int NOT NULL AUTO_INCREMENT,
  `AccountId` int NOT NULL,
  `Type` enum('Basic','Premium','VIP') NOT NULL,
  `Size` enum('Small','Medium','Large') NOT NULL,
  `Rent` decimal(10,2) NOT NULL,
  `Deposit` decimal(10,2) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`LockerNumber`),
  KEY `AccountId` (`AccountId`),
  CONSTRAINT `lockers_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `accounts` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lockers`
--

LOCK TABLES `lockers` WRITE;
/*!40000 ALTER TABLE `lockers` DISABLE KEYS */;
/*!40000 ALTER TABLE `lockers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Type` enum('Deposit','Withdrawal','Transfer') NOT NULL,
  `SenderAccountId` int DEFAULT NULL,
  `ReceiverAccountId` int DEFAULT NULL,
  `Mode` enum('NEFT','IMPS','UPI','CHECK') NOT NULL,
  `Status` enum('Pending','Completed','Failed') DEFAULT 'Completed',
  `SenderIFSC` varchar(11) DEFAULT NULL,
  `ReceiverIFSC` varchar(11) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `BalanceBefore` decimal(10,2) DEFAULT NULL,
  `BalanceAfter` decimal(10,2) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `SenderIFSC` (`SenderIFSC`),
  KEY `SenderAccountId` (`SenderAccountId`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`SenderIFSC`) REFERENCES `branches` (`IFSC`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`SenderAccountId`) REFERENCES `accounts` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=490000000000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 16:41:28
