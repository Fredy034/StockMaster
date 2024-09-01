SELECT "IdFactura", "IdEstadoFactura", "IdMetodoPago", "IdEmpleado", "IdCliente", "NumeroFactura", "Fecha", "Total", "Notas", "Activo", "Actualiza"
FROM "Factura"
WHERE "Activo" = b'1';
