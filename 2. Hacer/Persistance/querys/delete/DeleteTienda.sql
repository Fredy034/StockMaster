UPDATE "Tienda"
SET "Activo" = b'0',
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdTienda" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
