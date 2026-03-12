SELECT *
FROM Employee
WHERE Salary > 50000;

SELECT FirstName, LastName, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT FirstName, LastName
FROM Employee
WHERE DeptID = (
    SELECT DeptID
    FROM Department
    WHERE DeptName = 'IT'
);

SELECT DeptID, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY DeptID;

SELECT *
FROM Employee
WHERE HireDate > '2022-01-01';


-- part d 

SELECT e.FirstName, e.LastName, d.DeptName
FROM Employee e
JOIN Department d
ON e.DeptID = d.DeptID;

SELECT e.FirstName, e.LastName, p.ProjectName
FROM Employee e
JOIN Works_On w ON e.EmpID = w.EmpID
JOIN Project p ON w.ProjectID = p.ProjectID;


SELECT p.ProjectName, SUM(w.HoursWorked) AS TotalHours
FROM Project p
JOIN Works_On w ON p.ProjectID = w.ProjectID
GROUP BY p.ProjectName;


-- part e
SELECT DeptID, AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY DeptID;

SELECT DeptID, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY DeptID
ORDER BY TotalEmployees DESC
LIMIT 1;

SELECT FirstName, LastName, Salary
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);


-- group f
CREATE VIEW HighSalaryEmployee AS
SELECT *
FROM Employee
WHERE Salary > 60000;

CREATE INDEX idx_lastname
ON Employee (LastName);