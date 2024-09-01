CREATE OR REPLACE FUNCTION "EliminarCiudad"(P_IdCiudad UUID)
RETURNS TABLE ("IdCiudad" UUID, "IdDepartamento" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Ciudad" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = P_IdCiudad AND "Activo" = '1'
    RETURNING "IdCiudad", "IdDepartamento", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
