CREATE OR REPLACE FUNCTION "EliminarDetalleFacturaFisico"(P_IdDetalleFactura UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "DetalleFactura" 
    WHERE "IdDetalleFactura" = P_IdDetalleFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;