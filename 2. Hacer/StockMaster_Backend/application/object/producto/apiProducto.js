import { Router } from 'express';
const router = Router();

import CoreProducto from '../../../core/object/producto/coreProducto.js';
import modelProductoObject from '../../../domain/object/producto/modelProducto.js';
const { ModelProducto, modelproducto } = modelProductoObject;

// GET all products
/**
 * @swagger
 * /getproduct:
 *  get:
 *   summary: Get Product
 *   tags: [Producto]
 *   responses:
 *    200:
 *     description: Get all products
 */

router.get('/getproduct', async (req, res) => {
  // let answer = ['Esto', 'Es', 'Una', 'Prueba', 'De', 'Producto'];
  const coreproducto = new CoreProducto();
  try {
    const resultCoreProducto = await coreproducto.getProduct();
    res.status(200).json({ msg: 'Productos encontrados', product: resultCoreProducto });
  } catch (error) {
    res.status(500).json({ error: err.message });
    console.error(error);
  }
});

// GET a product by ID
/**
 * @swagger
 * /getproductid/{idproducto}:
 *  get:
 *   summary: Get a Product by ID
 *   tags: [Producto]
 *   parameters:
 *    - in: path
 *      name: idproducto
 *      required: true
 *      description: ID of the product to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the product by ID
 *    404:
 *     description: Product not found
 */

router.get('/getproductid/:idproducto', async (req, res) => {
  //let answer = ['Esto', 'Es', 'Una', 'Prueba', 'De', 'Producto', 'Con', 'ID', idproducto];
  const idproducto = req.params.idproducto;

  const coreproducto = new CoreProducto();
  try {
    const resultCoreProducto = await coreproducto.getProductById(idproducto);
    res.status(200).json({ msg: 'Producto encontrado', product: resultCoreProducto });
  } catch (error) {
    res.status(500).json({ error: err.message });
    console.error(error);
  }
});

// GET a product by name
/**
 * @swagger
 * /getproductname/{nombreproducto}:
 *  get:
 *   summary: Get a Product by Name
 *   tags: [Producto]
 *   parameters:
 *    - in: path
 *      name: nombreproducto
 *      required: true
 *      description: Name of the product to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the product by Name
 *    404:
 *     description: Product not found
 *    500:
 *     description: Internal Server Error
 */

router.get('/getproductname/:nombreproducto', async (req, res) => {
  const nombreproducto = req.params.nombreproducto;

  const coreproducto = new CoreProducto();
  try {
    const resultCoreProducto = await coreproducto.getProductByName(nombreproducto);
    res.status(200).json({ msg: 'Producto encontrado', product: resultCoreProducto });
  } catch (error) {
    res.status(500).json({ error: err.message });
    console.error(error);
  }
});

// POST a new product
/**
 * @swagger
 * /addproduct:
 *  post:
 *   summary: Add a new Product
 *   requestBody:
 *    required: true
 *    content:
 *     application/json:
 *      schema:
 *       type: object
 *       properties:
 *        idcategoriaproducto:
 *         type: string
 *        idtipoproducto:
 *         type: string
 *        idproducto:
 *         type: string
 *        nombrecategoria:
 *         type: string
 *        descripcioncategoria:
 *         type: string
 *        nombretipo:
 *         type: string
 *        nombreproducto:
 *         type: string
 *        descripcionproducto:
 *         type: string
 *        precio:
 *         type: integer
 *        stock:
 *         type: integer
 *   tags: [Producto]
 *   responses:
 *    201:
 *     description: Product added
 *    400:
 *     description: Bad request, missing required fields
 */

/*
PAYLOAD EXAMPLE:
{
  "idcategoriaproducto": "1",
  "idtipoproducto": "1",
  "idproducto": "1",
  "nombrecategoria": "1",
  "descripcioncategoria": "1",
  "nombretipo": "1",
  "nombreproducto": "1",
  "descripcionproducto": "1",
  "precio": "1",
  "stock": "1"
}
*/

