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

class InfraestructurePersona {
  constructor() {}

  async getPerson() {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarPersona"();');
      console.log('Personas encontradas:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getPersonById(id) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarPersonaPorId"($1);', [id]);
      console.log('Personas encontradas:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getPersonByName(nombrepersona) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarPersonaPorNombre"($1)', [nombrepersona]);
      console.log('Personas encontradas:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }
}

export default InfraestructurePersona;