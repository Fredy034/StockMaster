CREATE OR REPLACE FUNCTION "EliminarSucursal"(P_IdSucursal UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Sucursal" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdSucursal" = P_IdSucursal AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;