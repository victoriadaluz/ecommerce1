-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: barbanegradb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.20-MariaDB

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (0,'mendoza','las heras','unacalle',123,0,666);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `images` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Wahl','wahl.png'),(2,'Jaguar','jaguar.png'),(3,'BabyLiss Pro','babylyss.jpg'),(4,'TeknikStyle','default.png'),(5,'Don Mateo','don-mateo.png'),(6,'GAMMA','gama.jpg'),(7,'LOREAL','loreal.png'),(8,'Omega','omega.png'),(9,'Taiff','taiff.png'),(10,'Teknikpro','teknikpro.png'),(11,'WELLA','wella.png');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Maquinas'),(2,'Equipamientos'),(3,'Accesorios'),(4,'Repuestos');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `brandId` int(11) NOT NULL,
  `subcategoryId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subcategoria` (`subcategoryId`),
  KEY `marcas` (`brandId`),
  CONSTRAINT `marcas` FOREIGN KEY (`brandId`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subcategoria` FOREIGN KEY (`subcategoryId`) REFERENCES `subcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Senior Cordless','La nueva clipper Senior Cordless cuenta con la última tecnologia en baterías de litio de larga duración sin efecto memoria generando una velocidad alta de cuchilla con un torque mayor que recortará incluso el cabello más grueso con facilidad. Las máquinas Wahl, diseñadas con los más altos estándares de calidad, proporcionan la seguridad de una alta performance, sin objeciones.',21500,25,1,1),(2,'Detailer Cordless','Trimmer Profesional de Wahl inalámbrico fabricado en Estados Unidos. Liviana y ergonómica, provee al profesional de balance y control perfectos para un trabajo de la más alta calidad. Son ideales para un trabajo preciso y detalles perfectos. Las máquinas Wahl, diseñadas con los más altos estándares de calidad, proporcionan la seguridad de una alta performance, sin objeciones.',10999,40,1,2),(3,'Afeitadora Finale','La utilización de esta shaver es sencilla, gracias a su uso con o sin cable. La batería de litio de última generación permite 80 minutos de autonomía tras 120 minutos de carga.Además, sus hojas son hipoalergénicas doradas, para que afeitarte no sea sinónimo de irritación. Las máquinas Wahl, diseñadas con los más altos estándares de calidad, proporcionan la seguridad de una alta performance, sin objeciones.',15999,35,1,3),(4,'Tijera Jay2','Entre nuestros accesorios tenemos la Tijera Filo Navaja de Jaguar JAY2 de 6 pulgadas se amolda bien a la mano. Ideal para un trabajo cómodo, relajado por su forma ergonómica. Apropiada para todas las técnicas de corte y de capear, filos afilado, suave acción de corte.',2500,50,2,6),(5,'Trimmer+ Clipper Rosé','RoseFX de babyliss es una maquina de corte profesional inalámbrica, equipada con un motor diseñado por Ferrari. Una herramienta perfecta para cortar todas las texturas del cabello con potencia, velocidad y precisión.El combo incluye clipper y trimmer',35000,30,3,1),(6,'Sillon Chester Negro','Exclusivo sillón de barbería estilo retro con tapicería Simil Chesterfield marca TeknikStyle. Éste equipamiento tiene generosas dimensiones mancomunadas en una estructura metálica cromada con amplios apoya brazos que aportan mayor comodidad. Reclinable en su totalidad, es ideal para que el barbero trabaje a una altura óptima permitiendo que el cliente prácticamente quede acostado sobre el sillón. Apoya pies reclinable con superficie flotante tapizada para que el cliente descanse sus pies una vez acostado. Base circular metálica de gran tamaño que aporta solidez y firmeza a todo el sillón. Apoya cabezas tapizado y regulable en altura',110000,30,4,4),(7,'Spray Lubricante','Spray lubricante y desinfectante en Aerosol BabyLiss. Excelente para el mantenimiento de los repuestos. Desinfecta, lubrica, enfría, limpia y es anticorrosivo. Elimina Virus, hongos y bacterias. Brinda una lubricación suave de las cuchillas que reduce la fricción, suaviza los cortes y alaga la vida útil de las máquinas.',3000,40,3,9),(8,'Cabezal Shaver Finale','Repuesto de cabezal para máquina Shaver Finale de Wahl diseñado para obtener el afeitado más cercano posible sin ser doloroso o irritante, el paquete de reemplazo incluye lámina de oro hipoalergénica que evita los golpes y el conjunto de la barra de corte para una afeitadora como nueva. Compatible solo con la finale 5 estrellas',4999,15,1,10),(9,'Lavacabeza Premier','Dentro de nuestros equipamientos tenemos el Lavacabeza Premier de Teknikstyle que tiene un diseño ergonómico. Tapizado de Simil Cuero. Bacha de Cerámica. Terminaciones bordadas en hilo blanco que aportan elegancia.',125000,25,4,5),(10,'Secador Volare','La experiencia de BaByliss®PRO y la excelencia de FERRARI han desarrollado juntas una herramienta de diseño exclusivo con excepcionales prestaciones. Accesorio escencial en cualquier peluquería. El secador VOLARE esta especialmente construido para obtener un flujo de aire máximo con un mínimo peso y vibración, para un óptimo y rápido secado y asegurar un estilismo duradero.',25999,35,3,8),(11,'Set x 6 Peines','Kit de Peines Profesionales Nano Titanium BaByliss PRO. Accesorios hechos de carbono. Resistentes al calor. Evitan el frizz.',1999,50,3,7),(12,'Combo Sillón + Lavacabeza','Dentro de nuestros equipamientos, se destaca este combo de Tekniktyle: 1 Lavacabezas Black FG TeknikStyle. Posee una Bacha de Fibre Glass resistente y duradera de excelente calidad.  +  1 Sillón Hidráulico Peluqueria JPN. Base cromada regulable en altura. Líneas puras y elegantes de diseño ergonómico en apoya brazos cromados. Apoya pies removible.',25000,40,4,5),(13,'Patillera USB K42','Trimmer profesional ideal para detalles, terminaciones y dibujos. Esta patillera de teknikstyle se carga por USB. Tiene un motor de 6800 rpm y una potencia de 6,5w. El tiempo de carga de esta máquina es de 2 hs y de uso 4 hs',5990,NULL,4,2),(14,'Aceite lubricante','Aceite Wahl Oil Para el mantenimiento y lubricación de cortadoras De Pelo. Recubre las cuchillas con una película ultrafina que evita la corrosión de los repuestos. Para uso en todo tipo de cuchillas. Presentación:118 ml',699,NULL,1,9),(15,'Magic Clip Cordless','Liviana y confortable, posee cuchillas intercaladas para un corte más preciso y suave. Esta máquina Magic es una clipper profesional sin cable de Wahl. Liviana y poderosa, fácil de manipular. Poderoso motor de 5.500 rpm',24999,NULL,1,1),(16,'Sillón Senior Marrón','La impronta de un clásico reflejada en todos sus detalles. Teknikstyle nos permite, dentro de nuestros equipamientos, ofrecerles este exclusivo sillón de barbería estilo retro con tapicería Simil Chesterfield. Generosas dimensiones mancomunadas en una estructura metálica cromada con amplios apoya brazos que aportan mayor comodidad. Reclinable en su totalidad, es ideal para que el barbero trabaje a una altura óptima permitiendo que el cliente prácticamente quede acostado sobre el sillón.',79990,NULL,4,4),(17,'Tijera Safari','Tijera de corte profesional de 5,5 pulgadas de Jaguar. Es una accesorio con elegancia y alta calidad. Artesanía de precisión combinada con el uso de máquinas y tecnologías de vanguardia. Cada par de tijeras se comprueba y controla individualmente antes de la entrega. Revestimiento de alta tecnología, innovadora, resistente y prestigioso para un diseño individual e inconfundible de las tijeras. Protección contra la alergia al níquel. Diseño Offset para una posición ergonómica de los dedos y para un trabajo relajado.',5000,NULL,2,6),(18,'Super Taper Profesional','Maquina Cortadora De Pelo Wahl Super Taper Profesional. Motor vibratorio profesional V5000 para durabilidad. Ideal para grandes exigencias. Trabaja con cable, ideal para uso continuo. Gran potencia, alta precisión con cuchillas profesionales. Sólo utilizando el pulgar se gradúa el nivel o la textura del corte.',7999,NULL,1,1),(19,'Trimmer Beret profesional','Para contornos exactos: Chrom Blade, el juego de cuchillas de precisión cromado que corta con confianza e increíblemente cerca de la piel. Para una comodidad excepcional: Ultra-fina, ergonómica, ligera y silenciosa. Con acabado cromado pulido. Tiempo de carga 60 min. LED indicador de control de carga. Baterías de litio sin efecto memoria. Práctico soporte de carga.',7599,NULL,1,2),(20,'Secador Super Dry','El Secador de pelo WAHL cuenta con tecnología turmalina y flujo de iones integrados para reducir la electricidad estática del cabello. Además posee flujo de aire frío instantáneo más 3 posiciones de temperatura y 2 velocidades. A su vez, tiene mango ergonómico para estabilidad y control. Motor CA profesional de peso reducido con amortiguación de ruidos. También cuenta con filtro extraible de acero para una fácil limpieza, chorro de aire frío con flujo de aire frío instantáneo y 3 posiciones de temperatura y dos velocidades. Con un filtro extraíble de acero para una fácil limpieza. Es un accesorio infaltable para la barberia.',5700,NULL,1,8),(21,'Afeitadora Fading & Shaving','Shaver para barbas, Fading & Shaving de Teknikstyle, para cargar vía USB. Exclusiva máquina para rapar y afeitar. Liviana y maniobrable, con rodillos de alto desempeño. Exclusivo recortador de patillas. Rapados suaves y parejos.',6499,NULL,4,3),(22,'Cabezal + Cuchillas Teknikpro','Repuesto de cabezal + 2 Cuchillas Para Afeitadora Fading & Shaving de Teknikstyle',1999,NULL,4,10);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimage`
--

DROP TABLE IF EXISTS `productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `productId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productimage_FK` (`productId`),
  CONSTRAINT `productimage_FK` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimage`
--

LOCK TABLES `productimage` WRITE;
/*!40000 ALTER TABLE `productimage` DISABLE KEYS */;
INSERT INTO `productimage` VALUES (1,'maquina2-1.jpeg',1),(2,'trimmer1-1.jpeg',2),(3,'shaver1-1.jpeg',3),(4,'tijeraJay2.jpeg',4),(5,'combo1-1.jpeg',5),(6,'sillon1-1.jpeg',6),(7,'lubricanteBL.jpeg',7),(8,'repuesto-5.jpeg',8),(9,'lavacabeza4-1.jpeg',9),(10,'secador1.jpeg',10),(11,'peines1-2.jpeg',11),(12,'supercombo1.jpeg',12),(13,'trimmer4-1.jpeg',13),(14,'lubricanteW.jpeg',14),(15,'magic1.jpeg',15),(16,'sillon2-1.jpeg',16),(17,'tij_safari_5,5.jpeg',17),(18,'maquina4-1.jpeg',18),(19,'beret.jpeg',19),(20,'secador2.jpeg',20),(21,'shaver2.jpeg',21),(22,'repuesto2.jpeg',22),(23,'senior2.jpeg',1),(24,'senior3.jpeg',1),(25,'detailer2.png',2),(26,'detailer3.jpeg',2),(27,'finale2.jpeg',3),(28,'finale3.jpeg',3),(29,'jay2-2.jpeg',4),(30,'jay2-3.jpeg',4),(31,'rose2.jpeg',5),(32,'rose3.jpeg',5),(33,'chester2.jpeg',6),(34,'chester3.jpeg',6),(35,'spray2.jpeg',7),(36,'spray3.jpeg',7),(37,'cabezalFinale2.jpeg',8),(38,'cabezalFinale3.jpeg',8),(39,'premier2.jpeg',9),(40,'premier3.jpeg',9),(41,'volare2.jpeg',10),(42,'volare3.jpeg',10),(43,'setPeines2.jpeg',11),(44,'setPeines3.jpeg',11),(45,'comboSL2.png',12),(46,'comboSL3.jpeg',12),(47,'k42-2.jpeg',13),(48,'k42-3.png',13),(49,'aceite2.jpeg',14),(50,'aceite3.jpeg',14),(51,'magic2.png',15),(52,'magic3.jpeg',15),(53,'sMarron2.jpeg',16),(54,'sMarron3.jpeg',16),(55,'safari2.jpeg',17),(56,'safari3.jpeg',17),(57,'superT2.jpeg',18),(58,'superT3.jpeg',18),(59,'beret2.jpeg',19),(60,'beret3.jpeg',19),(61,'dry2.png',20),(62,'dry3.jpeg',20),(63,'fys2.jpeg',21),(64,'fys3.jpeg',21),(65,'cabfys2.jpeg',22),(66,'cabfys3.jpeg',22);
/*!40000 ALTER TABLE `productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria` (`categoryId`),
  CONSTRAINT `categoria` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,'Clippers',1),(2,'Trimmers',1),(3,'Shavers',1),(4,'Sillones',2),(5,'Lavacabezas',2),(6,'Tijeras',3),(7,'Peines',3),(8,'Secadores',3),(9,'Mantenimiento',4),(10,'Cabezales',4);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `total` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(70) CHARACTER SET utf8mb4 NOT NULL,
  `firstName` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `lastName` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `rol` int(2) NOT NULL DEFAULT 0,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `postalCode` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=ujis;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10,'gonza@gonza.com','$2a$10$r2KzJ/PiS5hqqsnmOeXay.lKhMinCRyliSEFhnbTpP7MztPpk3dJ6',NULL,NULL,NULL,'default-user.png',1,NULL,NULL,NULL,NULL,NULL),(11,'barbanegra@barbanegra.com','$2a$10$picEle/Aw.2sDw3e2lqaIeUf77d8wClxLR8fkn8og6DjlQduUC/lW',NULL,NULL,NULL,'default-user.png',1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'barbanegradb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-09  9:29:51
