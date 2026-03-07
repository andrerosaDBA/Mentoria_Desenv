use AdventureWorks2025;
go

--JOIN - retornar os clientes que possuí pedidos, ordenados por ID do cliente.
SELECT c.CustomerID,
       soh.SalesOrderID,
       soh.OrderDate
FROM Sales.Customer As c INNER JOIN Sales.SalesOrderHeader As soh ON c.CustomerID = soh.CustomerID
ORDER BY c.CustomerID;


--LEFT JOIN - retorna todos os clientes, mesmo que não tenham pedidos, ordenados por ID do cliente.
SELECT c.CustomerID,
       soh.SalesOrderID,
       soh.OrderDate
FROM Sales.Customer As c LEFT JOIN Sales.SalesOrderHeader As soh ON c.CustomerID = soh.CustomerID
ORDER BY c.CustomerID;


--RIGHT JOIN - retorna todos os pedidos, mesmo que não tenham cliente correspondente, ordenados por ID do cliente.
SELECT c.CustomerID,
       soh.SalesOrderID,
       soh.OrderDate
FROM Sales.Customer As c RIGHT JOIN Sales.SalesOrderHeader As soh ON c.CustomerID = soh.CustomerID
ORDER BY soh.SalesOrderID;


--FULL OUTER JOIN - retorna todos os clientes e todos os pedidos, mesmo que não tenham correspondência, ordenados por ID do cliente.
SELECT c.CustomerID,
       soh.SalesOrderID,
       soh.OrderDate
FROM Sales.Customer As c FULL OUTER JOIN Sales.SalesOrderHeader As soh ON c.CustomerID = soh.CustomerID
ORDER BY c.CustomerID;

-- CROSS JOIN - retorna o produto cartesiano entre clientes e pedidos, ordenados por ID do cliente.
SELECT c.CustomerID,
       soh.SalesOrderID
FROM Sales.Customer As c CROSS JOIN Sales.SalesOrderHeader As soh;

--SELF JOIN - retorna os clientes que possuem mais de um pedido, ordenados por ID do cliente.
SELECT A.CustomerID,
       A.SalesOrderID AS Pedido1,
       B.SalesOrderID AS Pedido2
FROM Sales.SalesOrderHeader As A INNER JOIN Sales.SalesOrderHeader As B ON A.CustomerID = B.CustomerID
                                                                       AND A.SalesOrderID < B.SalesOrderID
ORDER BY A.CustomerID;