-- 1. Create a database
CREATE DATABASE company;

-- 2. Use the database
USE company;

-- 3. Create the employee table
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    department VARCHAR(50),
    dob DATE
);

-- 4. Insert data into the employee table
INSERT INTO employee (id, name, salary, department, dob) VALUES
(101, 'Jack', 2000, 'HR', '1997-05-19'),
(102, 'Jack', NULL, 'HR', NULL),
(103, 'Mack', 6000, 'Developer', '1997-03-10'),
(104, 'Peter', 4000, 'Tester', '1998-07-16'),
(105, 'Tom', 3000, 'HR', '1998-11-03'),
(106, 'Leo', 2500, 'Developer', '1997-10-10'),
(107, 'Roger', 5300, 'Accounts', '1997-06-17'),
(108, 'Mike', 2000, NULL, '1998-03-09'),
(109, 'Paul', 4800, 'Developer', '1998-12-28'),
(110, 'Hannah', 2000, 'Accounts', '1999-09-26');

-- 5. Check the data
SELECT * FROM employee;

-- ================================
-- Question 1: Employee Count by Department
-- ================================

-- Find the number of employees working in each department as total_employee,
-- only include departments where the number of employees is more than one,
-- and sort the result by total_employee

SELECT department, COUNT(*) AS total_employee
FROM employee
GROUP BY department
HAVING COUNT(*) > 1
ORDER BY total_employee;

-- ================================
-- Question 2: Total Salary and Employee Count by Department
-- ================================

-- Write SQL query to calculate the total salary and the number of employees in each department
-- Only include departments where total salary is more than 5000 and number of employees is not 1
SELECT department, 
       COUNT(*) AS total_employee,
       SUM(salary) AS total_salary
FROM employee
GROUP BY department
HAVING SUM(salary) > 5000 AND COUNT(*) <> 1
ORDER BY total_salary;


-- ================================
-- Question 3: Total Salary by Department with Conditions
-- ================================

-- Write a SQL query to retrieve the total salary of employees in each department,
-- where the total salary of each department falls between 2000 and 6000,
-- and the department field is not null

SELECT department,
       SUM(salary) AS total_salary
FROM employee
WHERE department IS NOT NULL
GROUP BY department
HAVING SUM(salary) BETWEEN 2000 AND 6000
ORDER BY total_salary;

