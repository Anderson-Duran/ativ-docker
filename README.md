# Ativ 4

## 1. Criar Conexão de Rede para os Containers
Crie uma rede Docker para permitir a comunicação entre o banco de dados e a API.

docker network create db-network

## 2. Executar o Banco de Dados
docker run -d --name server --network db-network -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_DATABASE=db_aula -v db_data:/var/lib/mysql -v "${PWD}/init.sql:/docker-entrypoint-initdb.d/init.sql" -p 3306:3306 mysql:latest

## 3. Criar Docker para a API
docker build -t mikeduran/api:0.0.1 .

## 4. Executar o Docker da API
docker run -p 3000:3000 --network db-network --name api -d mikeduran/api:0.0.1

## 5. Acessar a API
Abra seu navegador e acesse a URL http://localhost:3000 para verificar se a API está funcionando e realizar consultas.

Link Docker HUb



# Ativ-Docker Final

Este repositório contém os passos para configurar e executar um banco de dados MySQL e uma API Node.js utilizando Docker. Siga os passos abaixo para configurar o ambiente.

## Passos para Configuração

### 1. Criar Imagens e Containers
Execute o comando docker-compose up --build


### 2. Acessar a API

Abra seu navegador e acesse a URL http://localhost:3000 para verificar se a API está funcionando e realizar consultas.

obs: as vezes pode levar alguns segundos para carregar o banco de dados portanto agurade alguns segundos caso a resposta não seja obtida


### Link Docker HUb 

https://hub.docker.com/repository/docker/mikeduran/api/general

https://github.com/Anderson-Duran/ativ-docker
