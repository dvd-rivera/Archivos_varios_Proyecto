-- Tabla de temas con soporte para múltiples idiomas
CREATE TABLE theme (
    id SERIAL PRIMARY KEY,
    name JSONB NOT NULL -- Utilizamos JSONB para almacenar un array de strings en diferentes idiomas
);

-- Tabla para los diarios
CREATE TABLE diary (
    id SERIAL PRIMARY KEY,
    price NUMERIC(10, 2) NOT NULL,
    personalized_price NUMERIC(10, 2) NOT NULL,
    description TEXT NOT NULL,
    theme_id INT REFERENCES theme(id),
    gr INT NOT NULL,
    sheets INT NOT NULL,
    size VARCHAR(50) NOT NULL,
    img TEXT NOT NULL,
    sheet_type VARCHAR(50) NOT NULL,
    laminate VARCHAR(50) NOT NULL
);

-- Tabla para los cuadernos
CREATE TABLE notebook (
    id SERIAL PRIMARY KEY,
    price NUMERIC(10, 2) NOT NULL,
    personalized_price NUMERIC(10, 2) NOT NULL,
    description TEXT NOT NULL,
    theme_id INT REFERENCES theme(id),
    gr INT NOT NULL,
    sheets INT NOT NULL,
    size VARCHAR(50) NOT NULL,
    img TEXT NOT NULL,
    sheet_type VARCHAR(50) NOT NULL,
    laminate VARCHAR(50) NOT NULL
);

-- Tabla para cuadernos de dibujo
CREATE TABLE drawing_notebook (
    id SERIAL PRIMARY KEY,
    price NUMERIC(10, 2) NOT NULL,
    personalized_price NUMERIC(10, 2) NOT NULL,
    description TEXT NOT NULL,
    theme_id INT REFERENCES theme(id),
    sheets INT NOT NULL,
    size VARCHAR(50) NOT NULL,
    img TEXT NOT NULL,
    laminate VARCHAR(50) NOT NULL
);

-- Tabla para llaveros de notas adhesivas
CREATE TABLE keychain_sticky_notes (
    id SERIAL PRIMARY KEY,
    price NUMERIC(10, 2) NOT NULL,
    personalized_price NUMERIC(10, 2) NOT NULL,
    description TEXT NOT NULL,
    theme_id INT REFERENCES theme(id)
);

-- Tabla para sets de marcadores
CREATE TABLE bookmarks_set (
    id SERIAL PRIMARY KEY,
    price NUMERIC(10, 2) NOT NULL,
    personalized_price NUMERIC(10, 2) NOT NULL,
    description TEXT NOT NULL,
    theme_id INT REFERENCES theme(id)
);

-- Tabla para sets de stickers
CREATE TABLE stickers_set (
    id SERIAL PRIMARY KEY,
    price NUMERIC(10, 2) NOT NULL,
    personalized_price NUMERIC(10, 2) NOT NULL,
    description TEXT NOT NULL,
    theme_id INT REFERENCES theme(id)
);

-- Tabla para calendarios de pared
CREATE TABLE wall_calendar (
    id SERIAL PRIMARY KEY,
    price NUMERIC(10, 2) NOT NULL,
    personalized_price NUMERIC(10, 2) NOT NULL,
    description TEXT NOT NULL,
    theme_id INT REFERENCES theme(id)
);

-- Tabla para calendarios magnéticos
CREATE TABLE magnet_calendar (
    id SERIAL PRIMARY KEY,
    size VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    personalized_price NUMERIC(10, 2) NOT NULL,
    description TEXT NOT NULL,
    theme_id INT REFERENCES theme(id)
);

-- Tabla para imanes de refrigerador
CREATE TABLE magnetic_fridge (
    id SERIAL PRIMARY KEY,
    price NUMERIC(10, 2) NOT NULL,
    size VARCHAR(50) NOT NULL,
    theme_id INT REFERENCES theme(id)
);

-- Tabla para pinturas
CREATE TABLE painting (
    id SERIAL PRIMARY KEY,
    price NUMERIC(10, 2) NOT NULL,
    personalized_price NUMERIC(10, 2) NOT NULL,
    description TEXT NOT NULL,
    theme_id INT REFERENCES theme(id)
);

-- Tabla para pinturas resinadas
CREATE TABLE resined_painting (
    id SERIAL PRIMARY KEY,
    size VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    personalized_price NUMERIC(10, 2) NOT NULL,
    description TEXT NOT NULL,
    theme_id INT REFERENCES theme(id)
);

-- Tabla para cajas de regalos (Happy Box)
CREATE TABLE happy_box (
    id SERIAL PRIMARY KEY,
    size VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    personalized_price NUMERIC(10, 2) NOT NULL,
    description TEXT NOT NULL,
    theme_id INT REFERENCES theme(id),
    content JSONB NOT NULL -- JSONB para almacenar un array de strings que representa el contenido
);


-- Notas importantes:
-- Relación con theme_id: Cada tabla de productos incluye una relación de clave externa con la tabla theme para referenciar el tema.
-- JSONB en theme y happy_box: Se utiliza JSONB para manejar el array de nombres en múltiples idiomas y el contenido de la Happy_Box.
-- Compatibilidad: Cada tabla tiene campos específicos basados en las propiedades de las interfaces, permitiendo la estructura y flexibilidad necesarias para manejar estos productos en PostgreSQL.





