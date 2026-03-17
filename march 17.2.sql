-- write a transaction that transfer
--  rs 5000 from ram's account to shyam accounts


START TRANSACTION;

-- Deduct 5000 from Ram's account
UPDATE accounts
SET balance = balance - 5000
WHERE account_holder = 'ram';

-- Add 5000 to Shyam's account
UPDATE accounts
SET balance = balance + 5000
WHERE account_holder = 'shyam';

COMMIT;

-- View updated balances
SELECT * FROM accounts;