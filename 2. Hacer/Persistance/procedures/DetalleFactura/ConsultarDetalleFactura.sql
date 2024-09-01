CREATE OR REPLACE FUNCTION "ConsultarDetalleFactura"()
RETURNS TABLE ("IdDetalleFactura" UUID, "IdFactura" UUID, "IdProducto" UUID, "Cantidad" DECIMAL, "Subtotal" DECIMAL, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT df."IdDetalleFactura", df."IdFactura", df."IdProducto", df."Cantidad", df."Subtotal", df."Activo", df."Actualiza"
    FROM "DetalleFactura" df
    WHERE df."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
