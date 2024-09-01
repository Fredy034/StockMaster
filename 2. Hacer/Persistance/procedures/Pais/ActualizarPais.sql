-- SELECT * FROM "ActualizarPais"('c3a5b128-fadc-455c-b57b-675276c2faba', 'Ecuador');

CREATE OR REPLACE FUNCTION "ActualizarPais"(P_IdPais UUID, P_Nombre VARCHAR)
RETURNS TABLE ("IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
	UPDATE "Pais" 
    SET "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
	WHERE "Pais"."IdPais" = P_IdPais AND "Pais"."Activo" = '1'
	RETURNING "Pais"."IdPais", "Pais"."Nombre", "Pais"."Activo", "Pais"."Actualiza";
END;
$$ LANGUAGE plpgsql;