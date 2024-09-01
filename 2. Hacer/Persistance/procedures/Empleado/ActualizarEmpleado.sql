CREATE OR REPLACE FUNCTION "ActualizarEmpleado"(P_IdEmpleado UUID, P_IdPersona UUID, P_IdSucursal UUID, P_FechaContratacion DATE, P_Salario NUMERIC)
RETURNS TABLE ("IdEmpleado" UUID, "IdPersona" UUID, "IdSucursal" UUID, "FechaContratacion" DATE, "Salario" NUMERIC, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Empleado" 
    SET "IdPersona" = P_IdPersona, "IdSucursal" = P_IdSucursal, "FechaContratacion" = P_FechaContratacion, "Salario" = P_Salario, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpleado" = P_IdEmpleado AND "Activo" = '1'
    RETURNING "IdEmpleado", "IdPersona", "IdSucursal", "FechaContratacion", "Salario", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;