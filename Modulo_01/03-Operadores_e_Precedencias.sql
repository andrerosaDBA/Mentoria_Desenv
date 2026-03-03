
Use AdventureWorks2025;
go

SELECT 
    ProductID,
    ListPrice,
    (ListPrice - 10) * 2 AS CalculatedValue
FROM Production.Product;


--Como o SQL interpreta isso?
SELECT *
FROM Sales.SalesOrderHeader
WHERE Status = 1
OR TerritoryID = 5
AND TotalDue > 10000;




SELECT *
FROM Sales.SalesOrderHeader
WHERE (Status = 1 OR TerritoryID = 5)
AND TotalDue > 10000;


SELECT *
FROM Production.Product
WHERE ListPrice > 100
AND StandardCost < 500
OR Color = 'Red';


SELECT *
FROM Production.Product
WHERE ( ListPrice > 100 AND StandardCost < 500 )
OR Color = 'Red';

SELECT *
FROM Production.Product
WHERE ListPrice > 100 
  AND ( StandardCost < 500 OR Color = 'Red' );


SELECT *
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
AND Status = 5
OR OnlineOrderFlag = 1;