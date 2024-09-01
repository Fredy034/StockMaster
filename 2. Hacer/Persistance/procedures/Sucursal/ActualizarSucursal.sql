CREATE OR REPLACE FUNCTION "ActualizarSucursal"(P_IdSucursal UUID, P_IdCiudad UUID, P_IdTienda UUID, P_Nombre VARCHAR)
RETURNS TABLE ("IdSucursal" UUID, "IdCiudad" UUID, "IdTienda" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Sucursal" 
    SET "IdCiudad" = P_IdCiudad, "IdTienda" = P_IdTienda, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdSucursal" = P_IdSucursal AND "Activo" = '1'
    RETURNING "IdSucursal", "IdCiudad", "IdTienda", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
