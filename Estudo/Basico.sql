create table financas(
nomeInvestimento varchar(30),
dataInvestimento date,
valor int(5)
);
alter table financas
add column idFinancas int auto_increment primary key;
INSERT INTO financas (nomeInvestimento, dataInvestimento, valor)
VALUES ('Forex', '2023-05-28', 2200);
INSERT INTO financas (nomeInvestimento, dataInvestimento, valor)
VALUES ('Forex', '2022-01-08', 1200);
INSERT INTO financas (nomeInvestimento, dataInvestimento, valor)
VALUES ('BMF', '2020-03-28', 200);

select nomeInvestimento
from financas
where nomeInvestimento = 'Forex';

select valor
from financas
where valor >= 1000

select nomeInvestimento, valor
from financas
where nomeInvestimento='Forex' and valor >= 1300;

select nomeInvestimento, valor
from financas
where not valor <= 1000;

select nomeInvestimento, valor
from financas
order by valor asc;
UPGRADE
