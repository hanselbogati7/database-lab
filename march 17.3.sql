-- write a transaction that transfer rs 10000from shyam's account to sita's 
-- account and demonstrate the use of ROLLBACk


START TRANSACTION;

-- Step 1: Deduct 10000 from Shyam
UPDATE accounts
SET balance = balance - 10000
WHERE account_holder = 'shyam';

-- Step 2: Add 10000 to Sita
UPDATE accounts
SET balance = balance + 10000
WHERE account_holder = 'sita';

-- Suppose something goes wrong here ❌
-- We cancel the transaction

ROLLBACK;