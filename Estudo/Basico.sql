create table financas(
nomeInvestimento varchar(30),
dataInvestimento date,
valor int(5)
);

alter table financas
add column idFinancas int auto_increment primary key;

INSERT INTO financas (nomeInvestimento, dataInvestimento, valor)
VALUES ('Forex', '2023-05-28', 2200);

