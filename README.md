# SQL_Task8
# Database Setup

1. Database creation

Creates a database named ecommerce and selects it.

2. Tables created

ec_customers: Stores customer details (customer_id, customer_name, email, city).

ec_orders: Stores order details (order_id, customer_id, amount, order_date) with a foreign key linking to ec_customers.

3. Sample data inserted

Four customers from different cities.

Four orders with varying amounts and dates.

# Stored Procedure – GetCustomersByCity(cityName)

* Accepts a city name as input.

* Returns all customer details for that city.

* Example call: CALL GetCustomersByCity('New York');

# Function – CalculateDiscount(amount)

Returns a discount based on the order amount:

≥ 1000 → 10% discount

≥ 500 and < 1000 → 5% discount

< 500 → 0% discount

Example usage: SELECT order_id, amount, CalculateDiscount(amount) AS discount FROM ec_orders;

# Purpose
This script demonstrates:

1. Creating a database and related tables with relationships.

2. Inserting sample data.

3. Using a stored procedure for filtered queries.

4. Creating a function for conditional calculations.
