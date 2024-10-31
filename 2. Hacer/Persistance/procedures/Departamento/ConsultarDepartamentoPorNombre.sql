CREATE OR REPLACE FUNCTION "ConsultarDepartamentoPorNombre"(P_NombreDepartamento VARCHAR)
RETURNS TABLE ("IdDepartamento" UUID, "IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT d."IdDepartamento", d."IdPais", d."Nombre", d."Activo", d."Actualiza"
    FROM "Departamento" d
    WHERE d."Nombre" = P_NombreDepartamento AND d."Activo" = '1';
END;
$$ LANGUAGE plpgsql;