import infraestructureTipoDocumento from '../../../infraestructure/entitie/tipo_documento/infraestructureTipoDocumento.js';

import ModelTipoDocumentoObject from '../../../domain/entitie/tipo_documento/modelTipoDocumento.js';
const { ModelTipoDocumento, modeltipodocumento } = ModelTipoDocumentoObject;

class CoreTipoDocumento {
  constructor() {}

  async getDocumentType() {
    const infraestructuretipodocumento = new infraestructureTipoDocumento();
    try {
      return await infraestructuretipodocumento.getDocumentType();
    } catch (err) {
      console.error(err.message);
    }
  }

  async getDocumentTypeById(id) {
    const infraestructuretipodocumento = new infraestructureTipoDocumento();
    try {
      return await infraestructuretipodocumento.getDocumentTypeById(id);
    } catch (err) {
      console.error(err.message);
    }
  }

  async getDocumentTypeByName(nombre) {
    const infraestructuretipodocumento = new infraestructureTipoDocumento();
    try {
      return await infraestructuretipodocumento.getDocumentTypeByName(nombre);
    } catch (err) {
      console.error(err.message);
    }
  }
}

export default CoreTipoDocumento;
