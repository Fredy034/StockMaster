SELECT 
	"p"."IdPais" AS "IdPais",
	"d"."IdDepartamento" AS "IdDepartamento",
	"c"."IdCiudad" AS "IdCiudad",
	"p"."Nombre" AS "NombrePais",
	"d"."Nombre" AS "NombreDepartamento",
	"c"."Nombre" AS "NombreCiudad"
FROM "Pais" AS "p" 
	INNER JOIN "Departamento" AS "d"
		ON "p"."IdPais" = "d"."IdPais"
	INNER JOIN "Ciudad" AS "c"
		ON "d"."IdDepartamento" = "c"."IdDepartamento"
WHERE "p"."Activo" = '1' AND "d"."Activo" = '1' AND "c"."Activo" = '1';