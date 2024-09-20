-- SELECT * FROM "IngresarPais"('Venezuela');

CREATE OR REPLACE FUNCTION "IngresarPais"(P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Pais" ("Nombre") 
	VALUES (P_Nombre);
END;
$$ LANGUAGE plpgsql;