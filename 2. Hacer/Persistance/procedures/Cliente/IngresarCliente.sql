CREATE OR REPLACE FUNCTION "IngresarCliente"(P_IdPersona UUID, P_FechaRegistro DATE, P_Direccion VARCHAR)
RETURNS TABLE ("IdCliente" UUID, "IdPersona" UUID, "FechaRegistro" DATE, "Direccion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Cliente" ("IdPersona", "FechaRegistro", "Direccion") 
    VALUES (P_IdPersona, P_FechaRegistro, P_Direccion)
    RETURNING "IdCliente", "IdPersona", "FechaRegistro", "Direccion", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
