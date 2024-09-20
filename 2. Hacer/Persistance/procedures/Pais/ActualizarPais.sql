-- SELECT * FROM "ActualizarPais"('c3a5b128-fadc-455c-b57b-675276c2faba', 'Ecuador');

CREATE OR REPLACE FUNCTION "ActualizarPais"(P_IdPais UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
	UPDATE "Pais" 
    SET "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
	WHERE "Pais"."IdPais" = P_IdPais AND "Pais"."Activo" = '1';
END;
$$ LANGUAGE plpgsql;