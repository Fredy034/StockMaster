import ProductCard from './ProductCard';
import ProductSearch from './ProductSearch';

const MongoInfo = () => {
  return (
    <div>
      <section className='products-container'>
        <div className='inner-container'>
          <p>Consulta de productos específicos</p>
          <ProductSearch />
        </div>
        <div className='inner-container'>
          <p>Consulta de todos los productos</p>
          <ProductCard />
        </div>
      </section>
    </div>
  );
};

export default MongoInfo;
