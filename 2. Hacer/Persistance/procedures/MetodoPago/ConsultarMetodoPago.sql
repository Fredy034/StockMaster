CREATE OR REPLACE FUNCTION "ConsultarMetodoPago"()
RETURNS TABLE ("IdMetodoPago" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT m."IdMetodoPago", m."Nombre", m."Descripcion", m."Activo", m."Actualiza"
    FROM "MetodoPago" m
    WHERE m."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
