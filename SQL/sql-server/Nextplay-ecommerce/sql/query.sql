select v.data_venda, v.cliente_id, i.preco_unitario, c.nome
from vendas v
inner join  itens_vendas i on v.vendas_id = i.item_id
inner join clientes c on v.cliente_id = c.cliente_id
go