CREATE OR REPLACE FUNCTION "EliminarTienda"(P_IdTienda UUID)
RETURNS TABLE ("IdTienda" UUID, "Nombre" VARCHAR, "Nit" VARCHAR, "Telefono" VARCHAR, "Correo" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Tienda" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTienda" = P_IdTienda AND "Activo" = '1'
    RETURNING "IdTienda", "Nombre", "Nit", "Telefono", "Correo", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
