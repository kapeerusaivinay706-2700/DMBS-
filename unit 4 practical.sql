use aa;
SELECT CAST('1236556576' AS DECIMAL(4,3)) AS result;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    address VARCHAR(100),
    dept_name VARCHAR(30),
    salary DECIMAL(10,2)
);
INSERT INTO employees (emp_id, name, age, address, dept_name, salary) VALUES
(101, 'Alice',   24, 'Hyderabad', 'HR',      60000),
(102, 'Bob',     26, 'Vijayawada', 'HR',      50000),
(103, 'Charlie', 25, 'Guntur',     'HR',      45000),
(104, 'David',   28, 'Visakhapatnam', 'HR',   70000),
(105, 'Eva',     27, 'Rajahmundry', 'HR',     55000),

(106, 'Frank',   30, 'Kakinada',   'IT',      75000),
(107, 'Grace',   29, 'Nellore',    'IT',      65000),
(108, 'Henry',   31, 'Tirupati',   'IT',      80000),
(109, 'Irene',   26, 'Warangal',   'IT',      60000),
(110, 'Jack',    27, 'Karimnagar', 'IT',      70000),

(111, 'Kevin',   24, 'Ongole',     'Sales',   40000),
(112, 'Lily',    25, 'Anantapur',  'Sales',   45000),
(113, 'Mike',    26, 'Eluru',      'Sales',   50000),
(114, 'Nancy',   28, 'Kadapa',     'Sales',   55000),
(115, 'Oliver',  29, 'Nizamabad',  'Sales',   60000);
select * from employees;
SELECT AVG(salary)FROM employees;
SELECT e.name, e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary)FROM employees);
CREATE TABLE departments (
    dept_name VARCHAR(30),
    location VARCHAR(50)
);
INSERT INTO departments (dept_name, location) VALUES
('HR', 'New York'),
('IT', 'Chicago'),
('Sales', 'New York');
select * from employees;
select * from departments;
	SELECT name FROM employees WHERE dept_name IN (
    SELECT dept_name FROM departments WHERE location = 'New York');
SELECT e.name, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE dept_name = e.dept_name);
  select * from employees;
SELECT CONCAT(name, ' ',salary) AS locality FROM employees;
SELECT lower(name) AS LowerName FROM employees;
SELECT upper(name) AS upperName FROM employees;
SELECT LENGTH(address) AS NameLength FROM employees;
SELECT SUBSTRING(name, 1, 3) AS ShortName FROM employees;
SELECT emp_id,name,REPLACE(dept_name, 'HR', 'Information Technology') AS Department
FROM employees;
SELECT emp_id,TRIM(name) AS Employee_Name FROM employees;
SELECT emp_id,name,REPLACE(dept_name, 'HR', 'Information Technology') AS Department
FROM employees WHERE emp_id=101;






SELECT DATE_FORMAT('2026-07-28 13:39:56', '%W, %M %d, %Y %h %i') AS formatted_date;

drop table employees;
