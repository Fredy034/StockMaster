CREATE OR REPLACE FUNCTION "EliminarTipoProducto"(P_IdTipoProducto UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "TipoProducto" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoProducto" = P_IdTipoProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;