# 1. Usar uma imagem base Python estável e leve
FROM python:3.11-slim

# 2. Definir o diretório de trabalho
WORKDIR /app

# 3. Copiar o arquivo de dependências
# (Assumindo que você tem um arquivo requirements.txt)
COPY requirements.txt .

# 4. Instalar as dependências
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copiar o código da aplicação
COPY . .

# 6. Expor a porta que a aplicação usa
EXPOSE 8000

# 7. Definir o comando para rodar a aplicação
# Usamos 0.0.0.0 para que seja acessível de fora do container
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

