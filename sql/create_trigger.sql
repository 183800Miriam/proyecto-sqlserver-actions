CREATE OR ALTER TRIGGER trg_AuditarVenta
ON Ventas
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO AuditoriaVentas (VentaID, Mensaje)
    SELECT 
        i.VentaID,
        CONCAT('Venta registrada automáticamente para el producto: ', i.Producto, ' (Cantidad: ', i.Cantidad, ')')
    FROM inserted i;
END;
GO