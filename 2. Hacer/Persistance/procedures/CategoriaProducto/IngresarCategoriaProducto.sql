CREATE OR REPLACE FUNCTION "IngresarCategoriaProducto"(P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "CategoriaProducto" ("Nombre", "Descripcion") 
    VALUES (P_Nombre, P_Descripcion);
END;
$$ LANGUAGE plpgsql;