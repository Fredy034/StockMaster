CREATE OR REPLACE FUNCTION "ActualizarDepartamento"(P_IdDepartamento UUID, P_IdPais UUID, P_Nombre VARCHAR)
RETURNS TABLE ("IdDepartamento" UUID, "IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Departamento" 
    SET "IdPais" = P_IdPais, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = P_IdDepartamento AND "Activo" = '1'
    RETURNING "IdDepartamento", "IdPais", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
