USE EmpresaDB;
GO

CREATE TRIGGER trg_AuditarVenta
ON Ventas
AFTER INSERT
AS
BEGIN
    EXEC sp_RegistrarAuditoriaYActualizarStock;
END;
GO