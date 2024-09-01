SELECT "IdPersona", "IdGenero", "IdTipoDocumento", "IdCiudad", "NombreCompleto", "NumeroDocumento", "Correo", "Telefono", "FechaNacimiento", "Usuario", "Contrasena", "Activo", "Actualiza"
FROM "Persona"
WHERE "Activo" = b'1';
