CREATE OR REPLACE FUNCTION "ActualizarTipoProducto"(P_IdTipoProducto UUID, P_IdCategoriaProducto UUID, P_Nombre VARCHAR)
RETURNS TABLE ("IdTipoProducto" UUID, "IdCategoriaProducto" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "TipoProducto" 
    SET "IdCategoriaProducto" = P_IdCategoriaProducto, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoProducto" = P_IdTipoProducto AND "Activo" = '1'
    RETURNING "IdTipoProducto", "IdCategoriaProducto", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
