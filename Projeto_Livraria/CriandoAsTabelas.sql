/* 
OBS: script ainda está cru, faltando algumas tratativas nas entradas de dados,
Irei primeiro botar o sistema para funcionar para logo após poder lapidar
os dados para poder se encaixar nas regras de negócios.

*/
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


CREATE TABLE estoque_geral (
    livro_id INT,
    quantidade INT,
    FOREIGN KEY (livro_id) REFERENCES livros(livro_id)
);

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


CREATE TABLE estoque_geral (
    livro_id INT,
    quantidade INT,
    FOREIGN KEY (livro_id) REFERENCES livros(livro_id)
);

create table endereco(
    client_id int,
    estado char(2),
    cidade varchar(30),
    bairro varchar(20),
    numero varchar(5),
    rua varchar(20),
    complemento varchar(100),
    FOREIGN key(client_id) references clientes(client_id)

);


