UPDATE "Ciudad"
SET "IdDepartamento" = 'id-departamento-actualizado',
    "Nombre" = 'Nombre de la Ciudad Actualizada',
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdCiudad" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
