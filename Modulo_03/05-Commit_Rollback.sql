Use AdventureWorks2025;
go

BEGIN TRANSACTION;

UPDATE Sales.SalesOrderHeader
SET Comment = 'Atualização de teste'
WHERE SalesOrderID = 43659;

-- Verificando alteração
SELECT SalesOrderID, Comment
FROM Sales.SalesOrderHeader
WHERE SalesOrderID = 43659;

-- Escolha uma opção

-- CONFIRMAR alteração
COMMIT;

-- OU cancelar
-- ROLLBACK;