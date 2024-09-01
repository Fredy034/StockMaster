CREATE OR REPLACE FUNCTION "IngresarEmpleado"(P_IdPersona UUID, P_IdSucursal UUID, P_FechaContratacion DATE, P_Salario NUMERIC)
RETURNS TABLE ("IdEmpleado" UUID, "IdPersona" UUID, "IdSucursal" UUID, "FechaContratacion" DATE, "Salario" NUMERIC, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Empleado" ("IdPersona", "IdSucursal", "FechaContratacion", "Salario") 
    VALUES (P_IdPersona, P_IdSucursal, P_FechaContratacion, P_Salario)
    RETURNING "IdEmpleado", "IdPersona", "IdSucursal", "FechaContratacion", "Salario", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
