create database company;
use company;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);
select * from Department;
select * from Employee;


CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    age INT,
    salary DECIMAL(10,2),
    dept_id INT,
    
    FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id)
);
INSERT INTO Department VALUES
(10, 'IT', 'Hyderabad'),
(20, 'HR', 'Chennai'),
(30, 'Finance', 'Bangalore'),
(40, 'Sales', 'Mumbai');

INSERT INTO Employee VALUES
(101, 'Ravi', 25, 45000, 10),
(102, 'Priya', 28, 55000, 10),
(103, 'Anil', 30, 60000, 20),
(104, 'Sneha', 26, 48000, 20),
(105, 'Kiran', 32, 75000, 30),
(106, 'Arjun', 29, 50000, 40);
SELECT emp_id, emp_name, dept_id
FROM Employee;
SELECT e.emp_name, d.dept_name
FROM Employee e
INNER JOIN Department d
ON e.dept_id = d.dept_id;
SELECT e.emp_name, d.dept_name
FROM Employee e
JOIN Department d
ON e.dept_id = d.dept_id;
SELECT emp_name, dept_name
FROM Employee
NATURAL JOIN Department;
SELECT d.dept_name, e.emp_name
FROM Department d
LEFT JOIN Employee e
ON d.dept_id = e.dept_id;
SELECT d.dept_name, e.emp_name
FROM Department d
right JOIN Employee e
ON d.dept_id = e.dept_id;
