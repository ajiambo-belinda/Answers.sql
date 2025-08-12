USE salesDB;

-- 2. Create 'payments' table and insert sample data
CREATE TABLE IF NOT EXISTS payments (
  checkNumber VARCHAR(50) PRIMARY KEY,
  paymentDate DATE,
  amount DECIMAL(10,2)
);

INSERT INTO payments (checkNumber, paymentDate, amount) VALUES
('CHK001', '2025-08-01', 1500.00),
('CHK002', '2025-08-05', 2450.50),
('CHK003', '2025-08-10', 3200.75)
ON DUPLICATE KEY UPDATE paymentDate=VALUES(paymentDate), amount=VALUES(amount);


-- 3. Create 'orders' table and insert sample data
CREATE TABLE IF NOT EXISTS orders (
  orderNumber INT PRIMARY KEY AUTO_INCREMENT,
  orderDate DATE,
  requiredDate DATE,
  status VARCHAR(50)
);

INSERT INTO orders (orderDate, requiredDate, status) VALUES
('2025-07-15', '2025-07-25', 'In Process'),
('2025-07-20', '2025-07-30', 'Shipped'),
('2025-07-18', '2025-07-28', 'In Process'),
('2025-07-22', '2025-08-01', 'Cancelled'),
('2025-07-25', '2025-08-05', 'In Process');


-- 4. Create 'employees' table and insert sample data
CREATE TABLE IF NOT EXISTS employees (
  employeeNumber INT PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(50),
  lastName VARCHAR(50),
  email VARCHAR(100),
  jobTitle VARCHAR(50)
);

INSERT INTO employees (firstName, lastName, email, jobTitle) VALUES
('John', 'Doe', 'john.doe@example.com', 'Sales Rep'),
('Jane', 'Smith', 'jane.smith@example.com', 'Sales Manager'),
('Emily', 'Johnson', 'emily.johnson@example.com', 'Sales Rep'),
('Michael', 'Brown', 'michael.brown@example.com', 'Developer'),
('Lisa', 'Davis', 'lisa.davis@example.com', 'Sales Rep');


-- 5. Create 'offices' table and insert sample data
CREATE TABLE IF NOT EXISTS offices (
  officeCode INT PRIMARY KEY,
  city VARCHAR(50),
  phone VARCHAR(20),
  addressLine1 VARCHAR(100),
  addressLine2 VARCHAR(100),
  state VARCHAR(50),
  country VARCHAR(50),
  postalCode VARCHAR(15),
  territory VARCHAR(50)
);

INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory) VALUES
(1, 'San Francisco', '123-456-7890', '100 Market St', '', 'CA', 'USA', '94105', 'NA'),
(2, 'Boston', '234-567-8901', '200 Main St', 'Suite 500', 'MA', 'USA', '02110', 'NA'),
(3, 'New York', '345-678-9012', '300 Broadway', '', 'NY', 'USA', '10007', 'NA');


-- 6. Create 'products' table and insert sample data
CREATE TABLE IF NOT EXISTS products (
  productCode INT PRIMARY KEY AUTO_INCREMENT,
  productName VARCHAR(100),
  buyPrice DECIMAL(10,2),
  quantityInStock INT
);

INSERT INTO products (productName, buyPrice, quantityInStock) VALUES
('SuperWidget', 25.50, 100),
('MegaWidget', 15.75, 50),
('UltraWidget', 35.00, 25),
('MiniWidget', 10.00, 200),
('GigaWidget', 45.25, 10),
('NanoWidget', 8.50, 75)
ON DUPLICATE KEY UPDATE buyPrice=VALUES(buyPrice), quantityInStock=VALUES(quantityInStock);
