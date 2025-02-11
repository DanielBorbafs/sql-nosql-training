CREATE TRIGGER trg_atualizar_estoque
ON itens_vendas
AFTER INSERT
AS
BEGIN
    -- Atualiza o estoque dos produtos vendidos
    UPDATE p
    SET p.qtd_estoque = p.qtd_estoque - i.quantidade
    FROM produtos p
    INNER JOIN inserted i ON p.produto_id = i.produto_id;
END;