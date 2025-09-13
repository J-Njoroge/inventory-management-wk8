"# inventory-management-wk8" 

---

# Inventory Tracking System

## Overview

This project is a **relational database management system (RDBMS)** for tracking inventory, suppliers, customers, and orders. It is designed using **MySQL** and follows principles of **database normalization** to ensure data integrity and eliminate redundancy.

The system supports:

* Managing products and suppliers
* Tracking customers and their regions/countries
* Recording customer orders and order details
* Monitoring stock movements through inventory transactions

---

## Database Schema

The database contains the following tables:

### 1. **Suppliers**

Stores supplier details.

```sql
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactEmail VARCHAR(100) UNIQUE,
    Phone VARCHAR(20)
);
```

### 2. **Products**

Stores products and links them to suppliers.

```sql
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL UNIQUE,
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0),
    UnitsInStock INT NOT NULL DEFAULT 0,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
```

### 3. **Customers** (Normalized)

Now split into `Region` and `Country` instead of a single `Address` field.

```sql
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Region VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL
);
```

### 4. **Orders**

Links customers to orders.

```sql
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

### 5. **OrderDetails**

Resolves the many-to-many relationship between `Orders` and `Products`.

```sql
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
```

### 6. **InventoryTransactions**

Logs stock movement in/out.

```sql
CREATE TABLE InventoryTransactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    TransactionType VARCHAR(20) NOT NULL,
    Quantity INT NOT NULL,
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
```

---

## Normalization

* **1NF (First Normal Form):**

  * Removed compound `Address` field in `Customers`.
  * Split into `Region` and `Country` for atomic values.

* **2NF & 3NF:**

  * Composite keys used where appropriate (`OrderDetails`).
  * Foreign keys ensure referential integrity (e.g., Products → Suppliers).
  * Eliminated redundancy (e.g., suppliers stored once, linked to products).

---

## 📊 Example Insert (Customers)

```sql
INSERT INTO Customers (FirstName, LastName, Email, Phone, Region, Country) VALUES
('John', 'Doe', 'john.doe@email.com', '254701111001', 'Nairobi', 'Kenya'),
('Jane', 'Smith', 'jane.smith@email.com', '254701111002', 'Mombasa', 'Kenya'),
('Emily', 'Clark', 'emily.clark@email.com', '254701111003', 'Kisumu', 'Kenya');
```

---

## 🚀 How to Run

1. Open MySQL Workbench (or your SQL environment).
2. Copy the contents of `inventory.sql`.
3. Run the script to create the database and tables.
4. Use `INSERT` statements to populate tables with sample data.
5. Run queries to:

   * Get stock levels
   * Track orders
   * Find customers by region/country

---

## Benefits of This Design

* **Normalized:** avoids duplication, ensures data integrity.
* **Scalable:** supports additional countries, regions, and new products easily.
* **Practical:** models real-world inventory workflows (suppliers → products → customers → orders → stock transactions).

