import pkg from 'body-parser';
import cors from 'cors';
import express from 'express';
import { serve, setup } from 'swagger-ui-express';
import { PORT_SERVER } from './config.js';

// import geografiaAPI from './application/entitie/geografia/apiGeografia.js';
// import swaggerSpecGeografia from './swagger/entitie/geografia/configGeografia.js';

import clienteAPI from './application/entitie/cliente/apiCliente.js';
import swaggerSpecCliente from './swagger/entitie/cliente/configCliente.js';

const { json } = pkg;
const app = express();

app.use(cors());

app.use(json());

app.use('/api-docs', serve, setup(swaggerSpecCliente));

app.use(clienteAPI);

app.listen(PORT_SERVER, () => {
  console.log('Entities Server is running on port', PORT_SERVER);
  console.log(`Swagger docs for entities available at http://localhost:${PORT_SERVER}/api-docs`);
});
