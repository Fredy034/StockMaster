CREATE OR REPLACE FUNCTION "ConsultarTipoDocumentoPorId"(P_IdTipoDocumento UUID)
RETURNS TABLE ("IdTipoDocumento" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT td."IdTipoDocumento", td."Nombre", td."Activo", td."Actualiza"
    FROM "TipoDocumento" td
    WHERE td."IdTipoDocumento" = P_IdTipoDocumento AND td."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
