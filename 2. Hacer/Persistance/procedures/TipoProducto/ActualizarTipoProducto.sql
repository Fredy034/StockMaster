CREATE OR REPLACE FUNCTION "ActualizarTipoProducto"(P_IdTipoProducto UUID, P_IdCategoriaProducto UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "TipoProducto" 
    SET "IdCategoriaProducto" = P_IdCategoriaProducto, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoProducto" = P_IdTipoProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;