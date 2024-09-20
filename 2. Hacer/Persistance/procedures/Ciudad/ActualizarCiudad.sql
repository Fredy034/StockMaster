CREATE OR REPLACE FUNCTION "ActualizarCiudad"(P_IdCiudad UUID, P_IdDepartamento UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Ciudad" 
    SET "IdDepartamento" = P_IdDepartamento, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = P_IdCiudad AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;