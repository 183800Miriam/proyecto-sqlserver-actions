USE EmpresaDB;
GO

CREATE TABLE Ventas(
    VentaID INT IDENTITY(1,1) PRIMARY KEY,
    Producto VARCHAR(100),
    Cantidad INT,
    Fecha DATETIME DEFAULT GETDATE()
);

CREATE TABLE AuditoriaVentas(
    AuditoriaID INT IDENTITY(1,1) PRIMARY KEY,
    VentaID INT,
    FechaRegistro DATETIME DEFAULT GETDATE(),
    Mensaje VARCHAR(255)
);

CREATE TABLE Inventario(
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    Producto VARCHAR(100) UNIQUE,
    Stock INT
);
GO

INSERT INTO Inventario (Producto, Stock) VALUES ('Laptop', 20), ('Monitor', 15);
GO