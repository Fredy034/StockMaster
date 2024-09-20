SELECT json_build_object
(
    'IdGenero', "g"."IdGenero",
    'IdTipoDocumento', "td"."IdTipoDocumento",
    'IdPersona', "p"."IdPersona",
    'IdCliente', "c"."IdCliente",
    'NombreGenero', "g"."Nombre",
    'NombreTipoDocumento', "td"."Nombre",
    'NombreCompleto', "p"."NombreCompleto",
    'NumeroDocumento', "p"."NumeroDocumento",
    'Correo', "p"."Correo",
    'Telefono', "p"."Telefono",
    'FechaNacimiento', "p"."FechaNacimiento",
    'Usuario', "p"."Usuario",
    'Contrasena', "p"."Contrasena",
    'FechaRegistro', "c"."FechaRegistro",
    'Direccion', "c"."Direccion"
) 
AS "Cliente"
FROM "Genero" AS "g"
    INNER JOIN "Persona" AS "p"
        ON "g"."IdGenero" = "p"."IdGenero"
    INNER JOIN "TipoDocumento" AS "td"
        ON "p"."IdTipoDocumento" = "td"."IdTipoDocumento"
    INNER JOIN "Cliente" AS "c"
        ON "p"."IdPersona" = "c"."IdPersona"
WHERE "g"."Activo" = '1' AND "td"."Activo" = '1' AND "p"."Activo" = '1' AND "c"."Activo" = '1';
