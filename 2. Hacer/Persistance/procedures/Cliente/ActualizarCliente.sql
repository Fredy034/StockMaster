CREATE OR REPLACE FUNCTION "ActualizarCliente"(P_IdCliente UUID, P_IdPersona UUID, P_FechaRegistro DATE, P_Direccion VARCHAR)
RETURNS TABLE ("IdCliente" UUID, "IdPersona" UUID, "FechaRegistro" DATE, "Direccion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Cliente" 
    SET "IdPersona" = P_IdPersona, "FechaRegistro" = P_FechaRegistro, "Direccion" = P_Direccion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCliente" = P_IdCliente AND "Activo" = '1'
    RETURNING "IdCliente", "IdPersona", "FechaRegistro", "Direccion", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
