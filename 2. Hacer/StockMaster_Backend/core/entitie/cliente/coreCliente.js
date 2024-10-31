import InfraestructureCliente from '../../../infraestructure/entitie/cliente/infraestructureCliente.js';

import ModelClienteObject from '../../../domain/entitie/cliente/modelCliente.js';
const { ModelCliente, modelcliente } = ModelClienteObject;

class CoreCliente {
  constructor() {}

  async getClient() {
    const infraestructurecliente = new InfraestructureCliente();
    try {
      return await infraestructurecliente.getClient();
    } catch (err) {
      console.error(err.message);
    }
  }

  async getClientById(id) {
    const infraestructurecliente = new InfraestructureCliente();
    try {
      return await infraestructurecliente.getClientById(id);
    } catch (err) {
      console.error(err.message);
    }
  }

  async getClientByName(direccion) {
    const infraestructurecliente = new InfraestructureCliente();
    try {
      return await infraestructurecliente.getClientByName(direccion);
    } catch (err) {
      console.error(err.message);
    }
  }
}

export default CoreCliente;
