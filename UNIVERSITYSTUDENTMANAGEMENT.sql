 CREATE DATABASE University;
 
 USE University;
 
 CREATE TABLE Students(
 ADMN_ID int AUTO_INCREMENT,
 NAME char(100) NOT NULL,
 AGE int,
 Email varchar(200) UNIQUE,
 PRIMARY KEY(ADMN_ID)
 );
 
 CREATE TABLE Course_Info(
 COURSE_ID int AUTO_INCREMENT,
 COURSE_NAME char(100) NOT NULL,
 COURSE_CREDITS int NOT NULL,
 ADMN_ID int NOT NULL,
 PRIMARY KEY (COURSE_ID),
 FOREIGN KEY (ADMN_ID) REFERENCES Students(ADMN_ID)
 );		
 
 INSERT INTO Students (NAME, AGE, Email) VALUES ('Joseph', 100, 'joseph@mugo.com');
 INSERT INTO Students (NAME, AGE, Email) VALUES ('Kelvin', 70, 'Kmugo44@gmail.com');
 INSERT INTO Students (NAME, AGE, Email) VALUES ('Wamiti', 50, 'Wamiti777@gmail.com');
 INSERT INTO Students (NAME, AGE, Email) VALUES ('Chispus', 60, 'Chrispus55@gmail.com');
 INSERT INTO Students (NAME, AGE, Email) VALUES ('Mathew', 65, 'Mathew33@gmail.com');
 INSERT INTO Students (NAME, AGE, Email) VALUES ('Mary', 80, 'Marymugo@gmail.com');
 INSERT INTO Students (NAME, AGE, Email) VALUES ('John', 87, 'johnKamau@gmail.com');
 INSERT INTO Students (NAME, AGE, Email) VALUES ('Elizabeth', 56, 'Elizabeth@gmail.com');
 
 INSERT INTO Course_Info(COURSE_NAME, COURSE_CREDITS, ADMN_ID) VALUES ("BCOM", 120, 4);
 INSERT INTO Course_Info(COURSE_NAME, COURSE_CREDITS, ADMN_ID) VALUES ("Catering", 50, 5);
 INSERT INTO Course_Info(COURSE_NAME, COURSE_CREDITS, ADMN_ID) VALUES ("DATA SCIENCE", 60, 6);
 INSERT INTO Course_Info(COURSE_NAME, COURSE_CREDITS, ADMN_ID) VALUES ("MATHEMATICS", 30, 7);
 INSERT INTO Course_Info(COURSE_NAME, COURSE_CREDITS, ADMN_ID) VALUES ("ACTURIAL SCIENCE", 67, 8);
 INSERT INTO Course_Info(COURSE_NAME, COURSE_CREDITS, ADMN_ID) VALUES ("EVENTS", 70, 9);
 INSERT INTO Course_Info(COURSE_NAME, COURSE_CREDITS, ADMN_ID) VALUES ("COMPUTER SCIENCE", 54, 10);
 
 -- QUERY TO SHOW ALL THE DATA FROM STUDENT TABLE
 SELECT * FROM Students;
 
 -- Students whose age is less than 50
 
 SELECT * 
 FROM Students
 WHERE AGE < 70;
 
 -- Age is between 35-75 (both inclusive) and admn_id is_not 10
 SELECT *
 FROM Students 
 WHERE AGE >= 45 AND AGE <= 85 AND ADMN_ID != 10;
 
 -- OPTIMIZING WITH THE BETWEEN KEYWORD
 SELECT *
 FROM Students 
 WHERE AGE BETWEEN 35 AND 75;
 
 -- CRUD Operations
 -- Update statement modify the existing record
-- SYNTAX  UPDATE table_name SET col=val, col=val..............WHERE condition;
UPDATE Students
SET name = 'Emugol'
WHERE ADMN_ID = 6;

UPDATE Students
SET Name='Steve Rogers', AGE = 70
WHERE ADMN_ID=5;

-- DELETE
-- SYNTAX: DELETE FROM table_name WHERE condition;

USE University;

DELETE FROM University.Students WHERE ADMN_ID=4;

-- DROP USED TO REMOVE THE ENTIRE TABLE
-- DELETE  One or multiple data in atable but have to provide a condition
-- Truncate Table will be there but entire data gets deleted Faster than delete no condition

-- Aggregation Function
-- MAX MIN COUNT MIN AVG
-- SUBQUERY QUERY INSIDE A QUERY
-- Nested Query
SELECT * 
FROM Students
WHERE AGE=(SELECT MAX(AGE) FROM Students);

SELECT * 
FROM Students
WHERE AGE=(SELECT MIN(AGE) FROM Students);

SELECT COUNT(NAME)
FROM Students
WHERE AGE > 20;

SELECT AVG(AGE) 
FROM Students;

-- SUM()
-- AVG = SUM() / COUNT()

SELECT SUM(AGE)
FROM Students;



-- INNER JOIN
-- SYNTAX
-- SELECT col_name
-- FROM table_1
-- INNER JOIN table_2
-- ON table1.col_name = table2.col_name;

-- MUST WORK WITH KEYS
SELECT  Students.ADMN_ID, NAME, COURSE_NAME
FROM Students
INNER JOIN COURSE_INFO
ON Students.ADMN_ID = COURSE_INFO.ADMN_ID;


-- LEFT OUTER JOIN
-- SYNTAX
-- SELECT col_name
-- FROM table_1
-- LEFT JOIN table_2
-- ON table1.col_name = table2.col_name;

-- MUST WORK WITH KEYS
SELECT NAME, COURSE_NAME
FROM Students
LEFT JOIN COURSE_INFO
ON Students.ADMN_ID = COURSE_INFO.ADMN_ID;

-- RIGHT OUTER JOIN
-- SYNTAX
-- SELECT col_name
-- FROM table_1
-- RIGHT JOIN table_2
-- ON table1.col_name = table2.col_name;

-- MUST WORK WITH KEYS
SELECT NAME, COURSE_NAME
FROM Students
RIGHT JOIN COURSE_INFO
ON Students.ADMN_ID = COURSE_INFO.ADMN_ID;
 
 
 -- f0j = loj + roj
 -- FULL OUTER JOIN
-- SYNTAX
-- SELECT col_name
-- FROM table_1
-- FULL JOIN table_2
-- ON table1.col_name = table2.col_name;
-- USE THE UNION TO COMBINE LEFT AND RIGHT OUTER JOIN

-- MUST WORK WITH KEYS
SELECT NAME, COURSE_NAME
FROM Students
LEFT JOIN COURSE_INFO
ON Students.ADMN_ID = COURSE_INFO.ADMN_ID
UNION
SELECT NAME, COURSE_NAME
FROM Students
RIGHT JOIN COURSE_INFO
ON Students.ADMN_ID = COURSE_INFO.ADMN_ID;

-- ANY & ALL(BOLLEAN OPERATORS)
SELECT NAME
FROM Students
WHERE ADMN_ID = ANY(SELECT ADMN_ID FROM Students WHERE AGE > 34);






















































































  
 
 
 
 
