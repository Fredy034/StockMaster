CREATE OR REPLACE FUNCTION "EliminarFactura"(P_IdFactura UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Factura" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdFactura" = P_IdFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;