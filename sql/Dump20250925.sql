-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: foodapp
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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menuId` int NOT NULL AUTO_INCREMENT,
  `restaurantId` int NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `isAvailable` tinyint(1) DEFAULT NULL,
  `ratings` decimal(10,1) DEFAULT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menuId`),
  KEY `restaurantId` (`restaurantId`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantid`)
) ENGINE=InnoDB AUTO_INCREMENT=3126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (3000,1001,'Nellore Vari Mutton Fry','A spicy and traditional Nellore-style mutton fry.',349,1,4.5,'images/nellore_vari_mutton_fry.jpg'),(3001,1001,'Chicken Majestic Boneless','Juicy boneless chicken pieces with a rich, aromatic flavor.',269,1,4.3,'images/chicken_majestic_boneless.jpg'),(3002,1001,'Kadai Paneer','Cubes of paneer in a spiced tomato-based gravy with bell peppers.',230,1,4.1,'images/kadai_paneer.jpg'),(3003,1001,'Avakaya Chicken Biryani','Hyderabadi biryani with the unique spicy flavor of mango pickle.',299,1,4.7,'images/avakaya_chicken_biryani.jpg'),(3004,1001,'Curd Rice','A simple and cooling rice dish mixed with yogurt.',85,1,4.0,'images/curd_rice.jpg'),(3005,1001,'Chicken Fried Rice','Classic fried rice with scrambled egg and chicken pieces.',198,1,4.5,'images/chicken_fried_rice.jpg'),(3006,1001,'Mushroom Biryani','Fragrant rice layered with spiced mushrooms.',220,1,4.2,'images/mushroom_biryani.jpg'),(3007,1001,'Nellore Vari Chapala Pulusu','Traditional Nellore fish curry, tangy and spicy.',229,1,4.6,'images/nellore_vari_chapala_pulusu.jpg'),(3008,1001,'Paneer Butter Masala','Soft paneer cubes in a rich, creamy, and mildly spiced tomato-based curry.',229,1,4.8,'images/paneer_butter_masala.jpg'),(3009,1002,'Paneer Manchurian Chilli','Crispy paneer tossed in a spicy and tangy sauce.',180,1,4.1,'images/paneer_manchurian_chilli.jpg'),(3010,1002,'Honey Chilli Potato','Crispy fried potatoes coated in a sweet and spicy glaze.',160,1,4.3,'images/honey_chilli_potato.jpg'),(3011,1002,'Chicken Biryani','Aromatic rice dish with tender chicken, perfect for a meal.',290,1,4.5,'images/chicken_biryani.jpg'),(3012,1002,'Mushroom Chilli','Deliciously spicy and tangy mushrooms with rich flavors.',160,1,4.0,'images/mushroom_chilli.jpg'),(3013,1002,'Paneer Tikka','Marinated paneer cubes grilled to perfection.',210,1,4.4,'images/paneer_tikka.jpg'),(3014,1002,'Manchow Soup','A spicy and sour soup with vegetables and crispy fried noodles.',140,1,4.2,'images/manchow_soup.jpg'),(3015,1002,'Chilli Garlic Potato','Spicy and garlicky potato fries tossed in a tangy sauce.',160,1,4.3,'images/chilli_garlic_potato.jpg'),(3016,1002,'Fish Butter Naan','A classic Indian bread with a fish-based topping.',110,1,4.6,'images/fish_butter_naan.jpg'),(3017,1002,'Crispy Chicken','Deep-fried chicken pieces with a crispy outer layer.',250,1,4.7,'images/crispy_chicken.jpg'),(3018,1003,'Chicken 65','A popular deep-fried spicy chicken appetizer.',350,1,4.2,'images/chicken_65.jpg'),(3019,1003,'Dragon Chicken','Spicy, Indo-Chinese style chicken with a distinct flavor.',375,1,4.0,'images/dragon_chicken.jpg'),(3020,1003,'Fish Tawa Fry','Marinated fish pieces pan-fried with spices.',430,1,4.5,'images/fish_tawa_fry.jpg'),(3021,1003,'Tandoori Roti','Whole wheat flatbread cooked in a tandoor.',65,1,4.1,'images/tandoori_roti.jpg'),(3022,1003,'Chicken Manchow Soup','A spicy and flavorful Chinese soup with chicken.',210,1,4.6,'images/chicken_manchow_soup.jpg'),(3023,1003,'Palak Paneer','Paneer cubes in a creamy and mildly spiced spinach gravy.',350,1,4.3,'images/palak_paneer.jpg'),(3024,1003,'Chicken Lollipop','Deep-fried chicken winglets shaped like lollipops.',365,1,4.3,'images/chicken_lollipop.jpg'),(3025,1003,'Dal Tadka','Lentils tempered with spices, herbs, and oil.',275,1,4.4,'images/dal_tadka.jpg'),(3026,1003,'Veg Manchurian','Fried vegetable balls in a spicy and tangy Manchurian sauce.',310,1,4.3,'images/veg_manchurian.jpg'),(3027,1004,'Natukodi Biryani','Biryani made with country chicken, known for its spicy taste.',499,1,4.7,'images/natukodi_biryani.jpg'),(3028,1004,'Special Prawns Biryani','Aromatic biryani with succulent prawns.',450,1,4.6,'images/special_prawns_biryani.jpg'),(3029,1004,'Chicken Tandoori Biryani','A flavorful biryani with tandoori chicken pieces.',575,1,4.8,'images/chicken_tandoori_biryani.jpg'),(3030,1004,'Mughlai Chicken Biryani','Traditional biryani with tender chicken and aromatic spices.',550,1,4.5,'images/mughlai_chicken_biryani.jpg'),(3031,1004,'Veg Dum Biryani','Fragrant rice cooked with mixed vegetables in a sealed pot.',349,1,4.0,'images/veg_dum_biryani.jpg'),(3032,1004,'Kaju Chicken Biryani','A savory biryani with tender chicken and crunchy cashews.',439,1,4.9,'images/kaju_chicken_biryani.jpg'),(3033,1004,'Jeelakarra Rice','Fluffy rice tempered with cumin seeds and spices.',140,1,4.2,'images/jeelakarra_rice.jpg'),(3034,1004,'Egg Fried Rice','Fried rice with scrambled egg and vegetables.',190,1,4.1,'images/egg_fried_rice.jpg'),(3035,1004,'Shahi Paneer Biryani','A rich and fragrant biryani with homemade paneer.',399,1,4.3,'images/shahi_paneer_biryani.jpg'),(3036,1005,'Nellore Chepala Pulusu','A spicy and tangy fish curry, a local Nellore specialty.',169,1,4.8,'images/nellore_chepala_pulusu.jpg'),(3037,1005,'Special Boneless Chicken Biryani','A flavorful biryani with tender boneless chicken pieces.',339,1,4.5,'images/special_boneless_chicken_biryani.jpg'),(3038,1005,'Boneless Chicken Fry','Andhra style boneless chicken fry with rich spices.',249,1,4.6,'images/boneless_chicken_fry.jpg'),(3039,1005,'Egg Biryani','A delectable rice dish with hard-boiled eggs and spices.',239,1,4.2,'images/egg_biryani.jpg'),(3040,1005,'Ragi Sangati with Boneless Chicken Fry','A wholesome dish of ragi served with spicy boneless chicken fry.',239,1,4.3,'images/ragi_sangati.jpg'),(3041,1005,'Fish Fry','Marinated fish pieces deep-fried until crispy.',189,1,4.7,'images/fish_fry.jpg'),(3042,1005,'Chicken Noodles','Stir-fried noodles with chicken and vegetables.',230,1,4.1,'images/chicken_noodles.jpg'),(3043,1005,'Ghee Pappucharu Annam','Rice served with a tangy and flavorful lentil soup.',200,1,4.0,'images/ghee_pappucharu_annam.jpg'),(3044,1005,'Chicken Fried Rice','Classic fried rice with chicken pieces.',230,1,4.4,'images/chicken_fried_rice.jpg'),(3045,1006,'Nellore Karam Dosa','A crispy dosa with a flavorful blend of traditional spices.',80,1,4.6,'images/nellore_karam_dosa.jpg'),(3046,1006,'Ghee Masala Dosa','Crispy dosa cooked in ghee with a spiced potato filling.',95,1,4.9,'images/ghee_masala_dosa.jpg'),(3047,1006,'Plain Dosa','Irresistibly crispy dosa served with chutney and sambar.',60,1,4.4,'images/plain_dosa.jpg'),(3048,1006,'Idli','Soft and fluffy steamed rice cakes served with sambar and chutney.',50,1,4.5,'images/idli.jpg'),(3049,1006,'Onion Masala Dosa','Crispy dosa with a potato masala filling and topped with onions.',95,1,4.6,'images/onion_masala_dosa.jpg'),(3050,1006,'Vada','Crispy, deep-fried lentil fritters served with chutney and sambar.',50,1,4.3,'images/vada.jpg'),(3051,1006,'Ghee Pappula Podi Idli','Steamed idlis tossed with flavorful podi and ghee.',110,1,4.5,'images/ghee_pappula_podi_idli.jpg'),(3052,1006,'Nellore Bonda','Deep-fried spicy fritters, a popular snack.',40,1,4.1,'images/nellore_bonda.jpg'),(3053,1006,'Single Egg Dosa','A dosa with a single egg spread on top.',90,1,4.2,'images/single_egg_dosa.jpg'),(3054,1007,'Hyderabadi Chicken Dum Biryani','Fragrant rice and succulent chicken cooked in the classic dum style.',290,1,4.7,'images/hyderabadi_chicken_dum_biryani.jpg'),(3055,1007,'Loose Prawns','Batter-fried prawns tossed in local spices.',370,1,4.4,'images/loose_prawns.jpg'),(3056,1007,'Chicken Schezwan Noodles','Spicy stir-fried noodles with chicken and Schezwan sauce.',270,1,4.5,'images/chicken_schezwan_noodles.jpg'),(3057,1007,'Nellore Fish Curry','A tangy and spicy fish curry from the Nellore region.',275,1,4.6,'images/nellore_fish_curry.jpg'),(3058,1007,'Mutton Rogan Josh','A classic North Indian mutton curry slow-cooked with spices.',350,1,4.8,'images/mutton_rogan_josh.jpg'),(3059,1007,'Veg Hot And Sour Soup','A popular Chinese soup that is spicy and sour.',120,1,4.1,'images/veg_hot_and_sour_soup.jpg'),(3060,1007,'Chilli Fish Dry','Crispy fish pieces tossed in a spicy chili sauce.',300,1,4.3,'images/chilli_fish_dry.jpg'),(3061,1007,'Gulab Jamun','Soft, fried milk solids soaked in a sweet, rose-scented syrup.',100,1,4.9,'images/gulab_jamun.jpg'),(3062,1007,'Chicken Fry Piece Biryani','Biryani with flavorful fried chicken pieces.',290,1,4.7,'images/chicken_fry_piece_biryani.jpg'),(3063,1008,'Haveli Tandoori Platter','A selection of tandoori grilled delicacies.',1019,1,4.5,'images/haveli_tandoori_platter.jpg'),(3064,1008,'Paneer Tikka Butter Masala','Soft paneer tikka in a creamy, buttery tomato gravy.',519,1,4.7,'images/paneer_tikka_butter_masala.jpg'),(3065,1008,'Dal Makhani','Creamy lentils slow-cooked with butter and spices.',519,1,4.6,'images/dal_makhani.jpg'),(3066,1008,'Veg Biryani','Aromatic rice dish with mixed vegetables and spices.',439,1,4.4,'images/veg_biryani.jpg'),(3067,1008,'Hara Bhara Kebab','A popular kebab made from spinach, peas, and potatoes.',529,1,4.3,'images/hara_bhara_kebab.jpg'),(3068,1008,'Stuffed Mushroom Tikka','Marinated mushrooms stuffed with a flavorful mix and grilled.',569,1,4.8,'images/stuffed_mushroom_tikka.jpg'),(3069,1008,'Achari Paneer Tikka','Paneer tikka with a tangy and spicy pickle flavor.',499,1,4.1,'images/achari_paneer_tikka.jpg'),(3070,1008,'Matar Pulao','Fragrant rice cooked with green peas and mild spices.',439,1,4.9,'images/matar_pulao.jpg'),(3071,1008,'Fried Rice','Simple stir-fried rice with vegetables and a hint of sauce.',459,1,4.3,'images/fried_rice.jpg'),(3072,1009,'Chicken 65','Deep-fried chicken pieces tossed with yogurt and spices.',315,1,4.3,'images/chicken_65.jpg'),(3073,1009,'Chilli Chicken','Batter-fried chicken tossed with chili peppers, onions, and soy sauce.',325,1,4.5,'images/chilli_chicken.jpg'),(3074,1009,'Loose Prawns','Fresh prawns batter-fried and tossed in local spices.',375,1,4.4,'images/loose_prawns.jpg'),(3075,1009,'Crispy Corn','Sweet corn kernels deep-fried until crispy.',275,1,4.3,'images/crispy_corn.jpg'),(3076,1009,'Dragon Gobi','Cauliflower florets in a spicy and tangy Indo-Chinese sauce.',285,1,4.3,'images/dragon_gobi.jpg'),(3077,1009,'Mushroom Manchuria','Crispy mushrooms tossed in a spicy and aromatic sauce.',285,1,4.3,'images/mushroom_manchuria.jpg'),(3078,1009,'Chilli Paneer','Cottage cheese stir-fried with chili peppers and onions.',295,1,4.1,'images/chilli_paneer.jpg'),(3079,1009,'Schezwan Chicken','Diced chicken in a fiery and spicy Schezwan sauce.',315,1,4.7,'images/schezwan_chicken.jpg'),(3080,1009,'Panko Fried Chicken','Chicken pieces coated in panko breadcrumbs and deep-fried.',325,1,3.8,'images/panko_fried_chicken.jpg'),(3081,1010,'Chicken Tikka Kebab Mandi','Arabian rice dish with flavorful chicken tikka kebabs.',269,1,4.5,'images/chicken_tikka_kebab_mandi.jpg'),(3082,1010,'Prawns Fried Mandi','A delicious Arabian rice dish with fried prawns.',349,1,4.6,'images/prawns_fried_mandi.jpg'),(3083,1010,'Chicken Afghani Mandi','Smoky and tender chicken mandi with Afghani flavors.',289,1,4.3,'images/chicken_afghani_mandi.jpg'),(3084,1010,'Mutton Ghee Roast Mandi','Mandi rice served with rich and spicy mutton ghee roast.',299,1,4.7,'images/mutton_ghee_roast_mandi.jpg'),(3085,1010,'Chicken Dum Mandi','Classic chicken mandi cooked in a sealed pot with fragrant spices.',289,1,4.4,'images/chicken_dum_mandi.jpg'),(3086,1010,'Mutton Shoulder Mandi','Mandi served with a succulent piece of mutton shoulder.',349,1,4.8,'images/mutton_shoulder_mandi.jpg'),(3087,1010,'Dawat Special Saabith Murgh Mandi','A chef-special Mandi with a whole grilled chicken.',999,1,4.9,'images/dawat_special_saabith_murgh_mandi.jpg'),(3088,1010,'Chicken Wings Mandi','Mandi rice served with flavorful chicken wings.',249,1,4.1,'images/chicken_wings_mandi.jpg'),(3089,1010,'Prawns Biryani','A fragrant rice dish with spicy, juicy prawns.',420,1,4.6,'images/prawns_biryani.jpg'),(3090,1011,'Achari Paneer Kebab','Paneer marinated in a spicy pickle masala and grilled.',160,1,4.5,'images/achari_paneer_kebab.jpg'),(3091,1011,'Veg Hakka Noodles','Classic Indo-Chinese noodles with a mix of vegetables.',150,1,4.3,'images/veg_hakka_noodles.jpg'),(3092,1011,'Dal Tadka','Lentils tempered with spices and herbs.',120,1,4.4,'images/dal_tadka.jpg'),(3093,1011,'Masala Dosa','A thin, crispy dosa with a spiced potato filling.',80,1,4.6,'images/masala_dosa.jpg'),(3094,1011,'Palak Paneer','Paneer cubes in a creamy spinach gravy.',150,1,4.7,'images/palak_paneer.jpg'),(3095,1011,'Mushroom Biryani','Fragrant rice cooked with spiced mushrooms.',170,1,4.2,'images/mushroom_biryani.jpg'),(3096,1011,'Veg Fried Rice','A simple yet flavorful fried rice with mixed vegetables.',130,1,4.1,'images/veg_fried_rice.jpg'),(3097,1011,'Paneer Tikka Kebab','Marinated paneer grilled to a smoky perfection.',160,1,4.8,'images/paneer_tikka_kebab.jpg'),(3098,1011,'Gulab Jamun','Soft fried dough balls soaked in sweet syrup.',60,1,4.9,'images/gulab_jamun.jpg'),(3099,1012,'Chicken 65','Spicy and tangy deep-fried chicken appetizer.',270,1,4.1,'images/chicken_65.jpg'),(3100,1012,'Pepper Chicken','Chicken cooked with a generous amount of crushed black pepper.',270,1,4.9,'images/pepper_chicken.jpg'),(3101,1012,'Chicken Biryani','A flavorful and aromatic chicken biryani.',339,1,4.5,'images/chicken_biryani.jpg'),(3102,1012,'Loose Prawns','Tender prawns fried and seasoned with spices.',300,1,4.3,'images/loose_prawns.jpg'),(3103,1012,'Paneer Tikka','Marinated paneer grilled in a tandoor.',290,1,4.6,'images/paneer_tikka.jpg'),(3104,1012,'Tandoori Chicken Half','Half a chicken marinated and grilled in a tandoor.',270,1,4.4,'images/tandoori_chicken_half.jpg'),(3105,1012,'Crispy Veg','A crunchy and aromatic vegetable starter.',180,1,4.0,'images/crispy_veg.jpg'),(3106,1012,'Mutton Biryani','A rich and aromatic biryani with tender mutton pieces.',450,1,4.7,'images/mutton_biryani.jpg'),(3107,1012,'Egg Biryani','A simple and flavorful biryani with boiled eggs.',179,1,4.2,'images/egg_biryani.jpg'),(3108,1013,'Ghee Pongal','A traditional South Indian rice and lentil dish cooked with ghee.',90,1,4.5,'images/ghee_pongal.jpg'),(3109,1013,'Chole Poori','Fluffy deep-fried pooris served with a spicy chickpea curry.',120,1,4.6,'images/chole_poori.jpg'),(3110,1013,'Mini Tiffin','A combo of small portions of idli, vada, pongal and a sweet.',150,1,4.8,'images/mini_tiffin.jpg'),(3111,1013,'Plain Dosa','A classic dosa served with sambar and chutneys.',60,1,4.4,'images/plain_dosa.jpg'),(3112,1013,'Ghee Roast Dosa','A crispy dosa roasted with a generous amount of ghee.',85,1,4.9,'images/ghee_roast_dosa.jpg'),(3113,1013,'Curd Vada','Soft lentil fritters soaked in seasoned yogurt.',75,1,4.7,'images/curd_vada.jpg'),(3114,1013,'Rava Kitchadi','A savory dish made from semolina and mixed vegetables.',80,1,4.3,'images/rava_kitchadi.jpg'),(3115,1013,'Filter Coffee','A traditional South Indian hot beverage.',40,1,5.0,'images/filter_coffee.jpg'),(3116,1013,'Sweet Corn Veg Soup','A creamy and classic soup with sweet corn kernels and vegetables.',70,1,4.2,'images/sweet_corn_veg_soup.jpg'),(3117,1040,'Chicken BBQ Mandi','Smoky barbecue chicken served with aromatic mandi rice.',250,1,4.7,'images/chicken_bbq_mandi.jpg'),(3118,1040,'Mutton Mandi','Traditional mandi with tender mutton pieces.',350,1,4.8,'images/mutton_mandi.jpg'),(3119,1040,'Kunafa','A traditional Arabian sweet pastry dessert with cheese and syrup.',300,1,4.9,'images/kunafa.jpg'),(3120,1040,'Chicken Fried Rice','A simple stir-fried rice with chicken.',200,1,4.1,'images/chicken_fried_rice.jpg'),(3121,1040,'Arabic Fish Mandi','Aromatic rice dish with grilled fish.',400,1,4.5,'images/arabic_fish_mandi.jpg'),(3122,1040,'Afghani Tikka','Chicken tikka with creamy Afghani marinade grilled to perfection.',250,1,4.6,'images/afghani_tikka.jpg'),(3123,1040,'Veg Fried Rice','A basic stir-fried rice with mixed vegetables.',120,1,4.0,'images/veg_fried_rice.jpg'),(3124,1040,'Sahi Tukda','A rich dessert made with fried bread soaked in milk and sugar syrup.',100,1,4.3,'images/sahi_tukda.jpg'),(3125,1040,'Mutton Soup','A warm and flavorful soup made with mutton.',120,1,4.2,'images/mutton_soup.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `restaurantid` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `orderdate` varchar(255) DEFAULT NULL,
  `totalamount` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `paymentmode` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=5004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (5000,'1','3',NULL,'475','hf','hru','hxh'),(5002,'1005','2','2025-08-10','667','Confirmed','cash_on_delivery','btm'),(5003,'1002','2','2025-08-22','580','Confirmed','cash_on_delivery','Abcd street,nellore');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `orderitemid` int NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) DEFAULT NULL,
  `menuid` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `totalamount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderitemid`)
) ENGINE=InnoDB AUTO_INCREMENT=6008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (6000,'5000','3','4','123'),(6005,'5002','3036','1','169'),(6006,'5002','3038','2','498'),(6007,'5003','3011','2','580');
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurantid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `cuisinetype` varchar(255) DEFAULT NULL,
  `deliverytime` int DEFAULT NULL,
  `adminuserid` int DEFAULT NULL,
  `rating` decimal(10,1) DEFAULT NULL,
  `isactive` tinyint DEFAULT NULL,
  `imagepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`restaurantid`)
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1001,'Nellore Ruchulu','12-34-56, Gandhi Nagar, Nellore, Andhra Pradesh','9876543210','South Indian',30,101,4.5,1,'images/nellore_ruchulu.jpg'),(1002,'Spicy Bites','45-67-89, VRC Centre, Nellore, Andhra Pradesh','9123456789','Indian',45,102,4.2,1,'images/spicy_bites.jpg'),(1003,'Prakriti Multicuisine Restaurant','Plat No :- 493, Kings Court Avenue Road, Magunta Layout, Nellore, Andhra Pradesh','9123456789','Multicuisine',45,103,4.3,1,'images/prakriti_multicuisine.jpg'),(1004,'Naidu Gari Kunda Biryani','27-4-288/1, Ramji Nagar 7th Line, Nellore, Andhra Pradesh','9012345678','Biryani',60,104,4.5,1,'images/naidu_gari_kunda_biryani.jpg'),(1005,'Nellore Biryani House','55-66-77, Magunta Layout, Nellore, Andhra Pradesh','9543210987','Biryani',60,105,4.7,1,'images/biryani_house.jpg'),(1006,'Nellore Tiffins','8-7-6, Main Bazaar, Nellore, Andhra Pradesh','9606162636','South Indian',20,115,4.6,1,'images/nellore_tiffins.jpg'),(1007,'Penna Multicuisine Restaurant','24-1692, Police Office Road, Dargamitta, Nellore, Andhra Pradesh','7659061115','Multicuisine',40,101,4.4,1,'images/penna_multicuisine.jpg'),(1008,'The Haveli Restaurant','26-16-283, V Ragavaiah Nagar, Magunta Layout, Nellore, Andhra Pradesh','9876543210','Indian',50,102,3.9,1,'images/the_haveli.jpg'),(1009,'55 Bistro','3rd Floor, Sreeman Enclave, Srihari Nagar, Nellore, Andhra Pradesh','9494729944','Fast Food',35,105,4.1,1,'images/55_bistro.jpg'),(1010,'Dawat arabic family restaurant','26-9-939, Sapthagiri Colony, Mini Bypass Road, Nellore, Andhra Pradesh','9988776655','Arabic',55,106,4.2,1,'images/dawat_arabic.jpg'),(1011,'The Vanam Multi Cuisine Theme Restaurant','Opposite Lalitha Silks, Magunta Layout, Dargamitta, Nellore, Andhra Pradesh','9543210987','Multicuisine',50,107,3.7,1,'images/the_vanam.jpg'),(1012,'Guma Gumalu Authentic Restaurant','Near Narayana Engineering College, Nellore, Andhra Pradesh','9676764666','Indian',45,108,4.0,1,'images/guma_gumalu.jpg'),(1013,'A2B','DR Central Mall, Trunk Road, Nellore, Andhra Pradesh','9321098765','South Indian',30,109,3.8,1,'images/a2b_nellore.jpg'),(1040,'The Jail Mandi','23-4-95, 1st Floor, White House, Kings Court Avenue, Magunta Layout, Nellore, Andhra Pradesh','9676764666','Arabian',55,110,4.2,1,'images/jail_mandi.jpg');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` enum('Customer','RestaurantAdmin','DeliveryAgent','SuperAdmin') DEFAULT 'Customer',
  `createdate` varchar(255) DEFAULT NULL,
  `lastlogindate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Alex','alex','574474229','alex@gmail.com','62973308370','VRC','Customer','2025-06-24 17:51:18.27','2025-06-24 17:51:18.27'),(2,'Basha','basha125','12345','basha@gmail.com','7653497','nellore','Customer','2025-06-29 17:24:35.7','2025-08-22 22:46:34.16'),(5,'Vishnu Vardhan','basha','bash@gmail.com','09347391148','qwer','Pargathi Nagar\r\n21876','Customer','2025-08-05 17:48:14.923','2025-08-05 17:48:14.923'),(6,'Vishnu Vardhan','basha','bas@gmail.com','09347391148','67890','Pargathi Nagar\r\n21876','Customer','2025-08-07 22:06:20.117','2025-08-07 22:06:20.117'),(7,'Vishnu Vardhan','gvishnu2222@gmail.com','gvishnu2222@gmail.com','09347391148','12345','Pargathi Nagar\r\n21876','Customer','2025-08-07 22:09:52.876','2025-08-07 22:09:52.876'),(8,'Vishnu Vardhan','gvishnu2222@gmail.com','pranesheduru@gmail.com','09347391148','12345','Pargathi Nagar\r\n21876','Customer','2025-08-07 22:15:42.216','2025-08-07 22:15:42.216'),(9,'Vishnu Vardhan','au723921243022','Giridharraj122@gmail.com','09347391148','12345','Pargathi Nagar\r\n21876','Customer','2025-08-07 22:18:38.302','2025-08-07 22:18:38.302');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-25 23:23:01
