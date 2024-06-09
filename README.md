
# Ativ-Docker

Este repositório contém os passos para configurar e executar um banco de dados MySQL e uma API Node.js utilizando Docker. Siga os passos abaixo para configurar o ambiente.

## Passos para Configuração

### 1. Criar Conexão de Rede para os Containers

Crie uma rede Docker para permitir a comunicação entre o banco de dados e a API.

docker network create db-network


### 2. Executar o Banco de Dados


docker run -d --name server --network db-network -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_DATABASE=db_aula -v db_data:/var/lib/mysql -v "${PWD}/init.sql:/docker-entrypoint-initdb.d/init.sql" -p 3307:3306 mysql:latest

### 3. Criar Banco de Dados, Tabelas e Popular Dados

docker exec -it server mysql -uroot -p db_aula

No prompt do MySQL, cole o conteúdo do arquivo init.sql e pressione Enter.

Digite exit para sair do prompt do MySQL.


### 4. Criar Docker para a API

docker build -t mikeduran/api:0.0.1 .


### 5. Executar o Docker da API

docker run -p 3000:3000 --network db-network --name api -d mikeduran/api:0.0.1


### 6. Acessar a API

Abra seu navegador e acesse a URL http://localhost:3000 para verificar se a API está funcionando e realizar consultas.
