import pkg from 'body-parser';
import cors from 'cors';
import express from 'express';
import { serve, setup } from 'swagger-ui-express';
import { PORT_INDEX } from './config.js';

import productoAPI from './application/object/producto/apiProducto.js';
import swaggerSpec from './swagger/object/producto/configProducto.js';

const { json } = pkg;
const app = express();

app.use(cors());

app.use(json());

app.use('/api-docs', serve, setup(swaggerSpec));

app.use(productoAPI);

app.listen(PORT_INDEX, () => {
  console.log('Server is running on port', PORT_INDEX);
  console.log(`Swagger docs available at http://localhost:${PORT_INDEX}/api-docs`);
});
