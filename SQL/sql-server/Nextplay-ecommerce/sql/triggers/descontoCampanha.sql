-- Gatilho para Aplicar Desconto Durante Campanhas

CREATE TRIGGER trg_aplicar_desconto
ON vendas
INSTEAD OF INSERT
AS
BEGIN
    -- Verifica se há uma campanha ativa para a categoria do produto vendido
    DECLARE @desconto DECIMAL(5, 2);
    DECLARE @valor_total DECIMAL(10, 2);
    DECLARE @data_venda DATE;

    SELECT 
        @desconto = ISNULL(c.porcentagem_desconto, 0),
        @valor_total = i.valor_total,
        @data_venda = i.data_venda
    FROM inserted i
    LEFT JOIN campanhas c ON i.data_venda BETWEEN c.data_inicio AND c.data_fim;

    -- Aplica o desconto ao valor total da venda
    SET @valor_total = @valor_total * (1 - @desconto / 100);

    -- Insere a venda com o desconto aplicado
    INSERT INTO vendas (vendas_id, cliente_id, data_venda, valor_total)
    SELECT vendas_id, cliente_id, data_venda, @valor_total
    FROM inserted;
END;