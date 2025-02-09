import { useEffect } from 'react';
import ClientCard from '../components/ClientCard';
import ClientSearch from './ClientSearch';

const ClientList = ({ keyword }) => {
  useEffect(() => {
    document.title = 'StockMaster | Consulta de Clientes - PostgreSQL';
  });

  return (
    <div className='main'>
      <div className='section-header'>
        <h2>Consulta de Clientes</h2>
        <a className='tech-button' href='/postgre'>
          Volver al Inicio
        </a>
      </div>
      <section className='clients-container-postgre'>
        <div className='inner-container'>
          <p>Consulta de productos específicos</p>
          <ClientSearch keyword={keyword} />
        </div>
        <div className='inner-container'>
          <p>Consulta de todos los productos</p>
          <ClientCard keyword={keyword} />
        </div>
      </section>
    </div>
  );
};

export default ClientList;
