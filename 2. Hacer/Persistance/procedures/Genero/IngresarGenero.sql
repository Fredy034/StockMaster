CREATE OR REPLACE FUNCTION "IngresarGenero"(P_Nombre VARCHAR)
RETURNS TABLE ("IdGenero" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Genero" ("Nombre") 
    VALUES (P_Nombre)
    RETURNING "IdGenero", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
