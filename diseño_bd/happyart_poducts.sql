CREATE DATABASE happyart_products;

CREATE TABLE themes (
    id SERIAL PRIMARY KEY,
    name JSONB NOT NULL DEFAULT '{}' -- Utilizamos JSONB para almacenar un array de strings en diferentes idiomas
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

/*
 * En lugar de tener una tabla para cada tipo de producto, 
 * se puede crear una tabla product general con un campo product_type 
 * para identificar el tipo de producto. 
 * Así evitamos la redundancia en la estructura de cada tabla específica.
*/
CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category_id INT REFERENCES category(id),
    product_type VARCHAR(50) NOT NULL DEFAULT 'Sin datos',
    size VARCHAR(50) NOT NULL DEFAULT 'Sin datos',
    description TEXT NOT NULL DEFAULT 'Sin datos',
    theme_id INT REFERENCES themes(id),
    stock INT NOT NULL DEFAULT 0,
    img TEXT NOT NULL DEFAULT 'Sin datos'
);


/*
 *  Tabla precio que permite registrar tanto el price como el personalized_price 
 * junto con product_id, en lugar de repetir estos campos en cada entrada de producto.
 */
CREATE TABLE price (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES product(id) ON DELETE CASCADE,
    price NUMERIC(10, 2) NOT NULL DEFAULT 0,
    is_personalized BOOLEAN NOT NULL DEFAULT FALSE
);

-- Tabla de contenido de Happy Box
CREATE TABLE happy_box (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES product(id) ON DELETE CASCADE,
    content JSONB NOT NULL DEFAULT '{}'
);


-- Tabla de atributos de cuadernos
CREATE TABLE notebook (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES product(id) ON DELETE CASCADE,
    sheets INT NOT NULL DEFAULT 0,
    laminate VARCHAR(50) NOT NULL DEFAULT 'Sin datos',
    sheet_type VARCHAR(50) NOT NULL DEFAULT 'Sin datos'
);