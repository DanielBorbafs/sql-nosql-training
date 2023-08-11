-- INSERINDO DADOS ----
-- Clientes
insert into cliente values ( 'Daniel', 'contatodaniel@ig.com', '27998788','23', 'M','ES')
go
insert into cliente values ( 'Caua','caua123@gmail.com', '9987887', '18', 'M', 'ES')
go
-- PRODUTOS 
insert into estoque values ('GOW Ragnarok', 149.90, 30)
go
insert into estoque values ('GTA V', 120, 20)
go

-- VENDAS 
INSERT INTO vendas (quantidadeProduto, valorTotal, idCliente, idProduto)
VALUES (1, 1200, 1,1)
go

select * from vendas 

select * from estoque
