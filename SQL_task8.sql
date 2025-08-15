CREATE DATABASE ecommerce;
USE ecommerce;

-- Customers table
CREATE TABLE ec_customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Orders table
CREATE TABLE ec_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES ec_customers(customer_id)
);

INSERT INTO ec_customers (customer_name, email, city) VALUES
('Alice Johnson', 'alice@example.com', 'New York'),
('Bob Smith', 'bob@example.com', 'Chicago'),
('Charlie Brown', 'charlie@example.com', 'New York'),
('Diana Prince', 'diana@example.com', 'Los Angeles');

INSERT INTO ec_orders (customer_id, amount, order_date) VALUES
(1, 1200.00, '2025-08-01'),
(2, 450.00,  '2025-08-02'),
(3, 700.00,  '2025-08-05'),
(4, 1500.00, '2025-08-08');

DELIMITER $$

CREATE PROCEDURE GetCustomersByCity(IN cityName VARCHAR(50))
BEGIN
    SELECT customer_id, customer_name, email, city
    FROM ec_customers
    WHERE city = cityName;
END $$

DELIMITER ;

CALL GetCustomersByCity('New York');

DELIMITER $$

CREATE FUNCTION CalculateDiscount(amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE discount DECIMAL(10,2);

    IF amount >= 1000 THEN
        SET discount = amount * 0.1; -- 10% discount
    ELSEIF amount >= 500 THEN
        SET discount = amount * 0.05; -- 5% discount
    ELSE
        SET discount = 0;
    END IF;

    RETURN discount;
END $$

DELIMITER ;

SELECT order_id, amount, CalculateDiscount(amount) AS discount
FROM ec_orders;

