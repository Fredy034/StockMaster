CREATE OR REPLACE FUNCTION "IngresarProducto"(P_IdTipoProducto UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR, P_Precio DECIMAL, P_Stock DECIMAL)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Producto" ("IdTipoProducto", "Nombre", "Descripcion", "Precio", "Stock") 
    VALUES (P_IdTipoProducto, P_Nombre, P_Descripcion, P_Precio, P_Stock);
END;
$$ LANGUAGE plpgsql;