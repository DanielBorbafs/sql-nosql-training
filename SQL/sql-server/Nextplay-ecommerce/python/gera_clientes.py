import sys
import pyodbc
from faker import Faker
import random
from datetime import datetime  # Adicionar esta linha

# Definir saída padrão como UTF-8 para suportar emojis
sys.stdout.reconfigure(encoding='utf-8')

fake = Faker('pt_BR')

# Configurar conexão com SQL Server
server =
database =
username = 
password = 

try:
    # Conectar ao banco
    conn = pyodbc.connect(
       'DRIVER=ODBC Driver 17 for SQL Server;SERVER=DANIEL-PC;DATABASE=NEXTPLAY;Trusted_Connection=yes'
    )
    print("✅ Conexão com o SQL Server bem-sucedida!")
    
    cursor = conn.cursor()  # Criando o cursor aqui para manter a conexão ativa

    num_registros = 45  # Definição do número correto de registros

    for _ in range(num_registros):
        nome = fake.name()
        email = fake.unique.email()
        telefone = fake.unique.msisdn()[0:12]  # Pega os 12 primeiros caracteres
        uf = fake.random_element(['SP', 'RJ', 'MG', 'RS', 'PR', 'BA', 'SC', 'GO', 'PE', 'ES', 'MS'])
        genero = fake.random_element(['M', 'F', None])  # Pode ser masculino, feminino ou nulo
        data_nascimento = fake.date_of_birth(minimum_age=18, maximum_age=40).strftime('%Y-%m-%d')

        # Garantir que a data de cadastro seja em Janeiro, Fevereiro ou Março de 2025
        mes_permitido = random.choice([1, 2, 3])  # Janeiro, Fevereiro ou Março
        ano = 2025
        dia = random.randint(1, 28 if mes_permitido == 2 else 31)  # Evita erro em fevereiro
        data_cadastro = datetime(ano, mes_permitido, dia).strftime('%Y-%m-%d')
        # Inserindo os dados na tabela clientes
        cursor.execute("""
            INSERT INTO clientes (nome, email, telefone, uf, genero, data_nascimento, data_cadastro)
            VALUES ( ?, ?, ?, ?, ?, ?, ?)
        """, ( nome, email, telefone, uf, genero, data_nascimento, data_cadastro))

    # Confirmar a transação
    conn.commit()
    print(f"✅ {num_registros} registros fictícios inseridos com sucesso no SQL Server!")

except Exception as e:
    print("❌ Erro ao conectar no SQL Server:", e)

finally:
    # Fechar a conexão apenas no final
    if 'conn' in locals() and conn is not None:
        conn.close()
        print("🔌 Conexão com o banco fechada.")
