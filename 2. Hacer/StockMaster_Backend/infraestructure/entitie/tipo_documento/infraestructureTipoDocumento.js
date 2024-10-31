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

class InfraestructureTipoDocumento {
  constructor() {}

  async getDocumentType() {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarTipoDocumento"();');
      console.log('Tipos de documentos encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getDocumentTypeById(id) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarTipoDocumentoPorId"($1);', [id]);
      console.log('Tipos de documentos encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }

  async getDocumentTypeByName(nombretipodocumento) {
    try {
      const results = await pool.query('SELECT * FROM "ConsultarTipoDocumentoPorNombre"($1)', [nombretipodocumento]);
      console.log('Tipos de documentos encontrados:', results.rowCount);
      return results.rows;
    } catch (err) {
      console.error(err.message);
    }
  }
}

export default InfraestructureTipoDocumento;
