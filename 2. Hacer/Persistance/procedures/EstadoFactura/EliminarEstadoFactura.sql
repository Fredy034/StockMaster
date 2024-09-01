CREATE OR REPLACE FUNCTION "EliminarEstadoFactura"(P_IdEstadoFactura UUID)
RETURNS TABLE ("IdEstadoFactura" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "EstadoFactura" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoFactura" = P_IdEstadoFactura AND "Activo" = '1'
    RETURNING "IdEstadoFactura", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
