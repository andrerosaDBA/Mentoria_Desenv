use AdventureWorks2025;
go

--CROSS APPLY - retorna os clientes e seus pedidos mais recentes, ordenados por ID do cliente.

SELECT 
    c.CustomerID,
    LastOrder.SalesOrderID,
    LastOrder.OrderDate,
    LastOrder.TotalDue
FROM Sales.Customer As c CROSS APPLY (
                                        SELECT TOP 1
                                            soh.SalesOrderID,
                                            soh.OrderDate,
                                            soh.TotalDue
                                        FROM Sales.SalesOrderHeader soh
                                        WHERE soh.CustomerID = c.CustomerID
                                        ORDER BY soh.OrderDate DESC
                                    ) AS LastOrder
ORDER BY c.CustomerID;


--OUTER APPLY - retorna os clientes e seus pedidos mais recentes, incluindo clientes sem pedidos, ordenados por ID do cliente.
--Funciona como um LEFT JOIN com subquery correlacionada.
SELECT 
    c.CustomerID,
    LastOrder.SalesOrderID,
    LastOrder.OrderDate,
    LastOrder.TotalDue
FROM Sales.Customer As c  OUTER APPLY (
                                           SELECT TOP 1
                                               soh.SalesOrderID,
                                               soh.OrderDate,
                                               soh.TotalDue
                                           FROM Sales.SalesOrderHeader soh
                                           WHERE soh.CustomerID = c.CustomerID
                                           ORDER BY soh.OrderDate DESC
                                       ) AS LastOrder
ORDER BY c.CustomerID;


;WITH CTE AS (
                SELECT 
                    CustomerID,
                    SalesOrderID,
                    OrderDate,
                    TotalDue,
                    ROW_NUMBER() OVER (
                        PARTITION BY CustomerID 
                        ORDER BY OrderDate DESC
                    ) AS RN
                FROM Sales.SalesOrderHeader
            )
SELECT 
    c.CustomerID,
    cte.SalesOrderID,
    cte.OrderDate,
    cte.TotalDue
FROM Sales.Customer As c LEFT JOIN CTE cte ON c.CustomerID = cte.CustomerID
WHERE cte.RN = 1;