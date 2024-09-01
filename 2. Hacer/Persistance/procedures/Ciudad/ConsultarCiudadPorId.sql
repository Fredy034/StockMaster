CREATE OR REPLACE FUNCTION "ConsultarCiudadPorId"(P_IdCiudad UUID)
RETURNS TABLE ("IdCiudad" UUID, "IdDepartamento" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT c."IdCiudad", c."IdDepartamento", c."Nombre", c."Activo", c."Actualiza"
    FROM "Ciudad" c
    WHERE c."IdCiudad" = P_IdCiudad AND c."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
