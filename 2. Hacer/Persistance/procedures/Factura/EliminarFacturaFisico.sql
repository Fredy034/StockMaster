CREATE OR REPLACE FUNCTION "EliminarFacturaFisico"(P_IdFactura UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Factura" 
    WHERE "IdFactura" = P_IdFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;