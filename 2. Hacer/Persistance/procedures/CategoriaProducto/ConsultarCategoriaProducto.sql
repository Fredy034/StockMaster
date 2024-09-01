CREATE OR REPLACE FUNCTION "ConsultarCategoriaProducto"()
RETURNS TABLE ("IdCategoriaProducto" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT cp."IdCategoriaProducto", cp."Nombre", cp."Descripcion", cp."Activo", cp."Actualiza"
    FROM "CategoriaProducto" cp
    WHERE cp."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
