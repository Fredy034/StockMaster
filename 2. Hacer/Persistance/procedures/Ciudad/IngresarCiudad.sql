CREATE OR REPLACE FUNCTION "IngresarCiudad"(P_IdDepartamento UUID, P_Nombre VARCHAR)
RETURNS TABLE ("IdCiudad" UUID, "IdDepartamento" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Ciudad" ("IdDepartamento", "Nombre") 
    VALUES (P_IdDepartamento, P_Nombre)
    RETURNING "IdCiudad", "IdDepartamento", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
