UPDATE "Persona"
SET "IdGenero" = 'id-genero-actualizado',
    "IdTipoDocumento" = 'id-tipo-documento-actualizado',
    "IdCiudad" = 'id-ciudad-actualizado',
    "NombreCompleto" = 'Nombre Completo Actualizado',
    "NumeroDocumento" = 'Número Documento Actualizado',
    "Correo" = 'correoactualizado@example.com',
    "Telefono" = '0987654321',
    "FechaNacimiento" = '1991-02-01',
    "Usuario" = 'usuarioactualizado',
    "Contrasena" = 'contraseñaactualizada',
    "Actualiza" = CURRENT_TIMESTAMP
WHERE "IdPersona" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
  AND "Activo" = b'1';
