use AdventureWorks2025;
go


--Subquery - retorna os clientes que possuem vendas totais acima da média, ordenados por total de vendas.
SELECT c.CustomerID,
       SUM(soh.TotalDue) AS TotalVendas
FROM Sales.Customer As c INNER JOIN Sales.SalesOrderHeader As soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID
HAVING SUM(soh.TotalDue) > (
                                SELECT AVG(TotalCliente)
                                FROM (
                                         SELECT SUM(TotalDue) AS TotalCliente
                                         FROM Sales.SalesOrderHeader
                                         GROUP BY CustomerID
                                     ) AS Sub
                            )
ORDER BY TotalVendas DESC;


--CTE - retorna os clientes que possuem vendas totais acima da média, ordenados por total de vendas.
WITH TotalPorCliente AS (
                            SELECT 
                                CustomerID,
                                SUM(TotalDue) AS TotalVendas
                            FROM Sales.SalesOrderHeader
                            GROUP BY CustomerID
                        ),
        MediaGeral AS (
                        SELECT AVG(TotalVendas) AS MediaVendas
                        FROM TotalPorCliente
                      )
SELECT 
    t.CustomerID,
    t.TotalVendas
FROM TotalPorCliente As t CROSS JOIN MediaGeral As m
WHERE t.TotalVendas > m.MediaVendas
ORDER BY t.TotalVendas DESC;


--Query mais simples, mesmo PE.

--Subquery - retorna os pedidos com TotalDue acima da média, ordenados por TotalDue.
SELECT *
FROM Sales.SalesOrderHeader
WHERE TotalDue > (
                    SELECT AVG(TotalDue)
                    FROM Sales.SalesOrderHeader
                 );


--CTE - retorna os pedidos com TotalDue acima da média, ordenados por TotalDue.
;WITH MediaPedidos AS (
                        SELECT AVG(TotalDue) AS Media
                        FROM Sales.SalesOrderHeader
                     )
SELECT *
FROM Sales.SalesOrderHeader CROSS JOIN MediaPedidos
WHERE TotalDue > Media;

