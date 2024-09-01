CREATE OR REPLACE FUNCTION "IngresarDetalleFactura"(P_IdFactura UUID, P_IdProducto UUID, P_Cantidad DECIMAL, P_Subtotal DECIMAL)
RETURNS TABLE ("IdDetalleFactura" UUID, "IdFactura" UUID, "IdProducto" UUID, "Cantidad" DECIMAL, "Subtotal" DECIMAL, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "DetalleFactura" ("IdFactura", "IdProducto", "Cantidad", "Subtotal") 
    VALUES (P_IdFactura, P_IdProducto, P_Cantidad, P_Subtotal)
    RETURNING "IdDetalleFactura", "IdFactura", "IdProducto", "Cantidad", "Subtotal", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
