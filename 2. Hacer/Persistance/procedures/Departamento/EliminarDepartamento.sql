CREATE OR REPLACE FUNCTION "EliminarDepartamento"(P_IdDepartamento UUID)
RETURNS TABLE ("IdDepartamento" UUID, "IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Departamento" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = P_IdDepartamento AND "Activo" = '1'
    RETURNING "IdDepartamento", "IdPais", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
