-- Create database
CREATE DATABASE bankdb;

-- Use the database
USE bankdb;

-- Create accounts table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL
);