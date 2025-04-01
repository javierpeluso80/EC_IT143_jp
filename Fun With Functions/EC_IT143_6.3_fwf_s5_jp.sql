-- EC_IT143_6.3_fwf_s5_jp.sql
-- Step 5 – Create a scalar UDF to extract first name
USE EC_IT143_DA;
GO

IF OBJECT_ID('dbo.ufn_get_first_name', 'FN') IS NOT NULL
    DROP FUNCTION dbo.ufn_get_first_name;
GO

CREATE FUNCTION dbo.ufn_get_first_name (@FullName NVARCHAR(100))
RETURNS NVARCHAR(100)
AS
BEGIN
    RETURN SUBSTRING(@FullName, 1, CHARINDEX(' ', @FullName + ' ') - 1);
END;
GO
