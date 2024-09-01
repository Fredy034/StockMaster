UPDATE "Empleado"
SET "IdPersona" = 'id-persona-actualizado',
    "IdSucursal" = 'id-sucursal-actualizado',
    "FechaContratacion" = '2024-09-02',
    "Salario" = 55000.00,
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdEmpleado" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
