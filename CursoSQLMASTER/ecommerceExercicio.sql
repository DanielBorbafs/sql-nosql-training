
/*Criar um banco de dados chamado Ecommerce;

Criar uma tabela chamada clientes com os dados

. Nome;
. Estado;
. Idade;
. Cidade;
. Email;
. Sexo;
. Celular;
*/

CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE clientes(
nome varchar(30),
uf char(2),
cidade varchar(25),
idade int,
email varchar(50),
sexo char(1),
celular varchar(15)
);

INSERT INTO clientes VALUES ('Ana', 'SP', 'São Paulo', 30, 'ana.santos@example.com', 'F', '5511987654321');
INSERT INTO clientes VALUES ('Mauro', 'SP', 'São Paulo', 16, 'ana.santos@example.com', 'M', '5511987654321');
INSERT INTO clientes VALUES ('Diego', 'RJ', 'São Paulo', 19, 'ana.santos@example.com', 'F', '5511987654321');
INSERT INTO clientes VALUES ('Pedro', 'RJ', 'Rio de Janeiro', 28, 'pedro.lisboa@example.com', 'M', '5519912345678');
INSERT INTO clientes VALUES ('Maria', 'MG', 'Belo Horizonte', 35, 'maria.mexico@example.com', 'F', '5531998765432');
INSERT INTO clientes VALUES ('João', 'RS', 'Porto Alegre', 40, 'joao@example.com', 'M', '5551987654321');
INSERT INTO clientes VALUES ('Luciana', 'PR', 'Curitiba', 27, 'luciana.paris@example.com', 'F', '5541998765432');

/* QUERYS */
# Trazer todos os clientes que começam com a letra D e moram no estado do Rio de janeiro;

SELECT *
FROM clientes
WHERE UPPER(uf) = 'RJ'
AND nome LIKE 'D%';

# Selecionar os clientes em ordem crescente de idade;

SELECT * FROM clientes
ORDER BY idade;

# Selecionar clientes que sejam menores que 18 anos, que moram em são paulo e também que sejam masculinos;

SELECT * FROM clientes
WHERE uf = 'SP'
AND SEXO = 'M'
AND idade < 18;

# Selecionar clientes que tenham entre 20 a 30 anos, que moram no estado do rio de janeiro OU na cidade de são paulo;

 SELECT * FROM clientes WHERE idade > 20 AND idade < 30 AND (UPPER(uf) = 'RJ' OR UPPER(cidade) = 'Sao paulo');

