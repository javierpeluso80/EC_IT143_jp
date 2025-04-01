/*
Script: EC_IT143_6.3_fwt_s4_jp.sql
Step 4 - Create AFTER UPDATE Trigger
Author: Javier Peluso
Date: 2025-04-01
*/
USE [EC_IT143_DA];
GO

CREATE OR ALTER TRIGGER tr_UpdateCustomerAudit
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE c
    SET 
        c.LastModifiedBy = SUSER_SNAME(),
        c.LastModifiedDate = GETDATE()
    FROM dbo.t_w3_schools_customers c
    INNER JOIN inserted i ON c.CustomerID = i.CustomerID;
END;
