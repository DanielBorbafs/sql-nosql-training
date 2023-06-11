/* 
OBS: dados ficticios apenas para testar a modelagem de dados.
*/

/* 1 - Inserindo um livro no catálogo*/
insert into livros values(1, 'A Cabana', 'George Bech', 'Suspense');

/* 2 - Inserindo a quantidade do livro no catálogo no estoque */
insert into estoque_geral values(1,20);

/* 3 - inserindo um cliente da loja */
insert into clientes values(1, 'Marcello', 'M', 23);

/* 4 - inserindo um endereço para o cliente.*/

insert into endereco values(1, 'ES', 'vitoria', 'São Domingos', '589', 'lima pacheco','proximo ao banco brasil');

/* 5- armazenando uma compra feita pelo cliente*/
insert into vendas values (1, 1, 1, '2023-06-11', 30.50);

/*
 testando um select

*/
SELECT v.venda_id as IdVenda, c.nome AS cliente, v.valor, l.titulo AS livro
FROM vendas v
JOIN clientes c ON v.client_id = c.client_id
JOIN livros l ON v.livro_id = l.livro_id;

/* abaixo vamos selecionar os campos que queremos,
como se trata de tabelas distintas deveremos apelidar
cada campo com a primeira inicial da tabela.
exemplo: v.venda_id é o campo da tabela venda, por isso
o 'v' na frente e assim por diante, já a especificação
'as' seria o apelido que vamos dar a tabela
quando a query for mostrada ao usuário.
exemplo: c.nome que é um dado da tabela cliente
 foi apelidada de cliente então irá mostrar 'cliente'
 como nome da coluna.
*/
select v.venda_id as idvenda, c.nome as cliente, v.valor, l.titulo as livro, e.estado as estado
from vendas v
join clientes c on v.client_id = c.client_id
join livros l on v.livro_id= l.livro_id
join endereco e on v.client_id = c.client_id;

/* Essa query mostra dados de uma venda, a mesma puxa informações
referente a venda, fica assim:
*/
+---------+----------+-------+----------+--------+
| idvenda | cliente  | valor | livro    | estado |
+---------+----------+-------+----------+--------+
|       1 | Marcello | 30.50 | A Cabana | ES     |
+---------+----------+-------+----------+--------+
