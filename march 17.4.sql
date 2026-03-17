-- write the transaction that demonstrate the used 
-- of saved point while updating account balance

START TRANSACTION;

-- Step 1: Deduct 5000 from Ram
UPDATE accounts
SET balance = balance - 5000
WHERE account_holder = 'ram';

-- Create a savepoint after first update
SAVEPOINT after_ram;

-- Step 2: Add 5000 to Shyam
-- write the transaction that demonstrate the used of 
-- saved point while updating account balance


UPDATE accounts
SET balance = balance + 5000
WHERE account_holder = 'shyam';

-- Create another savepoint
SAVEPOINT after_shyam;

-- Step 3: Add 2000 to Sita (mistaken operation)
UPDATE accounts
SET balance = balance + 2000
WHERE account_holder = 'sita';

-- Oops! Something went wrong 😬
-- Rollback only to the second savepoint

ROLLBACK TO after_shyam;

-- Commit remaining valid changes
COMMIT;


-- check result 
 select * from account;
 insert into employee values (1, "ram", 8000);
 insert into employee Values (2, "shyam", 15000);
 SELECT * FROM employee;
 
-- create table salry_log( 
-- log_id int auto_increment primary key,
-- emp_id int,
-- old_salary decimal(10,2),
-- new_salary decimal(10,2),
-- updated_at timestamp default current_timestamp)
#create a before insert trigger on employees that prevents inserting employees whose salary is less than 1000
# delimiter $$  create trigger
# check_salary 
#brefore insert on employees
 #for each 
 #begin
 #if new.salary<10000 then 
 # signal sqlstate'45000'
 #set message_text = 'salary must be aleast 10000';
 #end if
 #end $$
 #Delimiter;
 /* create an after update trigger on employees that records salary charges into the salary_log table
 delimiter $$
 create triggers  log_salary_update
 after update on employee
 for each row 
 begin
 insert into salary_log(emp_id,old_salary,new_salary);
 values(old.emp_id,old.salary,new.salary);
 end$$
 Delimiter;
 

 #1 create a stored procedure that retrieves all records from the employees table
 Delimiter $$
 create procedure getEmployee()
 begin 
 Select * from employees;
 end
 $$ 
 Delimiter;
 call getEmployees();
 
 #2 create a srored procedure that insert a new employee into the employees table using parameters.
 Delimiter $$
 create procedure andEmployee(
 in p_int, in p_name varchar(100),
 in p_salary decimal(10,2))
 begin 
 insert into emloyees
 values(p_id,p_name,p_salary);
 end $$
 Delimiter ;
 call addEmployee(5,'hari',20000);
 
 #3 create a stored procedure that updates the salary of an employee based on employee id.
 
DELIMITER //

CREATE PROCEDURE update_salary(
    IN p_emp_id INT,
    IN p_new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE employees
    SET salary = p_new_salary
    WHERE emp_id = p_emp_id;
END //

DELIMITER ;

# create a stored procedure that transfers money between two accounts using a transaction
DELIMITER //

CREATE PROCEDURE transfer_money(
    IN p_from_account INT,
    IN p_to_account INT,
    IN p_amount DECIMAL(10,2)
)
BEGIN
    START TRANSACTION;

    -- Deduct amount from sender (only if sufficient balance)
    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_from_account
      AND balance >= p_amount;

    -- Check if deduction was successful
    IF ROW_COUNT() = 0 THEN
        ROLLBACK;
    ELSE
        -- Add amount to receiver
        UPDATE accounts
        SET balance = balance + p_amount
        WHERE account_id = p_to_account;

        COMMIT;
    END IF;

END //
DELIMITER ;


