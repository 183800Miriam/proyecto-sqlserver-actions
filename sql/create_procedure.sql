USE EmpresaDB;
GO

CREATE PROCEDURE sp_RegistrarAuditoriaYActualizarStock
AS
BEGIN
    INSERT INTO AuditoriaVentas (VentaID, Mensaje)
    SELECT VentaID, 'Venta registrada automáticamente'
    FROM inserted;

    UPDATE i
    SET i.Stock = i.Stock - ins.Cantidad
    FROM Inventario i
    INNER JOIN inserted ins ON i.Producto = ins.Producto;
END;
GO