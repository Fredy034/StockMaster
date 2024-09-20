CREATE OR REPLACE FUNCTION "IngresarCiudad"(P_IdDepartamento UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Ciudad" ("IdDepartamento", "Nombre") 
    VALUES (P_IdDepartamento, P_Nombre);
END;
$$ LANGUAGE plpgsql;