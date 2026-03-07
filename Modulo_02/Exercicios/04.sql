use AdventureWorks2025;
go

/*

**** Objetivo:
Entender que o APPLY permite executar uma consulta para cada linha da tabela principal.

**** Cenário do exercício

Queremos descobrir:

Qual foi o pedido mais recente de cada cliente.


**** Tabelas utilizadas

Sales.Customer
Sales.SalesOrderHeader


**** Resultado esperado

A consulta deve retornar:

CustomerID

SalesOrderID

OrderDate

Mostrando o pedido mais recente de cada cliente.


**** Regras

1️- Use CROSS APPLY.

2️- Dentro do APPLY, utilize:

TOP 1

3- Ordene por:

OrderDate DESC


**** Dica

Dentro do APPLY, filtre os pedidos do cliente atual.

Algo parecido com:

WHERE CustomerID = c.CustomerID

*/