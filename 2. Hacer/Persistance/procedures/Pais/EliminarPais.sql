-- SELECT * FROM "EliminarPais"('c3a5b128-fadc-455c-b57b-675276c2faba');

CREATE OR REPLACE FUNCTION "EliminarPais"(P_IdPais UUID)
RETURNS TABLE ("IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
	UPDATE "Pais" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
	WHERE "Pais"."IdPais" = P_IdPais AND "Pais"."Activo" = '1'
	RETURNING "Pais"."IdPais", "Pais"."Nombre", "Pais"."Activo", "Pais"."Actualiza";
END;
$$ LANGUAGE plpgsql;