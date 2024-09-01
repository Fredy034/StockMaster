UPDATE "TipoDocumento"
SET "Nombre" = 'Nombre del Tipo de Documento Actualizado',
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdTipoDocumento" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
