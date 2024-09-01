SELECT "IdDetalleFactura", "IdFactura", "IdProducto", "Cantidad", "Subtotal", "Activo", "Actualiza"
FROM "DetalleFactura"
WHERE "Activo" = b'1';
