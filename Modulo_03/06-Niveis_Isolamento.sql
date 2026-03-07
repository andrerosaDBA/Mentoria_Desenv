Use AdventureWorks2025;
go

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRANSACTION;

SELECT *
FROM Sales.SalesOrderHeader
WHERE CustomerID = 11000;

COMMIT;

--Exemplo de leitura suja (dirty read), mudando o nível de isolamento para READ UNCOMMITTED.
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT *
FROM Sales.SalesOrderHeader;