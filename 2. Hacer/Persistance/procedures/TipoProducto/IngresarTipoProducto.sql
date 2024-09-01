CREATE OR REPLACE FUNCTION "IngresarTipoProducto"(P_IdCategoriaProducto UUID, P_Nombre VARCHAR)
RETURNS TABLE ("IdTipoProducto" UUID, "IdCategoriaProducto" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "TipoProducto" ("IdCategoriaProducto", "Nombre") 
    VALUES (P_IdCategoriaProducto, P_Nombre)
    RETURNING "IdTipoProducto", "IdCategoriaProducto", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
