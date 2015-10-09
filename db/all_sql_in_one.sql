-- Table created for gathering information about user for transfering to another tables
DROP DATABASE IF EXISTS test;

CREATE DATABASE test;
use test;
DROP TABLE IF EXISTS  Users;
CREATE TABLE Users (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS  Resources;
CREATE TABLE Resources (
  id INT NOT NULL,
  resource_name VARCHAR(100) NOT NULL,    -- name of resource
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS  Permissions;
CREATE TABLE Permissions (
  id INT NOT NULL AUTO_INCREMENT,
  action VARCHAR(100) NOT NULL,
  modifier VARCHAR(100) NOT NULL,
  resourses_id INT NOT NULL,
  FOREIGN KEY (resourses_id) REFERENCES Resources(id),
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS  Roles;
CREATE TABLE Roles (
  id INT NOT NULL,
  name INT NOT NULL,              -- name of role
  PRIMARY KEY(id)
);

	/*
	User_roles table create relations between users and their specific roles.
	*/
DROP TABLE IF EXISTS  User_roles;
CREATE TABLE User_roles (
 id INT NOT NULL AUTO_INCREMENT,
 user_id INT NOT NULL,
 roles_id INT NOT NULL,
 PRIMARY KEY (id),
 FOREIGN KEY (user_id) REFERENCES Users(id),
 FOREIGN KEY (roles_id) REFERENCES Roles(id)
);



# use test;
DROP TABLE IF EXISTS  Role_permissions;
CREATE TABLE Role_permissions (
  /*
  Simple table with relations between specific roles of users and its permissions.
  Permissions means activities of user what are allowed to do on site. User rights to edit status Problems entities
   */
  id INT NOT NULL AUTO_INCREMENT primary key,
  roles_id INT,
  permissions_id INT,
  FOREIGN KEY (roles_id) REFERENCES Roles(id),
  FOREIGN KEY (permissions_id) REFERENCES Permissions(id)
);

DROP TABLE IF EXISTS  Detailed_problems;
CREATE TABLE Detailed_problems (
 id INT NOT NULL,
 title VARCHAR(255) NOT NULL,
 content VARCHAR(255) NOT NULL,
 proposal VARCHAR(255) NOT NULL, /*User can propose a solution*/
 severity VARCHAR(255) NOT NULL,
 status VARCHAR(255) NOT NULL, /* not resolved or resolved */
 location BIGINT NOT NULL, /*Latitude and Longtitude of the problem*/
 problem_type_id INT NOT NULL,
 number_of_votes INT,
 datetime TIMESTAMP NOT NULL, /*date of create*/
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 number_of_comments INT,
 PRIMARY KEY (id)
);




# Should We use namespace here? Or we are
# going to pass it while executing code ?
DROP TABLE IF EXISTS Problem_types;
CREATE TABLE Problem_types (
    /*
        This table provides description of all problem types
    */
    id INT NOT NULL AUTO_INCREMENT,
    type VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);


DROP TABLE IF EXISTS  Problems;
CREATE TABLE Problems (
  id INT NOT NULl AUTO_INCREMENT,
  content VARCHAR(255) NOT NULL ,
  proposal VARCHAR(255) NOT NULL , # propose the solution
  severity VARCHAR(255) , # seriousness of problem
  detailed_problem_id INT NOT NULL,
  problem_types_id INT NOT NUll,
  PRIMARY KEY (id),
  FOREIGN KEY (detailed_problem_id) REFERENCES Detailed_problems(id),
  FOREIGN KEY (problem_types_id) REFERENCES Problem_types(id)
);



# Should We use namespace here? Or we are
# going to pass it while executing code ?
DROP TABLE IF EXISTS Problem_activities;
CREATE TABLE Problem_activities (
    /*
        This table represents logging of all activities on
        exact problems.
    */
    id INT NOT NULL AUTO_INCREMENT,
    # Time of activity's occuring
    datetime TIMESTAMP NOT NULL,
    problem_id INT NOT NULL,
    user_id INT NOT NULL,
    activity_type ENUM('Added', 'Removed', 'Updated', 'Vote') NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (problem_id) REFERENCES Problems(id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

DROP TABLE IF EXISTS  Votes;
CREATE TABLE Votes (
  id INT NOT NULl AUTO_INCREMENT,
  problem_id INT NOT NUll, # problem, wich was voted
  user_id INT NOT NULL , # user who has voted
  vote_value INT , # select value of severity
  PRIMARY KEY (id),
  FOREIGN KEY (problem_id) REFERENCES Problems(id),
  FOREIGN KEY (user_id) REFERENCES Users(id)
);

# use test;
DROP TABLE IF EXISTS  Photos;
CREATE TABLE Photos (
  /*
  Table for storage attached photos to Problem entities.
  Has reference
    :on user_id -> a user, who attached the photo
    :on problem_id -> specific Problem entity which photos belongs to
 */
  id INT NOT NULL AUTO_INCREMENT, # MEDIUMINT for secure incrementation :) or just regular INT ?
  Name VARCHAR(255) NOT NULL UNIQUE, # each photo must have unique name according to it /PATH/name.jpg
  Description LONGTEXT NULL, # this textfield type might be changed
  problem_id INT,
  user_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (problem_id) REFERENCES Problems(id),
  FOREIGN KEY (user_id) REFERENCES Users(id)
);

DROP TABLE IF EXISTS  Comments;
CREATE TABLE Comments (
  id INT NOT NULl AUTO_INCREMENT,
  content VARCHAR(255) NOT NULL,
  problem_id INT NOT NULL,         -- problem, comment belongs to
  user_id INT NOT NULL,            -- user, comment belongs to
  created_date DATE NOT NULL,         -- date of create
  modified_date DATE NULL,            -- date, when comment was modified
  modified_user_id INT NULL,       -- user, who modified comment
  PRIMARY KEY(id),
  FOREIGN KEY(problem_id) REFERENCES Problems(id),
  FOREIGN KEY(user_id) REFERENCES Users(id)
);
INSERT INTO Problem_types(type) VALUES ('first problem type');
INSERT INTO Users (first_name, last_name, email, password) VALUES ('vadim', 'padalko', '22@mail.ru', 'pass');
INSERT INTO Detailed_problems
(id, title, content, proposal, severity, status, location,
 problem_type_id, number_of_votes, datetime, first_name, last_name, number_of_comments)
    VALUES
      (1,'title','contetn detailed', 'proposal','ENUM BLEAT', 'status', 1213123, 1, 0,
       datetime,'firstname','lastname',0 );
INSERT INTO Problems(id, content, proposal, severity, detailed_problem_id, problem_types_id) VALUES
  (1, 'content probl1', 'my proposal', 'severeENUMBLEAT', 1, 1);


