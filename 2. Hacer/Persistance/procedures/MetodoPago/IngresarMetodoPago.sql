CREATE OR REPLACE FUNCTION "IngresarMetodoPago"(P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "MetodoPago" ("Nombre", "Descripcion") 
    VALUES (P_Nombre, P_Descripcion);
END;
$$ LANGUAGE plpgsql;