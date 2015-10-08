use test;
-- DROP  TABLE Second if EXISTS;
CREATE TABLE Third
(id SMALLINT NOT NULL AUTO_INCREMENT primary key,
name_third varchar(255) not null unique,
price_third MEDIUMINT NOT NULL
);

INSERT INTO
Third (name_third, price_third)
values ('third-1', 3);

INSERT INTO
Third (name_third, price_third)
values ('third-2', 44);

INSERT INTO
Third (name_third, price_third)
values ('third-3', 55);


