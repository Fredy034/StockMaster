CREATE OR REPLACE FUNCTION "IngresarTipoDocumento"(P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "TipoDocumento" ("Nombre") 
    VALUES (P_Nombre);
END;
$$ LANGUAGE plpgsql;