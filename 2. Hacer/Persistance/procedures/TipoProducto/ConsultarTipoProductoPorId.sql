CREATE OR REPLACE FUNCTION "ConsultarTipoProductoPorId"(P_IdTipoProducto UUID)
RETURNS TABLE ("IdTipoProducto" UUID, "IdCategoriaProducto" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT tp."IdTipoProducto", tp."IdCategoriaProducto", tp."Nombre", tp."Activo", tp."Actualiza"
    FROM "TipoProducto" tp
    WHERE tp."IdTipoProducto" = P_IdTipoProducto AND tp."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
