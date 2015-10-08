DROP DATABASE IF EXISTS test;

CREATE DATABASE test;
use test;

CREATE TABLE Table1
(ID INT NOT NULL AUTO_INCREMENT, 
Name VARCHAR(100) NOT NULL, 
Description LONGTEXT NULL, 
PRIMARY KEY(ID), 
INDEX Name(Name));


CREATE TABLE Product
(id int NOT NULL AUTO_INCREMENT primary key,
product_name varchar(255) not null unique,
price int NOT NULL
);

INSERT INTO 
Product (product_name, price)
values ('prod1', 155)
