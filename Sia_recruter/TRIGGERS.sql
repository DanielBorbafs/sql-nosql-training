CREATE TRIGGER TR_AUMENTO_SALARIAL
ON CARGO
AFTER UPDATE
AS
BEGIN
    IF UPDATE(SALARIO)
    BEGIN
        DECLARE @DataAumento DATE, @SalarioAnterior MONEY, @SalarioNovo MONEY;

        SELECT @DataAumento = GETDATE();
        SELECT @SalarioAnterior = SALARIO FROM deleted;
        SELECT @SalarioNovo = SALARIO FROM inserted;

        INSERT INTO HISTORICO_SALARIAL (IDCARGO, DATA_AUMENTO, SALARIO_ANTERIOR, SALARIO_NOVO)
        SELECT IDCARGO, @DataAumento, @SalarioAnterior, @SalarioNovo
        FROM inserted;
    END;
END;
GO
