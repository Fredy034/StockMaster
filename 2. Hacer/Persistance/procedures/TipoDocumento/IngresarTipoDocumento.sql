CREATE OR REPLACE FUNCTION "IngresarTipoDocumento"(P_Nombre VARCHAR)
RETURNS TABLE ("IdTipoDocumento" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "TipoDocumento" ("Nombre") 
    VALUES (P_Nombre)
    RETURNING "IdTipoDocumento", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
