-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: db_autofix
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `agendamentos`
--

DROP TABLE IF EXISTS `agendamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamentos` (
  `codAgendamento` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `tipoServico` enum('revisão','manutenção','instalação') NOT NULL,
  `idVeiculo` int NOT NULL,
  `idCliente` int NOT NULL,
  PRIMARY KEY (`codAgendamento`),
  KEY `idVeiculo` (`idVeiculo`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `agendamentos_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculos` (`codVeiculo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `agendamentos_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`codCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamentos`
--

LOCK TABLES `agendamentos` WRITE;
/*!40000 ALTER TABLE `agendamentos` DISABLE KEYS */;
INSERT INTO `agendamentos` VALUES (1,'2026-10-25','14:00:00','revisão',1,1),(2,'2026-10-05','10:30:00','manutenção',2,2),(3,'2026-10-15','16:00:00','instalação',3,3),(4,'2026-11-03','08:00:00','revisão',4,4),(5,'2026-11-10','09:30:00','instalação',5,5),(6,'2026-10-28','13:00:00','manutenção',6,1);
/*!40000 ALTER TABLE `agendamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `codCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `celular` varchar(20) NOT NULL,
  PRIMARY KEY (`codCliente`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Marcos','marcos@gmail.com','U2FsdGVkX1/k3+Ve978lAIotS8bJi0A9hESWRUGBmI8=','U2FsdGVkX185ZLyKFANmXtFuaSzICN+B8h3Q2DZIWjw=','Rua das Flores, 123','48999998888'),(2,'Ana','ana@gmail.com','U2FsdGVkX1+cD1g1uPVKrBHRv2q7DHbdCg5+a+vrTqY=','U2FsdGVkX1/rPmpnsXkXWlFjkwws/v/geETM2uw+lFs=','Av. Brasil, 456','48988887777'),(3,'Roberto','roberto@gmail.com','U2FsdGVkX1+wemZYI+Urcmzmyr+hmDrAZ5s7ht9y8zc=','U2FsdGVkX1/JiX5lBsDIjRLtzsxdwLUjUlijWtg8ZDQ=','Rua Central, 789','48977776666'),(4,'Juliana','juliana@gmail.com','U2FsdGVkX18ttvpgMjYiqPMfkiyWw6PcZ+J7nD2dJqc=','U2FsdGVkX1/mG5Uft2l4+OsTt74VHFCE4LF81QbT3KI=','Rua XV de Novembro, 50','48966665555'),(5,'Carlos','carlos@gmail.com','U2FsdGVkX1+rC2wAqSb43UpToon29g71scD/fri9q9k=','U2FsdGVkX18N9dWrVmX0QyOwOZyjleNMSs8zMUrAQJ0=','Av. Beira Mar, 1000','48955554444'),(6,'Guilherme','guilherme_bello@estudante.sesisenai.org.br','U2FsdGVkX19yKWlEXcf2gAf1PSz2fmadQeWhv93VKzU=','U2FsdGVkX18W//UjgHS7oaqJpR2HMouaH/II7i2xstY=','RUA','4799164399'),(7,'Guilherme','bello@gmail.com','U2FsdGVkX18V2SEqJNqtewTj8cr/jkM9e9ItTf/tIx0=','U2FsdGVkX18zuIjeqQYBJBBasHRjcqDMAlFpizNxUiQ=','rua','47991461399');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `codVeiculo` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `rastreador` varchar(100) NOT NULL,
  `idCliente` int NOT NULL,
  PRIMARY KEY (`codVeiculo`),
  UNIQUE KEY `placa` (`placa`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `veiculos_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`codCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
INSERT INTO `veiculos` VALUES (1,'Onix','Chevrolet','ABC1D23','U2FsdGVkX18wAB0UgucMqotmRmvLLLcXI7HVgPqL21w=',1),(2,'HB20','Hyundai','DEF4G56','U2FsdGVkX19NcLJYSKQiCoRMEdRzDbEFsNkfMqVkvuI=',2),(3,'Strada','Fiat','HIJ7K89','U2FsdGVkX185HaOaC8K8/ukOqRrD5vxpTkwFNlSIO14=',3),(4,'Gol','Volkswagen','LMN2P34','U2FsdGVkX195tvsLL+usv8poIuoOaKVx/xv/sUzgG0Q=',4),(5,'Corolla','Toyota','QRS5T67','U2FsdGVkX18bXJtgfOl8b6uzGwfgMDyGDi9duVi7XgU=',5),(6,'Hilux','Toyota','UVW8X90','U2FsdGVkX1+rx+mGyey2zVDv230OWnF8xVmjwVOwMhA=',1);
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-20  7:55:55
