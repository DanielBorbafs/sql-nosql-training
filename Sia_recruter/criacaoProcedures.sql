
/* 
. PROCEDURE PARA CADASTRAR TODAS INFORMACOES DE UMA VEZ NO BANCO

> Essa procedure SP_CADASTRAR_FUNCIONARIO aceita todos os dados necessários
para cadastrar um novo funcionário, incluindo informações do funcionário,
cargo, endereço e telefone. Ela insere os dados nas tabelas relacionadas de forma segura,
garantindo a integridade das informações.

*/

CREATE PROCEDURE SP_CADASTRAR_FUNCIONARIO
    @Nome VARCHAR(60),
    @Idade INT,
    @Email VARCHAR(40),
    @DataAdm DATE,
    @NomeCargo VARCHAR(30),
    @Salario MONEY,
    @Estado CHAR(2),
    @Bairro VARCHAR(30),
    @Rua VARCHAR(40),
    @Numero VARCHAR(5),
    @NumeroTelefone VARCHAR(20),
    @TipoTelefone CHAR(3)
AS
BEGIN
    -- Variáveis para armazenar os IDs gerados automaticamente
    DECLARE @IdCargo INT, @IdEndereco INT, @IdTelefone INT;

    -- Inserindo o cargo e obtendo o ID gerado
    INSERT INTO CARGO (NOMECARGO, SALARIO)
    VALUES (@NomeCargo, @Salario);

    SET @IdCargo = SCOPE_IDENTITY();

    -- Inserindo o endereço e obtendo o ID gerado
    INSERT INTO ENDERECO (ESTADO, BAIRRO, RUA, NUMERO)
    VALUES (@Estado, @Bairro, @Rua, @Numero);

    SET @IdEndereco = SCOPE_IDENTITY();

    -- Inserindo o telefone e obtendo o ID gerado
    INSERT INTO TELEFONE (NUMERO, TIPO)
    VALUES (@NumeroTelefone, @TipoTelefone);

    SET @IdTelefone = SCOPE_IDENTITY();

    -- Inserindo o funcionário com os IDs dos registros relacionados
    INSERT INTO FUNCIONARIO (NOME, IDADE, EMAIL, DATA_ADM, IDCARGO, IDENDERECO, IDTELEFONE)
    VALUES (@Nome, @Idade, @Email, @DataAdm, @IdCargo, @IdEndereco, @IdTelefone);
END;
GO

/* EXECUTANDO A PROCEDURE */
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
