
Use AdventureWorks2025;
go

--Analise a consulta:

SELECT *
FROM Sales.SalesOrderHeader
WHERE Status = 1
OR Status = 2
AND TotalDue > 5000;


--Como o SQL interpreta essa condição?

--Reescreva usando parênteses para:

--Trazer apenas pedidos com Status 1 ou 2 e TotalDue maior que 5000

