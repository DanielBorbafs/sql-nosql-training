import pandas as pd
from random import randint, choice

# Carregar as tabelas
produtos = pd.read_excel('python/produtos.xlsx')  # Tabela de produtos
vendas = pd.read_excel('python/vendas.xlsx')      # Tabela de vendas
itens_vendas = pd.read_excel('python/itens_vendas.xlsx')  # Tabela de itens vendidos

def simular_venda(produtos, vendas, itens_vendas):
    # Filtrar produtos com estoque disponível
    produtos_disponiveis = produtos[produtos['qtd_estoque'] > 0]

    # Verificar se há produtos disponíveis
    if produtos_disponiveis.empty:
        print("Estoque zerado!")
        return produtos, vendas, itens_vendas

    # Escolher produtos aleatórios para venda
    n_produtos = min(randint(1, 5), len(produtos_disponiveis))  # Escolhe de 1 a 5 produtos, mas não mais do que o disponível
    produtos_venda = produtos_disponiveis.sample(n=n_produtos)

    # Calcular valor total da venda
    valor_total = produtos_venda['preco'].sum()

    # Criar nova venda
    nova_venda = {
        'venda_id': vendas['venda_id'].max() + 1 if not vendas.empty else 1,
        'valor_total': valor_total
    }
    vendas = vendas._append(nova_venda, ignore_index=True)  # Usando _append() em vez de append()

    # Atualizar estoque e registrar itens vendidos
    for _, produto in produtos_venda.iterrows():
        # Diminuir estoque
        produtos.loc[produtos['produto_id'] == produto['produto_id'], 'qtd_estoque'] -= 1

        # Registrar item vendido
        novo_item = {
            'item_id': itens_vendas['item_id'].max() + 1 if not itens_vendas.empty else 1,
            'venda_id': nova_venda['venda_id'],
            'produto_id': produto['produto_id'],
            'quantidade': 1,
            'preco_unitario': produto['preco']
        }
        itens_vendas = itens_vendas._append(novo_item, ignore_index=True)  # Usando _append() em vez de append()

    return produtos, vendas, itens_vendas

# Simular vendas até zerar o estoque
while produtos['qtd_estoque'].sum() > 0:
    produtos, vendas, itens_vendas = simular_venda(produtos, vendas, itens_vendas)

# Salvar as tabelas atualizadas
produtos.to_excel('produtos_atualizados.xlsx', index=False)
vendas.to_excel('vendas_atualizadas.xlsx', index=False)
itens_vendas.to_excel('itens_vendas_atualizados.xlsx', index=False)

print("Vendas simuladas e estoque zerado!")