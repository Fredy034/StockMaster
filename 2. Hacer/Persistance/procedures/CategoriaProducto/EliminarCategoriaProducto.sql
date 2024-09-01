CREATE OR REPLACE FUNCTION "EliminarCategoriaProducto"(P_IdCategoriaProducto UUID)
RETURNS TABLE ("IdCategoriaProducto" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "CategoriaProducto" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCategoriaProducto" = P_IdCategoriaProducto AND "Activo" = '1'
    RETURNING "IdCategoriaProducto", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
