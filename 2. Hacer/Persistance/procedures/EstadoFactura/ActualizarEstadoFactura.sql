CREATE OR REPLACE FUNCTION "ActualizarEstadoFactura"(P_IdEstadoFactura UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "EstadoFactura" 
    SET "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoFactura" = P_IdEstadoFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;