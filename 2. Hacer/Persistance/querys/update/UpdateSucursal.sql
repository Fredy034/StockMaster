UPDATE "Sucursal"
SET "IdCiudad" = 'id-ciudad-actualizado',
    "IdTienda" = 'id-tienda-actualizado',
    "Nombre" = 'Nombre de la Sucursal Actualizado',
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdSucursal" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
