
create table livros(
    livro_id int primary key,
    titulo varchar(30),
    autor varchar(30),
    genero varchar(15)
);

create table clientes(
    client_id int primary key,
    nome varchar(30),
    sexo char(1),
    idade char(2)
);


create table vendas (
    venda_id INT PRIMARY KEY,
    client_id INT,
    livro_id INT,
    data DATE,
    valor DECIMAL(10, 2),
    FOREIGN KEY (client_id) REFERENCES clientes(client_id),
    FOREIGN KEY (livro_id) REFERENCES livros(livro_id)
);


