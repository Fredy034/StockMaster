CREATE TABLE "Pais" (
	"IdPais" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdPais")
);


CREATE TABLE "Departamento" (
	"IdDepartamento" UUID NOT NULL UNIQUE,
	"IdPais" UUID NOT NULL,
	"Nombre" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdDepartamento")
);


CREATE TABLE "Ciudad" (
	"IdCiudad" UUID NOT NULL UNIQUE,
	"IdDepartamento" UUID NOT NULL,
	"Nombre" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdCiudad")
);


CREATE TABLE "TipoDocumento" (
	"IdTipoDocumento" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdTipoDocumento")
);


CREATE TABLE "Genero" (
	"IdGenero" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdGenero")
);


CREATE TABLE "Persona" (
	"IdPersona" UUID NOT NULL UNIQUE,
	"IdGenero" UUID NOT NULL,
	"IdTipoDocumento" UUID NOT NULL,
	"IdCiudad" UUID NOT NULL,
	"NombreCompleto" VARCHAR NOT NULL,
	"NumeroDocumento" VARCHAR NOT NULL,
	"Correo" VARCHAR NOT NULL,
	"Telefono" VARCHAR NOT NULL,
	"FechaNacimiento" DATE NOT NULL,
	"Usuario" VARCHAR NOT NULL,
	"Contrasena" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdPersona")
);


CREATE TABLE "Cliente" (
	"IdCliente" UUID NOT NULL UNIQUE,
	"IdPersona" UUID NOT NULL,
	"FechaRegistro" DATE NOT NULL,
	"Direccion" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdCliente")
);


CREATE TABLE "Tienda" (
	"IdTienda" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR NOT NULL,
	"Nit" VARCHAR NOT NULL,
	"Telefono" VARCHAR NOT NULL,
	"Correo" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdTienda")
);


CREATE TABLE "Sucursal" (
	"IdSucursal" UUID NOT NULL UNIQUE,
	"IdCiudad" UUID NOT NULL,
	"IdTienda" UUID NOT NULL,
	"Nombre" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdSucursal")
);


CREATE TABLE "Empleado" (
	"IdEmpleado" UUID NOT NULL UNIQUE,
	"IdPersona" UUID NOT NULL,
	"IdSucursal" UUID NOT NULL,
	"FechaContratacion" DATE NOT NULL,
	"Salario" NUMERIC NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdEmpleado")
);


CREATE TABLE "CategoriaProducto" (
	"IdCategoriaProducto" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR NOT NULL,
	"Descripcion" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdCategoriaProducto")
);


CREATE TABLE "TipoProducto" (
	"IdTipoProducto" UUID NOT NULL UNIQUE,
	"IdCategoriaProducto" UUID NOT NULL,
	"Nombre" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdTipoProducto")
);


CREATE TABLE "Producto" (
	"IdProducto" UUID NOT NULL UNIQUE,
	"IdTipoProducto" UUID NOT NULL,
	"Nombre" VARCHAR NOT NULL,
	"Descripcion" VARCHAR NOT NULL,
	"Precio" DECIMAL NOT NULL,
	"Stock" DECIMAL NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdProducto")
);


CREATE TABLE "MetodoPago" (
	"IdMetodoPago" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR NOT NULL,
	"Descripcion" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdMetodoPago")
);


CREATE TABLE "EstadoFactura" (
	"IdEstadoFactura" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR NOT NULL,
	"Descripcion" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdEstadoFactura")
);


CREATE TABLE "Factura" (
	"IdFactura" UUID NOT NULL UNIQUE,
	"IdEstadoFactura" UUID NOT NULL,
	"IdMetodoPago" UUID NOT NULL,
	"IdEmpleado" UUID NOT NULL,
	"IdCliente" UUID NOT NULL,
	"NumeroFactura" VARCHAR NOT NULL,
	"Fecha" TIMESTAMP NOT NULL,
	"Total" DECIMAL NOT NULL,
	"Notas" VARCHAR NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdFactura")
);


CREATE TABLE "DetalleFactura" (
	"IdDetalleFactura" UUID NOT NULL UNIQUE,
	"IdFactura" UUID NOT NULL,
	"IdProducto" UUID NOT NULL,
	"Cantidad" DECIMAL NOT NULL,
	"Subtotal" DECIMAL NOT NULL,
	"Activo" BIT NOT NULL,
	"Actualiza" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdDetalleFactura")
);


ALTER TABLE "Pais"
ADD FOREIGN KEY("IdPais") REFERENCES "Departamento"("IdPais")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Departamento"
ADD FOREIGN KEY("IdDepartamento") REFERENCES "Ciudad"("IdDepartamento")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "MetodoPago"
ADD FOREIGN KEY("IdMetodoPago") REFERENCES "Factura"("IdMetodoPago")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "EstadoFactura"
ADD FOREIGN KEY("IdEstadoFactura") REFERENCES "Factura"("IdEstadoFactura")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Factura"
ADD FOREIGN KEY("IdFactura") REFERENCES "DetalleFactura"("IdFactura")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Producto"
ADD FOREIGN KEY("IdProducto") REFERENCES "DetalleFactura"("IdProducto")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "TipoProducto"
ADD FOREIGN KEY("IdTipoProducto") REFERENCES "Producto"("IdTipoProducto")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "CategoriaProducto"
ADD FOREIGN KEY("IdCategoriaProducto") REFERENCES "TipoProducto"("IdCategoriaProducto")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "TipoDocumento"
ADD FOREIGN KEY("IdTipoDocumento") REFERENCES "Persona"("IdTipoDocumento")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Genero"
ADD FOREIGN KEY("IdGenero") REFERENCES "Persona"("IdGenero")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Ciudad"
ADD FOREIGN KEY("IdCiudad") REFERENCES "Persona"("IdCiudad")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Ciudad"
ADD FOREIGN KEY("IdCiudad") REFERENCES "Sucursal"("IdCiudad")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Tienda"
ADD FOREIGN KEY("IdTienda") REFERENCES "Sucursal"("IdTienda")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Sucursal"
ADD FOREIGN KEY("IdSucursal") REFERENCES "Empleado"("IdSucursal")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Persona"
ADD FOREIGN KEY("IdPersona") REFERENCES "Empleado"("IdPersona")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Persona"
ADD FOREIGN KEY("IdPersona") REFERENCES "Cliente"("IdPersona")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Cliente"
ADD FOREIGN KEY("IdCliente") REFERENCES "Factura"("IdCliente")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Empleado"
ADD FOREIGN KEY("IdEmpleado") REFERENCES "Factura"("IdEmpleado")
ON UPDATE NO ACTION ON DELETE NO ACTION;