-- SELECT * FROM "ConsultarPais"();

CREATE OR REPLACE FUNCTION "ConsultarPais"()
RETURNS TABLE ("IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdPais", p."Nombre", p."Activo", p."Actualiza"
    FROM "Pais" p
    WHERE p."Activo" = '1';
END;
$$ LANGUAGE plpgsql;