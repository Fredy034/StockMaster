CREATE OR REPLACE FUNCTION "ConsultarDepartamento"()
RETURNS TABLE ("IdDepartamento" UUID, "IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT d."IdDepartamento", d."IdPais", d."Nombre", d."Activo", d."Actualiza"
    FROM "Departamento" d
    WHERE d."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
