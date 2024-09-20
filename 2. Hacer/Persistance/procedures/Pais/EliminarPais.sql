-- SELECT * FROM "EliminarPais"('c3a5b128-fadc-455c-b57b-675276c2faba');

CREATE OR REPLACE FUNCTION "EliminarPais"(P_IdPais UUID)
RETURNS VOID
AS $$
BEGIN
	UPDATE "Pais" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
	WHERE "Pais"."IdPais" = P_IdPais AND "Pais"."Activo" = '1';
END;
$$ LANGUAGE plpgsql;