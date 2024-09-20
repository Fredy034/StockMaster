CREATE OR REPLACE FUNCTION "ActualizarCliente"(P_IdCliente UUID, P_IdPersona UUID, P_FechaRegistro DATE, P_Direccion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Cliente" 
    SET "IdPersona" = P_IdPersona, "FechaRegistro" = P_FechaRegistro, "Direccion" = P_Direccion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCliente" = P_IdCliente AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;