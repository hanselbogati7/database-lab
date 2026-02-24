-- Select database
USE dbemp;

-- Create original DEPT table
CREATE TABLE dept (
    DEPTNO INT,
    DNAME VARCHAR(20),
    LOC VARCHAR(20)
);

-- 1. Rename table dept to department
RENAME TABLE dept TO department;

-- 2. Add new column PINCODE with NOT NULL constraint
ALTER TABLE department
ADD PINCODE INT NOT NULL;

-- 3. Rename column DNAME to DEPT_NAME
ALTER TABLE department
RENAME COLUMN DNAME TO DEPT_NAME;

-- 4. Change datatype of LOC to CHAR(10)
ALTER TABLE department
MODIFY LOC CHAR(10);

-- 5. Drop column PINCODE
ALTER TABLE department
DROP COLUMN PINCODE;

-- 6. Delete table
DROP TABLE department;