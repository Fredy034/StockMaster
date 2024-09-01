CREATE OR REPLACE FUNCTION "ConsultarEmpleadoPorId"(P_IdEmpleado UUID)
RETURNS TABLE ("IdEmpleado" UUID, "IdPersona" UUID, "IdSucursal" UUID, "FechaContratacion" DATE, "Salario" NUMERIC, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT e."IdEmpleado", e."IdPersona", e."IdSucursal", e."FechaContratacion", e."Salario", e."Activo", e."Actualiza"
    FROM "Empleado" e
    WHERE e."IdEmpleado" = P_IdEmpleado AND e."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
