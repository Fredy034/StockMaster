import pg from 'pg';
import { DB_POSTGRE, HOST_POSTGRE, PASSWORD_POSTGRE, PORT_POSTGRE, USER_POSTGRE } from '../../../config.js';

const { Pool } = pg;

const pool = new Pool({
  host: HOST_POSTGRE,
  user: USER_POSTGRE,
  password: PASSWORD_POSTGRE,
  database: DB_POSTGRE,
  port: PORT_POSTGRE,
});

class InfraestructureCliente {
  constructor() {}

  async getClient() {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarCliente"();');
      console.log('Clientes encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getClientById(id) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarClientePorId"($1);', [id]);
      console.log('Clientes encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getClientByName(nombrecliente) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarClientePorNombre"($1)', [nombrecliente]);
      console.log('Clientes encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }
}

export default InfraestructureCliente;
