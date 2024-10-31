import { Router } from 'express';
const router = Router();

import CoreCliente from '../../../core/entitie/cliente/coreCliente.js';
import CoreGenero from '../../../core/entitie/genero/coreGenero.js';
import CorePersona from '../../../core/entitie/persona/corePersona.js';
import CoreTipoDocumento from '../../../core/entitie/tipo_documento/coreTipoDocumento.js';

// GET all genders
/**
 * @swagger
 * /getgenders:
 *  get:
 *   summary: Get all Genders
 *   tags: [Genero]
 *   responses:
 *    200:
 *     description: Get all genders
 */

router.get('/getgenders', async (req, res) => {
  const coregenero = new CoreGenero();
  try {
    const resultCoreGenero = await coregenero.getGender();
    res.status(200).json({ msg: 'Generos encontrados', genders: resultCoreGenero });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a gender by ID
/**
 * @swagger
 * /getgenderbyid/{idgenero}:
 *  get:
 *   summary: Get a Gender by ID
 *   tags: [Genero]
 *   parameters:
 *    - in: path
 *      name: idgenero
 *      required: true
 *      description: ID of the gender to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the gender by ID
 *    404:
 *     description: Gender not found
 */

router.get('/getgenderbyid/:idgenero', async (req, res) => {
  const idgenero = req.params.idgenero;

  const coregenero = new CoreGenero();
  try {
    const resultCoreGenero = await coregenero.getGenderById(idgenero);
    res.status(200).json({ msg: 'Genero encontrado', gender: resultCoreGenero });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a gender by Name
/**
 * @swagger
 * /getgenderbyname/{nombregenero}:
 *  get:
 *   summary: Get a Gender by Name
 *   tags: [Genero]
 *   parameters:
 *    - in: path
 *      name: nombregenero
 *      required: true
 *      description: Name of the gender to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the gender by Name
 *    404:
 *     description: Gender not found
 */

router.get('/getgenderbyname/:nombregenero', async (req, res) => {
  const nombregenero = req.params.nombregenero;

  const coregenero = new CoreGenero();
  try {
    const resultCoreGenero = await coregenero.getGenderByName(nombregenero);
    res.status(200).json({ msg: 'Genero encontrado', gender: resultCoreGenero });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET all document types
/**
 * @swagger
 * /getdocumenttypes:
 *  get:
 *   summary: Get all Document Types
 *   tags: [Tipo Documento]
 *   responses:
 *    200:
 *     description: Get all document types
 */

router.get('/getdocumenttypes', async (req, res) => {
  const coretipodocumento = new CoreTipoDocumento();
  try {
    const resultCoreTipoDocumento = await coretipodocumento.getDocumentType();
    res.status(200).json({ msg: 'Tipos de Documentos encontrados', documents: resultCoreTipoDocumento });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a document type by ID
/**
 * @swagger
 * /getdocumenttypebyid/{idtipodocumento}:
 *  get:
 *   summary: Get a Document Type by Id
 *   tags: [Tipo Documento]
 *   parameters:
 *    - in: path
 *      name: idtipodocumento
 *      required: true
 *      description: ID of the document type to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the document type by Id
 *    404:
 *     description: Document Type not found
 */

router.get('/getdocumenttypebyid/:idtipodocumento', async (req, res) => {
  const idtipodocumento = req.params.idtipodocumento;

  const coretipodocumento = new CoreTipoDocumento();
  try {
    const resultCoreTipoDocumento = await coretipodocumento.getDocumentTypeById(idtipodocumento);
    res.status(200).json({ msg: 'Tipo de Documento encontrado', document: resultCoreTipoDocumento });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a document type by Name
/**
 * @swagger
 * /getdocumenttypebyname/{nombretipodocumento}:
 *  get:
 *   summary: Get a Document Type by Name
 *   tags: [Tipo Documento]
 *   parameters:
 *    - name: nombretipodocumento
 *      in: path
 *      required: true
 *      description: Name of the document type to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the document type by Name
 *    404:
 *     description: Document Type not found
 */

router.get('/getdocumenttypebyname/:nombretipodocumento', async (req, res) => {
  const nombretipodocumento = req.params.nombretipodocumento;

  const coretipodocumento = new CoreTipoDocumento();
  try {
    const resultCoreTipoDocumento = await coretipodocumento.getDocumentTypeByName(nombretipodocumento);
    res.status(200).json({ msg: 'Departamento encontrado', department: resultCoreTipoDocumento });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET all people
/**
 * @swagger
 * /getpeople:
 *  get:
 *   summary: Get all People
 *   tags: [Persona]
 *   responses:
 *    200:
 *     description: Get all people
 */

router.get('/getpeople', async (req, res) => {
  const corepersona = new CorePersona();
  try {
    const resultCorePersona = await corepersona.getPerson();
    res.status(200).json({ msg: 'Personas encontradas', people: resultCorePersona });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a person by ID
/**
 * @swagger
 * /getpersonbyid/{idpersona}:
 *  get:
 *   summary: Get a Person by Id
 *   tags: [Persona]
 *   parameters:
 *    - in: path
 *      name: idpersona
 *      required: true
 *      description: ID of the person to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the person by Id
 *    404:
 *     description: Person not found
 */

router.get('/getpersonbyid/:idpersona', async (req, res) => {
  const idpersona = req.params.idpersona;

  const corepersona = new CorePersona();
  try {
    const resultCorePersona = await corepersona.getPersonById(idpersona);
    res.status(200).json({ msg: 'Persona encontrada', person: resultCorePersona });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a person by Name
/**
 * @swagger
 * /getpersonbyname/{nombrepersona}:
 *  get:
 *   summary: Get a Person by Name
 *   tags: [Persona]
 *   parameters:
 *    - in: path
 *      name: nombrepersona
 *      required: true
 *      description: Name of the person to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the person by Name
 *    404:
 *     description: Person not found
 */

router.get('/getpersonbyname/:nombrepersona', async (req, res) => {
  const nombrepersona = req.params.nombrepersona;

  const corepersona = new CorePersona();
  try {
    const resultCorePersona = await corepersona.getPersonByName(nombrepersona);
    res.status(200).json({ msg: 'Persona encontrada', person: resultCorePersona });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET all clients
/**
 * @swagger
 * /getclients:
 *  get:
 *   summary: Get all Clients
 *   tags: [Cliente]
 *   responses:
 *    200:
 *     description: Get all clients
 */

router.get('/getclients', async (req, res) => {
  const coreCliente = new CoreCliente();
  try {
    const resultCoreCliente = await coreCliente.getClient();
    res.status(200).json({ msg: 'Clientes encontrados', clients: resultCoreCliente });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a client by ID
/**
 * @swagger
 * /getclientbyid/{idcliente}:
 *  get:
 *   summary: Get a Client by Id
 *   tags: [Cliente]
 *   parameters:
 *    - in: path
 *      name: idcliente
 *      required: true
 *      description: ID of the client to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the client by Id
 *    404:
 *     description: Client not found
 */

router.get('/getclientbyid/:idcliente', async (req, res) => {
  const idcliente = req.params.idcliente;

  const corecliente = new CoreCliente();
  try {
    const resultCoreCliente = await corecliente.getClientById(idcliente);
    res.status(200).json({ msg: 'Cliente encontrado', client: resultCoreCliente });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a client by Name
/**
 * @swagger
 * /getclientbyname/{direccioncliente}:
 *  get:
 *   summary: Get a Client by Name
 *   tags: [Cliente]
 *   parameters:
 *    - in: path
 *      name: direccioncliente
 *      required: true
 *      description: Name of the client to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the client by Name
 *    404:
 *     description: Client not found
 */

router.get('/getclientbyname/:direccioncliente', async (req, res) => {
  const direccioncliente = req.params.direccioncliente;

  const corecliente = new CoreCliente();
  try {
    const resultCoreCliente = await corecliente.getClientByName(direccioncliente);
    res.status(200).json({ msg: 'Cliente encontrado', client: resultCoreCliente });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

export default router;
