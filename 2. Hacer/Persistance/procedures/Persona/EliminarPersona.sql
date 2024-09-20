CREATE OR REPLACE FUNCTION "EliminarPersona"(P_IdPersona UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Persona" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdPersona" = P_IdPersona AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;