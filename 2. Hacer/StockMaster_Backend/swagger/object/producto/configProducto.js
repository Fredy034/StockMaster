import swaggerJSDoc from 'swagger-jsdoc';

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Producto API',
      version: '1.0.0',
      description: 'API Producto IUEAS2024-02',
    },
  },
  apis: ['./application/object/producto/*.js'],
};

const swaggerSpec = swaggerJSDoc(options);

export default swaggerSpec;
