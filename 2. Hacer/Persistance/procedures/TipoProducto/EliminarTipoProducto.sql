CREATE OR REPLACE FUNCTION "EliminarTipoProducto"(P_IdTipoProducto UUID)
RETURNS TABLE ("IdTipoProducto" UUID, "IdCategoriaProducto" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "TipoProducto" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoProducto" = P_IdTipoProducto AND "Activo" = '1'
    RETURNING "IdTipoProducto", "IdCategoriaProducto", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
