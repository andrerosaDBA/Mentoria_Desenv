
Use AdventureWorks2025;
go


--1- Classifique os comandos abaixo como DDL, DML ou DCL:

CREATE TABLE Teste (ID INT);
SELECT * FROM Production.Product;
UPDATE Production.Product SET ListPrice = 100 WHERE ProductID = 1;
GRANT SELECT ON Production.Product TO UsuarioTeste;
DELETE FROM Production.Product WHERE ProductID = 1;
ALTER TABLE Teste ADD Nome VARCHAR(50);
