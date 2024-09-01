CREATE OR REPLACE FUNCTION "ConsultarMetodoPagoPorId"(P_IdMetodoPago UUID)
RETURNS TABLE ("IdMetodoPago" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT m."IdMetodoPago", m."Nombre", m."Descripcion", m."Activo", m."Actualiza"
    FROM "MetodoPago" m
    WHERE m."IdMetodoPago" = P_IdMetodoPago AND m."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
