import InfraestrctureGenero from '../../../infraestructure/entitie/genero/infraestructureGenero.js';

import ModelGeneroObject from '../../../domain/entitie/genero/modelGenero.js';
const { ModelGenero, modelgenero } = ModelGeneroObject;

class CoreGenero {
  constructor() {}

  async getGender() {
    const infraestructuregenero = new InfraestrctureGenero();
    try {
      return await infraestructuregenero.getGender();
    } catch (err) {
      console.error(err.message);
    }
  }

  async getGenderById(id) {
    const infraestructuregenero = new InfraestrctureGenero();
    try {
      return await infraestructuregenero.getGenderById(id);
    } catch (err) {
      console.error(err.message);
    }
  }

  async getGenderByName(nombre) {
    const infraestructuregenero = new InfraestrctureGenero();
    try {
      return await infraestructuregenero.getGenderByName(nombre);
    } catch (err) {
      console.error(err.message);
    }
  }
}

export default CoreGenero;