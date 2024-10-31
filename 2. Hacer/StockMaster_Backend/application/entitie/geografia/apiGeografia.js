import { Router } from 'express';
const router = Router();

import CoreCiudad from '../../../core/entitie/ciudad/coreCiudad.js';
import CoreDepartamento from '../../../core/entitie/departamento/coreDepartamento.js';
import CorePais from '../../../core/entitie/pais/corePais.js';

// GET all countries
/**
 * @swagger
 * /getcountries:
 *  get:
 *   summary: Get all Countries
 *   tags: [Pais]
 *   responses:
 *    200:
 *     description: Get all countries
 */

router.get('/getcountries', async (req, res) => {
  const corepais = new CorePais();
  try {
    const resultCorePais = await corepais.getCountry();
    res.status(200).json({ msg: 'Paises encontrados', countries: resultCorePais });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a country by ID
/**
 * @swagger
 * /getcountrybyid/{idpais}:
 *  get:
 *   summary: Get a Country by ID
 *   tags: [Pais]
 *   parameters:
 *    - in: path
 *      name: idpais
 *      required: true
 *      description: ID of the country to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the country by ID
 *    404:
 *     description: Country not found
 */

router.get('/getcountrybyid/:idpais', async (req, res) => {
  const idpais = req.params.idpais;

  const corepais = new CorePais();
  try {
    const resultCorePais = await corepais.getCountryById(idpais);
    res.status(200).json({ msg: 'Pais encontrado', country: resultCorePais });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a country by Name
/**
 * @swagger
 * /getcountrybyname/{nombrepais}:
 *  get:
 *   summary: Get a Country by Name
 *   tags: [Pais]
 *   parameters:
 *    - in: path
 *      name: nombrepais
 *      required: true
 *      description: Name of the country to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the country by Name
 *    404:
 *     description: Country not found
 */

router.get('/getcountrybyname/:nombrepais', async (req, res) => {
  const nombrepais = req.params.nombrepais;

  const corepais = new CorePais();
  try {
    const resultCorePais = await corepais.getCountryByName(nombrepais);
    res.status(200).json({ msg: 'Pais encontrado', country: resultCorePais });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET all departments
/**
 * @swagger
 * /getdepartaments:
 *  get:
 *   summary: Get all Departments
 *   tags: [Departamento]
 *   responses:
 *    200:
 *     description: Get all departments
 */

router.get('/getdepartaments', async (req, res) => {
  const coredepartamento = new CoreDepartamento();
  try {
    const resultCoreDepartamento = await coredepartamento.getDeparment();
    res.status(200).json({ msg: 'Departamentos encontrados', departaments: resultCoreDepartamento });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a department by ID
/**
 * @swagger
 * /getdepartmentbyid/{iddepartamento}:
 *  get:
 *   summary: Get a Department by Id
 *   tags: [Departamento]
 *   parameters:
 *    - in: path
 *      name: iddepartamento
 *      required: true
 *      description: ID of the department to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the department by Id
 *    404:
 *     description: Department not found
 */

router.get('/getdepartmentbyid/:iddepartamento', async (req, res) => {
  const iddepartamento = req.params.iddepartamento;

  const coredepartamento = new CoreDepartamento();
  try {
    const resultCoreDepartamento = await coredepartamento.getDeparmentById(iddepartamento);
    res.status(200).json({ msg: 'Departamento encontrado', department: resultCoreDepartamento });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a department by Name
/**
 * @swagger
 * /getdepartmentbyname/{nombredepartamento}:
 *  get:
 *   summary: Get a Department by Name
 *   tags: [Departamento]
 *   parameters:
 *    - name: nombredepartamento
 *      in: path
 *      required: true
 *      description: Name of the department to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the department by Name
 *    404:
 *     description: Department not found
 */

router.get('/getdepartmentbyname/:nombredepartamento', async (req, res) => {
  const nombredepartamento = req.params.nombredepartamento;

  const coredepartamento = new CoreDepartamento();
  try {
    const resultCoreDepartamento = await coredepartamento.getDeparmentByName(nombredepartamento);
    res.status(200).json({ msg: 'Departamento encontrado', department: resultCoreDepartamento });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET all cities
/**
 * @swagger
 * /getcity:
 *  get:
 *   summary: Get all Cities
 *   tags: [Ciudad]
 *   responses:
 *    200:
 *     description: Get all cities
 */

router.get('/getcity', async (req, res) => {
  const coreciudad = new CoreCiudad();
  try {
    const resultCoreCiudad = await coreciudad.getCity();
    res.status(200).json({ msg: 'Ciudades encontradas', cities: resultCoreCiudad });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a city by ID
/**
 * @swagger
 * /getcitybyid/{idciudad}:
 *  get:
 *   summary: Get a City by Id
 *   tags: [Ciudad]
 *   parameters:
 *    - in: path
 *      name: idciudad
 *      required: true
 *      description: ID of the city to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the city by Id
 *    404:
 *     description: City not found
 */

router.get('/getcitybyid/:idciudad', async (req, res) => {
  const idciudad = req.params.idciudad;

  const coreciudad = new CoreCiudad();
  try {
    const resultCoreCiudad = await coreciudad.getCityById(idciudad);
    res.status(200).json({ msg: 'Ciudad encontrada', city: resultCoreCiudad });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

// GET a city by Name
/**
 * @swagger
 * /getcitybyname/{nombreciudad}:
 *  get:
 *   summary: Get a City by Name
 *   tags: [Ciudad]
 *   parameters:
 *    - in: path
 *      name: nombreciudad
 *      required: true
 *      description: Name of the city to get
 *      schema:
 *       type: string
 *   responses:
 *    200:
 *     description: Get the city by Name
 *    404:
 *     description: City not found
 */

router.get('/getcitybyname/:nombreciudad', async (req, res) => {
  const nombreciudad = req.params.nombreciudad;

  const coreciudad = new CoreCiudad();
  try {
    const resultCoreCiudad = await coreciudad.getCityByName(nombreciudad);
    res.status(200).json({ msg: 'Ciudad encontrada', city: resultCoreCiudad });
  } catch (err) {
    res.status(500).json({ error: err.message });
    console.error(err);
  }
});

export default router;
