import { MongoClient } from 'mongodb';
import { COLLECTION, DBNAME, MONGO_URI } from '../../../config.js';

import modelProductoObject from '../../../domain/object/producto/modelProducto.js';
const { ModelProducto, modelproducto } = modelProductoObject;

// Collections: Cliente, Geografia, Producto, Transaccion, Organizacion
const uri = MONGO_URI;
const dbName = DBNAME;
const collectionName = COLLECTION;

class InfraestructureProducto {
  constructor() {}

  async getProduct() {
    const client = new MongoClient(uri);
    const db = client.db(dbName);
    const col = db.collection(collectionName);

    let query = {};

    try {
      const result = await col.find(query).toArray();
      return result;
    } catch (error) {
      console.error(error);
    } finally {
      await client.close();
    }
  }

  async getProductById(parameter) {
    const client = new MongoClient(uri);
    const db = client.db(dbName);
    const col = db.collection(collectionName);

    let query = { IdProducto: parameter };

    try {
      const result = await col.findOne(query);
      return result;
    } catch (error) {
      console.error(error);
    } finally {
      await client.close();
    }
  }

  async getProductByName(parameter) {
    const client = new MongoClient(uri);
    const db = client.db(dbName);
    const col = db.collection(collectionName);

    let query = { NombreProducto: parameter };

    try {
      const result = await col.findOne(query);
      return result;
    } catch (error) {
      console.error(error);
    } finally {
      await client.close();
    }
  }

  async createProduct(product) {
    const client = new MongoClient(uri);
    const db = client.db(dbName);
    const col = db.collection(collectionName);

    try {
      const result = await col.insertOne(product);
      return result;
    } catch (error) {
      console.error(error);
    } finally {
      await client.close();
    }
  }

  async updateProduct(product) {
    const client = new MongoClient(uri);
    const db = client.db(dbName);
    const col = db.collection(collectionName);

    let query = { IdProducto: product.IdProducto };
    let newValues = { $set: product };

    try {
      const result = await col.updateOne(query, newValues);
      return result;
    } catch (error) {
      console.error(error);
    } finally {
      await client.close();
    }
  }

  async deleteProduct(parameter) {
    const client = new MongoClient(uri);
    const db = client.db(dbName);
    const col = db.collection(collectionName);

    let query = { IdProducto: parameter };

    try {
      const result = await col.deleteOne(query);
      return result;
    } catch (error) {
      console.error(error);
    } finally {
      await client.close();
    }
  }
}

export default { InfraestructureProducto };
