CREATE OR REPLACE FUNCTION "IngresarDepartamento"(P_IdPais UUID, P_Nombre VARCHAR)
RETURNS TABLE ("IdDepartamento" UUID, "IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Departamento" ("IdPais", "Nombre") 
    VALUES (P_IdPais, P_Nombre)
    RETURNING "IdDepartamento", "IdPais", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
