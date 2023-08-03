
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
EXEC SP_CADASTRAR_FUNCIONARIO
    @Nome = 'Daniel Borba',
    @Idade = 23,
    @Email = 'contato.danielborba@email.com',
    @DataAdm = '2024-08-03',
    @NomeCargo = 'Desenvolvedor Backend',
    @Salario = 3500.00,
    @Estado = 'ES',
    @Bairro = 'Belvedere',
    @Rua = 'Osorio duque estrada',
    @Numero = '10',
    @NumeroTelefone = '(28) 3285-7895',
    @TipoTelefone = 'RES';
GO

EXEC SP_CADASTRAR_FUNCIONARIO
    @Nome = 'Camila Santos',
    @Idade = 26,
    @Email = 'camila.santos@email.com',
    @DataAdm = '2024-03-18',
    @NomeCargo = 'Analista de Recursos Humanos',
    @Salario = 3800.00,
    @Estado = 'PR',
    @Bairro = 'Centro Cívico',
    @Rua = 'Avenida das Oliveiras',
    @Numero = '564',
    @NumeroTelefone = '(41) 9876-5678',
    @TipoTelefone = 'RES';
GO
EXEC SP_CADASTRAR_FUNCIONARIO
    @Nome = 'Rafael Martins',
    @Idade = 32,
    @Email = 'rafael.martins@email.com',
    @DataAdm = '2022-09-05',
    @NomeCargo = 'Gerente de Vendas',
    @Salario = 5000.00,
    @Estado = 'RS',
    @Bairro = 'Centro Histórico',
    @Rua = 'Rua das Flores',
    @Numero = '789',
    @NumeroTelefone = '(51) 4567-2345',
    @TipoTelefone = 'CEL';
GO

