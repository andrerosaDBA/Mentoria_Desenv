use AdventureWorks2025;
go

--LEFT JOIN - retorna todos os clientes, mesmo que não tenham pedidos, ordenados por ID do cliente.
SELECT 
    c.CustomerID,
    soh.SalesOrderID
FROM Sales.Customer As c LEFT JOIN Sales.SalesOrderHeader As soh ON c.CustomerID = soh.CustomerID
ORDER BY c.CustomerID;


--LEFT JOIN com filtro para trazer apenas os clientes que não possuem pedidos, ordenados por ID do cliente.
SELECT 
    c.CustomerID
FROM Sales.Customer As c LEFT JOIN Sales.SalesOrderHeader As soh ON c.CustomerID = soh.CustomerID
WHERE soh.CustomerID IS NULL
ORDER BY c.CustomerID;


--NOT EXISTS - retorna os clientes que não possuem pedidos, ordenados por ID do cliente.
SELECT 
    c.CustomerID
FROM Sales.Customer As c
WHERE NOT EXISTS (
                    SELECT 1
                    FROM Sales.SalesOrderHeader soh
                    WHERE soh.CustomerID = c.CustomerID
                )
ORDER BY c.CustomerID;