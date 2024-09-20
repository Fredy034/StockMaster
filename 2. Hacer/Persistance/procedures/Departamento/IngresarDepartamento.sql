CREATE OR REPLACE FUNCTION "IngresarDepartamento"(P_IdPais UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Departamento" ("IdPais", "Nombre") 
    VALUES (P_IdPais, P_Nombre);
END;
$$ LANGUAGE plpgsql;