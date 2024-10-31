import swaggerJSDoc from 'swagger-jsdoc';

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Cliente API',
      version: '1.0.0',
      description: 'API Cliente IUEAS2024-02',
    },
  },
  apis: ['./application/entitie/cliente/*.js'],
};

const swaggerSpec = swaggerJSDoc(options);

export default swaggerSpec;
