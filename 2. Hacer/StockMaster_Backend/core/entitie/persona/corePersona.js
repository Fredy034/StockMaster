import InfraestructurePersona from '../../../infraestructure/entitie/persona/infraestructurePersona.js';

import ModelPersonaObject from '../../../domain/entitie/persona/modelPersona.js';
const { ModelPersona, modelpersona } = ModelPersonaObject;

class CorePersona {
  constructor() {}

  async getPerson() {
    const infraestructurepersona = new InfraestructurePersona();
    try {
      return await infraestructurepersona.getPerson();
    } catch (err) {
      console.error(err.message);
    }
  }

  async getPersonById(id) {
    const infraestructurepersona = new InfraestructurePersona();
    try {
      return await infraestructurepersona.getPersonById(id);
    } catch (err) {
      console.error(err.message);
    }
  }

  async getPersonByName(nombrepersona) {
    const infraestructurepersona = new InfraestructurePersona();
    try {
      return await infraestructurepersona.getPersonByName(nombrepersona);
    } catch (err) {
      console.error(err.message);
    }
  }
}

export default CorePersona;
