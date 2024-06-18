-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ID INT,
	  ProductName VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
	  ID INT,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
	  CountryID INT,
	  FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
	  ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    WarehouseAmount INT,
	  PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');
INSERT INTO Products (ID,ProductName)
	VALUES (1, 'Product');
INSERT INTO Warehouses (ID,WarehouseName,WarehouseAddress,CountryID)
	VALUES (1, 'Kiev1','Khreshchatyk1','1');
INSERT INTO Warehouses (ID,WarehouseName,WarehouseAddress,CountryID)
	VALUES (2, 'Kiev2','Khreshchatyk2','2');
INSERT INTO ProductInventory (ID,ProductID,WarehouseID,WarehouseAmount)
	VALUES (1, 1, 1, 4);
INSERT INTO ProductInventory (ID,ProductID,WarehouseID,WarehouseAmount)
	VALUES (2, 1, 2, 5);

