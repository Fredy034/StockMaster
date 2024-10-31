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

class InfrastructureCiudad {
  constructor() {}

  async getCity() {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarCiudad"();');
      console.log('Ciudades encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getCityById(id) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarCiudadPorId"($1);', [id]);
      console.log('Ciudades encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getCityByName(nombreciudad) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarCiudadPorNombre"($1)', [nombreciudad]);
      console.log('Ciudades encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async ingresarciudad(cuerpo) {
    let results = [];
    return results;
  }

  async modificarciudad(parametro, cuerpo) {
    let results = [];
    return results;
  }

  async eliminarciudad(parametro) {
    let results = [];
    return results;
  }
}

export default InfrastructureCiudad;
