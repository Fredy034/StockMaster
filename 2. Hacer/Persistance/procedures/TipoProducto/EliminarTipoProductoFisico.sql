CREATE OR REPLACE FUNCTION "EliminarTipoProductoFisico"(P_IdTipoProducto UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "TipoProducto" 
    WHERE "IdTipoProducto" = P_IdTipoProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;