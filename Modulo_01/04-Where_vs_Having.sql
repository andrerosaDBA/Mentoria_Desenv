use AdventureWorks2025;
go

-- A primeira consulta tenta filtrar os resultados usando a cláusula WHERE com uma função de agregação (SUM), 
--o que resulta em um erro de sintaxe, pois a função de agregação não pode ser usada diretamente na cláusula WHERE.
SELECT 
    p.Name,
    SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail sod
INNER JOIN Production.Product p
    ON sod.ProductID = p.ProductID
WHERE SUM(sod.LineTotal) > 100000
GROUP BY p.Name;

SELECT 
    p.Name,
    SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail sod
INNER JOIN Production.Product p
    ON sod.ProductID = p.ProductID
GROUP BY p.Name
HAVING SUM(sod.LineTotal) > 100000
ORDER BY TotalSales DESC;


--Consulta para comparar o uso de WHERE e HAVING, onde a primeira consulta filtra os resultados antes da agregação,
SELECT 
    TerritoryID,
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2023-01-01'
GROUP BY TerritoryID;


SELECT 
    TerritoryID,
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY TerritoryID
HAVING SUM(TotalDue) > 5000000;


--Consulta que utiliza a cláusula HAVING para filtrar os resultados agregados, 
--contando o número de pedidos e somando o total de vendas por território, 
--e filtrando apenas os territórios com mais de 50 pedidos.
SELECT 
    TerritoryID,
    COUNT(*) AS OrderCount,
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
WHERE Status = 5
GROUP BY TerritoryID
HAVING COUNT(*) > 50
ORDER BY TotalSales DESC;
