CREATE OR REPLACE FUNCTION "ActualizarProducto"(P_IdProducto UUID, P_IdTipoProducto UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR, P_Precio DECIMAL, P_Stock DECIMAL)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Producto" 
    SET "IdTipoProducto" = P_IdTipoProducto, "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Precio" = P_Precio, "Stock" = P_Stock, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdProducto" = P_IdProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;