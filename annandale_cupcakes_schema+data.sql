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
