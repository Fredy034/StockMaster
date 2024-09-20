CREATE OR REPLACE FUNCTION "EliminarTienda"(P_IdTienda UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Tienda" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTienda" = P_IdTienda AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;