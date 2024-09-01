CREATE OR REPLACE FUNCTION "EliminarTipoDocumento"(P_IdTipoDocumento UUID)
RETURNS TABLE ("IdTipoDocumento" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "TipoDocumento" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoDocumento" = P_IdTipoDocumento AND "Activo" = '1'
    RETURNING "IdTipoDocumento", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
