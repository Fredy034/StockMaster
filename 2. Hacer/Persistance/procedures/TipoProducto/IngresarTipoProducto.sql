CREATE OR REPLACE FUNCTION "IngresarTipoProducto"(P_IdCategoriaProducto UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "TipoProducto" ("IdCategoriaProducto", "Nombre") 
    VALUES (P_IdCategoriaProducto, P_Nombre);
END;
$$ LANGUAGE plpgsql;