CREATE OR REPLACE FUNCTION "ActualizarCategoriaProducto"(P_IdCategoriaProducto UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "CategoriaProducto" 
    SET "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCategoriaProducto" = P_IdCategoriaProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;