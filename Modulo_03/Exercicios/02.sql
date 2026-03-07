Use AdventureWorks2025;
go

/*

****Objetivo:
Classificar dados usando CASE.

****Enunciado

Crie uma consulta na tabela: Sales.SalesOrderHeader

que retorne: SalesOrderID e TotalDue

E uma nova coluna chamada: CategoriaPedido

***Classifique os pedidos da seguinte forma:

------------------------------------
|TotalDue			|Categoria	   |
|----------------------------------|
|menor que 1000		|Pedido pequeno|
|entre 1000 e 5000	|Pedido médio  |
|maior que 5000		|Pedido grande |
------------------------------------
*/