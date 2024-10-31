CREATE OR REPLACE FUNCTION "ConsultarPersonaPorNombre"(P_NombrePersona VARCHAR)
RETURNS TABLE ("IdPersona" UUID, "IdGenero" UUID, "IdTipoDocumento" UUID, "IdCiudad" UUID, "NombreCompleto" VARCHAR, "NumeroDocumento" VARCHAR, "Correo" VARCHAR, "Telefono" VARCHAR, "FechaNacimiento" DATE, "Usuario" VARCHAR, "Contrasena" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdPersona", p."IdGenero", p."IdTipoDocumento", p."IdCiudad", p."NombreCompleto", p."NumeroDocumento", p."Correo", p."Telefono", p."FechaNacimiento", p."Usuario", p."Contrasena", p."Activo", p."Actualiza"
    FROM "Persona" p
    WHERE p."NombreCompleto" = P_NombrePersona AND p."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
