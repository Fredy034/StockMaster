CREATE OR REPLACE FUNCTION "EliminarSucursal"(P_IdSucursal UUID)
RETURNS TABLE ("IdSucursal" UUID, "IdCiudad" UUID, "IdTienda" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Sucursal" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdSucursal" = P_IdSucursal AND "Activo" = '1'
    RETURNING "IdSucursal", "IdCiudad", "IdTienda", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
