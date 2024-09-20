CREATE OR REPLACE FUNCTION "EliminarProducto"(P_IdProducto UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Producto" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdProducto" = P_IdProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;