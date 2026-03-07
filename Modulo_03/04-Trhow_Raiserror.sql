Use AdventureWorks2025;
go

DECLARE @TotalPedidos INT;

SELECT 
    @TotalPedidos = COUNT(*)
FROM Sales.SalesOrderHeader
WHERE CustomerID = 11000;

IF @TotalPedidos = 0
BEGIN
    THROW 50001, 'Cliente não possui pedidos.', 1;
END;
ELSE
BEGIN
    RAISERROR('Cliente possui pedidos cadastrados.', 10, 1);
END;