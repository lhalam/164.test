use test;
-- DROP  TABLE Second if EXISTS;
CREATE TABLE Second
(id int NOT NULL AUTO_INCREMENT primary key,
Second_name varchar(255) not null unique,
Second_price int NOT NULL
);

INSERT INTO 
Second (Second_name, Second_price)
values ('Second_product', 22222);
