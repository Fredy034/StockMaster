CREATE OR REPLACE FUNCTION "EliminarPersonaFisico"(P_IdPersona UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Persona" 
    WHERE "IdPersona" = P_IdPersona AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;