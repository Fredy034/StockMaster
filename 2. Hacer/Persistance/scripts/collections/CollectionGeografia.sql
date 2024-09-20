SELECT json_build_object 
(
	'IdPais', "p"."IdPais",
	'IdDepartamento', "d"."IdDepartamento",
	'IdCiudad', "c"."IdCiudad",
	'NombrePais', "p"."Nombre",
	'NombreDepartamento', "d"."Nombre",
	'NombreCiudad', "c"."Nombre"
)
AS "Geografia"
FROM "Pais" AS "p" 
	INNER JOIN "Departamento" AS "d"
		ON "p"."IdPais" = "d"."IdPais"
	INNER JOIN "Ciudad" AS "c"
		ON "d"."IdDepartamento" = "c"."IdDepartamento"
WHERE "p"."Activo" = '1' AND "d"."Activo" = '1' AND "c"."Activo" = '1';