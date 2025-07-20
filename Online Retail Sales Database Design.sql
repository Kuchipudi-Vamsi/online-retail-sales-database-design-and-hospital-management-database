CREATE DATABASE RetailSalesDB;
USE RetailSalesDB;

-- schema.sql
-- 1. Customers Table
CREATE TABLE Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(15),
  address TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Products Table
CREATE TABLE Products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  stock INT DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 3. Orders Table
CREATE TABLE Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(50) DEFAULT 'Pending',
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 4. Order_Items Table (Many-to-Many Bridge)
CREATE TABLE Order_Items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 5. Payments Table
CREATE TABLE Payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  amount DECIMAL(10,2) NOT NULL,
  payment_method VARCHAR(50),
  payment_status VARCHAR(50) DEFAULT 'Pending',
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Sample Data
INSERT INTO Customers (name, email, phone, address) VALUES
('Alice Johnson', 'alice@example.com', '9876543210', 'Bangalore'),
('Bob Smith', 'bob@example.com', '8765432109', 'Mumbai'),
('Charlie Brown', 'charlie@example.com', '7654321098', 'Delhi');

INSERT INTO Products (name, description, price, stock) VALUES
('Laptop', 'Gaming laptop', 70000.00, 50),
('Smartphone', 'Android phone', 25000.00, 150),
('Headphones', 'Bluetooth headphones', 3000.00, 200),
('Keyboard', 'Mechanical keyboard', 1500.00, 100);

INSERT INTO Orders (customer_id, status, total_amount) VALUES
(1, 'Shipped', 73000.00),
(2, 'Processing', 28000.00),
(3, 'Delivered', 4500.00);

INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 70000.00),
(1, 3, 1, 3000.00),
(2, 2, 1, 25000.00),
(2, 4, 2, 1500.00),
(3, 3, 1, 3000.00),
(3, 4, 1, 1500.00);

INSERT INTO Payments (order_id, amount, payment_method, payment_status) VALUES
(1, 73000.00, 'Credit Card', 'Paid'),
(2, 28000.00, 'UPI', 'Pending'),
(3, 4500.00, 'Cash', 'Paid');

-- View Order Summary with Customer & Items
SELECT o.order_id, c.name AS customer_name, p.name AS product_name,
       oi.quantity, oi.price, o.total_amount, o.status
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
ORDER BY o.order_id;

-- Total Sales per Product
SELECT p.name AS product, SUM(oi.quantity) AS total_units_sold,
       SUM(oi.quantity * oi.price) AS total_sales
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sales DESC;

-- Daily Sales Report
SELECT DATE(order_date) AS sales_date,
       COUNT(order_id) AS total_orders,
       SUM(total_amount) AS daily_revenue
FROM Orders
GROUP BY sales_date
ORDER BY sales_date DESC;

-- Customer Purchase History
SELECT c.name, o.order_id, o.order_date, o.total_amount, p.name AS product, oi.quantity
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
ORDER BY c.customer_id, o.order_date DESC;

-- Daily Sales View
CREATE VIEW Daily_Sales_View AS
SELECT DATE(order_date) AS sales_date,
       COUNT(order_id) AS total_orders,
       SUM(total_amount) AS total_revenue
FROM Orders
GROUP BY sales_date;

-- best selling products view 
CREATE VIEW Best_Selling_Products AS
SELECT p.name, SUM(oi.quantity) AS units_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY units_sold DESC;





