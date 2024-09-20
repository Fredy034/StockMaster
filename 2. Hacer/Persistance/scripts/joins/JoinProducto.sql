SELECT 
    "cp"."IdCategoriaProducto" AS "IdCategoriaProducto",
    "tp"."IdTipoProducto" AS "IdTipoProducto",
    "p"."IdProducto" AS "IdProducto",
    "cp"."Nombre" AS "NombreCategoriaProducto",
    "tp"."Nombre" AS "NombreTipoProducto",
    "p"."Nombre" AS "NombreProducto",
    "p"."Descripcion" AS "DescripcionProducto",
    "p"."Precio" AS "PrecioProducto",
    "p"."Stock" AS "StockProducto"
FROM "CategoriaProducto" AS "cp"
    INNER JOIN "TipoProducto" AS "tp"
        ON "cp"."IdCategoriaProducto" = "tp"."IdCategoriaProducto"
    INNER JOIN "Producto" AS "p"
        ON "tp"."IdTipoProducto" = "p"."IdTipoProducto"
WHERE "cp"."Activo" = '1' AND "tp"."Activo" = '1' AND "p"."Activo" = '1';