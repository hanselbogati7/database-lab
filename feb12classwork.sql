-- Create and use database
CREATE DATABASE IF NOT EXISTS join_lab;
USE join_lab;

-- Drop tables if they already exist
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Create departments table
CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Create employees table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- Insert data into departments
INSERT INTO departments (id, department_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Police'),
(4, 'Nuclear Plant'),
(5, 'Bar');

-- Insert data into employees (from your slide)
INSERT INTO employees (id, employee_name, department_id) VALUES
(1, 'Homer Simpson', 4),
(2, 'Ned Flanders', 1),
(3, 'Barney Gumble', 5),
(4, 'Clancy Wiggum', 3),
(5, 'Moe Szyslak', NULL);

-- View tables
SELECT * FROM employees;
SELECT * FROM departments;

-- INNER JOIN (only matching departments)
SELECT 
    e.id,
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.id;

-- LEFT JOIN (include employees without department)
SELECT 
    e.id,
    e.employee_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.id;
