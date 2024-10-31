import { useEffect } from 'react';
import MongoInfo from '../components/MongoInfo';

const Mongo = () => {
  useEffect(() => {
    document.title = 'StockMaster | Consulta de Productos - MongoDB';
  })

  return (
    <main className='main'>
      <div className='section-header'>
        <h2>Consulta de Productos</h2>
        <a className='tech-button' href='/'>
          Volver al Inicio
        </a>
      </div>
      <MongoInfo />
    </main>
  );
};

export default Mongo;
