-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: natam
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `id_flight` varchar(10) NOT NULL,
  `model` varchar(15) NOT NULL,
  `id_plate` varchar(15) NOT NULL,
  `flight_hours` int NOT NULL,
  PRIMARY KEY (`id_plate`),
  KEY `id_flight` (`id_flight`),
  CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`id_flight`) REFERENCES `flight` (`id_flight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES ('FL123','Boeing 737','ABC123',5000),('FL888','Airbus A310','BCD890',5300),('FL456','Airbus A320','DEF456',6000),('FL999','Boeing 737','EFG123',5600),('FL789','Boeing 747','GHI789',7000),('FL111','Airbus A320','HIJ456',5900),('FL101','Airbus A330','JKL012',5500),('FL232','Boeing 747','KLM789',6800),('FL222','Boeing 777','MNO345',6500),('FL281','Airbus A330','NOP012',5400),('FL444','Airbus A350','PQR678',4800),('FL330','Boeing 777','QRS345',6300),('FL228','Boeing 767','STU901',5200),('FL555','Airbus A380','VWX234',6700),('FL777','Boeing 787','YZA567',6100);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `id_airline` int NOT NULL AUTO_INCREMENT,
  `id_crew` int NOT NULL,
  PRIMARY KEY (`id_airline`),
  KEY `id_crew` (`id_crew`),
  CONSTRAINT `airline_ibfk_1` FOREIGN KEY (`id_crew`) REFERENCES `flight_crew` (`id_crew`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES (101,201),(102,202),(103,203),(104,204),(105,205),(106,206),(107,207),(108,208),(109,209),(110,210),(111,211),(112,212),(113,213),(114,214),(115,215);
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `id_flight` varchar(10) NOT NULL,
  `id_airline` int NOT NULL,
  `id_Airport` varchar(10) NOT NULL,
  `name_city` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`id_Airport`),
  KEY `id_flight` (`id_flight`),
  KEY `id_airline` (`id_airline`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`id_flight`) REFERENCES `flight` (`id_flight`),
  CONSTRAINT `airport_ibfk_2` FOREIGN KEY (`id_airline`) REFERENCES `airline` (`id_airline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('FL123',101,'501','Santiago','Chile'),('FL456',102,'502','Buenos Aires','Argentina'),('FL789',103,'503','Chicago','USA'),('FL101',104,'504','Miami','USA'),('FL222',105,'505','Rio de Janeiro','Brazil'),('FL444',106,'506','Paris ','Francia'),('FL228',107,'507','Denver','USA'),('FL555',108,'508','Puero Natales','Chile'),('FL777',109,'509','Calama ','Chile'),('FL888',110,'510','Antofagasta ','Chile'),('FL999',111,'511','New Orleans','USA'),('FL111',112,'512','Atlanta','USA'),('FL232',113,'513','Boston','USA'),('FL881',114,'514','Mendoza ','Argentina '),('FL330',115,'515','Caracas','Venezuela'),('FL101',102,'701','Bogota','Colombia'),('FL111',102,'702','Mendoza','Argentina'),('FL123',103,'703','Albuquerque','USA'),('FL222',104,'704','Brasilia','Brazil'),('FL228',105,'705','Cuidad de Mexico','Mexico'),('FL232',106,'706','Moscu ','Rusia'),('FL281',107,'707','Varzovia','Polonia'),('FL330',108,'708','Berlin ','Germany');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `id_flight` varchar(10) NOT NULL,
  `origen` varchar(20) NOT NULL,
  `destination` varchar(20) NOT NULL,
  `passengers_numbers` int NOT NULL,
  `name_capitan` varchar(20) NOT NULL,
  `last_name_capitan` varchar(20) NOT NULL,
  `date_flight` date NOT NULL,
  PRIMARY KEY (`id_flight`,`date_flight`),
  KEY `idx_date_flight` (`date_flight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES ('FL101','Miami','San Francisco',180,'Michael','Johnson','2023-02-05'),('FL111','Atlanta','New York',200,'James','Lopez','2023-02-13'),('FL123','New York','Los Angeles',150,'John','Doe','2023-02-02'),('FL222','San Francisco','Seattle',90,'Emily','Brown','2023-02-06'),('FL228','Denver','Las Vegas',130,'Sophia','Taylor','2023-02-08'),('FL232','New York','Boston',110,'Isabella','Hernandez','2023-02-14'),('FL281','Boston','Washington DC',130,'Alexander','Gonzalez','2023-02-15'),('FL330','Washington DC','Philadelphia',120,'Mia','Perez','2023-02-16'),('FL330','Caracas','Lima',120,'Carlos ','Perez','2023-02-23'),('FL444','Seattle','Denver',110,'Daniel','Martinez','2023-02-07'),('FL456','Los Angeles','Chicago',120,'Jane','Smith','2023-02-03'),('FL555','Las Vegas','Dallas',140,'Matthew','Anderson','2023-02-09'),('FL777','Dallas','Houston',150,'Olivia','Wilson','2023-02-10'),('FL789','Chicago','Miami',100,'Alice','Johnson','2023-02-04'),('FL881','Mendoza ','Santiago',150,'Ana ','Martinez','2023-02-22'),('FL888','Houston','New Orleans',160,'David','Lee','2023-02-11'),('FL999','New Orleans','Atlanta',170,'Emma','Garcia','2023-02-12');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_crew`
--

DROP TABLE IF EXISTS `flight_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_crew` (
  `id_crew` int NOT NULL AUTO_INCREMENT,
  `id_flight` varchar(10) NOT NULL,
  `rut_crew` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `Phone_number` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id_crew`),
  KEY `id_flight` (`id_flight`),
  CONSTRAINT `flight_crew_ibfk_1` FOREIGN KEY (`id_flight`) REFERENCES `flight` (`id_flight`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_crew`
--

LOCK TABLES `flight_crew` WRITE;
/*!40000 ALTER TABLE `flight_crew` DISABLE KEYS */;
INSERT INTO `flight_crew` VALUES (201,'FL123','1001','John','Doe','123-456-7890','john.doe@example.com','2022-04-01'),(202,'FL456','1002','Jane','Smith','987-654-3210','jane.smith@example.com','2022-04-02'),(203,'FL789','1003','Alice','Johnson','456-789-0123','alice.johnson@example.com','2022-04-03'),(204,'FL101','1004','Michael','Johnson','234-567-8901','michael.johnson@example.com','2022-04-04'),(205,'FL222','1005','Emily','Brown','890-123-4567','emily.brown@example.com','2022-04-05'),(206,'FL444','1006','Daniel','Martinez','678-901-2345','daniel.martinez@example.com','2022-04-06'),(207,'FL228','1007','Sophia','Taylor','345-678-9012','sophia.taylor@example.com','2022-04-07'),(208,'FL555','1008','Matthew','Anderson','012-345-6789','matthew.anderson@example.com','2022-04-08'),(209,'FL777','1009','Olivia','Wilson','890-123-4567','olivia.wilson@example.com','2022-04-09'),(210,'FL888','1010','David','Lee','456-789-0123','david.lee@example.com','2022-04-10'),(211,'FL999','1011','Emma','Garcia','678-901-2345','emma.garcia@example.com','2022-04-11'),(212,'FL111','1012','James','Lopez','345-678-9012','james.lopez@example.com','2022-04-12'),(213,'FL232','1013','Isabella','Hernandez','123-456-7890','isabella.hernandez@example.com','2022-04-13'),(214,'FL281','1014','Alexander','Gonzalez','890-123-4567','alexander.gonzalez@example.com','2022-04-14'),(215,'FL330','1015','Mia','Perez','678-901-2345','mia.perez@example.com','2022-04-15'),(216,'FL101','1016','Juan','Pérez','123456789','juan@example.com','1990-01-01');
/*!40000 ALTER TABLE `flight_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_passenger`
--

DROP TABLE IF EXISTS `flight_passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_passenger` (
  `id_flight` varchar(10) NOT NULL,
  `date_flight` date NOT NULL,
  `id_passenger` int NOT NULL,
  PRIMARY KEY (`id_flight`,`date_flight`,`id_passenger`),
  KEY `date_flight` (`date_flight`),
  KEY `id_passenger` (`id_passenger`),
  CONSTRAINT `flight_passenger_ibfk_1` FOREIGN KEY (`id_flight`) REFERENCES `flight` (`id_flight`),
  CONSTRAINT `flight_passenger_ibfk_2` FOREIGN KEY (`date_flight`) REFERENCES `flight` (`date_flight`),
  CONSTRAINT `flight_passenger_ibfk_3` FOREIGN KEY (`id_passenger`) REFERENCES `passenger` (`id_passenger`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_passenger`
--

LOCK TABLES `flight_passenger` WRITE;
/*!40000 ALTER TABLE `flight_passenger` DISABLE KEYS */;
INSERT INTO `flight_passenger` VALUES ('FL101','2023-02-02',4),('FL111','2023-02-02',12),('FL123','2023-02-02',1),('FL222','2023-02-02',5),('FL228','2023-02-02',7),('FL232','2023-02-02',13),('FL281','2023-02-02',14),('FL330','2023-02-02',15),('FL444','2023-02-02',6),('FL456','2023-02-02',2),('FL555','2023-02-02',8),('FL777','2023-02-02',9),('FL789','2023-02-02',3),('FL888','2023-02-02',10),('FL999','2023-02-02',11);
/*!40000 ALTER TABLE `flight_passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_ticket`
--

DROP TABLE IF EXISTS `flight_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_ticket` (
  `id_ticket` int NOT NULL,
  `id_passenger` int NOT NULL,
  `flight_number` varchar(10) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `gate_number` varchar(10) NOT NULL,
  `class_code` varchar(10) NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  `date_flight` date NOT NULL,
  PRIMARY KEY (`id_ticket`),
  KEY `id_passenger` (`id_passenger`),
  KEY `flight_number` (`flight_number`),
  CONSTRAINT `flight_ticket_ibfk_1` FOREIGN KEY (`id_passenger`) REFERENCES `passenger` (`id_passenger`),
  CONSTRAINT `flight_ticket_ibfk_2` FOREIGN KEY (`flight_number`) REFERENCES `flight` (`id_flight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_ticket`
--

LOCK TABLES `flight_ticket` WRITE;
/*!40000 ALTER TABLE `flight_ticket` DISABLE KEYS */;
INSERT INTO `flight_ticket` VALUES (1,1,'FL123','Maria','Pinto','GATE1','ECONOMY','A12','2020-04-05'),(2,2,'FL456','Luis','Sanchez','GATE2','BUSINESS','C7','2020-04-06'),(3,3,'FL789','Paula ','Jaraquemada','GATE3','PREMIUM','D15','2020-04-07'),(4,4,'FL101','Manuel','Rojas ','GATE4','ECONOMY','B3','2020-04-08'),(5,5,'FL222','Carmen ','Paez','GATE5','BUSINESS','D10','2020-04-09'),(6,6,'FL444','Ignacia','Soto','GATE6','PREMIUM','F5','2020-04-10'),(7,7,'FL228','Carla','Romero','GATE7','ECONOMY','A7','2020-04-11'),(8,8,'FL555','Marta','Jimenez','GATE8','ECONOMY','A2','2020-04-12'),(9,9,'FL777','Luca','Gonzalez','GATE8','BUSINESS','C12','2020-04-13'),(10,10,'FL888','Cecilia','Perez','GATE10','ECONOMY','B14','2020-04-14'),(11,11,'FL999','Jose','Pineda','GATE11','BUSINESS','E9','2020-04-15'),(12,12,'FL111','Sofia','Vergara','GATE12','PREMIUM','F2','2020-04-16'),(13,13,'FL232','vicente','Madrid','GATE13','ECONOMY','A20','2020-04-17'),(14,14,'FL281','Carlos','Ruiz','GATE14','BUSINESS','C5','2020-04-18'),(15,15,'FL330','Ines','Tejeda','GATE15','PREMIUM','D8','2020-04-19');
/*!40000 ALTER TABLE `flight_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luggage`
--

DROP TABLE IF EXISTS `luggage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `luggage` (
  `id_luggage` int NOT NULL,
  `flight_number` varchar(20) NOT NULL,
  `id_passenger` int NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `weight` int NOT NULL,
  PRIMARY KEY (`id_luggage`),
  KEY `id_passenger` (`id_passenger`),
  CONSTRAINT `luggage_ibfk_1` FOREIGN KEY (`id_passenger`) REFERENCES `passenger` (`id_passenger`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luggage`
--

LOCK TABLES `luggage` WRITE;
/*!40000 ALTER TABLE `luggage` DISABLE KEYS */;
INSERT INTO `luggage` VALUES (5,'FL222',5,'Carmen','Sanchez',15),(6,'FL333',6,'Ignacia','Soto',10),(7,'FL444',7,'Carla','Romero',20),(8,'FL555',8,'Marta','Jimenez',18),(9,'FL656',9,'Luca','Gonzalez',23),(10,'FL777',10,'Cecilia ','Perez',20),(11,'FL888',11,'Jose','pineda',16),(12,'FL999',12,'sofia ','Vergara',17),(13,'FL111',13,'Vicente','Madreid',13),(14,'FL222',14,'Carlos','Ruiz',17),(15,'FL333',15,'Ines','Tejeda',20);
/*!40000 ALTER TABLE `luggage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `id_passenger` int NOT NULL,
  `rut_passenger` int NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(35) NOT NULL,
  `birthdate` date DEFAULT NULL,
  PRIMARY KEY (`id_passenger`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,1001,'Maria','Pinto','+56 986543123','m.pinto@gmail.com','1962-01-01'),(2,1002,'Luis','Sanchez','+56 987456321','l.sanchez@gmail.com','1972-01-01'),(3,1003,'Paula','Jaraquemada','+56 9863423123','p.jaraquemada@outlook.com','1982-01-01'),(4,1004,'Maneul','Rojas','+56 123543678','manuel.rojas@gmail.com','1992-01-01'),(5,1005,'Carmen','Paez','+56 986543123','c.paez@gmail.com','2002-01-01'),(6,1006,'Ignacia','Soto','+56 9761273465','i.soto@outlook.com','2012-01-01'),(7,1007,'Carla','Romero','+56 897354122','maria.pinto@gmail.com','2018-01-01'),(8,1008,'Marta','Jimenez','56897354233','marta.jumenez@gmail.com','2015-01-01'),(9,1009,'Luca','Gonzalez','+56 765234987','maria.figueroa@yahoo.com','1977-01-01'),(10,1010,'Cecilia','Perez','+56 986543123','maria.perez@gmail.com','1945-01-01'),(11,1011,'Jose','Pineda','+56 765432199','jose.pineda@gmail.com','2016-01-01'),(12,1012,'Sofia','Vergara','+56 986543657','sofia.vergara@outlook.com','2017-01-01'),(13,1013,'Vicente','Madrid','+56 543128761','vicente.madrid@gmail.com','2019-01-01'),(14,1014,'Carlos','Ruiz','+56 675243111','carlos.ruiz@gmail.com','1992-01-01'),(15,1015,'Ines','Tejeda','+56 765123992','inez.tejeda@gmail.com','1995-01-01');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-11 10:17:58
