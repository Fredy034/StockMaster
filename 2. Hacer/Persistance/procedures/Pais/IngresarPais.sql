-- SELECT * FROM "IngresarPais"('Venezuela');

CREATE OR REPLACE FUNCTION "IngresarPais"(P_Nombre VARCHAR)
RETURNS TABLE ("IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Pais" ("Nombre") 
	VALUES (P_Nombre)
	RETURNING "Pais"."IdPais", "Pais"."Nombre", "Pais"."Activo", "Pais"."Actualiza";
END;
$$ LANGUAGE plpgsql;