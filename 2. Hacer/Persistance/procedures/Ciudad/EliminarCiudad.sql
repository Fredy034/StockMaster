CREATE OR REPLACE FUNCTION "EliminarCiudad"(P_IdCiudad UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Ciudad" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = P_IdCiudad AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;