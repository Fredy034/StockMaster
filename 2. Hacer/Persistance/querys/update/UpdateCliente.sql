UPDATE "Cliente"
SET "IdPersona" = 'id-persona-actualizado',
    "FechaRegistro" = '2024-09-02',
    "Direccion" = 'Dirección del Cliente Actualizada',
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdCliente" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
