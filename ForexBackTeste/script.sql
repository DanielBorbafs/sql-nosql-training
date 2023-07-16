CRETE DATABASE FOREXBACKTESTE
USE FOREXBACKTESTE

CREATE TABLE CONTAGEM (
  parMoeda varchar(30) not null,
  estrategiaNome varchar(30) not null,
  win int,
  loss int,
  data int not null
);
