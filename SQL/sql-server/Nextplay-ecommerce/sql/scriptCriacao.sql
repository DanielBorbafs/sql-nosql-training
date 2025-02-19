CREATE DATABASE NEXTPLAY
GO

USE NEXTPLAY 
GO

CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(12) UNIQUE NOT NULL,
    uf CHAR(2) NOT NULL,
    genero CHAR(1),
    data_nascimento DATE NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE categorias (
    categoria_id INT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL
);

CREATE TABLE produtos (
    produto_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(MAX),
    preco DECIMAL(10, 2) NOT NULL,
    qtd_estoque INT NOT NULL,
    categoria_id INT NOT NULL,
    CONSTRAINT fk_produtos_categorias FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

CREATE TABLE vendas (
    vendas_id INT PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_venda DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_vendas_clientes FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE itens_vendas (
    item_id INT PRIMARY KEY,
    venda_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_itens_vendas_vendas FOREIGN KEY (venda_id) REFERENCES vendas(vendas_id),
    CONSTRAINT fk_itens_vendas_produtos FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

CREATE TABLE campanhas (
    campanhas_id INT PRIMARY KEY,
    nome_campanha VARCHAR(100) NOT NULL,
    categoria_desconto INT NOT NULL,
    porcentagem_desconto DECIMAL(5, 2) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    CONSTRAINT fk_campanhas_categorias FOREIGN KEY (categoria_desconto) REFERENCES categorias(categoria_id)
);