CREATE OR REPLACE FUNCTION "EliminarEmpleadoFisico"(P_IdEmpleado UUID)
RETURNS VOID 
AS $$
BEGIN
    DELETE FROM "Empleado" 
    WHERE "IdEmpleado" = P_IdEmpleado AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;