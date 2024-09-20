CREATE OR REPLACE FUNCTION "EliminarCategoriaProducto"(P_IdCategoriaProducto UUID)
RETURNS VOID 
AS $$
BEGIN
    UPDATE "CategoriaProducto" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCategoriaProducto" = P_IdCategoriaProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;