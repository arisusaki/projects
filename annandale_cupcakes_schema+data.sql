drop schema if exists `annandale_cupcakes`;

-- DDL for creating database schema
create database annandale_cupcakes;
use annandale_cupcakes;

-- DDL for creating tables
create table customer (
	customer_id int primary key auto_increment,
	first_name varchar(50),
	last_name varchar(50),
	phone_number varchar(20),
	email varchar(30),
	street varchar(100),
	city varchar(50),
	state varchar(25),
	zip varchar(10),
	notes varchar(255),
	created_at datetime,
	updated_at datetime
);
create table customer_note (
	note_id int primary key auto_increment,
	subject varchar(50),
	note varchar(255),
	customer_id int,
	created_at datetime,
	updated_at datetime
);
create table event (
	event_id int primary key auto_increment,
	customer_id int,
	order_id int,
	event_datetime datetime,
	bake_order_datetime datetime,
	description varchar(100),
	delivery_instructions varchar(100),
	notes varchar(255),
	created_at datetime,
	updated_at datetime
);
create table payment (
	payment_id int primary key auto_increment,
	sale_id int,
	payment_method varchar(20),
	amount decimal(7,2),
	notes varchar(255),
	created_at datetime,
	updated_at datetime
);
create table product (
	product_id int primary key auto_increment,
	cupcake_type varchar(50),
	cupcake_name varchar(50),
	price decimal(7,2),
	cost_per_unit decimal(7,2),
	unit_capacity_per_day int,
	notes text,
	created_at datetime,
	updated_at datetime
);
create table sale (
	sale_id int primary key auto_increment,
	customer_id int,
	sale_date datetime,
	notes text,
	created_at datetime,
	updated_at datetime
);
create table sale_item (
	sale_item_id int primary key auto_increment,
	sale_id int,
	product_id int,
	quantity int,
	created_at datetime,
	updated_at datetime
);


-- DML insert statements for test data

-- Dumping data for table `customer`
LOCK TABLES `customer` WRITE;
INSERT INTO `customer` VALUES (1,'New','Customer','(111) 222-3333','new.customer@gmail.com','1233 Little River Tpk','Annandale','VA','22002-    ',NULL,NULL,NULL),(2,'Barb','Smith','(555) 234-5233','bsmith@aol.com','507 Main St, #401','Fairfax','Virginia','22003-    ',NULL,NULL,NULL),(3,'Ryan','Ammons','(555) 555-5555','rammons@nvcc.edu','123 Main St','Alexandria','VA','22310-    ','He\'s okay.',NULL,NULL),(4,'Chris','Smith','(202) 555-1234','c.smith@smithness.com','555 Round Rd','Washington','District of Columbia','20001-    ',NULL,NULL,NULL);
UNLOCK TABLES;

-- Dumping data for table `customer_note`
LOCK TABLES `customer_note` WRITE;
INSERT INTO `customer_note` VALUES (1,'Test','This is a test note :)',1,NULL,NULL),(2,'Hi, I like cupcakes','Yay!',2,NULL,NULL),(3,'Lobbyist','Works on K Street, wants to have cupcake catering to events',4,NULL,NULL);
UNLOCK TABLES;

-- Dumping data for table `event`
LOCK TABLES `event` WRITE;
UNLOCK TABLES;

-- Dumping data for table `payment`
LOCK TABLES `payment` WRITE;
INSERT INTO `payment` VALUES (1,1,'Visa',100.00,'Oh the fees…',NULL,NULL),(2,2,'Cash',10.00,'Cash is king!',NULL,NULL);
UNLOCK TABLES;

-- Dumping data for table `product`
LOCK TABLES `product` WRITE;
INSERT INTO `product` VALUES (1,'Chocalate','Plain Old Chocolate',6.00,1.50,25,NULL,NULL,NULL),(2,'Vanilla','Plain Old Vanilla',5.50,1.40,50,NULL,NULL,NULL),(3,'Strawberry','Plain Old Strawberry',6.50,1.75,15,NULL,NULL,NULL),(4,'Mixed','The Napolean',7.00,2.25,10,NULL,NULL,NULL),(5,'Sprinkles','Party Time (vanilla)',6.00,1.50,10,NULL,NULL,NULL),(6,'Sprinkles','Party Time (chocalate)',6.50,1.60,10,NULL,NULL,NULL),(7,'Sprinkles','Party Time (strawberry)',7.00,1.85,5,NULL,NULL,NULL);
UNLOCK TABLES;

-- Dumping data for table `sale`
LOCK TABLES `sale` WRITE;
INSERT INTO `sale` VALUES (1,3,'2019-11-11 00:00:00','Just found us, likes our products',NULL,NULL),(2,2,'2019-11-11 00:00:00','asdasdfasdf',NULL,NULL),(3,3,'2019-11-19 00:00:00','He\'s kind of annoying….',NULL,NULL),(4,1,'2019-11-18 00:00:00',NULL,NULL,NULL),(5,4,'2019-11-30 00:00:00','n/a asdfasdfasdfasdf',NULL,NULL),(6,4,'2019-11-30 00:00:00',NULL,NULL,NULL),(7,1,'2019-11-30 00:00:00',NULL,NULL,NULL),(8,2,'2019-11-30 00:00:00',NULL,NULL,NULL);
UNLOCK TABLES;

-- Dumping data for table `sale_item`
LOCK TABLES `sale_item` WRITE;
INSERT INTO `sale_item` VALUES (1,1,6,1,NULL,NULL),(2,1,4,1,NULL,NULL),(3,2,1,1,NULL,NULL),(4,2,6,2,NULL,NULL),(5,2,3,1,NULL,NULL),(6,2,2,4,NULL,NULL),(7,2,4,2,NULL,NULL),(8,3,1,10,NULL,NULL),(9,1,7,2,NULL,NULL),(10,2,1,20,NULL,NULL),(11,3,3,11,NULL,NULL),(12,4,7,32,NULL,NULL),(13,4,4,12,NULL,NULL),(14,1,5,1,NULL,NULL),(15,6,4,10,NULL,NULL),(16,6,5,5,NULL,NULL),(17,6,2,10,NULL,NULL),(18,7,7,123,NULL,NULL),(19,8,6,23,NULL,NULL),(20,9,1,12,NULL,NULL);
UNLOCK TABLES;