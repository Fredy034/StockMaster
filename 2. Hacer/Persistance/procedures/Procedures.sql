-- CategoriaProducto
CREATE OR REPLACE FUNCTION "ActualizarCategoriaProducto"(P_IdCategoriaProducto UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "CategoriaProducto" 
    SET "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCategoriaProducto" = P_IdCategoriaProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarCategoriaProducto"(P_IdCategoriaProducto UUID)
RETURNS VOID 
AS $$
BEGIN
    UPDATE "CategoriaProducto" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCategoriaProducto" = P_IdCategoriaProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "IngresarCategoriaProducto"(P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "CategoriaProducto" ("Nombre", "Descripcion") 
    VALUES (P_Nombre, P_Descripcion);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarCategoriaProductoFisico"(P_IdCategoriaProducto UUID)
RETURNS VOID
AS $$
BEGIN
	DELETE FROM "CategoriaProducto"
	WHERE "IdCategoriaProducto" = P_IdCategoriaProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- Ciudad
CREATE OR REPLACE FUNCTION "ActualizarCiudad"(P_IdCiudad UUID, P_IdDepartamento UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Ciudad" 
    SET "IdDepartamento" = P_IdDepartamento, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = P_IdCiudad AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarCiudad"(P_IdCiudad UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Ciudad" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = P_IdCiudad AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "IngresarCiudad"(P_IdDepartamento UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Ciudad" ("IdDepartamento", "Nombre") 
    VALUES (P_IdDepartamento, P_Nombre);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarCiudadFisico"(P_IdCiudad UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Ciudad" 
    WHERE "IdCiudad" = P_IdCiudad AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- Cliente
CREATE OR REPLACE FUNCTION "IngresarCliente"(P_IdPersona UUID, P_FechaRegistro DATE, P_Direccion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Cliente" ("IdPersona", "FechaRegistro", "Direccion") 
    VALUES (P_IdPersona, P_FechaRegistro, P_Direccion);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ActualizarCliente"(P_IdCliente UUID, P_IdPersona UUID, P_FechaRegistro DATE, P_Direccion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Cliente" 
    SET "IdPersona" = P_IdPersona, "FechaRegistro" = P_FechaRegistro, "Direccion" = P_Direccion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCliente" = P_IdCliente AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarCliente"(P_IdCliente UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Cliente" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCliente" = P_IdCliente AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarClienteFisico"(P_IdCliente UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Cliente" 
    WHERE "IdCliente" = P_IdCliente AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- Departamento
CREATE OR REPLACE FUNCTION "ActualizarDepartamento"(P_IdDepartamento UUID, P_IdPais UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Departamento" 
    SET "IdPais" = P_IdPais, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = P_IdDepartamento AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "IngresarDepartamento"(P_IdPais UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Departamento" ("IdPais", "Nombre") 
    VALUES (P_IdPais, P_Nombre);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarDepartamento"(P_IdDepartamento UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Departamento" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = P_IdDepartamento AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarDepartamentoFisico"(P_IdDepartamento UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Departamento" 
    WHERE "IdDepartamento" = P_IdDepartamento AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- DetalleFactura
CREATE OR REPLACE FUNCTION "ActualizarDetalleFactura"(P_IdDetalleFactura UUID, P_IdFactura UUID, P_IdProducto UUID, P_Cantidad DECIMAL, P_Subtotal DECIMAL)
RETURNS VOID
AS $$
BEGIN
    UPDATE "DetalleFactura" 
    SET "IdFactura" = P_IdFactura, "IdProducto" = P_IdProducto, "Cantidad" = P_Cantidad, "Subtotal" = P_Subtotal, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDetalleFactura" = P_IdDetalleFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "IngresarDetalleFactura"(P_IdFactura UUID, P_IdProducto UUID, P_Cantidad DECIMAL, P_Subtotal DECIMAL)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "DetalleFactura" ("IdFactura", "IdProducto", "Cantidad", "Subtotal") 
    VALUES (P_IdFactura, P_IdProducto, P_Cantidad, P_Subtotal);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarDetalleFactura"(P_IdDetalleFactura UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "DetalleFactura" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDetalleFactura" = P_IdDetalleFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarDetalleFacturaFisico"(P_IdDetalleFactura UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "DetalleFactura" 
    WHERE "IdDetalleFactura" = P_IdDetalleFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- Empleado
CREATE OR REPLACE FUNCTION "IngresarEmpleado"(P_IdPersona UUID, P_IdSucursal UUID, P_FechaContratacion DATE, P_Salario NUMERIC)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Empleado" ("IdPersona", "IdSucursal", "FechaContratacion", "Salario") 
    VALUES (P_IdPersona, P_IdSucursal, P_FechaContratacion, P_Salario);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ActualizarEmpleado"(P_IdEmpleado UUID, P_IdPersona UUID, P_IdSucursal UUID, P_FechaContratacion DATE, P_Salario NUMERIC)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Empleado" 
    SET "IdPersona" = P_IdPersona, "IdSucursal" = P_IdSucursal, "FechaContratacion" = P_FechaContratacion, "Salario" = P_Salario, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpleado" = P_IdEmpleado AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarEmpleadoFisico"(P_IdEmpleado UUID)
RETURNS VOID 
AS $$
BEGIN
    DELETE FROM "Empleado" 
    WHERE "IdEmpleado" = P_IdEmpleado AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarEmpleado"(P_IdEmpleado UUID)
RETURNS VOID 
AS $$
BEGIN
    UPDATE "Empleado" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpleado" = P_IdEmpleado AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- EstadoFactura
CREATE OR REPLACE FUNCTION "ActualizarEstadoFactura"(P_IdEstadoFactura UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "EstadoFactura" 
    SET "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoFactura" = P_IdEstadoFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "IngresarEstadoFactura"(P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "EstadoFactura" ("Nombre", "Descripcion") 
    VALUES (P_Nombre, P_Descripcion);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarEstadoFactura"(P_IdEstadoFactura UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "EstadoFactura" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoFactura" = P_IdEstadoFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarEstadoFacturaFisico"(P_IdEstadoFactura UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "EstadoFactura" 
    WHERE "IdEstadoFactura" = P_IdEstadoFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- Factura
CREATE OR REPLACE FUNCTION "ActualizarFactura"(P_IdFactura UUID, P_IdEstadoFactura UUID, P_IdMetodoPago UUID, P_IdEmpleado UUID, P_IdCliente UUID, P_NumeroFactura VARCHAR, P_Fecha TIMESTAMP, P_Total DECIMAL, P_Notas VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Factura" 
    SET "IdEstadoFactura" = P_IdEstadoFactura, "IdMetodoPago" = P_IdMetodoPago, "IdEmpleado" = P_IdEmpleado, "IdCliente" = P_IdCliente, "NumeroFactura" = P_NumeroFactura, "Fecha" = P_Fecha, "Total" = P_Total, "Notas" = P_Notas, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdFactura" = P_IdFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "IngresarFactura"(P_IdEstadoFactura UUID, P_IdMetodoPago UUID, P_IdEmpleado UUID, P_IdCliente UUID, P_NumeroFactura VARCHAR, P_Fecha TIMESTAMP, P_Total DECIMAL, P_Notas VARCHAR)
RETURNS VOID 
AS $$
BEGIN
    INSERT INTO "Factura" ("IdEstadoFactura", "IdMetodoPago", "IdEmpleado", "IdCliente", "NumeroFactura", "Fecha", "Total", "Notas") 
    VALUES (P_IdEstadoFactura, P_IdMetodoPago, P_IdEmpleado, P_IdCliente, P_NumeroFactura, P_Fecha, P_Total, P_Notas);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarFacturaFisico"(P_IdFactura UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Factura" 
    WHERE "IdFactura" = P_IdFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarFactura"(P_IdFactura UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Factura" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdFactura" = P_IdFactura AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- Genero
CREATE OR REPLACE FUNCTION "ActualizarGenero"(P_IdGenero UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Genero" 
    SET "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdGenero" = P_IdGenero AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "IngresarGenero"(P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Genero" ("Nombre") 
    VALUES (P_Nombre);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarGeneroFisico"(P_IdGenero UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Genero" 
    WHERE "IdGenero" = P_IdGenero AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarGenero"(P_IdGenero UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Genero" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdGenero" = P_IdGenero AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- MetodoPago
CREATE OR REPLACE FUNCTION "IngresarMetodoPago"(P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "MetodoPago" ("Nombre", "Descripcion") 
    VALUES (P_Nombre, P_Descripcion);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ActualizarMetodoPago"(P_IdMetodoPago UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "MetodoPago" 
    SET "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdMetodoPago" = P_IdMetodoPago AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarMetodoPagoFisico"(P_IdMetodoPago UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "MetodoPago" 
    WHERE "IdMetodoPago" = P_IdMetodoPago AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarMetodoPago"(P_IdMetodoPago UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "MetodoPago" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdMetodoPago" = P_IdMetodoPago AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- Pais
CREATE OR REPLACE FUNCTION "IngresarPais"(P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Pais" ("Nombre") 
	VALUES (P_Nombre);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ActualizarPais"(P_IdPais UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
	UPDATE "Pais" 
    SET "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
	WHERE "Pais"."IdPais" = P_IdPais AND "Pais"."Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarPais"(P_IdPais UUID)
RETURNS VOID
AS $$
BEGIN
	UPDATE "Pais" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
	WHERE "Pais"."IdPais" = P_IdPais AND "Pais"."Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarPaisFisico"(P_IdPais UUID)
RETURNS VOID
AS $$
BEGIN
	DELETE FROM "Pais"
	WHERE "IdPais" = P_IdPais AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- Persona
CREATE OR REPLACE FUNCTION "IngresarPersona"(P_IdGenero UUID, P_IdTipoDocumento UUID, P_IdCiudad UUID, P_NombreCompleto VARCHAR, P_NumeroDocumento VARCHAR, P_Correo VARCHAR, P_Telefono VARCHAR, P_FechaNacimiento DATE, P_Usuario VARCHAR, P_Contrasena VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Persona" ("IdGenero", "IdTipoDocumento", "IdCiudad", "NombreCompleto", "NumeroDocumento", "Correo", "Telefono", "FechaNacimiento", "Usuario", "Contrasena") 
    VALUES (P_IdGenero, P_IdTipoDocumento, P_IdCiudad, P_NombreCompleto, P_NumeroDocumento, P_Correo, P_Telefono, P_FechaNacimiento, P_Usuario, P_Contrasena);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ActualizarPersona"(P_IdPersona UUID, P_IdGenero UUID, P_IdTipoDocumento UUID, P_IdCiudad UUID, P_NombreCompleto VARCHAR, P_NumeroDocumento VARCHAR, P_Correo VARCHAR, P_Telefono VARCHAR, P_FechaNacimiento DATE, P_Usuario VARCHAR, P_Contrasena VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Persona" 
    SET "IdGenero" = P_IdGenero, "IdTipoDocumento" = P_IdTipoDocumento, "IdCiudad" = P_IdCiudad, "NombreCompleto" = P_NombreCompleto, "NumeroDocumento" = P_NumeroDocumento, "Correo" = P_Correo, "Telefono" = P_Telefono, "FechaNacimiento" = P_FechaNacimiento, "Usuario" = P_Usuario, "Contrasena" = P_Contrasena, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdPersona" = P_IdPersona AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarPersonaFisico"(P_IdPersona UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Persona" 
    WHERE "IdPersona" = P_IdPersona AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarPersona"(P_IdPersona UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Persona" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdPersona" = P_IdPersona AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- Producto
CREATE OR REPLACE FUNCTION "IngresarProducto"(P_IdTipoProducto UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR, P_Precio DECIMAL, P_Stock DECIMAL)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Producto" ("IdTipoProducto", "Nombre", "Descripcion", "Precio", "Stock") 
    VALUES (P_IdTipoProducto, P_Nombre, P_Descripcion, P_Precio, P_Stock);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ActualizarProducto"(P_IdProducto UUID, P_IdTipoProducto UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR, P_Precio DECIMAL, P_Stock DECIMAL)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Producto" 
    SET "IdTipoProducto" = P_IdTipoProducto, "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Precio" = P_Precio, "Stock" = P_Stock, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdProducto" = P_IdProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarProductoFisico"(P_IdProducto UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Producto" 
    WHERE "IdProducto" = P_IdProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarProducto"(P_IdProducto UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Producto" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdProducto" = P_IdProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- Sucursal
CREATE OR REPLACE FUNCTION "IngresarSucursal"(P_IdCiudad UUID, P_IdTienda UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Sucursal" ("IdCiudad", "IdTienda", "Nombre") 
    VALUES (P_IdCiudad, P_IdTienda, P_Nombre);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ActualizarSucursal"(P_IdSucursal UUID, P_IdCiudad UUID, P_IdTienda UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Sucursal" 
    SET "IdCiudad" = P_IdCiudad, "IdTienda" = P_IdTienda, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdSucursal" = P_IdSucursal AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarSucursalFisica"(P_IdSucursal UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Sucursal" 
    WHERE "IdSucursal" = P_IdSucursal AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarSucursal"(P_IdSucursal UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Sucursal" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdSucursal" = P_IdSucursal AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- Tienda
CREATE OR REPLACE FUNCTION "IngresarTienda"(P_Nombre VARCHAR, P_Nit VARCHAR, P_Telefono VARCHAR, P_Correo VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Tienda" ("Nombre", "Nit", "Telefono", "Correo") 
    VALUES (P_Nombre, P_Nit, P_Telefono, P_Correo);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ActualizarTienda"(P_IdTienda UUID, P_Nombre VARCHAR, P_Nit VARCHAR, P_Telefono VARCHAR, P_Correo VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Tienda" 
    SET "Nombre" = P_Nombre, "Nit" = P_Nit, "Telefono" = P_Telefono, "Correo" = P_Correo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTienda" = P_IdTienda AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarTiendaFisico"(P_IdTienda UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Tienda" 
    WHERE "IdTienda" = P_IdTienda AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarTienda"(P_IdTienda UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Tienda" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTienda" = P_IdTienda AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- TipoDocumento
CREATE OR REPLACE FUNCTION "IngresarTipoDocumento"(P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "TipoDocumento" ("Nombre") 
    VALUES (P_Nombre);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ActualizarTipoDocumento"(P_IdTipoDocumento UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "TipoDocumento" 
    SET "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoDocumento" = P_IdTipoDocumento AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarTipoDocumentoFisico"(P_IdTipoDocumento UUID)
RETURNS VOID
AS $$
BEGIN 
    DELETE FROM "TipoDocumento" 
    WHERE "IdTipoDocumento" = P_IdTipoDocumento AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarTipoDocumento"(P_IdTipoDocumento UUID)
RETURNS VOID
AS $$
BEGIN 
    UPDATE "TipoDocumento" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoDocumento" = P_IdTipoDocumento AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- TipoProducto
CREATE OR REPLACE FUNCTION "IngresarTipoProducto"(P_IdCategoriaProducto UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "TipoProducto" ("IdCategoriaProducto", "Nombre") 
    VALUES (P_IdCategoriaProducto, P_Nombre);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "ActualizarTipoProducto"(P_IdTipoProducto UUID, P_IdCategoriaProducto UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "TipoProducto" 
    SET "IdCategoriaProducto" = P_IdCategoriaProducto, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoProducto" = P_IdTipoProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarTipoProductoFisico"(P_IdTipoProducto UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "TipoProducto" 
    WHERE "IdTipoProducto" = P_IdTipoProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "EliminarTipoProducto"(P_IdTipoProducto UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "TipoProducto" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoProducto" = P_IdTipoProducto AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;