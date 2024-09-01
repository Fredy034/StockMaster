UPDATE "Factura"
SET "IdEstadoFactura" = 'id-estado-factura-actualizado',
    "IdMetodoPago" = 'id-metodo-pago-actualizado',
    "IdEmpleado" = 'id-empleado-actualizado',
    "IdCliente" = 'id-cliente-actualizado',
    "NumeroFactura" = 'Número de Factura Actualizado',
    "Fecha" = '2024-09-02 12:00:00',
    "Total" = 1100.00,
    "Notas" = 'Notas de la Factura Actualizadas',
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdFactura" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
