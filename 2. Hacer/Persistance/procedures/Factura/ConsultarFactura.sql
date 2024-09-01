CREATE OR REPLACE FUNCTION "ConsultarFactura"()
RETURNS TABLE ("IdFactura" UUID, "IdEstadoFactura" UUID, "IdMetodoPago" UUID, "IdEmpleado" UUID, "IdCliente" UUID, "NumeroFactura" VARCHAR, "Fecha" TIMESTAMP, "Total" DECIMAL, "Notas" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT f."IdFactura", f."IdEstadoFactura", f."IdMetodoPago", f."IdEmpleado", f."IdCliente", f."NumeroFactura", f."Fecha", f."Total", f."Notas", f."Activo", f."Actualiza"
    FROM "Factura" f
    WHERE f."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
