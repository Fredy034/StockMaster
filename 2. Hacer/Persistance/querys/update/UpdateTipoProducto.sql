UPDATE "TipoProducto"
SET "IdCategoriaProducto" = 'id-categoria-producto-actualizado',
    "Nombre" = 'Nombre del Tipo de Producto Actualizado',
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdTipoProducto" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
