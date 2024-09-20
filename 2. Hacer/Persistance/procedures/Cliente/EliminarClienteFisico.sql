CREATE OR REPLACE FUNCTION "EliminarClienteFisico"(P_IdCliente UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Cliente" 
    WHERE "IdCliente" = P_IdCliente AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;