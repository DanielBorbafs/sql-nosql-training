
/* PARA CADA INSERT DE UM VENDEDOR NO BANCO PRINCIPAL, TAMBÉM DA UM INSERT NO BANCO DE BKP */

CREATE TRIGGER AUDIT_VENDEDORES
AFTER INSERT ON VENDEDOR
FOR EACH ROW
BEGIN 
	INSERT INTO BACKUP_MINILOJA.BKP_VENDEDOR VALUES(NULL, NEW.NOME);
END
$

CREATE TRIGGER AUDIT_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN 
  INSERT INTO BKP_MINILOJA.BKP_PRODUTO VALUES(NULL, NEW.NOME, NEW.PRECO, NEW.IDVENDEDOR);
END
$