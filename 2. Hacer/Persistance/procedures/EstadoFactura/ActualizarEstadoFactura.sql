CREATE OR REPLACE FUNCTION "ActualizarEstadoFactura"(P_IdEstadoFactura UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS TABLE ("IdEstadoFactura" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "EstadoFactura" 
    SET "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoFactura" = P_IdEstadoFactura AND "Activo" = '1'
    RETURNING "IdEstadoFactura", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
