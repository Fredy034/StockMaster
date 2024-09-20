CREATE OR REPLACE FUNCTION "IngresarEmpleado"(P_IdPersona UUID, P_IdSucursal UUID, P_FechaContratacion DATE, P_Salario NUMERIC)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Empleado" ("IdPersona", "IdSucursal", "FechaContratacion", "Salario") 
    VALUES (P_IdPersona, P_IdSucursal, P_FechaContratacion, P_Salario);
END;
$$ LANGUAGE plpgsql;