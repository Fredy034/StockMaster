CREATE OR REPLACE FUNCTION "EliminarTipoDocumento"(P_IdTipoDocumento UUID)
RETURNS VOID
AS $$
BEGIN 
    UPDATE "TipoDocumento" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoDocumento" = P_IdTipoDocumento AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;