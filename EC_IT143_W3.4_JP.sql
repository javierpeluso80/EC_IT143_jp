-- =============================================
-- EC_IT143_W3.4_JP
-- Author: Javier Peluso
-- Purpose: Answering 8 AdventureWorks questions using SQL
-- =============================================

-- Q1 Business User question—Marginal complexity
-- Question: What are the five cheapest products by list price?
-- Author: Francisco Meireles da Silva
-- Runtime Estimate: < 5s
SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice ASC;

-- Q2 Business User question—Marginal complexity
-- Question: Which employees have the job title "Sales Representative"?
-- Author: Francisco Meireles da Silva
-- Runtime Estimate: < 5s
SELECT FirstName, LastName, JobTitle
FROM HumanResources.Employee AS e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
WHERE JobTitle = 'Sales Representative';

-- Q3 Business User question—Moderate complexity
-- Question: Which salespersons exceeded $100,000 in total sales? Show their names and total amount sold.
-- Author: Francisco Meireles da Silva
-- Runtime Estimate: < 10s
SELECT p.FirstName, p.LastName, SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesPerson AS sp ON soh.SalesPersonID = sp.BusinessEntityID
JOIN Person.Person AS p ON sp.BusinessEntityID = p.BusinessEntityID
GROUP BY p.FirstName, p.LastName
HAVING SUM(soh.TotalDue) > 100000;

-- Q4 Business User question—Moderate complexity
-- Question: Which products with a list price over $2,000 belong to which categories? Show product name, category, and price.
-- Author: Francisco Meireles da Silva
-- Runtime Estimate: < 10s
SELECT p.Name AS ProductName, pc.Name AS Category, p.ListPrice
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory AS pc ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE p.ListPrice > 2000;

-- Q5 Business User question—Increased complexity
-- Question: Which vendors have supplied products with a total value over $1,000? Show vendor name, total value, and number of different products supplied.
-- Author: Francisco Meireles da Silva
-- Runtime Estimate: ~15s
SELECT v.Name AS VendorName,
       SUM(poh.UnitPrice * poh.OrderQty) AS TotalValue,
       COUNT(DISTINCT p.ProductID) AS ProductCount
FROM Purchasing.PurchaseOrderDetail AS poh
JOIN Purchasing.PurchaseOrderHeader AS pohd ON poh.PurchaseOrderID = pohd.PurchaseOrderID
JOIN Purchasing.Vendor AS v ON pohd.VendorID = v.BusinessEntityID
JOIN Production.Product AS p ON poh.ProductID = p.ProductID
GROUP BY v.Name
HAVING SUM(poh.UnitPrice * poh.OrderQty) > 1000;

-- Q6 Business User question—Increased complexity
-- Question: Which customers purchased more than 5 items in a single order? Show customer ID, order number, and total quantity ordered.
-- Author: Francisco Meireles da Silva
-- Runtime Estimate: ~10s
SELECT soh.CustomerID, soh.SalesOrderID, SUM(sod.OrderQty) AS TotalQuantity
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY soh.CustomerID, soh.SalesOrderID
HAVING SUM(sod.OrderQty) > 5;

-- Q7 Metadata question
-- Question: Which tables in the database contain a column named "ModifiedDate"?
-- Author: Francisco Meireles da Silva
-- Runtime Estimate: < 5s
SELECT DISTINCT TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ModifiedDate';

-- Q8 Metadata question
-- Question: Which columns in the database use the money data type? Show table name, column name, and data type.
-- Author: Francisco Meireles da Silva
-- Runtime Estimate: < 5s
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE DATA_TYPE = 'money';
