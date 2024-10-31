import TechCard from './TechCard';

const Welcome = () => {
  return (
    <article className='welcome-container'>
      <TechCard
        tech='MongoDB - Productos'
        text='Explora los detalles clave de los productos almacenados en nuestro sistema de inventarios. La API en MongoDB te permite acceder a información precisa y en tiempo real de cada producto, facilitando la consulta y actualización de datos específicos.'
        image='https://www.bleepstatic.com/content/hl-images/2023/12/16/mongodb-header-o.jpg'
        link='/mongo'
      />
      <TechCard
        tech='PostgreSQL - Clientes'
        text='Consulta diversas estadísticas y datos relevantes sobre el inventario de productos mediante nuestra API en PostgreSQL. Esta API proporciona información consolidada y analítica para ayudarte a tomar decisiones informadas sobre la gestión de tu inventario.'
        image='https://btech.id/media/images/Page/2023/07/07/postgres-2583895412'
        link='/postgre'
      />
    </article>
  );
};

export default Welcome;
