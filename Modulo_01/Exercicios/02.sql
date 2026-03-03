Use AdventureWorks2025;
go


--Analise a query abaixo:

SELECT 
    p.Color,
    COUNT(*) AS TotalProducts
FROM Production.Product p
WHERE TotalProducts > 10
GROUP BY p.Color;


--Vai funcionar?

--Se não, por quê?

--Corrija a query.

