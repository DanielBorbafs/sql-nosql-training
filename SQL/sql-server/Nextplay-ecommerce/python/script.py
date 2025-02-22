import pandas as pd
import numpy as np

# Carregar os dados do Excel
df = pd.read_excel('python/vendas_atualizadas.xlsx')

# Certificar-se de que a coluna está em formato numérico
df["cliente_id"] = pd.to_numeric(df["cliente_id"], errors="coerce")

# Gerando valores aleatórios para os NaNs
valores_aleatorios = np.random.randint(1, 96, size=df["cliente_id"].isna().sum())

# Preenchendo os valores NaN com valores aleatórios
df.loc[df["cliente_id"].isna(), "cliente_id"] = valores_aleatorios

# Agora sim, convertendo para int
df["cliente_id"] = df["cliente_id"].astype(int)

# Salvando no mesmo arquivo (sobrescrevendo)
df.to_excel('python/vendas_atualizadas.xlsx', index=False)