router.post('/addproduct', async (req, res) => {
  const {
    idcategoriaproducto,
    idtipoproducto,
    idproducto,
    nombrecategoria,
    descripcioncategoria,
    nombretipo,
    nombreproducto,
    descripcionproducto,
    precio,
    stock,
  } = req.body;

  if (
    !idcategoriaproducto ||
    !idtipoproducto ||
    !idproducto ||
    !nombrecategoria ||
    !descripcioncategoria ||
    !nombretipo ||
    !nombreproducto ||
    !descripcionproducto ||
    !precio ||
    !stock
  ) {
    return res.status(400).json({ msg: 'Faltan campos por llenar, completa los campos requeridos' });
  }

  const coreproducto = new CoreProducto();
  try {
    const newProduct = new ModelProducto(
      idcategoriaproducto,
      idtipoproducto,
      idproducto,
      nombrecategoria,
      descripcioncategoria,
      nombretipo,
      nombreproducto,
      descripcionproducto,
      precio,
      stock
    );

    const resultCoreProducto = await coreproducto.createProduct(newProduct);
    res.status(201).json({ msg: 'Producto agregado', product: resultCoreProducto });
  } catch (error) {
    res.status(500).json({ error: error.message });
    console.error(error);
  }
});

// PUT a product
/**
 * @swagger
 * /updateproduct/{idproducto}:
 *  put:
 *   summary: Update an existing Product
 *   tags: [Producto]
 *   parameters:
 *    - in: path
 *      name: idproducto
 *      required: true
 *      description: ID of the product to update
 *      schema:
 *       type: string
 *   requestBody:
 *    required: true
 *    content:
 *     application/json:
 *      schema:
 *       type: object
 *       properties:
 *        idcategoriaproducto:
 *         type: string
 *        idtipoproducto:
 *         type: string
 *        nombrecategoria:
 *         type: string
 *        descripcioncategoria:
 *         type: string
 *        nombretipo:
 *         type: string
 *        nombreproducto:
 *         type: string
 *        descripcionproducto:
 *         type: string
 *        precio:
 *         type: integer
 *        stock:
 *         type: integer
 *   responses:
 *    200:
 *     description: Product updated
 *    400:
 *     description: Bad request, missing required fields or payload error
 *    404:
 *     description: Product not found
 */

router.put('/updateproduct/:idproducto', async (req, res) => {
  const {
    idcategoriaproducto,
    idtipoproducto,
    nombrecategoria,
    descripcioncategoria,
    nombretipo,
    nombreproducto,
    descripcionproducto,
    precio,
    stock,
  } = req.body;

  if (
    !idcategoriaproducto ||
    !idtipoproducto ||
    !nombrecategoria ||
    !descripcioncategoria ||
    !nombretipo ||
    !nombreproducto ||
    !descripcionproducto ||
    !precio ||
    !stock
  ) {
    return res.status(400).json({ msg: 'Faltan campos por llenar, completa los campos requeridos' });
  }

  const coreproducto = new CoreProducto();
  try {
    const updatedProduct = new ModelProducto(
      idcategoriaproducto,
      idtipoproducto,
      req.params.idproducto,
      nombrecategoria,
      descripcioncategoria,
      nombretipo,
      nombreproducto,
      descripcionproducto,
      precio,
      stock
    );

    const resultCoreProducto = await coreproducto.updateProduct(updatedProduct);
    res.status(200).json({ msg: 'Producto actualizado', product: resultCoreProducto });
  } catch (error) {
    res.status(500).json({ error: error.message });
    console.error(error);
  }
});

// DELETE a product
/**
 * @swagger
 * /deleteproduct/{idproducto}:
 *  delete:
 *   summary: Delete an existing Product
 *   tags: [Producto]
 *   parameters:
 *    - in: path
 *      name: idproducto
 *      required: true
 *      description: ID of the product to delete
 *      schema:
 *       type: string
 *   responses:
 *    201:
 *     description: Product deleted
 *    404:
 *     description: Product not found
 */

router.delete('/deleteproduct/:idproducto', async (req, res) => {
  const idproducto = req.params.idproducto;

  const coreproducto = new CoreProducto();
  try {
    const resultCoreProducto = await coreproducto.deleteProduct(idproducto);
    res.status(201).json({ msg: 'Producto eliminado', product: resultCoreProducto });
  } catch (error) {
    res.status(500).json({ error: error.message });
    console.error(error);
  }
});

export default router;
