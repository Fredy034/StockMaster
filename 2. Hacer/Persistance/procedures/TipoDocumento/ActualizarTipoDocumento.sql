CREATE OR REPLACE FUNCTION "ActualizarTipoDocumento"(P_IdTipoDocumento UUID, P_Nombre VARCHAR)
RETURNS TABLE ("IdTipoDocumento" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "TipoDocumento" 
    SET "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoDocumento" = P_IdTipoDocumento AND "Activo" = '1'
    RETURNING "IdTipoDocumento", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
