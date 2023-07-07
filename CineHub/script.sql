create database cinehub;

use cinehub;

create table Filmes (
id int primary key,
nome_filme varchar(30),
data_lancamento date,
avaliacao float(2),
diretor_filme varchar(30),
genero_filme varchar(15)
);

create table diretores (
id int primary key,
nome varchar(100)
);

ALTER TABLE Filmes
ADD COLUMN diretor_id INT,
ADD CONSTRAINT FK_diretor_filme FOREIGN KEY (diretor_id) REFERENCES diretores(id);
