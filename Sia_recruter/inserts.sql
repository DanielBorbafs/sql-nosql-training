
-- INSERINDO OS DADOS

INSERT INTO CARGO (NOMECARGO, SALARIO) VALUES ('Analista de Marketing', 2000.00);
INSERT INTO ENDERECO (ESTADO, BAIRRO, RUA, NUMERO) VALUES ('SP', 'Centro', 'Avenida Paulista', '100');
INSERT INTO TELEFONE (NUMERO, TIPO) VALUES ('(11) 98765-4321', 'COM');
INSERT INTO FUNCIONARIO (NOME, IDADE, EMAIL, DATA_ADM, IDCARGO, IDENDERECO, IDTELEFONE)
VALUES ('Maria Silva', 30, 'maria.silva@email.com', '2023-08-02', 1, 1, 1);
GO

-- INSERINDO VIA PROCEDURE
EXEC SP_CADASTRAR_FUNCIONARIO
    @Nome = 'João da Silva',
    @Idade = 25,
    @Email = 'joao.silva@email.com',
    @DataAdm = '2023-08-02',
    @NomeCargo = 'Analista de Vendas',
    @Salario = 2500.00,
    @Estado = 'SP',
    @Bairro = 'Centro',
    @Rua = 'Rua das Flores',
    @Numero = '10',
    @NumeroTelefone = '(11) 98765-4321',
    @TipoTelefone = 'RES';
GO
