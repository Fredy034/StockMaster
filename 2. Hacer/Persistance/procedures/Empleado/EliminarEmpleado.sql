CREATE OR REPLACE FUNCTION "EliminarEmpleado"(P_IdEmpleado UUID)
RETURNS TABLE ("IdEmpleado" UUID, "IdPersona" UUID, "IdSucursal" UUID, "FechaContratacion" DATE, "Salario" NUMERIC, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Empleado" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpleado" = P_IdEmpleado AND "Activo" = '1'
    RETURNING "IdEmpleado", "IdPersona", "IdSucursal", "FechaContratacion", "Salario", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
