CREATE OR REPLACE FUNCTION "EliminarCategoriaProductoFisico"(P_IdCategoriaProducto UUID)
RETURNS VOID
AS $$
BEGIN
	DELETE FROM "CategoriaProducto"
	WHERE "IdCategoriaProducto" = P_IdCategoriaProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;