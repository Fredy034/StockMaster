CREATE OR REPLACE FUNCTION "EliminarCliente"(P_IdCliente UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Cliente" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCliente" = P_IdCliente AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;