-- Nama	:Fransiska Paulina Ari
-- Nim  : 22512015
-- prodi : Teknologi Rekayasa Internet

use products;

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL
    -- Kolom lainnya
);

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(255) NOT NULL
    -- Kolom lainnya
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    supplier_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

INSERT INTO products (product_name, description, price, stock_quantity)
VALUES ('LAPTOP ASUS', 'Deskripsi produk Laptop ASUS', 120000000, 50);

SELECT product_id, product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

UPDATE products
SET stock_quantity = 75
WHERE product_id = 'p003';

SELECT c.category_name, COUNT(p.product_id) AS jumlah_produk_terjual
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

SELECT *
FROM products
WHERE stock_quantity > 20 AND price < 15000000;

SELECT *
FROM products
ORDER BY price ASC;

DELETE FROM products WHERE quantity < 10;

SELECT product_id, product_name, price * stock_quantity AS total_nilai_stok
FROM products;


ALTER TABLE products
ADD COLUMN discount DECIMAL(5,2);



