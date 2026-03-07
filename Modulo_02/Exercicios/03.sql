use AdventureWorks2025;
go

/*

**** Objetivo:
Aprender o que é uma subquery simples.

**** Enunciado

Liste os pedidos cujo valor total seja maior que a média de todos os pedidos do sistema.

**** Tabela a ser usada:

Sales.SalesOrderHeader

**** A consulta deve retornar:

SalesOrderID

CustomerID

TotalDue

**** Regras

A média deve ser calculada usando uma subquery.

Não usar CTE.

Não usar JOIN.

**** Dica

Primeiro descubra qual é a média dos pedidos:

SELECT AVG(TotalDue)
FROM Sales.SalesOrderHeader;

Depois use esse valor dentro da consulta principal.


****Perguntas para reflexão

1️⃣ A subquery executa quantas vezes?
2️⃣ O valor da média muda para cada linha?

*/