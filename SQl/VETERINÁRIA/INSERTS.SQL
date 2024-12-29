--> fluxo de atendimento <--
-- INSERT TABELA VETERINÁRIO
INSERT INTO VETERINARIOS VALUES 
('ANA SILVA', 'GATOS', '2017-02-20'),
('JOÃO PEREIRA', 'PÁSSAROS', '2018-07-15'),
('CARLA FERREIRA', 'RÉPTEIS', '2019-03-30'),
('ROBERTO SOUSA', 'PEQUENOS MAMÍFEROS', '2020-11-10'),
('LUCAS MENDES', 'PEIXES', '2021-05-25'),
('JULIANA COSTA', 'ANIMAIS EXÓTICOS', '2022-08-18'),
('PEDRO ALVES', 'CAVALOS', '2023-01-12'),
('MARIANA LIMA', 'ANIMAIS SILVESTRES', '2023-04-22'),
('FELIPE RODRIGUES', 'CÃES E GATOS', '2023-09-05');
GO

SELECT * FROM DONO GO
-- INSERT NA TABELA DONO
INSERT INTO DONO VALUES
('BEATRIZ SOUZA', '21 985674312', 'BEATRIZ.SOUZA@YAHOO.COM'),
('FÁBIO ALMEIDA', '11 998712345', 'FABIO.ALMEIDA@HOTMAIL.COM'),
('CAROLINA FERREIRA', '31 987654321', 'CAROLINA.FERREIRA@GMAIL.COM'),
('GUSTAVO RODRIGUES', '19 981234567', 'GUSTAVO.RODRIGUES@OUTLOOK.COM'),
('HELENA MENDES', '61 982345678', 'HELENA.MENDES@GMAIL.COM'),
('RODRIGO SILVA', '47 985673421', 'RODRIGO.SILVA@YAHOO.COM'),
('FERNANDA COSTA', '51 983214567', 'FERNANDA.COSTA@HOTMAIL.COM'),
('MARCOS ALMEIDA', '41 981234576', 'MARCOS.ALMEIDA@OUTLOOK.COM'),
('PATRICIA PEREIRA', '21 987654321', 'PATRICIA.PEREIRA@GMAIL.COM');
GO

SELECT * FROM VETERINARIOS GO
SELECT * FROM DONO GO
SELECT * FROM PACIENTE GO
-- INSERT NA TABELA PACIENTE
INSERT INTO PACIENTE VALUES 
('GARFIELD','GATO', 'PERSA', '02/10/2022', 1002),
('TONICO','PÁSSAROS', 'PIRIQUITO', '05/11/2023', 1003),
('LINA','RÉPTIL', 'COBRA', '02/10/2023', 1004),
('POLLY','PEQUENOS MAMIFEROS', 'PANDA', '02/02/2024', 1005),
('NEMO','PEIXES', 'PALHAÇO', '11/04/2024', 1006),
('LOURO','ANIMAIS EXÓTICOS', 'TUCANO', '05/05/2024', 1007),
('LEON','GRANDES MAMÍFEROS', 'CAVALO', '05/10/2024', 1008),
('LION','ANIMAIS SILVESTRES', 'LEÃO', '08/05/2024', 1009),
('SCOOB','CÃES E GATOS', 'CACHORRO', '11/06/2024', 1010);
GO

--INSERT NA TABELA DE CONSULTA
SELECT * FROM CONSULTAS GO
INSERT INTO CONSULTAS VALUES  -- CONSULTAID - DATA-CONSULTA-MOTIVO-PACIENTE-ID-VETERINARIO ID
( '02/10/2023', 'O dono alega que o gato está soltando muito pelo', 1002,1002),
( '05/12/2023', 'O dono alega que o passário está com a pata ferida', 1003,1003),
( '05/01/2024', 'O dono informou que a cobra está muito agressiva', 1004,1004),
( '05/04/2024', 'O dono informou que o panda está sem apetite', 1005,1005),
( '25/06/2024', 'O dono informa que o animal está comendo menos que o normal', 1006,1006),
( '25/12/2024', 'O dono informa que o animal está com o bico quebrado', 1007,1007),
( '31/12/2024', 'O dono informa que o cavalo está dando muito coice', 1008,1008),
( '30/11/2024', 'O dono informa leão está soltando muito pelo', 1009,1009),
( '13/12/2024', 'O dono informa que o cachorro está babando muito', 1010,1010)
GO

-- INSERÇÃO DE DADOS NA TABELA CONSULTAS
INSERT INTO CONSULTAS VALUES
('2023/10/02', 'O dono alega que o gato está soltando muito pelo', 1002, 1002),
('2023/12/05', 'O dono alega que o passário está com a pata ferida', 1003, 1003),
('2024/01/05', 'O dono informou que a cobra está muito agressiva', 1004, 1004),
('2024/04/05', 'O dono informou que o panda está sem apetite', 1005, 1005),
('2024/06/25', 'O dono informa que o animal está comendo menos que o normal', 1006, 1006),
('2024/12/25', 'O dono informa que o animal está com o bico quebrado', 1007, 1007),
('2024/12/31', 'O dono informa que o cavalo está dando muito coice', 1008, 1008),
('2024/11/30', 'O dono informa que o leão está soltando muito pelo', 1009, 1009), 
('2024/12/13', 'O dono informa que o cachorro está babando muito', 1010, 1010);
go
