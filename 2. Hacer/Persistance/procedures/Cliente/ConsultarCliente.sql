CREATE OR REPLACE FUNCTION "ConsultarCliente"()
RETURNS TABLE ("IdCliente" UUID, "IdPersona" UUID, "FechaRegistro" DATE, "Direccion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT cl."IdCliente", cl."IdPersona", cl."FechaRegistro", cl."Direccion", cl."Activo", cl."Actualiza"
    FROM "Cliente" cl
    WHERE cl."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
