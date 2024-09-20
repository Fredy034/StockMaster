CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE "Pais" (
	"IdPais" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
	"Nombre" VARCHAR(255) NOT NULL,
	"Activo" BIT NOT NULL DEFAULT b'1',
	"Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("IdPais")
);

CREATE TABLE "Departamento" (
	"IdDepartamento" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
	"IdPais" UUID NOT NULL,
	"Nombre" VARCHAR(255) NOT NULL,
	"Activo" BIT NOT NULL DEFAULT b'1',
	"Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("IdDepartamento"),
	FOREIGN KEY("IdPais") REFERENCES "Pais" ("IdPais")
);

CREATE TABLE "Ciudad" (
  "IdCiudad" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdDepartamento" UUID NOT NULL,
  "Nombre" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdCiudad"),
  FOREIGN KEY("IdDepartamento") REFERENCES "Departamento" ("IdDepartamento")
);

CREATE TABLE "TipoDocumento" (
  "IdTipoDocumento" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "Nombre" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdTipoDocumento")
);

CREATE TABLE "Genero" (
  "IdGenero" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "Nombre" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdGenero")
);

CREATE TABLE "Persona" (
  "IdPersona" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdGenero" UUID NOT NULL,
  "IdTipoDocumento" UUID NOT NULL,
  "IdCiudad" UUID NOT NULL,
  "NombreCompleto" VARCHAR(255) NOT NULL,
  "NumeroDocumento" VARCHAR(20) NOT NULL,
  "Correo" VARCHAR(255) NOT NULL,
  "Telefono" VARCHAR(20) NOT NULL,
  "FechaNacimiento" DATE NOT NULL,
  "Usuario" VARCHAR(255) NOT NULL,
  "Contrasena" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdPersona"),
  FOREIGN KEY("IdGenero") REFERENCES "Genero" ("IdGenero"),
  FOREIGN KEY("IdTipoDocumento") REFERENCES "TipoDocumento" ("IdTipoDocumento"),
  FOREIGN KEY("IdCiudad") REFERENCES "Ciudad" ("IdCiudad")
);

CREATE TABLE "Cliente" (
  "IdCliente" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdPersona" UUID NOT NULL,
  "FechaRegistro" DATE NOT NULL,
  "Direccion" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdCliente"),
  FOREIGN KEY("IdPersona") REFERENCES "Persona" ("IdPersona")
);

CREATE TABLE "Tienda" (
  "IdTienda" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "Nombre" VARCHAR(255) NOT NULL,
  "Nit" VARCHAR(20) NOT NULL,
  "Telefono" VARCHAR(20) NOT NULL,
  "Correo" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdTienda")
);

CREATE TABLE "Sucursal" (
  "IdSucursal" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdCiudad" UUID NOT NULL,
  "IdTienda" UUID NOT NULL,
  "Nombre" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdSucursal"),
  FOREIGN KEY("IdCiudad") REFERENCES "Ciudad" ("IdCiudad"),
  FOREIGN KEY("IdTienda") REFERENCES "Tienda" ("IdTienda")
);

CREATE TABLE "Empleado" (
  "IdEmpleado" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdPersona" UUID NOT NULL,
  "IdSucursal" UUID NOT NULL,
  "FechaContratacion" DATE NOT NULL,
  "Salario" NUMERIC NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdEmpleado"),
  FOREIGN KEY("IdPersona") REFERENCES "Persona" ("IdPersona"),
  FOREIGN KEY("IdSucursal") REFERENCES "Sucursal" ("IdSucursal")
);

CREATE TABLE "CategoriaProducto" (
  "IdCategoriaProducto" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "Nombre" VARCHAR(255) NOT NULL,
  "Descripcion" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdCategoriaProducto")
);

CREATE TABLE "TipoProducto" (
  "IdTipoProducto" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdCategoriaProducto" UUID NOT NULL,
  "Nombre" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdTipoProducto"),
  FOREIGN KEY("IdCategoriaProducto") REFERENCES "CategoriaProducto" ("IdCategoriaProducto")
);

CREATE TABLE "Producto" (
  "IdProducto" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdTipoProducto" UUID NOT NULL,
  "Nombre" VARCHAR(255) NOT NULL,
  "Descripcion" VARCHAR(255) NOT NULL,
  "Precio" DECIMAL NOT NULL,
  "Stock" DECIMAL NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdProducto"),
  FOREIGN KEY("IdTipoProducto") REFERENCES "TipoProducto" ("IdTipoProducto")
);

CREATE TABLE "MetodoPago" (
  "IdMetodoPago" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "Nombre" VARCHAR(255) NOT NULL,
  "Descripcion" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdMetodoPago")
);

CREATE TABLE "EstadoFactura" (
  "IdEstadoFactura" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "Nombre" VARCHAR(255) NOT NULL,
  "Descripcion" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdEstadoFactura")
);

CREATE TABLE "Factura" (
  "IdFactura" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdEstadoFactura" UUID NOT NULL,
  "IdMetodoPago" UUID NOT NULL,
  "IdEmpleado" UUID NOT NULL,
  "IdCliente" UUID NOT NULL,
  "NumeroFactura" VARCHAR(255) NOT NULL,
  "Fecha" TIMESTAMP NOT NULL,
  "Total" DECIMAL NOT NULL,
  "Notas" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdFactura"),
  FOREIGN KEY("IdEstadoFactura") REFERENCES "EstadoFactura"("IdEstadoFactura"),
  FOREIGN KEY("IdMetodoPago") REFERENCES "MetodoPago" ("IdMetodoPago"),
  FOREIGN KEY("IdEmpleado") REFERENCES "Empleado" ("IdEmpleado"),
  FOREIGN KEY("IdCliente") REFERENCES "Cliente" ("IdCliente")
);

CREATE TABLE "DetalleFactura" (
  "IdDetalleFactura" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdFactura" UUID NOT NULL,
  "IdProducto" UUID NOT NULL,
  "Cantidad" DECIMAL NOT NULL,
  "Subtotal" DECIMAL NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdDetalleFactura"),
  FOREIGN KEY("IdFactura") REFERENCES "Factura" ("IdFactura"),
  FOREIGN KEY("IdProducto") REFERENCES "Producto" ("IdProducto")
);