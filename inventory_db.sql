CREATE DATABASE InventoryDB;

USE InventoryDB;

CREATE TABLE products (
	ProductID INT AUTO_INCREMENT PRIMARY KEY,                -- Unique ID for each product
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0), -- Price must be non-negative
    UnitsInStock INT NOT NULL DEFAULT 0,
    SupplierID INT,                                          -- FK to Suppliers
    UNIQUE(ProductName)                                      -- Prevent duplicate product names
);

INSERT INTO Products (ProductName, Category, UnitPrice, UnitsInStock, SupplierID) VALUES
	('Laptop Pro 15', 'Electronics', 1200.00, 15, 1),
	('Wireless Mouse', 'Electronics', 25.00, 50, 1),
	('Office Chair', 'Furniture', 180.00, 20, 2),
	('Notebook Pack', 'Stationery', 5.50, 100, 5),
	('Ballpoint Pens (10pk)', 'Stationery', 3.00, 200, 5),
	('Desk Lamp', 'Electronics', 45.00, 30, 4),
	('External Hard Drive 1TB', 'Electronics', 75.00, 40, 1),
	('Printer Ink Cartridge', 'Office Supplies', 20.00, 80, 2),
	('Whiteboard', 'Office Supplies', 60.00, 25, 6),
	('Monitor 24"', 'Electronics', 150.00, 18, 7),
	('USB-C Cable', 'Electronics', 10.00, 120, 8),
	('Keyboard Mechanical', 'Electronics', 55.00, 35, 3),
	('Filing Cabinet', 'Furniture', 250.00, 12, 9),
	('Projector HD', 'Electronics', 400.00, 8, 10),
	('Tablet 10"', 'Electronics', 220.00, 22, 1),
	('Headphones Wireless', 'Electronics', 85.00, 45, 11),
	('Smartphone X', 'Electronics', 650.00, 16, 14),
	('Sticky Notes Pack', 'Stationery', 4.00, 150, 13),
	('Office Desk', 'Furniture', 320.00, 10, 2),
	('Scanner Pro', 'Electronics', 280.00, 14, 12);


CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactEmail VARCHAR(100) UNIQUE,           -- Each supplier must have unique email
    Phone VARCHAR(20)
);

INSERT INTO Suppliers (SupplierName, ContactEmail, Phone) VALUES
	('TechSource Ltd', 'contact@techsource.com', '254700111001'),
	('GadgetHub', 'info@gadgethub.com', '254700111002'),
	('OfficeMart', 'support@officemart.com', '254700111003'),
	('ElectroWorld', 'sales@electroworld.com', '254700111004'),
	('Stationery Plus', 'orders@stationeryplus.com', '254700111005'),
	('CompuCare', 'help@compucare.com', '254700111006'),
	('Mega Supplies', 'contact@megasupplies.com', '254700111007'),
	('Smart Distributors', 'info@smartdist.com', '254700111008'),
	('PaperWorks Ltd', 'sales@paperworks.com', '254700111009'),
	('Digital Zone', 'support@digitalzone.com', '254700111010'),
	('FastTech', 'orders@fasttech.com', '254700111011'),
	('EcoSupplies', 'info@ecosupplies.com', '254700111012'),
	('BrightStationery', 'contact@brightstationery.com', '254700111013'),
	('Innovatech', 'sales@innovatech.com', '254700111014'),
	('ProTech Ltd', 'help@protech.com', '254700111015'),
	('NextGen Supplies', 'orders@nextgen.com', '254700111016'),
	('Elite Electronics', 'support@eliteelec.com', '254700111017'),
	('Techie World', 'info@techieworld.com', '254700111018'),
	('Office Essentials', 'contact@officeessentials.com', '254700111019'),
	('Quick Supplies', 'sales@quicksupplies.com', '254700111020');


CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Region VARCHAR(100) NOT NULL,   -- e.g., Nairobi, Kisumu
    Country VARCHAR(100) NOT NULL   -- e.g., Kenya
);


