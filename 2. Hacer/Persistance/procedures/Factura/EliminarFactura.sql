CREATE OR REPLACE FUNCTION "EliminarFactura"(P_IdFactura UUID)
RETURNS TABLE ("IdFactura" UUID, "IdEstadoFactura" UUID, "IdMetodoPago" UUID, "IdEmpleado" UUID, "IdCliente" UUID, "NumeroFactura" VARCHAR, "Fecha" TIMESTAMP, "Total" DECIMAL, "Notas" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Factura" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdFactura" = P_IdFactura AND "Activo" = '1'
    RETURNING "IdFactura", "IdEstadoFactura", "IdMetodoPago", "IdEmpleado", "IdCliente", "NumeroFactura", "Fecha", "Total", "Notas", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
