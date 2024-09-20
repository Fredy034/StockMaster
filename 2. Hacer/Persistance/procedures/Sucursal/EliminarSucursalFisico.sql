CREATE OR REPLACE FUNCTION "EliminarSucursalFisica"(P_IdSucursal UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Sucursal" 
    WHERE "IdSucursal" = P_IdSucursal AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;