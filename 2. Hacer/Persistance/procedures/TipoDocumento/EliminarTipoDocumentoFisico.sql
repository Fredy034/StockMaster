CREATE OR REPLACE FUNCTION "EliminarTipoDocumentoFisico"(P_IdTipoDocumento UUID)
RETURNS VOID
AS $$
BEGIN 
    DELETE FROM "TipoDocumento" 
    WHERE "IdTipoDocumento" = P_IdTipoDocumento AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;