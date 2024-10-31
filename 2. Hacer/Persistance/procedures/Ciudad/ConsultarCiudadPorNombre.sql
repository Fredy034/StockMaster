CREATE OR REPLACE FUNCTION "ConsultarCiudadPorNombre"(P_NombreCiudad VARCHAR)
RETURNS TABLE ("IdCiudad" UUID, "IdDepartamento" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT c."IdCiudad", c."IdDepartamento", c."Nombre", c."Activo", c."Actualiza"
    FROM "Ciudad" c
    WHERE c."Nombre" = P_NombreCiudad AND c."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
