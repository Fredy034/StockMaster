CREATE OR REPLACE FUNCTION "ActualizarTienda"(P_IdTienda UUID, P_Nombre VARCHAR, P_Nit VARCHAR, P_Telefono VARCHAR, P_Correo VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Tienda" 
    SET "Nombre" = P_Nombre, "Nit" = P_Nit, "Telefono" = P_Telefono, "Correo" = P_Correo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTienda" = P_IdTienda AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;