UPDATE "Tienda"
SET "Nombre" = 'Nombre de la Tienda Actualizado',
    "Nit" = 'Nit Actualizado',
    "Telefono" = 'Telefono Actualizado',
    "Correo" = 'Correo Actualizado',
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdTienda" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
