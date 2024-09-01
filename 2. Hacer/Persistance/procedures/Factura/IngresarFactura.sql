CREATE OR REPLACE FUNCTION "IngresarFactura"(P_IdEstadoFactura UUID, P_IdMetodoPago UUID, P_IdEmpleado UUID, P_IdCliente UUID, P_NumeroFactura VARCHAR, P_Fecha TIMESTAMP, P_Total DECIMAL, P_Notas VARCHAR)
RETURNS TABLE ("IdFactura" UUID, "IdEstadoFactura" UUID, "IdMetodoPago" UUID, "IdEmpleado" UUID, "IdCliente" UUID, "NumeroFactura" VARCHAR, "Fecha" TIMESTAMP, "Total" DECIMAL, "Notas" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Factura" ("IdEstadoFactura", "IdMetodoPago", "IdEmpleado", "IdCliente", "NumeroFactura", "Fecha", "Total", "Notas") 
    VALUES (P_IdEstadoFactura, P_IdMetodoPago, P_IdEmpleado, P_IdCliente, P_NumeroFactura, P_Fecha, P_Total, P_Notas)
    RETURNING "IdFactura", "IdEstadoFactura", "IdMetodoPago", "IdEmpleado", "IdCliente", "NumeroFactura", "Fecha", "Total", "Notas", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
