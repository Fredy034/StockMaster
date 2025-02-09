const ClientTypes = () => {
  return (
    <main>
      <section className='main-welcome'>
        <h2>Sistema de Gestión de Inventario - Stock Master</h2>
        <article className='section-container'>
          <div>
            <p>Consulta de Clientes - Genero</p>
            <a className='tech-button' href='/postgre/genero'>
              Genero
            </a>
          </div>
          <div>
            <p>Consulta de Clientes - Tipo Documento</p>
            <a className='tech-button' href='/postgre/tipodocumento'>
              Tipo Documento
            </a>
          </div>
          <div>
            <p>Consulta de Clientes - Persona</p>
            <a className='tech-button' href='/postgre/persona'>
              Persona
            </a>
          </div>
          <div>
            <p>Consulta de Clientes - Cliente</p>
            <a className='tech-button' href='/postgre/cliente'>
              Cliente
            </a>
          </div>
        </article>
        <a className='tech-button' href='/'>
          Volver al Inicio
        </a>
      </section>
    </main>
  );
};

export default ClientTypes;
