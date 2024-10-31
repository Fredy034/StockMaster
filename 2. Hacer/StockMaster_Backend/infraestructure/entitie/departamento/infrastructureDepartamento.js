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

class InfrastructureDepartamento {
  constructor() {}

  async getDeparment() {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarDepartamento"();');
      console.log('Departamentos encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getDeparmentById(id) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarDepartamentoPorId"($1)', [id]);
      console.log('Departamentos encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getDeparmentByName(nombredepartamento) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarDepartamentoPorNombre"($1)', [nombredepartamento]);
      console.log('Departamentos encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async ingresardepartamento(cuerpo) {
    let results = [];
    return results;
  }

  async modificardepartamento(parametro, cuerpo) {
    let results = [];
    return results;
  }

  async eliminardepartamento(parametro) {
    let results = [];
    return results;
  }
}

export default InfrastructureDepartamento;
