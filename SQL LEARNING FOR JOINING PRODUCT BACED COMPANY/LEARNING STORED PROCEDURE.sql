 --Stored Procedure Definition
--CREATE PROCEDURE ProcedureName AS
--BEGIN
 --SQL STATEMENT GO HERE


--END

--Stored Procedure execution cell
--EXEC ProcedureName

--TIP:
--ADD A SEMICOLON  ;
--AT THE END OF EACH SOL STATEMENT

--Step 1: Write a query 
--For US Customers Find the Total numbers of Customers and the average score

/*SELECT 
COUNT(*) TotalCustomers,
Avg(Score) Avgsales
FROM Sales.Customers
WHERE Country ='USA'*/

--Step 2: Turning a query into a stored procedure 
CREATE PROCEDURE GetCustomerSummary AS
BEGIN
SELECT 
	COUNT(*) TotalCustomers,
	Avg(Score) Avgsales
FROM Sales.Customers
WHERE Country ='USA'
END

--Step 3: Execute the stored Procedure

EXEC GetCustomerSummary

--PARAMETERS
--PLACEHOLDERS USED TO PASS VALUES AS INPUT FROM THE CALLER TO THE PROCEDURE , 
--ALLOWINFG DYNAMIC DATA TO BE PROCESSED

--FOR THE GERMAN CUSTOMERS FIND THE TOTAL NUMBER OF CUSTOMERS AND AVERAGE SCORE
CREATE PROCEDURE GetCustomerSummaryGermany AS
BEGIN
SELECT 
	COUNT(*) TotalCustomers,
	Avg(Score) Avgsales
FROM Sales.Customers
WHERE Country ='Germany'
END

EXEC GetCustomerSummaryGermany

--SELECT * FROM SALES.Customers

--AVOID REPETITION 

--IF YOU NOTICE REPEATED CODE IN YOUR PROJECT,IT'S A SIGN THAT YOUR CODE CAN BE IMPROVED\\


--DEFINE STORED PROCEDURE 

ALTER PROCEDURE GetCustomerSummary @Country NVARCHAR(50) ='USA'
AS
BEGIN
SELECT 
	COUNT(*) TotalCustomers,
	Avg(Score) Avgsales
FROM Sales.Customers
WHERE Country = @Country;

--FIND THE TOTAL NUMBER OF ORDERS AND TOTAL SALES

SELECT 
	COUNT(OrderID) TotalOrders,
	SUM(Sales) TotalSales
FROM Sales.Orders o
JOIN Sales.Customers c
ON c.CustomerID=o.CustomerID
WHERE c.Country = @Country;
END

EXEC GetCustomerSummary @Country = 'USA'
EXEC GetCustomerSummary @Country = 'Germany'

EXEC GetCustomerSummary

Drop Procedure GetCustomerSummaryGermany

--FIND THE TOTAL NUMBER OF ORDERS AND TOTAL SALES

SELECT * FROM Sales.Orders

SELECT * FROM Sales.Customers

SELECT 
	COUNT(OrderID) TotalOrders,
	SUM(Sales) TotalSales
FROM Sales.Orders o
JOIN Sales.Customers c
ON c.CustomerID=o.CustomerID
WHERE c.Country = 'USA'



