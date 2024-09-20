CREATE OR REPLACE FUNCTION "EliminarEstadoFacturaFisico"(P_IdEstadoFactura UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "EstadoFactura" 
    WHERE "IdEstadoFactura" = P_IdEstadoFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;