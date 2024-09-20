CREATE OR REPLACE FUNCTION "ActualizarSucursal"(P_IdSucursal UUID, P_IdCiudad UUID, P_IdTienda UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Sucursal" 
    SET "IdCiudad" = P_IdCiudad, "IdTienda" = P_IdTienda, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdSucursal" = P_IdSucursal AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;