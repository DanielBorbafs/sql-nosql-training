
-- Criando as tabelas ---
CREATE TABLE CLIENTES (
	idCliente int primary key identity,
	nome varchar(50),
	idade int,
)
GO

CREATE TABLE PEDIDOS (
	idpedido int primary key identity,
	produto varchar(50),
	valor money,
	idcliente int
)
GO
-- Atribuindo as chaves estrangeiras 
alter table pedidos 
add constraint fk_pedido_cliente
foreign key (idcliente)
references clientes(idcliente)
go

-- inserindo dados
insert into clientes values ( 'Daniel', '22')
INSERT INTO clientes (nome, idade)
VALUES ('Daniel', '22'),
       ('Maria', '28'),
       ('João', '25'),
       ('Ana', '30'),
       ('Pedro', '27'),
       ('Laura', '23'),
       ('Carlos', '29'),
       ('Lúcia', '24'),
       ('Rafael', '26'),
       ('Isabela', '31');

go

/* insert pedidos */
INSERT INTO pedidos (produto, valor, idCliente)
VALUES ('Fone de ouvido', 2200.00, 2),
       ('Mouse', 80.50, 3),
       ('Teclado', 120.00, 4),
       ('Monitor', 800.00, 5),
       ('Notebook', 2500.00, 6),
       ('Impressora', 350.00, 7),
       ('Cadeira Gamer', 500.00, 2),
       ('Webcam', 100.00, 3),
       ('Mousepad', 30.00, 4),
       ('Roteador', 80.00, 5);

go


/* querys */

--Escreva uma consulta que retorne os nomes dos clientes e o total gasto por cada um.

select clientes.nome,sum(pedidos.valor)as Gasto_Total
from clientes
inner join pedidos on pedidos.idcliente = clientes.idcliente
group by clientes.nome
go
