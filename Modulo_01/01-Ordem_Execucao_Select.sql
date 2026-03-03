USE AdventureWorks2025;
GO

/*
    Para demonstrar a ordem de processamento das cláusulas em uma consulta SQL, vamos comparar 
    duas consultas que tentam filtrar os resultados com base em uma função de agregação (SUM) e 
    como corrigir esse erro usando a cláusula HAVING.
    Na primeira consulta, o erro ocorre porque a cláusula WHERE é processada antes do GROUP BY, 
    e a função de agregação SUM(sod.LineTotal) não pode ser usada diretamente na cláusula WHERE. 
     O SQL Server não reconhece TotalSales como uma coluna válida nesse contexto, resultando em um erro de sintaxe.
*/
SELECT 
    p.Name,
    SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail sod
INNER JOIN Production.Product p
    ON sod.ProductID = p.ProductID
WHERE TotalSales > 100000
GROUP BY p.Name;

SELECT 
    p.Name,
    SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail sod
INNER JOIN Production.Product p
    ON sod.ProductID = p.ProductID
WHERE SUM(sod.LineTotal) > 100000
GROUP BY p.Name;


/*
A segunda consulta corrige esse erro usando a cláusula HAVING, que é processada após o GROUP BY, 
permitindo filtrar os resultados agregados corretamente.
*/
SELECT p.Name AS ProductName,
       SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail As sod  INNER JOIN Sales.SalesOrderHeader As soh ON sod.SalesOrderID = soh.SalesOrderID
                                    INNER JOIN Production.Product As p ON sod.ProductID = p.ProductID
WHERE YEAR(soh.OrderDate) = 2023
GROUP BY p.Name
HAVING SUM(sod.LineTotal) > 100000
ORDER BY TotalSales DESC;

/*Teste */