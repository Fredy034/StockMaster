CREATE OR REPLACE FUNCTION "IngresarPersona"(P_IdGenero UUID, P_IdTipoDocumento UUID, P_IdCiudad UUID, P_NombreCompleto VARCHAR, P_NumeroDocumento VARCHAR, P_Correo VARCHAR, P_Telefono VARCHAR, P_FechaNacimiento DATE, P_Usuario VARCHAR, P_Contrasena VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Persona" ("IdGenero", "IdTipoDocumento", "IdCiudad", "NombreCompleto", "NumeroDocumento", "Correo", "Telefono", "FechaNacimiento", "Usuario", "Contrasena") 
    VALUES (P_IdGenero, P_IdTipoDocumento, P_IdCiudad, P_NombreCompleto, P_NumeroDocumento, P_Correo, P_Telefono, P_FechaNacimiento, P_Usuario, P_Contrasena);
END;
$$ LANGUAGE plpgsql;