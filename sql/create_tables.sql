USE EmpresaDB;
GO

-- Tabla Ventas
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Ventas')
BEGIN
    CREATE TABLE Ventas (
        VentaID INT IDENTITY(1,1) PRIMARY KEY,
        Producto VARCHAR(100) NOT NULL,
        Cantidad INT NOT NULL,
        Fecha DATETIME DEFAULT GETDATE()
    );
END;
GO

-- Tabla AuditoriaVentas
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'AuditoriaVentas')
BEGIN
    CREATE TABLE AuditoriaVentas (
        AuditoriaID INT IDENTITY(1,1) PRIMARY KEY,
        VentaID INT NOT NULL,
        FechaRegistro DATETIME DEFAULT GETDATE(),
        Mensaje VARCHAR(255) NOT NULL
    );
END;
GO

-- Tabla Inventario (Reto Avanzado)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Inventario')
BEGIN
    CREATE TABLE Inventario (
        ProductoID INT IDENTITY(1,1) PRIMARY KEY,
        Producto VARCHAR(100) UNIQUE NOT NULL,
        Stock INT NOT NULL
    );

    -- Stock inicial de prueba
    INSERT INTO Inventario (Producto, Stock) VALUES ('Laptop', 50);
    INSERT INTO Inventario (Producto, Stock) VALUES ('Monitor', 30);
    INSERT INTO Inventario (Producto, Stock) VALUES ('Teclado', 100);
END;
GO