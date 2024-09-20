CREATE OR REPLACE FUNCTION "EliminarProductoFisico"(P_IdProducto UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Producto" 
    WHERE "IdProducto" = P_IdProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;