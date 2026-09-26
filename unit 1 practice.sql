use school;
CREATE TABLE S2 (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(30),
    Adress VARCHAR(100));
    INSERT INTO S2 (Student_ID, Name, Age, Department,Adress)
VALUES
(103, 'Arun', 19, 'CSE','gjfvghf'),
(104, 'Sneha', 20, 'IT','hfdfh');
INSERT INTO S2
VALUES
(105, 'Arun', 19, 'CSE','gjfvghf');
select * from S2;
ALTER TABLE S2 ADD Email VARCHAR(100);
ALTER TABLE S2 ADD DOB date;
INSERT INTO S2(Student_ID, Name, Age, Department,Adress,DOB)
VALUES
(106, 'Arun', 19, 'CSE','gjfvghf','2000-03-25');

ALTER TABLE S2 MODIFY Age SMALLINT;
ALTER TABLE S2 DROP COLUMN Email;
ALTER TABLE S2 RENAME COLUMN Age TO Stuage;
DROP TABLE S3;
RENAME TABLE S2 TO S3;
TRUNCATE TABLE S3;
select *from S3;


UPDATE S2 SET Department='AIML' WHERE Student_ID = 103; 
DELETE FROM S2 WHERE Student_ID = 103;


create table users
(
user_id int primary key,
username varchar(100) unique);

insert into users values
(101,"eswar"),
(102,"vijay");
select* from s1;
insert into users values
(103,"eswars");

insert into users values
(104,"abhi");

update  s1 set collection=100 where Student_ID >0 ;


alter table s1 add column collection int;