INSERT INTO Customers (FirstName, LastName, Email, Phone, Region, Country) VALUES
('John', 'Doe', 'john.doe@email.com', '254701111001', 'Nairobi', 'Kenya'),
('Jane', 'Smith', 'jane.smith@email.com', '254701111002', 'Mombasa', 'Kenya'),
('Emily', 'Clark', 'emily.clark@email.com', '254701111003', 'Kisumu', 'Kenya'),
('Michael', 'Brown', 'michael.brown@email.com', '254701111004', 'Nakuru', 'Kenya'),
('Sarah', 'Johnson', 'sarah.j@email.com', '254701111005', 'Eldoret', 'Kenya'),
('David', 'Lee', 'david.lee@email.com', '254701111006', 'Nairobi', 'Kenya'),
('Sophia', 'Kimani', 'sophia.k@email.com', '254701111007', 'Thika', 'Kenya'),
('Daniel', 'Mwangi', 'daniel.m@email.com', '254701111008', 'Nyeri', 'Kenya'),
('Grace', 'Atieno', 'grace.a@email.com', '254701111009', 'Kisii', 'Kenya'),
('Brian', 'Otieno', 'brian.o@email.com', '254701111010', 'Siaya', 'Kenya'),
('Kevin', 'Kamau', 'kevin.k@email.com', '254701111011', 'Machakos', 'Kenya'),
('Lucy', 'Wambui', 'lucy.w@email.com', '254701111012', 'Meru', 'Kenya'),
('Peter', 'Omondi', 'peter.o@email.com', '254701111013', 'Migori', 'Kenya'),
('Agnes', 'Mumbi', 'agnes.m@email.com', '254701111014', 'Murang’a', 'Kenya'),
('Felix', 'Mutua', 'felix.m@email.com', '254701111015', 'Kitale', 'Kenya'),
('Anne', 'Achieng', 'anne.a@email.com', '254701111016', 'Busia', 'Kenya'),
('George', 'Karanja', 'george.k@email.com', '254701111017', 'Kericho', 'Kenya'),
('Mary', 'Wairimu', 'mary.w@email.com', '254701111018', 'Nairobi', 'Kenya'),
('Isaac', 'Cheruiyot', 'isaac.c@email.com', '254701111019', 'Bomet', 'Kenya'),
('Ruth', 'Chebet', 'ruth.c@email.com', '254701111020', 'Kapsabet', 'Kenya');



CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',       -- Pending, Shipped, Cancelled, etc.
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (CustomerID, OrderDate, Status) VALUES
(1, '2025-01-10', 'Shipped'),
(2, '2025-01-12', 'Pending'),
(3, '2025-01-13', 'Cancelled'),
(4, '2025-01-14', 'Shipped'),
(5, '2025-01-15', 'Pending'),
(6, '2025-01-17', 'Shipped'),
(7, '2025-01-18', 'Pending'),
(8, '2025-01-19', 'Pending'),
(9, '2025-01-20', 'Shipped'),
(10, '2025-01-21', 'Shipped'),
(11, '2025-01-22', 'Cancelled'),
(12, '2025-01-23', 'Shipped'),
(13, '2025-01-25', 'Pending'),
(14, '2025-01-26', 'Shipped'),
(15, '2025-01-27', 'Shipped'),
(16, '2025-01-28', 'Pending'),
(17, '2025-01-29', 'Shipped'),
(18, '2025-01-30', 'Shipped'),
(19, '2025-02-01', 'Pending'),
(20, '2025-02-02', 'Shipped');


CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),   -- Must order at least 1 item
    PRIMARY KEY (OrderID, ProductID),             -- Composite key: unique product per order
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(2, 4, 5),
(3, 5, 2),
(4, 6, 1),
(4, 7, 2),
(5, 8, 3),
(6, 9, 1),
(7, 10, 2),
(8, 11, 4),
(9, 12, 1),
(10, 13, 1),
(11, 14, 2),
(12, 15, 1),
(13, 16, 2),
(14, 17, 1),
(15, 18, 3),
(16, 19, 1),
(20, 20, 2);


CREATE TABLE InventoryTransactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    TransactionType VARCHAR(20) NOT NULL,       -- e.g., 'Stock In', 'Stock Out', 'Adjustment'
    Quantity INT NOT NULL,
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO InventoryTransactions (ProductID, TransactionType, Quantity) VALUES
(1, 'Stock In', 20),
(2, 'Stock In', 50),
(3, 'Stock Out', 5),
(4, 'Stock In', 100),
(5, 'Stock Out', 10),
(6, 'Stock In', 15),
(7, 'Stock Out', 4),
(8, 'Stock In', 30),
(9, 'Stock Out', 2),
(10, 'Stock In', 25),
(11, 'Stock Out', 6),
(12, 'Stock In', 40),
(13, 'Stock In', 10),
(14, 'Stock Out', 3),
(15, 'Stock In', 12),
(16, 'Stock Out', 8),
(17, 'Stock In', 18),
(18, 'Stock In', 5),
(19, 'Stock Out', 7),
(20, 'Stock In', 9);

