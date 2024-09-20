SELECT 
    "g"."IdGenero" AS "IdGenero",
    "td"."IdTipoDocumento" AS "IdTipoDocumento",
    "p"."IdPersona" AS "IdPersona",
    "c"."IdCliente" AS "IdCliente",
    "g"."Nombre" AS "NombreGenero",
    "td"."Nombre" AS "NombreTipoDocumento",
    "p"."NombreCompleto" AS "NombreCompleto",
    "p"."NumeroDocumento" AS "NumeroDocumento",
    "p"."Correo" AS "Correo",
    "p"."Telefono" AS "Telefono",
    "p"."FechaNacimiento" AS "FechaNacimiento",
	"p"."Usuario" AS "Usuario",
	"p"."Contrasena" AS "Contrasena",
    "c"."FechaRegistro" AS "FechaRegistro",
    "c"."Direccion" AS "Direccion"
FROM "Genero" AS "g"
    INNER JOIN "Persona" AS "p"
        ON "g"."IdGenero" = "p"."IdGenero"
    INNER JOIN "TipoDocumento" AS "td"
        ON "p"."IdTipoDocumento" = "td"."IdTipoDocumento"
    INNER JOIN "Cliente" AS "c"
        ON "p"."IdPersona" = "c"."IdPersona"
WHERE "g"."Activo" = '1' AND "td"."Activo" = '1' AND "p"."Activo" = '1' AND "c"."Activo" = '1';