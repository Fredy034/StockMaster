UPDATE "DetalleFactura"
SET "IdFactura" = 'id-factura-actualizado',
    "IdProducto" = 'id-producto-actualizado',
    "Cantidad" = 15,
    "Subtotal" = 150.00,
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdDetalleFactura" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
