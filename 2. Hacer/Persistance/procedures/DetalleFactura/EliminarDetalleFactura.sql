CREATE OR REPLACE FUNCTION "EliminarDetalleFactura"(P_IdDetalleFactura UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "DetalleFactura" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDetalleFactura" = P_IdDetalleFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;