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

class InfrastructurePais {
  constructor() {}

  async getCountry() {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarPais"();');
      console.log('Paises encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getCountryById(id) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarPaisPorId"($1);', [id]);
      console.log('Paises encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getCountryByName(nombrepais) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarPaisPorNombre"($1)', [nombrepais]);
      console.log('Paises encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async ingresarpais(cuerpo) {
    let results = [];
    return results;
  }

  async modificarpais(parametro, cuerpo) {
    let results = [];
    return results;
  }

  async eliminarpais(parametro) {
    let results = [];
    return results;
  }
}

export default InfrastructurePais;
