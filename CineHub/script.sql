CREATE TABLE Filmes (
  idFilme INT PRIMARY KEY,
  nomeFilme VARCHAR(30),
  dataLancamento DATE,
  avaliacao FLOAT(2),
  idDiretor INT,
  FOREIGN KEY (idDiretor) REFERENCES Diretores(idDiretor)
);

CREATE TABLE Diretores (
  idDiretor INT PRIMARY KEY,
  nomeDiretor VARCHAR(100)
);

-- Inserindo um diretor
INSERT INTO Diretores (idDiretor, nomeDiretor) VALUES (1, 'John Lourence');

-- Inserindo um filme e relacionando-o ao diretor
INSERT INTO Filmes (idFilme, nomeFilme, dataLancamento, avaliacao, idDiretor)
VALUES (1, 'Filme A', '2022-01-01', 4.5, 1);
