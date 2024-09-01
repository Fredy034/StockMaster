CREATE OR REPLACE FUNCTION "ConsultarGenero"()
RETURNS TABLE ("IdGenero" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT g."IdGenero", g."Nombre", g."Activo", g."Actualiza"
    FROM "Genero" g
    WHERE g."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
