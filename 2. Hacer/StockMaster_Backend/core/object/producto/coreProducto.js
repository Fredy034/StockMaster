import modelProductoObject from '../../../domain/object/producto/modelProducto.js';
const { ModelProducto, modelproducto } = modelProductoObject;

import InfraestructureProductoObject from '../../../infraestructure/object/producto/infraestructureProducto.js';
const InfraestructureProducto = InfraestructureProductoObject.InfraestructureProducto;

class CoreProducto {
  constructor() {}

  async getProduct() {
    const infraestructureProducto = new InfraestructureProducto();
    try {
      return await infraestructureProducto.getProduct();
    } catch (error) {
      console.error(error);
    }
  }

  async getProductById(parameter) {
    const infraestructureProducto = new InfraestructureProducto();
    try {
      return await infraestructureProducto.getProductById(parameter);
    } catch (error) {
      console.error(error);
    }
  }

  async getProductByName(parameter) {
    const infraestructureProducto = new InfraestructureProducto();
    try {
      return await infraestructureProducto.getProductByName(parameter);
    } catch (error) {
      console.error(error);
    }
  }

  async createProduct(product) {
    const infraestructureProducto = new InfraestructureProducto();
    try {
      return await infraestructureProducto.createProduct(product);
    } catch (error) {
      console.error(error);
    }
  }

  async updateProduct(product) {
    const infraestructureProducto = new InfraestructureProducto();
    try {
      return await infraestructureProducto.updateProduct(product);
    } catch (error) {
      console.error(error);
    }
  }

  async deleteProduct(parameter) {
    const infraestructureProducto = new InfraestructureProducto();
    try {
      return await infraestructureProducto.deleteProduct(parameter);
    } catch (error) {
      console.error(error);
    }
  }
}

export default CoreProducto;
