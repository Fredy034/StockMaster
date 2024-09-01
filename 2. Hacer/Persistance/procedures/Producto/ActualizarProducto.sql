CREATE OR REPLACE FUNCTION "ActualizarProducto"(P_IdProducto UUID, P_IdTipoProducto UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR, P_Precio DECIMAL, P_Stock DECIMAL)
RETURNS TABLE ("IdProducto" UUID, "IdTipoProducto" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Precio" DECIMAL, "Stock" DECIMAL, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Producto" 
    SET "IdTipoProducto" = P_IdTipoProducto, "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Precio" = P_Precio, "Stock" = P_Stock, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdProducto" = P_IdProducto AND "Activo" = '1'
    RETURNING "IdProducto", "IdTipoProducto", "Nombre", "Descripcion", "Precio", "Stock", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
