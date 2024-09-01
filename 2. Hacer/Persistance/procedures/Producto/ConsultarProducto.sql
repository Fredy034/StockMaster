CREATE OR REPLACE FUNCTION "ConsultarProducto"()
RETURNS TABLE ("IdProducto" UUID, "IdTipoProducto" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Precio" DECIMAL, "Stock" DECIMAL, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdProducto", p."IdTipoProducto", p."Nombre", p."Descripcion", p."Precio", p."Stock", p."Activo", p."Actualiza"
    FROM "Producto" p
    WHERE p."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
