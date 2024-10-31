import Welcome from '../components/Welcome';

const Root = () => {
  return (
    <main>
      <section className='main-welcome'>
        <h2>Sistema de Gestión de Inventario - Stock Master</h2>
        <p>
          Bienvenido a Stock Master, un sistema diseñado para facilitar la administración de inventarios de manera
          eficiente y precisa. Nuestra solución integra dos APIs especializadas: una en MongoDB y otra en PostgreSQL,
          brindando flexibilidad y acceso rápido a datos detallados sobre productos. Desde el seguimiento de existencias
          hasta la consulta de información detallada, este sistema es la herramienta perfecta para optimizar el manejo
          de inventarios.
        </p>
        <Welcome />
      </section>
    </main>
  );
};

export default Root;
