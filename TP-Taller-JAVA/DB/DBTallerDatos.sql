-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: taller
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
-- Dumping data for table `repuesto`
--

LOCK TABLES `repuesto` WRITE;
/*!40000 ALTER TABLE `repuesto` DISABLE KEYS */;
INSERT INTO `repuesto` VALUES (1,'Aceite de motor (varias viscosidades) (5L)',10000,101),(2,'Filtro de aceite',2500,54),(3,'Filtro de aire',2000,32),(4,'Filtro de A/C',2500,22),(5,'Correa de distribución',9000,24),(6,'Filtro de combustible',3500,25),(7,'Bujías (Pack x4)',6000,16),(8,'Radiador',15000,2),(9,'Bomba de agua',10000,15),(10,'Bomba de combustible',8000,11),(11,'Amortiguadores (Del.)',15000,9),(12,'Amortiguadores (Tras.)',15000,10),(13,'Pastillas de freno (Pack x2)',5000,32),(14,'Kit de distr. completa',16000,13),(15,'Componentes caja de cambio (Por juego)',30000,5),(16,'Junta tapa de válvula',5000,16),(17,'Batería (12V)',20000,21),(18,'Luminaria (Focos, LED, etc.)',3000,38),(19,'Líquido de freno (Por botella) (1L)',1000,29),(20,'Líquido refrigerante (5L)',4000,47),(21,'Cables de bujías (Por juego)',4500,20),(22,'Tapa de radiador',5000,15),(23,'Poleas tensores',3500,7),(24,'Aceite de caja (Por botella)',7000,23),(25,'Grasa/lubricante (Por paquete)',1000,33),(26,'Bobina de encendido',6000,14),(27,'Disco de freno',13000,12);
/*!40000 ALTER TABLE `repuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trabajo`
--

LOCK TABLES `trabajo` WRITE;
/*!40000 ALTER TABLE `trabajo` DISABLE KEYS */;
INSERT INTO `trabajo` VALUES (1,'Mantenimiento','Cambio de aceite y filtro',5000),(2,'Mantenimiento','Cambio de filtro de combustible',4000),(3,'Mantenimiento','Cambio de bujias',4000),(4,'Reparaciones Menores','Cambio de pastillas de freno',4500),(5,'Reparaciones Menores','Cambio o recarga de batería',2000),(6,'Reparaciones Menores','Anulación de luces de tablero',1500),(7,'Trabajos Mayores','Cambio de correa de distribución',15000),(8,'Trabajos Mayores','Cambio de amortiguadores',18000),(9,'Trabajos Mayores','Cambio o reparación de radiador',12000),(10,'Trabajos Mayores','Cambio o reparación de bomba de agua',9000),(11,'Tren Motriz','Reparación de caja de cambios',40000),(12,'Tren Motriz','Reparación del motor (general)',80000),(13,'Tren Motriz','Cambio de junta de tapa de válvula',13000),(14,'Tren Motriz','Reparación de tapa de válvula',17000),(15,'Trabajo Completo','Distribución completa (correa, bba agua, tensores)',30000),(16,'Mantenimiento','Limpieza de inyectores',6000),(17,'Mantenimiento','Alineacion y balanceo',4000),(18,'Mantenimiento','Control y carga de gas para AC',5000),(19,'Reparaciones Menores','Cambio de luces',1500),(20,'Reparaciones Menores','Cambio de limpiaparabrisas',500),(21,'Trabajos Mayores','Cambio de catalizador de escape',10000),(22,'Trabajos Mayores','Reparación de alternador',12000),(23,'Trabajos Mayores','Cambio de rulemanes de rueda',8000),(24,'Tren Motriz','Cambio de embrague',27000),(25,'Tren Motriz','Reparación del diferencial',25000),(26,'Trabajo Completo','Revisión completa antes de viaje',8000),(27,'Electrónica','Diagnóstico general con scanner',3500),(28,'Electrónica','Reparación de sensores (ABS, velocidad, oxígeno)',5000);
/*!40000 ALTER TABLE `trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trabajo_repuesto`
--

LOCK TABLES `trabajo_repuesto` WRITE;
/*!40000 ALTER TABLE `trabajo_repuesto` DISABLE KEYS */;
INSERT INTO `trabajo_repuesto` VALUES (1,1),(1,2),(1,3),(7,5),(2,6),(3,7),(9,8),(10,9),(8,11),(8,12),(4,13),(15,14),(11,15),(12,15),(13,16),(14,16),(5,17),(6,18),(19,18),(3,21),(10,22);
/*!40000 ALTER TABLE `trabajo_repuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trabajo_turno`
--

LOCK TABLES `trabajo_turno` WRITE;
/*!40000 ALTER TABLE `trabajo_turno` DISABLE KEYS */;
INSERT INTO `trabajo_turno` VALUES (13,'2024-02-27','08:00:00',4),(15,'2024-02-15','08:00:00',3),(15,'2020-06-18','09:00:00',7),(15,'2022-02-28','09:00:00',5),(3,'2023-12-11','09:15:00',2),(8,'2024-07-11','10:00:00',4),(1,'2024-11-11','11:00:00',6),(7,'2024-11-15','16:30:00',2),(3,'2024-02-27','18:00:00',8),(17,'2024-02-27','18:00:00',8);
/*!40000 ALTER TABLE `trabajo_turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
INSERT INTO `turno` VALUES ('2020-06-18','09:00:00',7,165842,'Finalizado','Efectivo',46000),('2022-02-28','09:00:00',5,191041,'Finalizado','Tarjeta Debito',46000),('2023-12-11','09:15:00',2,55698,'Finalizado','Tarjeta Debito',14500),('2024-02-15','08:00:00',3,245654,'Finalizado','Efectivo',46000),('2024-02-27','08:00:00',4,428209,'Finalizado','Efectivo',18000),('2024-02-27','18:00:00',8,91723,'Finalizado','Tarjeta Credito',18500),('2024-07-11','10:00:00',4,435020,'Finalizado','Efectivo',33000),('2024-11-11','11:00:00',6,32649,'Finalizado','Transferencia',19500),('2024-11-15','16:30:00',2,99802,'Finalizado','Tarjeta Debito',24000);
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin','Administrador','Supremo','0000000000','usuariosupremo@mail.com','dni','00000001','Avenida Siempreviva 742','admin'),(2,'vacio','vacio','User','Vacio','1111111111','usuariovacio@mail.com','dni','00000002','P.Sherman Calle Wallaby 42, Sydney','user'),(3,'jdoe','Contra1234','Juan','Doe','1164875623','jdoe@gmail.com','dni','35678452','Calle Falsa 123','admin'),(4,'mlopez','Clave2023','María','López','1123456789','mlopez@hotmail.com','dni','40123456','Av. Libertador 456','user'),(5,'rluna','Passw0rd1','Ricardo','Luna','1145671234','rluna@yahoo.com','dni','27894512','San Martín 789','user'),(6,'agomez','Segura2022','Ana','Gómez','1134567890','agomez@gmail.com','dni','35987415','Belgrano 321','user'),(7,'pcortez','Admin2024','Pablo','Cortez','1156784321','pcortez@outlook.com','dni','40235678','Mitre 145','user'),(8,'jmedina','Medina123','Julieta','Medina','1165432987','jmedina@gmail.com','dni','35678432','Rivadavia 678','user'),(9,'fmartin','Hola2023','Facundo','Martín','1147896543','fmartin@hotmail.com','dni','32987451','Sarmiento 987','user'),(10,'mvargas','Clave1234','Mónica','Vargas','1132987654','mvargas@live.com','dni','36587412','Avellaneda 456','user'),(11,'dlacruz','Cruz2024','Diego','Lacruz','1154321987','dlacruz@gmail.com','dni','31458796','Brown 123','user'),(12,'carivero','Argento2023','Carla','Rivero','1169875432','carivero@yahoo.com','dni','37458291','Espejo 654','user'),(13,'lrodriguez','Rodri987','Luis','Rodríguez','1123654789','lrodriguez@gmail.com','dni','34857612','Pasteur 321','user'),(14,'jtoro','Toro2024','Joaquín','Toro','1167543210','jtoro@hotmail.com','dni','39485672','Laprida 987','user');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (1,'LDD 305','Renault','Clio',2012,'Plata','Motor V1.2',1),(2,'FCU 584','Volkswagen','Gol',2019,'Gris Oscuro',NULL,4),(3,'FGS 747','Renault','Scenic',2005,'Gris Oscuro',NULL,5),(4,'EEU 828','Volkswagen','Gol',2018,'Plata',NULL,6),(5,'EFQ 143','Citroen','Xsara',2007,'Rojo','Motor V1.6',7),(6,'AB 132 FO','Ford','Ka',2022,'Negro',NULL,8),(7,'GKQ 208','Renault','Megane',2014,'Plata','1.5 dci',9),(8,'BOY 741','Ford','Fiesta',2019,'Rojo',NULL,10),(9,'BPP 431','Volkswagen','Polo',2020,'Blanco',NULL,11),(10,'AD 098 CL','Volkswagen','Gol',2011,'Plata',NULL,12),(11,'DHN 582','Peugeot','106',2007,'Bordo','2.0 16v',13);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-13 11:14:29
