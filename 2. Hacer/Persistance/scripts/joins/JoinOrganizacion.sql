SELECT 
    "t"."IdTienda" AS "IdTienda",
    "s"."IdSucursal" AS "IdSucursal",
    "e"."IdEmpleado" AS "IdEmpleado",
    "p"."IdPersona" AS "IdPersona",
    "td"."IdTipoDocumento" AS "IdTipoDocumento",
    "g"."IdGenero" AS "IdGenero",
    "t"."Nombre" AS "NombreTienda",
	"t"."Nit" AS "NitTienda",
	"t"."Telefono" AS "TelefonoTienda",
	"t"."Correo" AS "CorreoTienda",
    "s"."Nombre" AS "NombreSucursal",
    "td"."Nombre" AS "NombreTipoDocumento",
    "g"."Nombre" AS "NombreGenero",
    "p"."NombreCompleto" AS "NombreCompleto",
    "p"."NumeroDocumento" AS "NumeroDocumento",
    "p"."Correo" AS "CorreoEmpleado",
    "p"."Telefono" AS "TelefonoEmpleado",
	"p"."FechaNacimiento" AS "FechaNacimiento",
	"p"."Usuario" AS "Usuario",
	"p"."Contrasena" AS "Contrasena",
    "e"."FechaContratacion" AS "FechaContratacion",
    "e"."Salario" AS "Salario"
FROM "Tienda" AS "t"
    INNER JOIN "Sucursal" AS "s"
        ON "t"."IdTienda" = "s"."IdTienda"
    INNER JOIN "Empleado" AS "e"
        ON "s"."IdSucursal" = "e"."IdSucursal"
    INNER JOIN "Persona" AS "p"
        ON "e"."IdPersona" = "p"."IdPersona"
    INNER JOIN "Genero" AS "g"
        ON "p"."IdGenero" = "g"."IdGenero"
    INNER JOIN "TipoDocumento" AS "td"
        ON "p"."IdTipoDocumento" = "td"."IdTipoDocumento"
WHERE "t"."Activo" = '1' AND "s"."Activo" = '1' AND "e"."Activo" = '1' AND "p"."Activo" = '1' AND "g"."Activo" = '1' AND "td"."Activo" = '1';