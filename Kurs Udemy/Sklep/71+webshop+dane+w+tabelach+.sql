CREATE TABLE IF NOT EXISTS users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(24) NOT NULL,
    surname VARCHAR(24),
    email VARCHAR(256) UNIQUE NOT NULL,
    password VARCHAR(24) NOT NULL,
    type ENUM('admin', 'customer', 'employee'),
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS addresses (
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    street VARCHAR(24),
    city VARCHAR(24),
    state VARCHAR(24),
    country VARCHAR(24),
    zip_code VARCHAR(24),
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE IF NOT EXISTS products (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(24),
    price DECIMAL(10, 2),
    description TEXT,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS order_details (
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT DEFAULT 1,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);










INSERT INTO users (name, surname, email, password, type)
VALUES ('Admin', 'Admiński', 'admin@webshop.com', 'admin12345', 'admin');

INSERT INTO users (name, surname, email, password, type)
VALUES ('Customer', 'Customer', 'customer@example.com', 'a12345', 'customer');


INSERT INTO products (name, price, description)
VALUES
('iPhone', 1000.23, 'Apple Iphone'),
('GG Pixel', 876.56, 'GG phone'),
('Sony Xperia', 1100.87, 'Sony'),
('iPhone MAX', 1700.13, 'Apple Iphone Max');

INSERT INTO orders (user_id) VALUES(2);

INSERT INTO order_details (order_id, product_id, quantity)
VALUES
(LAST_INSERT_ID(), 1, 1),
(LAST_INSERT_ID(), 2, 3);