import swaggerJSDoc from 'swagger-jsdoc';

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Geografia API',
      version: '1.0.0',
      description: 'API Geografia IUEAS2024-02',
    },
  },
  apis: ['./application/entitie/geografia/*.js'],
};

const swaggerSpec = swaggerJSDoc(options);

export default swaggerSpec;
