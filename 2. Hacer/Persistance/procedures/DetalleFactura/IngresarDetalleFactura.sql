CREATE OR REPLACE FUNCTION "IngresarDetalleFactura"(P_IdFactura UUID, P_IdProducto UUID, P_Cantidad DECIMAL, P_Subtotal DECIMAL)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "DetalleFactura" ("IdFactura", "IdProducto", "Cantidad", "Subtotal") 
    VALUES (P_IdFactura, P_IdProducto, P_Cantidad, P_Subtotal);
END;
$$ LANGUAGE plpgsql;