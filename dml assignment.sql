INSERT INTO Department VALUES
(1,'HR','Kathmandu'),
(2,'IT','Pokhara'),
(3,'Finance','Lalitpur'),
(4,'Marketing','Bhaktapur'),
(5,'Support','Chitwan');

UPDATE Employee
SET Salary = Salary * 1.10
WHERE EmpID = 102;

DELETE FROM Project
WHERE ProjectID = 5;