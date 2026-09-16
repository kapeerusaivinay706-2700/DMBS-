CREATE DATABASE d4;
USE d4;

-- 1. Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    Major VARCHAR(50)
);

-- 2. Create Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT
);

-- 3. Create Enrollments table
CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- 4. Create Instructors table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15)
);

-- 5. Create Course_Instructors table
CREATE TABLE Course_Instructors (
    CourseID INT,
    InstructorID INT,
    PRIMARY KEY (CourseID, InstructorID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

-- 6. Insert Students
INSERT INTO Students VALUES
(101, 'Rahul', 'CSE'),
(102, 'Priya', 'AIML'),
(103, 'Arjun', 'ECE'),
(104, 'Sneha', 'AIML');

-- 7. Insert Courses
INSERT INTO Courses VALUES
(201, 'Database Management Systems', 4),
(202, 'Operating Systems', 4),
(203, 'Machine Learning', 3),
(204, 'Computer Networks', 3);

-- 8. Insert Enrollments
INSERT INTO Enrollments VALUES
(101, 201, '2026-07-01'),
(101, 202, '2026-07-01'),
(102, 201, '2026-07-02'),
(102, 203, '2026-07-02'),
(103, 204, '2026-07-03'),
(104, 203, '2026-07-03');

-- 9. Insert Instructors
INSERT INTO Instructors VALUES
(301, 'Dr. Kumar', '9876543210'),
(302, 'Dr. Anitha', '9876543211'),
(303, 'Dr. Ramesh', '9876543212');

-- 10. Insert Course_Instructors
INSERT INTO Course_Instructors VALUES
(201, 301),
(202, 302),
(203, 303),
(204, 301);

-- 11. Display Students
SELECT * FROM Students;

-- 12. Display Courses
SELECT * FROM Courses;

-- 13. Display AIML students
SELECT StudentID, StudentName
FROM Students
WHERE Major = 'AIML';

-- 14. Display students and their courses
SELECT S.StudentID, S.StudentName, C.CourseName
FROM Students S
JOIN Enrollments E
    ON S.StudentID = E.StudentID
JOIN Courses C
    ON E.CourseID = C.CourseID;

-- 15. Display courses and instructors
SELECT C.CourseName, I.InstructorName
FROM Courses C
JOIN Course_Instructors CI
    ON C.CourseID = CI.CourseID
JOIN Instructors I
    ON CI.InstructorID = I.InstructorID;

-- 16. Display student, course and enrollment date
SELECT S.StudentName,
       C.CourseName,
       E.EnrollmentDate
FROM Students S
JOIN Enrollments E
    ON S.StudentID = E.StudentID
JOIN Courses C
    ON E.CourseID = C.CourseID;

-- 17. Display all tables
SHOW TABLES;

-- 18. Create d4_user
CREATE USER 'd4_user'@'localhost'
IDENTIFIED BY 'd4user@123';

-- 19. Give SELECT privilege to u4_user
GRANT SELECT
ON d4.Students
TO 'd4_user'@'localhost';

-- 20. Check Students table
SELECT * FROM Students;

-- 21. Delete enrollment records first
DELETE FROM Enrollments
WHERE StudentID = 101;

-- 22. Now delete Student 101
DELETE FROM Students
WHERE StudentID = 101;

-- 23. Create university_user
CREATE USER 'university_user'@'localhost'
IDENTIFIED BY 'University@123';

-- 24. Grant SELECT, INSERT and UPDATE
GRANT SELECT, INSERT, UPDATE
ON d4.Students
TO 'university_user'@'localhost';

-- 25. Grant all privileges on database
GRANT ALL PRIVILEGES
ON d4.*
TO 'university_user'@'localhost';

-- 26. Revoke UPDATE
REVOKE UPDATE
ON d4.Students
FROM 'university_user'@'localhost';

-- 27. Revoke INSERT
REVOKE INSERT
ON d4.Students
FROM 'university_user'@'localhost';

-- 28. Grant SELECT again
GRANT SELECT
ON d4.Students
TO 'university_user'@'localhost';

-- 29. User can view data
SELECT * FROM Students;

-- 30. Revoke SELECT
REVOKE SELECT
ON d4.Students
FROM 'university_user'@'localhost';
