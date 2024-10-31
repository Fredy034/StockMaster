import InfrastructurePais from '../../../infraestructure/entitie/pais/infrastructurePais.js';

import ModelPaisObject from '../../../domain/entitie/pais/modelPais.js';
const { ModelPais, modelpais } = ModelPaisObject;

class CorePais {
  constructor() {}

  async getCountry() {
    const infrastructurepais = new InfrastructurePais();
    try {
      return await infrastructurepais.getCountry();
    } catch (err) {
      console.error(err.message);
    }
  }

  async getCountryById(id) {
    const infrastructurepais = new InfrastructurePais();
    try {
      return await infrastructurepais.getCountryById(id);
    } catch (err) {
      console.error(err.message);
    }
  }

  async getCountryByName(nombrepais) {
    const infrastructurepais = new InfrastructurePais();
    try {
      return await infrastructurepais.getCountryByName(nombrepais);
    } catch (err) {
      console.error(err.message);
    }
  }

  async ingresarpais(cuerpo) {
    const infrastructurepais = new InfrastructurePais();
    try {
      return await infrastructurepais.ingresarpais(cuerpo);
    } catch (err) {
      console.error(err.message);
    }
  }

  async modificarpais(parametro, cuerpo) {
    const infrastructurepais = new InfrastructurePais();
    try {
      return await infrastructurepais.modificarpais(parametro, cuerpo);
    } catch (err) {
      console.error(err.message);
    }
  }

  async eliminarpais(parametro) {
    const infrastructurepais = new InfrastructurePais();
    try {
      return await infrastructurepais.eliminarpais(parametro);
    } catch (err) {
      console.error(err.message);
    }
  }
}

export default CorePais;
