/* inserindo os dados */

-- Inserir dados na tabela endereco
INSERT INTO endereco (cep, rua, logradouro, estado)
VALUES ('12345-678', 'Rua Exemplo', 123, 'SP');
go

-- Inserir dados na tabela contato
INSERT INTO contato (tipo, numero)
VALUES ('Telefone', '(11) 1234-5678');
go


-- Inserir dados na tabela categorias
INSERT INTO categorias (nomecategoria, descricao)
VALUES ('Eletrônicos', 'Produtos eletrônicos em geral');


-- Inserir dados na tabela produtos
INSERT INTO produtos (nomeproduto, preco, estoque, fk_categoriaid)
VALUES ('Smartphone', 999.99, 50, 1); 
go

-- Inserir dados na tabela clientes com referências às tabelas enderec
INSERT INTO clientes (nomecliente, email, fk_contatoid, fk_endereco)
VALUES ('João da Silva', 'joao@example.com', 2, 2);
go

-- Inserir dados na tabela pedidos
INSERT INTO pedidos (datapedido, statuspedido, fk_clienteid)
VALUES ('2023-09-20', 'Em processamento', 5); -- Supondo que o ID do cliente seja 1
go

select * from clientes
go

-- Inserir dados na tabela detalhespedido
INSERT INTO detalhespedido (quantidade, precounitario, fk_pedido, fk_produto)
VALUES (2, 199.99, 2, 1); -- Supondo que o ID do pedido e o ID do produto sejam 1
go

select * from detalhespedido;
