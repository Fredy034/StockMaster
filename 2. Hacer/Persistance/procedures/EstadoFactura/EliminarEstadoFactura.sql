CREATE OR REPLACE FUNCTION "EliminarEstadoFactura"(P_IdEstadoFactura UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "EstadoFactura" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoFactura" = P_IdEstadoFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;