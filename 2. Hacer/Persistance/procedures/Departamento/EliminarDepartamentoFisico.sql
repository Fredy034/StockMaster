CREATE OR REPLACE FUNCTION "EliminarDepartamentoFisico"(P_IdDepartamento UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Departamento" 
    WHERE "IdDepartamento" = P_IdDepartamento AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;