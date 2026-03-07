use AdventureWorks2025;
go

-- DISTINCT - "Remove" duplicidade no resultado.
--Obs: Não resolve problema estrutural, apenas “esconde” duplicação
SELECT DISTINCT
    c.CustomerID
FROM Sales.Customer As c INNER JOIN Sales.SalesOrderHeader As soh ON c.CustomerID = soh.CustomerID;


-- GROUP BY - Agrupa os resultados por um ou mais campos, eliminando duplicidade.
SELECT 
    c.CustomerID
FROM Sales.Customer As c INNER JOIN Sales.SalesOrderHeader As soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID;


-- ROW_NUMBER() - Atribui um número sequencial a cada linha dentro de uma partição de um conjunto de resultados, permitindo identificar e eliminar duplicidade.
WITH PedidosOrdenados AS (
                            SELECT CustomerID,
                                   SalesOrderID,
                                   OrderDate,
                                   ROW_NUMBER() OVER (
                                                       PARTITION BY CustomerID
                                                       ORDER BY OrderDate DESC
                                                     ) AS RN
                            FROM Sales.SalesOrderHeader
                        )
SELECT CustomerID,
       SalesOrderID,
       OrderDate
FROM PedidosOrdenados
WHERE RN = 1;


-- EXISTS - Verifica a existência de registros relacionados, eliminando duplicidade.
SELECT c.CustomerID
FROM Sales.Customer As c
WHERE EXISTS (
                SELECT 1
                FROM Sales.SalesOrderHeader soh
                WHERE soh.CustomerID = c.CustomerID
            );


--COUNT + HAVING - Conta o número de registros relacionados e filtra com base nessa contagem, eliminando duplicidade.
SELECT CustomerID,
       COUNT(*) AS Qtde
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(*) > 1;


-- INSERT - Evita erro de chave duplicada.
INSERT INTO Sales.Customer (CustomerID, AccountNumber)
    SELECT 99999, 'TESTE-99999'
    WHERE NOT EXISTS (
                        SELECT 1
                        FROM Sales.Customer
                        WHERE CustomerID = 99999
                    );