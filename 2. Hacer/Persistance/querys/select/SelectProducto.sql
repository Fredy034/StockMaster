SELECT "IdProducto", "IdTipoProducto", "Nombre", "Descripcion", "Precio", "Stock", "Activo", "Actualiza"
FROM "Producto"
WHERE "Activo" = b'1';
