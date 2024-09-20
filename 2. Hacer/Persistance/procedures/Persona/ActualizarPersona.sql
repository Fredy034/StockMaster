CREATE OR REPLACE FUNCTION "ActualizarPersona"(P_IdPersona UUID, P_IdGenero UUID, P_IdTipoDocumento UUID, P_IdCiudad UUID, P_NombreCompleto VARCHAR, P_NumeroDocumento VARCHAR, P_Correo VARCHAR, P_Telefono VARCHAR, P_FechaNacimiento DATE, P_Usuario VARCHAR, P_Contrasena VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Persona" 
    SET "IdGenero" = P_IdGenero, "IdTipoDocumento" = P_IdTipoDocumento, "IdCiudad" = P_IdCiudad, "NombreCompleto" = P_NombreCompleto, "NumeroDocumento" = P_NumeroDocumento, "Correo" = P_Correo, "Telefono" = P_Telefono, "FechaNacimiento" = P_FechaNacimiento, "Usuario" = P_Usuario, "Contrasena" = P_Contrasena, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdPersona" = P_IdPersona AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;