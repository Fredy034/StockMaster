CREATE OR REPLACE FUNCTION "ActualizarTipoDocumento"(P_IdTipoDocumento UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "TipoDocumento" 
    SET "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoDocumento" = P_IdTipoDocumento AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;