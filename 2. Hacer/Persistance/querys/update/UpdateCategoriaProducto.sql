UPDATE "CategoriaProducto"
SET "Nombre" = 'Nombre de la Categoría Actualizado',
    "Descripcion" = 'Descripción de la Categoría Actualizada',
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdCategoriaProducto" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
