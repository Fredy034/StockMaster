UPDATE "EstadoFactura"
SET "Nombre" = 'Nombre del Estado Actualizado',
    "Descripcion" = 'Descripción del Estado Actualizada',
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdEstadoFactura" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
