CREATE DATABASE university;
USE university;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Major VARCHAR(30),
    Age INT
);

INSERT INTO Students VALUES
(101, 'Ravi', 'AIML', 20),
(102, 'Priya', 'CSE', 21),
(103, 'Kiran', 'AIML', 20),
(104, 'Anu', 'ECE', 22),
(105, 'Rahul', 'CSE', 21);

-- Create Secondary Index
CREATE INDEX idx_major
ON Students(Major);

-- Display Indexes
SHOW INDEX FROM Students;

-- Retrieve using Primary Index
SELECT *
FROM Students
WHERE StudentID = 103;

-- Retrieve using Secondary Index
SELECT *
FROM Students
WHERE Major = 'AIML';

-- Check query execution
EXPLAIN SELECT *
FROM Students
WHERE Major = 'AIML';

-- Insert a new record
INSERT INTO Students
VALUES (106, 'Sneha', 'AIML', 21);

-- Display records
SELECT * FROM Students;

-- Delete a record
DELETE FROM Students
WHERE StudentID = 103;

-- Display records after deletion
SELECT * FROM Students;

-- Display indexes again
SHOW INDEX FROM Students;