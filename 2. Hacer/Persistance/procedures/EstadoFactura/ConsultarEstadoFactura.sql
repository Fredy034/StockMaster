CREATE OR REPLACE FUNCTION "ConsultarEstadoFactura"()
RETURNS TABLE ("IdEstadoFactura" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT e."IdEstadoFactura", e."Nombre", e."Descripcion", e."Activo", e."Actualiza"
    FROM "EstadoFactura" e
    WHERE e."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
