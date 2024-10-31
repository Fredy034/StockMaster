import InfrastructureCiudad from '../../../infraestructure/entitie/ciudad/infrastructureCiudad.js';

import ModelCiudadObject from '../../../domain/entitie/ciudad/modelCiudad.js';
const { ModelCiudad, modelciudad } = ModelCiudadObject;

class CoreCiudad {
  constructor() {}

  async getCity() {
    const infrastructureciudad = new InfrastructureCiudad();
    try {
      return await infrastructureciudad.getCity();
    } catch (err) {
      console.error(err.message);
    }
  }

  async getCityById(id) {
    const infrastructureciudad = new InfrastructureCiudad();
    try {
      return await infrastructureciudad.getCityById(id);
    } catch (err) {
      console.error(err.message);
    }
  }

  async getCityByName(nombreciudad) {
    const infrastructureciudad = new InfrastructureCiudad();
    try {
      return await infrastructureciudad.getCityByName(nombreciudad);
    } catch (err) {
      console.error(err.message);
    }
  }

  async ingresarciudad(cuerpo) {
    const infrastructureciudad = new InfrastructureCiudad();
    try {
      return await infrastructureciudad.ingresarciudad(cuerpo);
    } catch (err) {
      console.error(err.message);
    }
  }

  async modificarciudad(parametro, cuerpo) {
    const infrastructureciudad = new InfrastructureCiudad();
    try {
      return await infrastructureciudad.modificarciudad(parametro, cuerpo);
    } catch (err) {
      console.error(err.message);
    }
  }

  async eliminarciudad(parametro) {
    const infrastructureciudad = new InfrastructureCiudad();
    try {
      return await infrastructureciudad.eliminarciudad(parametro);
    } catch (err) {
      console.error(err.message);
    }
  }
}

export default CoreCiudad;
