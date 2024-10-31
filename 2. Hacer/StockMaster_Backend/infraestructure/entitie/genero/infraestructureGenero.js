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

class InfraestructureGenero {
  constructor() {}

  async getGender() {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarGenero"();');
      console.log('Generos encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getGenderById(id) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarGeneroPorId"($1);', [id]);
      console.log('Generos encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getGenderByName(nombregenero) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarGeneroPorNombre"($1)', [nombregenero]);
      console.log('Generos encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }
}

export default InfraestructureGenero;
