

CREATE DATABASE QL_VanPhongPham;
GO
USE QL_VanPhongPham;
GO
-- 1. Tạo bảng Nhà cung cấp (Suppliers)
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName NVARCHAR(255) NOT NULL,
    ContactName NVARCHAR(100),
    Address NVARCHAR(255),
    City NVARCHAR(100),
    Phone NVARCHAR(20)
);

-- 2. Tạo bảng Khách hàng (Customers)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(255) NOT NULL,
    ContactName NVARCHAR(100),
    Email NVARCHAR(100),
    Address NVARCHAR(255),
    City NVARCHAR(100)
);

-- 3. Tạo bảng Sản phẩm (Products)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(255) NOT NULL,
    Unit NVARCHAR(50),
    Price DECIMAL(18, 2)
);

-- 4. Tạo bảng Trung gian NCC_Sản phẩm (Supplier_Product)
-- Thể hiện mối quan hệ: Một nhà cung cấp có thể cung cấp nhiều sản phẩm và ngược lại
CREATE TABLE Supplier_Product (
    SupplierID INT,
    ProductID INT,
    PRIMARY KEY (SupplierID, ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 5. Tạo bảng Đơn hàng (Orders)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(18, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 6. Tạo bảng Chi tiết đơn hàng (OrderDetails)
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PriceAtPurchase DECIMAL(18, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
