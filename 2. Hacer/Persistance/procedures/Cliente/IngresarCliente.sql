CREATE OR REPLACE FUNCTION "IngresarCliente"(P_IdPersona UUID, P_FechaRegistro DATE, P_Direccion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Cliente" ("IdPersona", "FechaRegistro", "Direccion") 
    VALUES (P_IdPersona, P_FechaRegistro, P_Direccion);
END;
$$ LANGUAGE plpgsql;