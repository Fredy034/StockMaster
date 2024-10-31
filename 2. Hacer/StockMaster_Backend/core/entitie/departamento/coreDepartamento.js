import InfrastructureDepartamento from '../../../infraestructure/entitie/departamento/infrastructureDepartamento.js';

import ModelDepartamentoObject from '../../../domain/entitie/departamento/modelDepartamento.js';
const { ModelDepartamento, modeldepartamento } = ModelDepartamentoObject;

class CoreDepartamento {
  constructor() {}

  async getDeparment() {
    const infrastructuredepartamento = new InfrastructureDepartamento();
    try {
      return await infrastructuredepartamento.getDeparment();
    } catch (err) {
      console.error(err.message);
    }
  }

  async getDeparmentById(id) {
    const infrastructuredepartamento = new InfrastructureDepartamento();
    try {
      return await infrastructuredepartamento.getDeparmentById(id);
    } catch (err) {
      console.error(err.message);
    }
  }

  async getDeparmentByName(nombredepartamento) {
    const infrastructuredepartamento = new InfrastructureDepartamento();
    try {
      return await infrastructuredepartamento.getDeparmentByName(nombredepartamento);
    } catch (err) {
      console.error(err.message);
    }
  }

  async ingresardepartamento(cuerpo) {
    const infrastructuredepartamento = new InfrastructureDepartamento();
    try {
      return await infrastructuredepartamento.ingresardepartamento(cuerpo);
    } catch (err) {
      console.error(err.message);
    }
  }

  async modificardepartamento(parametro, cuerpo) {
    const infrastructuredepartamento = new InfrastructureDepartamento();
    try {
      return await infrastructuredepartamento.modificardepartamento(parametro, cuerpo);
    } catch (err) {
      console.error(err.message);
    }
  }

  async eliminardepartamento(parametro) {
    const infrastructuredepartamento = new InfrastructureDepartamento();
    try {
      return await infrastructuredepartamento.eliminardepartamento(parametro);
    } catch (err) {
      console.error(err.message);
    }
  }
}

export default CoreDepartamento;
