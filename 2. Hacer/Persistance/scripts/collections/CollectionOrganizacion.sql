SELECT json_build_object 
(
    'IdTienda', "t"."IdTienda",
    'IdSucursal', "s"."IdSucursal",
    'IdEmpleado', "e"."IdEmpleado",
    'IdPersona', "p"."IdPersona",
    'IdTipoDocumento', "td"."IdTipoDocumento",
    'IdGenero', "g"."IdGenero",
    'NombreTienda', "t"."Nombre",
    'NitTienda', "t"."Nit",
    'TelefonoTienda', "t"."Telefono",
    'CorreoTienda', "t"."Correo",
    'NombreSucursal', "s"."Nombre",
    'NombreTipoDocumento', "td"."Nombre",
    'NombreGenero', "g"."Nombre",
    'NombreCompleto', "p"."NombreCompleto",
    'NumeroDocumento', "p"."NumeroDocumento",
    'CorreoEmpleado', "p"."Correo",
    'TelefonoEmpleado', "p"."Telefono",
    'FechaNacimiento', "p"."FechaNacimiento",
    'Usuario', "p"."Usuario",
    'Contrasena', "p"."Contrasena",
    'FechaContratacion', "e"."FechaContratacion",
    'Salario', "e"."Salario"
)
AS "Organizacion"
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