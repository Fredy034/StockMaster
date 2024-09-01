CREATE OR REPLACE FUNCTION "EliminarDetalleFactura"(P_IdDetalleFactura UUID)
RETURNS TABLE ("IdDetalleFactura" UUID, "IdFactura" UUID, "IdProducto" UUID, "Cantidad" DECIMAL, "Subtotal" DECIMAL, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "DetalleFactura" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDetalleFactura" = P_IdDetalleFactura AND "Activo" = '1'
    RETURNING "IdDetalleFactura", "IdFactura", "IdProducto", "Cantidad", "Subtotal", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
