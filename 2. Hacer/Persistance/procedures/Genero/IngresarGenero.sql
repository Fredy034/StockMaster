CREATE OR REPLACE FUNCTION "IngresarGenero"(P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Genero" ("Nombre") 
    VALUES (P_Nombre);
END;
$$ LANGUAGE plpgsql;