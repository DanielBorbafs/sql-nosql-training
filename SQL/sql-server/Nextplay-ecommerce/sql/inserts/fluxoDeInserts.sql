-- clientes 
INSERT INTO CLIENTES VALUES(1, 'Marcos Souza', 'm_souza@gmail.com', '2198785217', 'RJ', 'M','1995-01-28','2025-01-01')
GO
INSERT INTO CLIENTES VALUES(2, 'Maria Souza', 'maria_souza@gmail.com', '2798785217', 'ES', 'F','1998-04-21','2025-01-01')
GO

-- Categorias
insert into categorias values(1, 'Notebooks')
go

-- Produtos
INSERT INTO produtos (produto_id, nome, descricao, preco, qtd_estoque, categoria_id)
VALUES (1, 'Notebook', 'Notebook de última geração', 3500.00, 10, 1);
go
INSERT INTO produtos (produto_id, nome, descricao, preco, qtd_estoque, categoria_id)
VALUES (2, 'Notebook Asus', 'Asus Machine v2', 3800.00, 5, 1);
go


-- Campanhas
INSERT INTO campanhas (campanhas_id, nome_campanha, categoria_desconto, porcentagem_desconto, data_inicio, data_fim)
VALUES (1, 'Mês dos Notebooks', 1, 10.00, '2025-01-01', '2025-01-10');
GO


-- Vendas
INSERT INTO vendas (vendas_id, cliente_id, data_venda, valor_total)
VALUES (1, 1, '2025-01-02', 3500.00)
GO
INSERT INTO vendas (vendas_id, cliente_id, data_venda, valor_total)
VALUES (2, 2, '2025-01-03', 3800.00)
GO


-- itens_vendas
INSERT INTO itens_vendas (item_id, venda_id, produto_id, quantidade, preco_unitario)
VALUES (1, 1, 1, 2, 3500.00)
GO
INSERT INTO itens_vendas (item_id, venda_id, produto_id, quantidade, preco_unitario)
VALUES (3, 2, 2, 1, 3800.00)
GO

