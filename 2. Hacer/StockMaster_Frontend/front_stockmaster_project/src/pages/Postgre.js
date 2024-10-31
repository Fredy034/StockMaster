import { useEffect } from 'react';
import ClientCard from '../components/ClientCard';

const Postgre = () => {
  useEffect(() => {
    document.title = 'StockMaster | Consulta de Clientes - PostgreSQL';
  });
  return (
    <div className='main'>
      <div className='section-header'>
        <h2>Consulta de Clientes</h2>
        <a className='tech-button' href='/'>
          Volver al Inicio
        </a>
      </div>
      <section className='clients-container-postgre'>
        <div className='inner-container'>
          <p>Consulta de Generos</p>
          <ClientCard keyword={'gender'} />
          <p>Consulta de Tipo de Documentos</p>
          <ClientCard keyword={'documenttype'} />
          <p>Consulta de Clientes</p>
          <ClientCard keyword={'client'} />
        </div>
        <div className='inner-container'>
          <p>Consulta de Personas</p>
          <ClientCard keyword={'people'} />
        </div>
      </section>
    </div>
  );
};

export default Postgre;
