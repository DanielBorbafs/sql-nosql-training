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

