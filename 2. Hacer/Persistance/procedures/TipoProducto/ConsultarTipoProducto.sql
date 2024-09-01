CREATE OR REPLACE FUNCTION "ConsultarTipoProducto"()
RETURNS TABLE ("IdTipoProducto" UUID, "IdCategoriaProducto" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT tp."IdTipoProducto", tp."IdCategoriaProducto", tp."Nombre", tp."Activo", tp."Actualiza"
    FROM "TipoProducto" tp
    WHERE tp."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
