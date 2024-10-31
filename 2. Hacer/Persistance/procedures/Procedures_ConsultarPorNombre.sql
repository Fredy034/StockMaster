-- SELECT * FROM "ConsultarPaisPorNombre"('9ecae1dd-3414-429c-96c5-1a70d14f122d');

CREATE OR REPLACE FUNCTION "ConsultarPaisPorNombre"(P_NombrePais VARCHAR)
RETURNS TABLE ("IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdPais", p."Nombre", p."Activo", p."Actualiza"
    FROM "Pais" p
    WHERE p."Nombre" = P_NombrePais AND p."Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ConsultarClientePorNombre"(P_DireccionCliente VARCHAR)
RETURNS TABLE ("IdCliente" UUID, "IdPersona" UUID, "FechaRegistro" DATE, "Direccion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT cl."IdCliente", cl."IdPersona", cl."FechaRegistro", cl."Direccion", cl."Activo", cl."Actualiza"
    FROM "Cliente" cl
    WHERE cl."Direccion" = P_DireccionCliente AND cl."Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ConsultarCiudadPorNombre"(P_NombreCiudad VARCHAR)
RETURNS TABLE ("IdCiudad" UUID, "IdDepartamento" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT c."IdCiudad", c."IdDepartamento", c."Nombre", c."Activo", c."Actualiza"
    FROM "Ciudad" c
    WHERE c."Nombre" = P_NombreCiudad AND c."Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ConsultarDepartamentoPorNombre"(P_NombreDepartamento VARCHAR)
RETURNS TABLE ("IdDepartamento" UUID, "IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT d."IdDepartamento", d."IdPais", d."Nombre", d."Activo", d."Actualiza"
    FROM "Departamento" d
    WHERE d."Nombre" = P_NombreDepartamento AND d."Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ConsultarGeneroPorNombre"(P_NombreGenero VARCHAR)
RETURNS TABLE ("IdGenero" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT g."IdGenero", g."Nombre", g."Activo", g."Actualiza"
    FROM "Genero" g
    WHERE g."Nombre" = P_NombreGenero AND g."Activo" = '1';
END;
$$ LANGUAGE plpgsql;

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

CREATE OR REPLACE FUNCTION "ConsultarTipoDocumentoPorNombre"(P_NombreTipoDocumento VARCHAR)
RETURNS TABLE ("IdTipoDocumento" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT td."IdTipoDocumento", td."Nombre", td."Activo", td."Actualiza"
    FROM "TipoDocumento" td
    WHERE td."Nombre" = P_NombreTipoDocumento AND td."Activo" = '1';
END;
$$ LANGUAGE plpgsql;