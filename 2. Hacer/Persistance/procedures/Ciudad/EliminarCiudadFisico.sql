CREATE OR REPLACE FUNCTION "EliminarCiudadFisico"(P_IdCiudad UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Ciudad" 
    WHERE "IdCiudad" = P_IdCiudad AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;