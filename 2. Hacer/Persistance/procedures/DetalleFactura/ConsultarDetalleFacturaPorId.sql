CREATE OR REPLACE FUNCTION "ConsultarDetalleFacturaPorId"(P_IdDetalleFactura UUID)
RETURNS TABLE ("IdDetalleFactura" UUID, "IdFactura" UUID, "IdProducto" UUID, "Cantidad" DECIMAL, "Subtotal" DECIMAL, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT df."IdDetalleFactura", df."IdFactura", df."IdProducto", df."Cantidad", df."Subtotal", df."Activo", df."Actualiza"
    FROM "DetalleFactura" df
    WHERE df."IdDetalleFactura" = P_IdDetalleFactura AND df."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
