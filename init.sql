CREATE DATABASE IF NOT EXISTS db_aula;

USE db_aula;

CREATE TABLE db_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    age INT,
    course VARCHAR(300)
);

INSERT INTO db_data (name, age, course) VALUES 
('Anderson Serafim Duran', 36, 'Analise e Desenvolvimento de Sistemas'),
('Leticia Mangusso Duran', 37, 'Educação Fisica');