CREATE OR REPLACE FUNCTION "EliminarPersona"(P_IdPersona UUID)
RETURNS TABLE ("IdPersona" UUID, "IdGenero" UUID, "IdTipoDocumento" UUID, "IdCiudad" UUID, "NombreCompleto" VARCHAR, "NumeroDocumento" VARCHAR, "Correo" VARCHAR, "Telefono" VARCHAR, "FechaNacimiento" DATE, "Usuario" VARCHAR, "Contrasena" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Persona" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdPersona" = P_IdPersona AND "Activo" = '1'
    RETURNING "IdPersona", "IdGenero", "IdTipoDocumento", "IdCiudad", "NombreCompleto", "NumeroDocumento", "Correo", "Telefono", "FechaNacimiento", "Usuario", "Contrasena", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
