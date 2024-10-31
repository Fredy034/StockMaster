const modelproducto = [];

class ModelProducto {
  constructor(
    IdCategoriaProducto,
    IdTipoProducto,
    IdProducto,
    NombreCategoriaProducto,
    DescripcionCategoriaProducto,
    NombreTipoProducto,
    NombreProducto,
    DescripcionProducto,
    PrecioProducto,
    StockProducto
  ) {
    this.IdCategoriaProducto = IdCategoriaProducto;
    this.IdTipoProducto = IdTipoProducto;
    this.IdProducto = IdProducto;
    this.NombreCategoriaProducto = NombreCategoriaProducto;
    this.DescripcionCategoriaProducto = DescripcionCategoriaProducto;
    this.NombreTipoProducto = NombreTipoProducto;
    this.NombreProducto = NombreProducto;
    this.DescripcionProducto = DescripcionProducto;
    this.PrecioProducto = PrecioProducto;
    this.StockProducto = StockProducto;
  }
}

// class ModelProducto {
//   constructor(
//     idcategoriaproducto,
//     idtipoproducto,
//     idproducto,
//     nombrecategoria,
//     descripcioncategoria,
//     nombretipo,
//     nombreproducto,
//     descripcionproducto,
//     precio,
//     stock
//   ) {
//     this.idcategoriaproducto = idcategoriaproducto;
//     this.idtipoproducto = idtipoproducto;
//     this.idproducto = idproducto;
//     this.nombrecategoria = nombrecategoria;
//     this.descripcioncategoria = descripcioncategoria;
//     this.nombretipo = nombretipo;
//     this.nombreproducto = nombreproducto;
//     this.descripcionproducto = descripcionproducto;
//     this.precio = precio;
//     this.stock = stock;
//   }
// }

export default { ModelProducto, modelproducto };
