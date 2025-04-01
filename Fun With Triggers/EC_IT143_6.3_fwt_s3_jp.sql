/*
Script: EC_IT143_6.3_fwt_s3_jp.sql
Step 3 - Fun With Triggers
Author: Javier Peluso
Date: 2025-04-01
Description: Drop and re-add columns to demonstrate trigger functionality from a clean state
*/


USE [EC_IT143_DA];
GO


IF COL_LENGTH('dbo.t_w3_schools_customers', 'LastModifiedBy') IS NOT NULL
BEGIN
    ALTER TABLE dbo.t_w3_schools_customers DROP COLUMN LastModifiedBy;
END
IF COL_LENGTH('dbo.t_w3_schools_customers', 'LastModifiedDate') IS NOT NULL
BEGIN
    ALTER TABLE dbo.t_w3_schools_customers DROP COLUMN LastModifiedDate;
END
GO

ALTER TABLE dbo.t_w3_schools_customers
ADD 
    LastModifiedBy VARCHAR(100),
    LastModifiedDate DATETIME;
GO
