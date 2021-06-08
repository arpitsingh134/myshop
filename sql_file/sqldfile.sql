/*
SQLyog Community v13.1.4  (64 bit)
MySQL - 8.0.24 : Database - myshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `myshop`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `categoryID` int NOT NULL AUTO_INCREMENT,
  `categoryDescription` varchar(1500) DEFAULT NULL,
  `categoryTitle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `category` */

insert  into `category`(`categoryID`,`categoryDescription`,`categoryTitle`) values 
(1,'This category contains product related to fashion ','Fashion'),
(2,'This is category contains data related computers','Computers'),
(3,'This contain mobile data ','Mobile Phones'),
(4,'this contains all type of cloths','Cloths'),
(5,'Home & Kitchen','Home & Kitchen'),
(6,'Jewellery','Jewellery'),
(7,'Industrial & Scientific','Industrial & Scientific'),
(8,'this contain all type of Electronics data','Electronics');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pPid` int NOT NULL AUTO_INCREMENT,
  `pDescription` varchar(3000) DEFAULT NULL,
  `pDiscount` int NOT NULL,
  `pName` varchar(255) DEFAULT NULL,
  `pPhoto` varchar(255) DEFAULT NULL,
  `pPrice` int NOT NULL,
  `pQuanity` int NOT NULL,
  `catID` int DEFAULT NULL,
  PRIMARY KEY (`pPid`),
  KEY `FKsgwsqgtq8kkpy5eswsyx9vuvj` (`catID`),
  CONSTRAINT `FKsgwsqgtq8kkpy5eswsyx9vuvj` FOREIGN KEY (`catID`) REFERENCES `category` (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product` */

insert  into `product`(`pPid`,`pDescription`,`pDiscount`,`pName`,`pPhoto`,`pPrice`,`pQuanity`,`catID`) values 
(1,'\r\nNVIDIA GeForce GTX 1650\r\n15.6 inch Full HD LED Backlit Display\r\nLight Laptop without Optical Disk Drive\r\nPre-installed Genuine Windows 10 OS',10,'HP Pavilion Gaming Ryzen 5 Quad Core 3550H','HPPavilion.jpeg',49990,100,2),
(2,'16 GB/1 TB SSD/Windows 10 Home/2 GB Graphics) UX482EG-KA711TS Thin and Light Laptop  (14 inch, Celestial Blue, 1.62 kg, With MS Office)',20,'ASUS ZenBook Duo 14 (2021) Core i7 11th Gen','ASUSZenBook.jpeg',148000,1000,2),
(3,'8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce GTX 1650 Ti) A715-75G-51H8 Gaming Laptop  (15.6 inch, Charcoal Black, 2.15 kg',10,'acer Aspire 7 Core i5 9th Gen','acerAprire.jpeg',53000,100,2),
(4,'\r\nNVIDIA GeForce GTX 1050\r\n15.6 inches Full HD IPS Anti-Glare Display (250 nits Brightness)\r\nLight Laptop without Optical Disk Drive\r\nPre-installed Genuine Windows 10 OS',10,'Lenovo Core i5 9th Gen','lenovooriginal.jpeg',46000,100,2),
(5,'\r\n3 GB RAM | 32 GB ROM | Expandable Upto 256 GB\r\n16.54 cm (6.51 inch) HD+ Display\r\n13MP + 2MP | 8MP Front Camera\r\n6000 mAh Battery\r\nMediaTek Helio G85 Processor',20,'realme Narzo 30A ','narzo-30a.jpeg',10000,100,3),
(6,'\r\n3 GB RAM | 32 GB ROM | Expandable Upto 256 GB\r\n16.51 cm (6.5 inch) HD+ Display\r\n13MP + 2MP + 2MP | 8MP Front Camera\r\n5000 mAh Lithium-ion Polymer Battery\r\nQualcomm Snapdragon 460 Processor\r\n90 Hz Punch Hole Display\r\n18W Fast Charging',30,'OPPO A33 (Mint Cream, 32 GB)  (3 GB RAM)','oppo-a33.jpeg',12990,100,3),
(7,'\r\nUseful for home usage, Bio Wash, sports wear, Pure Cotton Clothes, Best in class comfort, Breathable design, Gym wear',73,'Solid Men Round Neck Blue, Yellow T-Shirt  (Pack of 2)','m-465-466.jpeg',2598,1000,4),
(8,'Style Code\r\nK_18\r\nPattern\r\nPrinted, Floral Print\r\nPack of\r\n1\r\nSecondary Color\r\nPink\r\nOccasion\r\nWedding & Festive, Party & Festive, Wedding, Casual\r\nDecorative Material\r\nMirror\r\nFabric Care\r\nDo not Iron on Print/Embroidery/Embellishment, Do not Bleach, Dry Clean Only, Do not Iron',80,'Printed, Floral Print Fashion Lycra Blend Saree  (Maroon, Black)','free-hitesh2series-fumvel-unstitched-original-imafwypg4fwky3a7.jpeg',2500,1000,1),
(9,'Supported Apps: Netflix|Prime Video|Disney+Hotstar|Youtube',10,'realme 80 cm (32 inch) HD Ready LED Smart Android TV  ','realme-tv-32-original-imafrz79pweqeafh.jpeg',14990,100,8),
(10,'TV Voltage Stabilizer for 82 cm (32) TV+ Set topbox (Working Range:90-290V; 1.3 A)',20,'V-Guard Mini Crystal Supreme TV Voltage Stabilizer for 82 cm','mini-crystal-supreme.jpeg',1500,100,8),
(11,'253 L : Good for families of 3-5 members',33,'SAMSUNG 253 L Frost Free Double Door 3 Star Refrigerator  (Elegant Inox, RT28A3453S8/HL)','rt28a3453s8-hl-3-2021-samsung-original-imafzhedepq6z5r8.jpeg',28000,100,8),
(12,'AE-17 Brass Chain',33,'AE-17 Brass Chain','ae-17-chain-achyutam-enterprise-original-imafp593yzhmqqyy.jpeg',500,1000,6);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `userAddress` varchar(1500) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  `user_phone` varchar(12) DEFAULT NULL,
  `user_pic` varchar(50) DEFAULT NULL,
  `userType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'normal',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`user_id`,`userAddress`,`user_email`,`user_name`,`user_password`,`user_phone`,`user_pic`,`userType`) values 
(1,'441 g 191 gaushala road balaganj\r\nLucknow','arpitsingh134@gmail.com','ARPIT SINGH','amansingh','8858494096','default.jpg','admin'),
(2,'441 g 191 gaushala road balaganj\r\nLucknow','sakshamarpit134@gmail.com','saksham singh','arpit','9721004101','default.jpg','normal'),
(3,'441 g 191 gaushala road balaganj\r\nLucknow','arpitsingh134@gmail.com','ARPIT SINGH','sadfjlsk','8858494096','default.jpg','normal'),
(4,'441 g 191 gaushala road balaganj\r\nLucknow','arpitsingh134@gmail.com','ARPIT SINGH','asdf','8858494096','default.jpg','normal'),
(5,'441 g191 gaushala road balaganj\r\nLucknow','sakshamarpit134@gmail.com','Arpit Singh Singh','dsdfs','9721004101','default.jpg','normal');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
