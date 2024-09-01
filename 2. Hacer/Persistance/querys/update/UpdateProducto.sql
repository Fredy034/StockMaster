UPDATE "Producto"
SET "IdTipoProducto" = 'id-tipo-producto-actualizado',
    "Nombre" = 'Nombre del Producto Actualizado',
    "Descripcion" = 'Descripción del Producto Actualizada',
    "Precio" = 120.00,
    "Stock" = 30,
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdProducto" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
