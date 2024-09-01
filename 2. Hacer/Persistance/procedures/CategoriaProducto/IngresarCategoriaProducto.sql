CREATE OR REPLACE FUNCTION "IngresarCategoriaProducto"(P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS TABLE ("IdCategoriaProducto" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "CategoriaProducto" ("Nombre", "Descripcion") 
    VALUES (P_Nombre, P_Descripcion)
    RETURNING "IdCategoriaProducto", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
