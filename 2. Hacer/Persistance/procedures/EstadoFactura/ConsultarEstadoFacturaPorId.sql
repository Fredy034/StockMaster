CREATE OR REPLACE FUNCTION "ConsultarEstadoFacturaPorId"(P_IdEstadoFactura UUID)
RETURNS TABLE ("IdEstadoFactura" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT e."IdEstadoFactura", e."Nombre", e."Descripcion", e."Activo", e."Actualiza"
    FROM "EstadoFactura" e
    WHERE e."IdEstadoFactura" = P_IdEstadoFactura AND e."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
