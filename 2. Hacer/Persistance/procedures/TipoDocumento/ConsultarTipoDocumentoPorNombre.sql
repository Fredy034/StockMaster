CREATE OR REPLACE FUNCTION "ConsultarTipoDocumentoPorNombre"(P_NombreTipoDocumento VARCHAR)
RETURNS TABLE ("IdTipoDocumento" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT td."IdTipoDocumento", td."Nombre", td."Activo", td."Actualiza"
    FROM "TipoDocumento" td
    WHERE td."Nombre" = P_NombreTipoDocumento AND td."Activo" = '1';
END;
$$ LANGUAGE plpgsql;