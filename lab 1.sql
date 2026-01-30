#1 create database dhemp;
use dhemp;
#create an employee table with appropriate data types and constraints for employee details
create table employee(
            EmployeeID varchar(20) NOT NULL PRIMARY KEY,
            FIRSTNAME varchar(20),
            lastname varchar(20)
            Gender char(1),
            dateofbirth date,
            designation varchar(50),
            departmentname varchar(20),
            managerid varchar(20),
            joineddate data,
            salary decimal(10,0)
);