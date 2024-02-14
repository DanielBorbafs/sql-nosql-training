
/* CRIANDO O BANCO */
CREATE DATABASE ECOMMERCE;

USE ECOMMERCE;

CREATE TABLE cliente(
id_cliente INT PRIMARY KEY auto_increment NOT NULL,
nome VARCHAR(60),
email VARCHAR(100) UNIQUE,
telefone VARCHAR(20),
rua VARCHAR(60),
uf 	CHAR(2),
cidade VARCHAR(60),
bairro VARCHAR(60),
cep VARCHAR(60)
);

CREATE TABLE produto(
id_produto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_produto VARCHAR(45),
descricao VARCHAR(100),
preco DECIMAL(10,2),
quantidade_estoque INT
);

CREATE TABLE pedido (
id_pedido INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
fk_cliente_id INT,
fk_produto_id INT,
data_pedido DATE, 
quantidade_comprada INT,
tipo_pagamento VARCHAR(45),
status ENUM('pendente', 'procesSando', 'enviado', 'entregue'),
FOREIGN KEY (fk_cliente_id) REFERENCES cliente(id_cliente),
FOREIGN KEY (fk_produto_id) REFERENCES produto(id_produto)
);

DROP TABLE PEDIDO;


