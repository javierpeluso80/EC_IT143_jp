/*
Script: EC_IT143_6.3_fwt_s5_jp.sql
Step 5 - Test trigger
Author: Javier Peluso
Date: 2025-04-01
*/

-- Update a record to test trigger
USE [EC_IT143_DA];
GO

UPDATE dbo.t_w3_schools_customers
SET City = 'Munich'
WHERE CustomerID = 1;

-- Check that audit columns were updated
SELECT * FROM dbo.t_w3_schools_customers;
