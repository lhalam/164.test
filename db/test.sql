DROP DATABASE IF EXISTS test;

CREATE DATABASE test;
use test;

CREATE TABLE Problems (
  id BIGINT NOT NULL AUTO_INCREMENT primary key,
  problem_column varchar(255) not null unique
);

CREATE TABLE Users(
  id BIGINT NOT NULL AUTO_INCREMENT primary key,
  user_info varchar(255) not null unique
);

CREATE TABLE Roles(
  id BIGINT NOT NULL AUTO_INCREMENT primary key,
  role_info varchar(255) not null
);

CREATE TABLE User_roles(
  id BIGINT NOT NULL AUTO_INCREMENT primary key,
  user_id  BIGINT NOT NULL,
  role_id BIGINT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(id),
  FOREIGN KEY (role_id) REFERENCES Roles(id)
);

CREATE TABLE Permissions(
  id BIGINT NOT NULL AUTO_INCREMENT primary key,
  permission_type  VARCHAR(255) NOT NULL
);

CREATE TABLE Role_permissions (
  id BIGINT NOT NULL AUTO_INCREMENT primary key,
  roles_id BIGINT,
  permissions_id BIGINT,
  FOREIGN KEY (roles_id) REFERENCES Roles(id),
  FOREIGN KEY (permissions_id) REFERENCES Permissions(id)
);
DROP TABLE IF EXISTS Photos;
CREATE TABLE Photos (
  id BIGINT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL UNIQUE,
  Description LONGTEXT NULL,
  problem_id BIGINT,
  user_id BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (problem_id) REFERENCES Problems(id),
  FOREIGN KEY (user_id) REFERENCES Users(id)
);


