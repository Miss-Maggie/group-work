-- Create a database
CREATE DATABASE bookstore;

-- Create tables
USE bookstore;
CREATE TABLE book(
book_id INT PRIMARY KEY AUTO_INCREMENT,
bookName VARCHAR(10),
availability VARCHAR(20),
pages INT,
price INT,
publication_year YEAR 
);

CREATE TABLE book_author(
book_id INT,
author_id INT PRIMARY KEY AUTO_INCREMENT,
FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE author(
author_id INT,
firstName VARCHAR(10),
lastName VARCHAR(10),
nationality VARCHAR(10),
age INT,
gender VARCHAR(10)
);

CREATE TABLE book_language(
language_id INT PRIMARY KEY AUTO_INCREMENT,
language_name VARCHAR(20)
);

CREATE TABLE publisher(
publisher_id INT PRIMARY KEY AUTO_INCREMENT,
firstName VARCHAR(10),
secondName VARCHAR(0),
year_of_publishing DATE,
email_address VARCHAR(50)
);

CREATE TABLE customer(
customer_Id INT PRIMARY KEY AUTO_INCREMENT,
customer_Name VARCHAR(50),
contact INT,
email_address VARCHAR(100)
);

CREATE TABLE customer_address(
street VARCHAR(50),
city VARCHAR(50),
state VARCHAR(50),
postal_code VARCHAR(30)
);

CREATE TABLE address_status(
status_id INT PRIMARY KEY AUTO_INCREMENT,
status_name VARCHAR(40)
);

CREATE TABLE address(
address_id INT PRIMARY KEY AUTO_INCREMENT,
address_type VARCHAR(30),
city VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50)
);

CREATE TABLE country(
country_id INT PRIMARY KEY AUTO_INCREMENT,
country_name VARCHAR(30),
country_code INT,
timezone VARCHAR(50),
currency VARCHAR(50)
);

CREATE TABLE cust_order(
order_id INT PRIMARY KEY AUTO_INCREMENT,
order_number INT,
order_date DATE,
order_status VARCHAR(50),
customer_name VARCHAR(50)
);

CREATE TABLE order_line(
order_line_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
book_id INT,
quantity INT,
total_price INT
);

CREATE TABLE shipping_method(
shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
method_name VARCHAR(50),
cost INT,
delivery_date DATE
);

CREATE TABLE order_history(
history_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
status VARCHAR(50),
delivery_date DATE,
updated_by VARCHAR(40)
);

CREATE TABLE order_status(
status_id INT PRIMARY KEY AUTO_INCREMENT,
status_name VARCHAR(50),
description TEXT
);

-- Creating user groups
CREATE USER 'mag'@'localhost'
IDENTIFIED BY "12345";

CREATE USER 'dan'@'localhost'
IDENTIFIED BY "dan12";

CREATE USER 'protas'@'localhost'
IDENTIFIED BY "pro123";

-- Granting access to the users
GRANT ALL ON bookstore.* TO mag@localhost, dan@localhost, protas@localhost;

-- Creating roles
CREATE ROLE manager, clerk, assistant; 

-- Grant roles to users
GRANT manager TO mag@localhost;
GRANT clerk TO dan@localhost;
GRANT assistant TO protas@localhost;