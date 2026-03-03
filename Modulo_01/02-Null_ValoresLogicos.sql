
use AdventureWorks2025
go

--Pesquisa por valores nulos, o SQL interpreta o valor "NULL" como texto, 
--fazendo uma conversão implícita e retornando um resultado vazio, pois não há registros com o valor "NULL" como texto.
SELECT MiddleName , *
FROM Person.Person
WHERE MiddleName = NULL;

--Pesquisa por valores nulos, não há registros com o valor "NULL" como texto.
SELECT MiddleName , *
FROM Person.Person
WHERE MiddleName = 'NULL';


--Pesquisa por valores vazios 
SELECT MiddleName , *
FROM Person.Person
WHERE MiddleName = '';


--Pesquisa com "bug"
SELECT *
FROM Production.Product
WHERE ProductID NOT IN (1, 2, NULL);


--Pesquisa correta para valores nulos, utilizando "IS NULL" para verificar se o valor é nulo.
SELECT MiddleName , *
FROM Person.Person
WHERE MiddleName is NULL;


--Validação de valores lógicos com NULL, utilizando "CASE" para verificar as condições e retornar resultados específicos.
SELECT 
    CASE WHEN NULL = NULL THEN 'TRUE' ELSE 'NOT TRUE' END AS Result1,
    CASE WHEN NULL <> NULL THEN 'TRUE' ELSE 'NOT TRUE' END AS Result2,
    CASE WHEN NULL IS NULL THEN 'TRUE' ELSE 'NOT TRUE' END AS Result3;