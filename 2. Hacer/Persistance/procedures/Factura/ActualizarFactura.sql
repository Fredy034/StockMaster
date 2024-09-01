CREATE OR REPLACE FUNCTION "ActualizarFactura"(P_IdFactura UUID, P_IdEstadoFactura UUID, P_IdMetodoPago UUID, P_IdEmpleado UUID, P_IdCliente UUID, P_NumeroFactura VARCHAR, P_Fecha TIMESTAMP, P_Total DECIMAL, P_Notas VARCHAR)
RETURNS TABLE ("IdFactura" UUID, "IdEstadoFactura" UUID, "IdMetodoPago" UUID, "IdEmpleado" UUID, "IdCliente" UUID, "NumeroFactura" VARCHAR, "Fecha" TIMESTAMP, "Total" DECIMAL, "Notas" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Factura" 
    SET "IdEstadoFactura" = P_IdEstadoFactura, "IdMetodoPago" = P_IdMetodoPago, "IdEmpleado" = P_IdEmpleado, "IdCliente" = P_IdCliente, "NumeroFactura" = P_NumeroFactura, "Fecha" = P_Fecha, "Total" = P_Total, "Notas" = P_Notas, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdFactura" = P_IdFactura AND "Activo" = '1'
    RETURNING "IdFactura", "IdEstadoFactura", "IdMetodoPago", "IdEmpleado", "IdCliente", "NumeroFactura", "Fecha", "Total", "Notas", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
