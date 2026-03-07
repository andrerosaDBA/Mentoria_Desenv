Use AdventureWorks2025;
go

-- Declarando variáveis
DECLARE @CustomerID INT;
DECLARE @TotalPedidos INT;

-- Atribuindo valor à variável
SET @CustomerID = 11000;

-- Usando variável em consulta
SELECT 
    @TotalPedidos = COUNT(*)
FROM Sales.SalesOrderHeader
WHERE CustomerID = @CustomerID;

-- Exibindo resultado
PRINT 'CustomerID: ' + CAST(@CustomerID AS VARCHAR);
PRINT 'Total de pedidos: ' + CAST(@TotalPedidos AS VARCHAR);