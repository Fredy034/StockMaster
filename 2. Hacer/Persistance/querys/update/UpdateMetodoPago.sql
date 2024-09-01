UPDATE "MetodoPago"
SET "Nombre" = 'Nombre del Método de Pago Actualizado',
    "Descripcion" = 'Descripción del Método de Pago Actualizada',
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdMetodoPago" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
