CREATE DATABASE happyart_users;

-- Tabla de usuarios
CREATE TABLE users (
    userId SERIAL PRIMARY KEY,
    rut VARCHAR(10) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, 
    phone VARCHAR(15) NOT NULL,
    address TEXT NOT NULL
);

-- Tabla de tokens 
CREATE TABLE tokens (
    token_id SERIAL PRIMARY KEY,
    userId INT REFERENCES users(userId),
    token TEXT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
