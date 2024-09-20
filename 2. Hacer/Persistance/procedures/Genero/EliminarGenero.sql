CREATE OR REPLACE FUNCTION "EliminarGenero"(P_IdGenero UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Genero" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdGenero" = P_IdGenero AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;