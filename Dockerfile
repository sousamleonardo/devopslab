# Use uma Imagem Official do Python
FROM python:3.10

# Declarando a váriavel do nome do arquivo de configuração do NewRelic
ENV NEW_RELIC_CONFIG_FILE=newrelic.ini  NEW_RELIC_LICENSE_KEY=c6780611d1735a0646fd2f712e7ae323683bNRAL

# Definindo o diretório onde a aplicação será armazenada
WORKDIR /app

# Copiar os arquivos da pasta local para dentro do container
COPY . /app

# Instalar as dependências de Python de acordo com o que foi desenvolvido na aplicação e que está declarado no arquivo requirements.txt.
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Garante que será iniciado a aplicação.
CMD ["newrelic-admin", "run-program", "gunicorn", "app:app"]
