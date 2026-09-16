create database u4;
use u4;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    Major VARCHAR(50)
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT
);
CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15)
);
CREATE TABLE Course_Instructors (
    CourseID INT,
    InstructorID INT,
    PRIMARY KEY (CourseID, InstructorID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);
INSERT INTO Students VALUES
(101, 'Rahul', 'CSE'),
(102, 'Priya', 'AIML'),
(103, 'Arjun', 'ECE'),
(104, 'Sneha', 'AIML');
INSERT INTO Courses VALUES
(201, 'Database Management Systems', 4),
(202, 'Operating Systems', 4),
(203, 'Machine Learning', 3),
(204, 'Computer Networks', 3);
INSERT INTO Enrollments VALUES
(101, 201, '2026-07-01'),
(101, 202, '2026-07-01'),
(102, 201, '2026-07-02'),
(102, 203, '2026-07-02'),
(103, 204, '2026-07-03'),
(104, 203, '2026-07-03');
INSERT INTO Instructors VALUES
(301, 'Dr. Kumar', '9876543210'),
(302, 'Dr. Anitha', '9876543211'),
(303, 'Dr. Ramesh', '9876543212');
INSERT INTO Course_Instructors VALUES
(201, 301),
(202, 302),
(203, 303),
(204, 301);
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT StudentID, StudentName
FROM Students
WHERE Major = 'AIML';
SELECT S.StudentID, S.StudentName, C.CourseName
FROM Students S
JOIN Enrollments E
    ON S.StudentID = E.StudentID
JOIN Courses C
    ON E.CourseID = C.CourseID;
    SELECT C.CourseName, I.InstructorName
FROM Courses C
JOIN Course_Instructors CI
    ON C.CourseID = CI.CourseID
JOIN Instructors I
    ON CI.InstructorID = I.InstructorID;
    SELECT S.StudentName,
       C.CourseName,
       E.EnrollmentDate
FROM Students S
JOIN Enrollments E
    ON S.StudentID = E.StudentID
JOIN Courses C
    ON E.CourseID = C.CourseID;
    show tables;
    CREATE USER 'u4_user'@'localhost'
IDENTIFIED BY 'U4user@123';
    GRANT SELECT
ON u4.students
TO 'u4_user'@'localhost';
SELECT * FROM Students;
DELETE FROM Students
WHERE StudentID = 101;
GRANT SELECT, INSERT, UPDATE
ON University.Students
TO 'university_user'@'localhost';
GRANT ALL PRIVILEGES
ON u4.*
TO 'university_user'@'localhost';
REVOKE UPDATE
ON u4.Students
FROM 'university_user'@'localhost';
REVOKE INSERT
ON u4.Students
FROM 'university_user'@'localhost';
GRANT SELECT ON u4.Students
TO 'university_user'@'localhost';

-- User can view data
SELECT * FROM Students;

REVOKE SELECT ON u4.Students
FROM 'university_user'@'localhost';

-- SELECT privilege is now removed