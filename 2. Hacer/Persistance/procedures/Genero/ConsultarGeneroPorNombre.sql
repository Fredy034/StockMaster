CREATE OR REPLACE FUNCTION "ConsultarGeneroPorNombre"(P_NombreGenero VARCHAR)
RETURNS TABLE ("IdGenero" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT g."IdGenero", g."Nombre", g."Activo", g."Actualiza"
    FROM "Genero" g
    WHERE g."Nombre" = P_NombreGenero AND g."Activo" = '1';
END;
$$ LANGUAGE plpgsql;