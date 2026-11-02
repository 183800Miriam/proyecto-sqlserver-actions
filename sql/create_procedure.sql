USE EmpresaDB;
GO

CREATE OR ALTER PROCEDURE sp_RegistrarVenta
    @Producto VARCHAR(100),
    @Cantidad INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si hay suficiente stock
    IF EXISTS (SELECT 1 FROM Inventario WHERE Producto = @Producto AND Stock >= @Cantidad)
    BEGIN
        -- 1. Descontar del Inventario
        UPDATE Inventario
        SET Stock = Stock - @Cantidad
        WHERE Producto = @Producto;

        -- 2. Registrar la Venta (esto activará el trigger trg_AuditarVenta automáticamente)
        INSERT INTO Ventas (Producto, Cantidad)
        VALUES (@Producto, @Cantidad);

        PRINT 'Venta registrada e inventario actualizado con éxito.';
    END
    ELSE
    BEGIN
        RAISERROR('Stock insuficiente o producto no encontrado en el inventario.', 16, 1);
    END;
END;
GO