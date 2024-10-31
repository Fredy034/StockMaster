CREATE OR REPLACE FUNCTION "ConsultarClientePorNombre"(P_DireccionCliente VARCHAR)
RETURNS TABLE ("IdCliente" UUID, "IdPersona" UUID, "FechaRegistro" DATE, "Direccion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT cl."IdCliente", cl."IdPersona", cl."FechaRegistro", cl."Direccion", cl."Activo", cl."Actualiza"
    FROM "Cliente" cl
    WHERE cl."Direccion" = P_DireccionCliente AND cl."Activo" = '1';
END;
$$ LANGUAGE plpgsql;