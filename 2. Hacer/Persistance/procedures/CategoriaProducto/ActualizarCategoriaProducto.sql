CREATE OR REPLACE FUNCTION "ActualizarCategoriaProducto"(P_IdCategoriaProducto UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS TABLE ("IdCategoriaProducto" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "CategoriaProducto" 
    SET "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCategoriaProducto" = P_IdCategoriaProducto AND "Activo" = '1'
    RETURNING "IdCategoriaProducto", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
