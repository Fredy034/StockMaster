CREATE OR REPLACE FUNCTION "EliminarProducto"(P_IdProducto UUID)
RETURNS TABLE ("IdProducto" UUID, "IdTipoProducto" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Precio" DECIMAL, "Stock" DECIMAL, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Producto" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdProducto" = P_IdProducto AND "Activo" = '1'
    RETURNING "IdProducto", "IdTipoProducto", "Nombre", "Descripcion", "Precio", "Stock", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
