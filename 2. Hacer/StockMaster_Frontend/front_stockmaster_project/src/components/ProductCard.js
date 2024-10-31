import { useEffect, useState } from 'react';

const ProductCard = ({ urlType, parameter }) => {
  const [productos, setProductos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const uriApi =
    urlType === 'id'
      ? `http://localhost:8067/getproductid/${parameter}`
      : urlType === 'name'
      ? `http://localhost:8067/getproductname/${parameter}`
      : 'http://localhost:8067/getproduct';

  useEffect(() => {
    setLoading(true);
    setError(null);

    fetch(uriApi)
      .then((response) => response.json())
      .then((data) => {
        if (data && data.product) {
          setProductos(Array.isArray(data.product) ? data.product : [data.product]);
        } else {
          setProductos([]);
        }
        setLoading(false);
      })
      .catch((error) => {
        console.error('Error al cargar datos:', error);
        setError('No se pudieron cargar los datos del producto.');
        setLoading(false);
      });
  }, [uriApi]);

  if (loading) {
    return (
      <div className='loading-products'>
        <p className='loading-text'>Cargando datos ...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className='loading-products'>
        <p className='loading-text'>{error}</p>
      </div>
    );
  }

  if (!productos.length && !loading) {
    return (
      <div className='loading-products'>
        <p className='loading-text'>No se encontraron productos con el criterio seleccionado.</p>
      </div>
    );
  }

  return (
    <article className='card-container'>
      {productos.map((product) => (
        <div className='product-card' key={product._id}>
          <p>
            <span>Nombre del Producto: </span>
            {product.NombreProducto}
          </p>
          <p>
            <span>Id Categoria de Producto: </span>
            {product.IdCategoriaProducto}
          </p>
          <p>
            <span>Id Tipo de Producto: </span>
            {product.IdTipoProducto}
          </p>
          <p>
            <span>Id Producto: </span>
            {product.IdProducto}
          </p>
          <p>
            <span>Nombre de la Categoria de Producto: </span>
            {product.NombreCategoriaProducto}
          </p>
          <p>
            <span>Nombre del Tipo de Producto: </span>
            {product.NombreTipoProducto}
          </p>
          <p>
            <span>Descripción del Producto: </span>
            {product.DescripcionProducto}
          </p>
          <p>
            <span>Precio del Producto: </span>
            {product.PrecioProducto}
          </p>
          <p>
            <span>Stock del Producto: </span>
            {product.StockProducto}
          </p>
        </div>
      ))}
    </article>
  );
};

export default ProductCard;
