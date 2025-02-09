import { useEffect } from 'react';
import ClientTypes from '../components/ClientTypes';

const Postgre = () => {
  useEffect(() => {
    document.title = 'StockMaster | Consulta de Clientes - PostgreSQL';
  });
  return (
    <div className='main'>
      <ClientTypes />
    </div>
  );
};

export default Postgre;
