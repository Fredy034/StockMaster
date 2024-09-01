CREATE OR REPLACE FUNCTION "ConsultarCategoriaProductoPorId"(P_IdCategoriaProducto UUID)
RETURNS TABLE ("IdCategoriaProducto" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT cp."IdCategoriaProducto", cp."Nombre", cp."Descripcion", cp."Activo", cp."Actualiza"
    FROM "CategoriaProducto" cp
    WHERE cp."IdCategoriaProducto" = P_IdCategoriaProducto AND cp."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
