CREATE OR REPLACE FUNCTION "EliminarCliente"(P_IdCliente UUID)
RETURNS TABLE ("IdCliente" UUID, "IdPersona" UUID, "FechaRegistro" DATE, "Direccion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Cliente" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCliente" = P_IdCliente AND "Activo" = '1'
    RETURNING "IdCliente", "IdPersona", "FechaRegistro", "Direccion", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
