-- SELECT * FROM "ConsultarPaisPorNombre"('9ecae1dd-3414-429c-96c5-1a70d14f122d');

CREATE OR REPLACE FUNCTION "ConsultarPaisPorNombre"(P_NombrePais VARCHAR)
RETURNS TABLE ("IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdPais", p."Nombre", p."Activo", p."Actualiza"
    FROM "Pais" p
    WHERE p."Nombre" = P_NombrePais AND p."Activo" = '1';
END;
$$ LANGUAGE plpgsql;