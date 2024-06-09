const express = require('express');
const mysql = require('mysql2');
const app = express();

const dbConfig = {
    host: process.env.DB_HOST || 'server',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'db_aula'
};

const connection =  mysql.createConnection(dbConfig);

connection.connect(error => {
    if (error) {
        console.error('Error connecting to database:', error);
        return;
    }
    console.log('Conexão estabelecida com sucesso ao banco de dados');
});

app.get('/', (request, response) => {
    return response
    .status(200)
    .json({
        status: true,
        message: "Home da API"
    });
});

app.get("/liveness", (request, response) => {
    return response
    .status(200)
    .json({
        message: "API SuccessFull loaded",
        path: process.cwd(), 
        date: new Date().getTime()
    });
});

app.get("/readiness", (request, response) => {
    return response
    .status(200)
    .json({
        message: "API it's ready",
        path: process.cwd(), 
        date: new Date().getTime()
    });
});

app.get('/consulta-dados', (request, response) => {
    const query = 'SELECT * FROM db_data';

    connection.query(query, (error, results) => {
        if (error) {
            console.error('Error executing the query:', error);
            return response
            .status(500)
            .json({
                error: 'Error fetching data from database'
            });
        }

        return response.status(200).json({
            data: results
        });
    });
});

module.exports = app;