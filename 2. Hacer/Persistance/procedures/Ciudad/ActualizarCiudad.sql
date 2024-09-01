CREATE OR REPLACE FUNCTION "ActualizarCiudad"(P_IdCiudad UUID, P_IdDepartamento UUID, P_Nombre VARCHAR)
RETURNS TABLE ("IdCiudad" UUID, "IdDepartamento" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Ciudad" 
    SET "IdDepartamento" = P_IdDepartamento, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = P_IdCiudad AND "Activo" = '1'
    RETURNING "IdCiudad", "IdDepartamento", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
