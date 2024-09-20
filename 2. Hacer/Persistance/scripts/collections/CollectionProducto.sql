SELECT json_build_object 
(
	'IdCategoriaProducto', "cp"."IdCategoriaProducto",
	'NombreCategoriaProducto', "cp"."Nombre",
	'IdTipoProducto', "tp"."IdTipoProducto",
	'NombreTipoProducto', "tp"."Nombre",
	'IdProducto', "p"."IdProducto",
	'NombreProducto', "p"."Nombre",
	'DescripcionProducto', "p"."Descripcion",
	'PrecioProducto', "p"."Precio",
	'StockProducto', "p"."Stock"
) AS "Producto"
FROM "CategoriaProducto" AS "cp"
	INNER JOIN "TipoProducto" AS "tp"
		ON "cp"."IdCategoriaProducto" = "tp"."IdCategoriaProducto"
	INNER JOIN "Producto" AS "p"
		ON "tp"."IdTipoProducto" = "p"."IdTipoProducto"
WHERE "cp"."Activo" = '1' AND "tp"."Activo" = '1' AND "p"."Activo" = '1';