-- Create Table
CREATE TABLE employee(
EmployeeID VARCHAR2(20) PRIMARY KEY,
FirstName VARCHAR2(20),
LastName VARCHAR2(20),
Gender CHAR(1),
DateofBirth DATE,
Designation VARCHAR2(50),
DepartmentName VARCHAR2(50),
ManagerId VARCHAR2(20),
JoinedDate DATE,
Salary NUMBER(10)
);

-- Insert Records
INSERT INTO employee (
EmployeeID,FirstName,LastName,Gender,DateofBirth,
Designation,DepartmentName,ManagerId,JoinedDate,Salary
)
VALUES (
'0009','Season','Maharjan','M',
TO_DATE('1996-04-02','YYYY-MM-DD'),
'Engineer','Software Engineering','0005',
TO_DATE('2022-04-02','YYYY-MM-DD'),
5000000
);

INSERT INTO employee (
EmployeeID,FirstName,LastName,Gender,DateofBirth,
Designation,DepartmentName,ManagerId,JoinedDate,Salary
)
VALUES (
'0010','Ramesh','Rai','M',
TO_DATE('2000-04-02','YYYY-MM-DD'),
'Manager','Software Engineering','0003',
TO_DATE('2022-04-02','YYYY-MM-DD'),
1000000
);

-- Display Data
SELECT * FROM employee;

-- Update Gender
UPDATE employee
SET Gender='M'
WHERE EmployeeID='0009';

-- Employees older than 25
SELECT FirstName,
SYSDATE AS CurrentDate,
DateofBirth,
TRUNC(MONTHS_BETWEEN(SYSDATE,DateofBirth)/12) AS Age
FROM employee
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE,DateofBirth)/12) > 25;

-- Oldest Employee
SELECT *
FROM employee
WHERE DateofBirth=(SELECT MIN(DateofBirth) FROM employee);

-- Youngest Employee
SELECT *
FROM employee
WHERE DateofBirth=(SELECT MAX(DateofBirth) FROM employee);

-- Max Salary Department Wise
SELECT DepartmentName, MAX(Salary) AS MaxSalary
FROM employee
GROUP BY DepartmentName;

-- Employees acting as Managers
SELECT FirstName
FROM employee
WHERE EmployeeID IN (
SELECT ManagerID FROM employee
);

-- Insert Recent Employee
INSERT INTO employee (
EmployeeID,FirstName,LastName,Gender,DateofBirth,
Designation,DepartmentName,ManagerId,JoinedDate,Salary
)
VALUES (
'0012','Anil','Karki','M',
TO_DATE('1998-09-18','YYYY-MM-DD'),
'Accountant','Finance','0010',
TO_DATE('2024-02-10','YYYY-MM-DD'),
700000
);

-- Most Recently Joined Employee
SELECT *
FROM employee
WHERE JoinedDate=(SELECT MAX(JoinedDate) FROM employee);