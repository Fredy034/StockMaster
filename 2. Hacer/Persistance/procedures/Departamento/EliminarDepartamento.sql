CREATE OR REPLACE FUNCTION "EliminarDepartamento"(P_IdDepartamento UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Departamento" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = P_IdDepartamento AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;