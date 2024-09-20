CREATE OR REPLACE FUNCTION "ActualizarDetalleFactura"(P_IdDetalleFactura UUID, P_IdFactura UUID, P_IdProducto UUID, P_Cantidad DECIMAL, P_Subtotal DECIMAL)
RETURNS VOID
AS $$
BEGIN
    UPDATE "DetalleFactura" 
    SET "IdFactura" = P_IdFactura, "IdProducto" = P_IdProducto, "Cantidad" = P_Cantidad, "Subtotal" = P_Subtotal, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDetalleFactura" = P_IdDetalleFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;