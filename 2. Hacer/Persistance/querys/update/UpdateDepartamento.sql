UPDATE "Departamento"
SET "IdPais" = 'id-pais-actualizado',
    "Nombre" = 'Nombre del Departamento Actualizado',
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdDepartamento" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
