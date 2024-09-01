CREATE OR REPLACE FUNCTION "IngresarProducto"(P_IdTipoProducto UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR, P_Precio DECIMAL, P_Stock DECIMAL)
RETURNS TABLE ("IdProducto" UUID, "IdTipoProducto" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Precio" DECIMAL, "Stock" DECIMAL, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Producto" ("IdTipoProducto", "Nombre", "Descripcion", "Precio", "Stock") 
    VALUES (P_IdTipoProducto, P_Nombre, P_Descripcion, P_Precio, P_Stock)
    RETURNING "IdProducto", "IdTipoProducto", "Nombre", "Descripcion", "Precio", "Stock", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
