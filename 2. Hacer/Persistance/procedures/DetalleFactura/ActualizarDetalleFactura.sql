CREATE OR REPLACE FUNCTION "ActualizarDetalleFactura"(P_IdDetalleFactura UUID, P_IdFactura UUID, P_IdProducto UUID, P_Cantidad DECIMAL, P_Subtotal DECIMAL)
RETURNS TABLE ("IdDetalleFactura" UUID, "IdFactura" UUID, "IdProducto" UUID, "Cantidad" DECIMAL, "Subtotal" DECIMAL, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "DetalleFactura" 
    SET "IdFactura" = P_IdFactura, "IdProducto" = P_IdProducto, "Cantidad" = P_Cantidad, "Subtotal" = P_Subtotal, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDetalleFactura" = P_IdDetalleFactura AND "Activo" = '1'
    RETURNING "IdDetalleFactura", "IdFactura", "IdProducto", "Cantidad", "Subtotal", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
