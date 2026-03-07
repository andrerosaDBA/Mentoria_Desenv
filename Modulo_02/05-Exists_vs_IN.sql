use AdventureWorks2025;
go

SELECT c.CustomerID
FROM Sales.Customer As c
WHERE EXISTS (
                SELECT 1
                FROM Sales.SalesOrderHeader soh
                WHERE soh.CustomerID = c.CustomerID
            )
ORDER BY c.CustomerID;


SELECT CustomerID
FROM Sales.Customer
WHERE CustomerID IN (
                        SELECT CustomerID
                        FROM Sales.SalesOrderHeader
                    )
ORDER BY CustomerID;