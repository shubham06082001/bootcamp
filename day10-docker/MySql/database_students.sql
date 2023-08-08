CREATE DATABASE student;
use student;

CREATE TABLE students(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO students(name, age) VALUES('John', 20);
INSERT INTO students(name, age) VALUES('Jane', 21);
INSERT INTO students(name, age) VALUES('Joe', 22);