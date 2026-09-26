create database clgdb;
show databases;
use clgdb;
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(30),
    Adress VARCHAR(100));
INSERT INTO Student (Student_ID, Name, Age, Department,Adress)
VALUES (101, 'Ravi', 20, 'CSE','vizag');
INSERT INTO Student (Student_ID, Name, Age, Department,Adress)
VALUES (102, 'Ravi', 20, 'CSE','vizag');
INSERT INTO Student ( Name, Age, Department,Adress)
VALUES ('Ravi', 20, 'CSE','vizag');
INSERT INTO Student (Student_ID, Name, Age, Department,Dob)
VALUES (109, 'Ravi', 20, 'CSE','1990-12-09');
select * from Student;
ALTER TABLE Student ADD Email VARCHAR(100);
ALTER TABLE Student ADD Dob date;
ALTER TABLE Student MODIFY Age SMALLINT;
ALTER TABLE Student DROP COLUMN Email;





SELECT Name, Extract(year FROM Dob) AS BirthDay FROM Student;

SELECT name, Age * 2 AS "Revised Age" FROM Student; 


SELECT * FROM Student WHERE Department ='CSE' or Adress = 'vizag';
