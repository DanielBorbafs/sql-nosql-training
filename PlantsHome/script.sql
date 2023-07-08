CREATE TABLE info_plantas (
    id_planta INT PRIMARY KEY AUTO_INCREMENT,
    Nome_planta VARCHAR(30),
    valor DECIMAL(6, 2)
);

CREATE TABLE info_vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    Nome_planta VARCHAR(30),
    valor DECIMAL(6, 2),
    quantidade VARCHAR(3),
    metodo_pagamento VARCHAR(20),
    Nome_cliente VARCHAR(30),
    FOREIGN KEY (Nome_planta) REFERENCES info_plantas(Nome_planta),
    FOREIGN KEY (Nome_cliente) REFERENCES info_clientes(Nome_cliente)
);

CREATE TABLE info_clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome_cliente VARCHAR(30),
    estado CHAR(2),
    cidade VARCHAR(30),
    bairro VARCHAR(30),
    rua VARCHAR(30),
    logradouro VARCHAR(5),
    cep VARCHAR(10),
    telefone VARCHAR(13)
);