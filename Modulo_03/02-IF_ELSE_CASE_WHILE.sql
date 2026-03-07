Use AdventureWorks2025;
go

DECLARE @CustomerID INT = 11000;
DECLARE @TotalPedidos INT;

SELECT 
    @TotalPedidos = COUNT(*)
FROM Sales.SalesOrderHeader
WHERE CustomerID = @CustomerID;

-- IF / ELSE
IF @TotalPedidos > 5
BEGIN
    PRINT 'Cliente com muitos pedidos';
END
ELSE
BEGIN
    PRINT 'Cliente com poucos pedidos';
END;

-- CASE em consulta
SELECT 
    SalesOrderID,
    TotalDue,
    CASE 
        WHEN TotalDue < 1000 THEN 'Pedido pequeno'
        WHEN TotalDue BETWEEN 1000 AND 5000 THEN 'Pedido médio'
        ELSE 'Pedido grande'
    END AS CategoriaPedido
FROM Sales.SalesOrderHeader;

-- WHILE
DECLARE @Contador INT = 1;

WHILE @Contador <= 5
BEGIN
    PRINT 'Execução número: ' + CAST(@Contador AS VARCHAR);
    SET @Contador = @Contador + 1;
END;