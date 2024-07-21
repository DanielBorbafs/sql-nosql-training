SELECT 
    C.CLIENTE_NOME,
    C.SEXO,
    E.ESTADO,
    SUM(O.VALOR_TOTAL) AS TOTAL_VALOR,
    O.ID_JOGO
FROM
    CLIENTES AS C
INNER JOIN 
    ENDERECO AS E
ON
    C.CLIENTE_ID = E.CLIENTE_ID
INNER JOIN 
    ORDEM AS O
ON 
    C.CLIENTE_ID = O.CLIENTE_ID
WHERE 
    E.ESTADO = 'SC'
GROUP BY 
    C.CLIENTE_NOME,
    C.SEXO,
    E.ESTADO,
    O.ID_JOGO;
