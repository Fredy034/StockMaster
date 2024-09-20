CREATE OR REPLACE FUNCTION "ActualizarDepartamento"(P_IdDepartamento UUID, P_IdPais UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Departamento" 
    SET "IdPais" = P_IdPais, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = P_IdDepartamento AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;