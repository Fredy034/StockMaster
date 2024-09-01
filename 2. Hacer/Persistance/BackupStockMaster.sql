--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: ActualizarCategoriaProducto(uuid, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarCategoriaProducto"(p_idcategoriaproducto uuid, p_nombre character varying, p_descripcion character varying) RETURNS TABLE("IdCategoriaProducto" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "CategoriaProducto" 
    SET "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCategoriaProducto" = P_IdCategoriaProducto AND "Activo" = '1'
    RETURNING "IdCategoriaProducto", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarCategoriaProducto"(p_idcategoriaproducto uuid, p_nombre character varying, p_descripcion character varying) OWNER TO postgres;

--
-- Name: ActualizarCiudad(uuid, uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarCiudad"(p_idciudad uuid, p_iddepartamento uuid, p_nombre character varying) RETURNS TABLE("IdCiudad" uuid, "IdDepartamento" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Ciudad" 
    SET "IdDepartamento" = P_IdDepartamento, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = P_IdCiudad AND "Activo" = '1'
    RETURNING "IdCiudad", "IdDepartamento", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarCiudad"(p_idciudad uuid, p_iddepartamento uuid, p_nombre character varying) OWNER TO postgres;

--
-- Name: ActualizarCliente(uuid, uuid, date, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarCliente"(p_idcliente uuid, p_idpersona uuid, p_fecharegistro date, p_direccion character varying) RETURNS TABLE("IdCliente" uuid, "IdPersona" uuid, "FechaRegistro" date, "Direccion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Cliente" 
    SET "IdPersona" = P_IdPersona, "FechaRegistro" = P_FechaRegistro, "Direccion" = P_Direccion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCliente" = P_IdCliente AND "Activo" = '1'
    RETURNING "IdCliente", "IdPersona", "FechaRegistro", "Direccion", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarCliente"(p_idcliente uuid, p_idpersona uuid, p_fecharegistro date, p_direccion character varying) OWNER TO postgres;

--
-- Name: ActualizarDepartamento(uuid, uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarDepartamento"(p_iddepartamento uuid, p_idpais uuid, p_nombre character varying) RETURNS TABLE("IdDepartamento" uuid, "IdPais" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Departamento" 
    SET "IdPais" = P_IdPais, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = P_IdDepartamento AND "Activo" = '1'
    RETURNING "IdDepartamento", "IdPais", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarDepartamento"(p_iddepartamento uuid, p_idpais uuid, p_nombre character varying) OWNER TO postgres;

--
-- Name: ActualizarDetalleFactura(uuid, uuid, uuid, numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarDetalleFactura"(p_iddetallefactura uuid, p_idfactura uuid, p_idproducto uuid, p_cantidad numeric, p_subtotal numeric) RETURNS TABLE("IdDetalleFactura" uuid, "IdFactura" uuid, "IdProducto" uuid, "Cantidad" numeric, "Subtotal" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "DetalleFactura" 
    SET "IdFactura" = P_IdFactura, "IdProducto" = P_IdProducto, "Cantidad" = P_Cantidad, "Subtotal" = P_Subtotal, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDetalleFactura" = P_IdDetalleFactura AND "Activo" = '1'
    RETURNING "IdDetalleFactura", "IdFactura", "IdProducto", "Cantidad", "Subtotal", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarDetalleFactura"(p_iddetallefactura uuid, p_idfactura uuid, p_idproducto uuid, p_cantidad numeric, p_subtotal numeric) OWNER TO postgres;

--
-- Name: ActualizarEmpleado(uuid, uuid, uuid, date, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarEmpleado"(p_idempleado uuid, p_idpersona uuid, p_idsucursal uuid, p_fechacontratacion date, p_salario numeric) RETURNS TABLE("IdEmpleado" uuid, "IdPersona" uuid, "IdSucursal" uuid, "FechaContratacion" date, "Salario" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Empleado" 
    SET "IdPersona" = P_IdPersona, "IdSucursal" = P_IdSucursal, "FechaContratacion" = P_FechaContratacion, "Salario" = P_Salario, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpleado" = P_IdEmpleado AND "Activo" = '1'
    RETURNING "IdEmpleado", "IdPersona", "IdSucursal", "FechaContratacion", "Salario", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarEmpleado"(p_idempleado uuid, p_idpersona uuid, p_idsucursal uuid, p_fechacontratacion date, p_salario numeric) OWNER TO postgres;

--
-- Name: ActualizarEstadoFactura(uuid, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarEstadoFactura"(p_idestadofactura uuid, p_nombre character varying, p_descripcion character varying) RETURNS TABLE("IdEstadoFactura" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "EstadoFactura" 
    SET "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoFactura" = P_IdEstadoFactura AND "Activo" = '1'
    RETURNING "IdEstadoFactura", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarEstadoFactura"(p_idestadofactura uuid, p_nombre character varying, p_descripcion character varying) OWNER TO postgres;

--
-- Name: ActualizarFactura(uuid, uuid, uuid, uuid, uuid, character varying, timestamp without time zone, numeric, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarFactura"(p_idfactura uuid, p_idestadofactura uuid, p_idmetodopago uuid, p_idempleado uuid, p_idcliente uuid, p_numerofactura character varying, p_fecha timestamp without time zone, p_total numeric, p_notas character varying) RETURNS TABLE("IdFactura" uuid, "IdEstadoFactura" uuid, "IdMetodoPago" uuid, "IdEmpleado" uuid, "IdCliente" uuid, "NumeroFactura" character varying, "Fecha" timestamp without time zone, "Total" numeric, "Notas" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Factura" 
    SET "IdEstadoFactura" = P_IdEstadoFactura, "IdMetodoPago" = P_IdMetodoPago, "IdEmpleado" = P_IdEmpleado, "IdCliente" = P_IdCliente, "NumeroFactura" = P_NumeroFactura, "Fecha" = P_Fecha, "Total" = P_Total, "Notas" = P_Notas, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdFactura" = P_IdFactura AND "Activo" = '1'
    RETURNING "IdFactura", "IdEstadoFactura", "IdMetodoPago", "IdEmpleado", "IdCliente", "NumeroFactura", "Fecha", "Total", "Notas", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarFactura"(p_idfactura uuid, p_idestadofactura uuid, p_idmetodopago uuid, p_idempleado uuid, p_idcliente uuid, p_numerofactura character varying, p_fecha timestamp without time zone, p_total numeric, p_notas character varying) OWNER TO postgres;

--
-- Name: ActualizarGenero(uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarGenero"(p_idgenero uuid, p_nombre character varying) RETURNS TABLE("IdGenero" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Genero" 
    SET "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdGenero" = P_IdGenero AND "Activo" = '1'
    RETURNING "IdGenero", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarGenero"(p_idgenero uuid, p_nombre character varying) OWNER TO postgres;

--
-- Name: ActualizarMetodoPago(uuid, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarMetodoPago"(p_idmetodopago uuid, p_nombre character varying, p_descripcion character varying) RETURNS TABLE("IdMetodoPago" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "MetodoPago" 
    SET "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdMetodoPago" = P_IdMetodoPago AND "Activo" = '1'
    RETURNING "IdMetodoPago", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarMetodoPago"(p_idmetodopago uuid, p_nombre character varying, p_descripcion character varying) OWNER TO postgres;

--
-- Name: ActualizarPais(uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarPais"(p_idpais uuid, p_nombre character varying) RETURNS TABLE("IdPais" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
	UPDATE "Pais" 
    SET "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
	WHERE "Pais"."IdPais" = P_IdPais AND "Pais"."Activo" = '1'
	RETURNING "Pais"."IdPais", "Pais"."Nombre", "Pais"."Activo", "Pais"."Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarPais"(p_idpais uuid, p_nombre character varying) OWNER TO postgres;

--
-- Name: ActualizarPersona(uuid, uuid, uuid, uuid, character varying, character varying, character varying, character varying, date, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarPersona"(p_idpersona uuid, p_idgenero uuid, p_idtipodocumento uuid, p_idciudad uuid, p_nombrecompleto character varying, p_numerodocumento character varying, p_correo character varying, p_telefono character varying, p_fechanacimiento date, p_usuario character varying, p_contrasena character varying) RETURNS TABLE("IdPersona" uuid, "IdGenero" uuid, "IdTipoDocumento" uuid, "IdCiudad" uuid, "NombreCompleto" character varying, "NumeroDocumento" character varying, "Correo" character varying, "Telefono" character varying, "FechaNacimiento" date, "Usuario" character varying, "Contrasena" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Persona" 
    SET "IdGenero" = P_IdGenero, "IdTipoDocumento" = P_IdTipoDocumento, "IdCiudad" = P_IdCiudad, "NombreCompleto" = P_NombreCompleto, "NumeroDocumento" = P_NumeroDocumento, "Correo" = P_Correo, "Telefono" = P_Telefono, "FechaNacimiento" = P_FechaNacimiento, "Usuario" = P_Usuario, "Contrasena" = P_Contrasena, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdPersona" = P_IdPersona AND "Activo" = '1'
    RETURNING "IdPersona", "IdGenero", "IdTipoDocumento", "IdCiudad", "NombreCompleto", "NumeroDocumento", "Correo", "Telefono", "FechaNacimiento", "Usuario", "Contrasena", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarPersona"(p_idpersona uuid, p_idgenero uuid, p_idtipodocumento uuid, p_idciudad uuid, p_nombrecompleto character varying, p_numerodocumento character varying, p_correo character varying, p_telefono character varying, p_fechanacimiento date, p_usuario character varying, p_contrasena character varying) OWNER TO postgres;

--
-- Name: ActualizarProducto(uuid, uuid, character varying, character varying, numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarProducto"(p_idproducto uuid, p_idtipoproducto uuid, p_nombre character varying, p_descripcion character varying, p_precio numeric, p_stock numeric) RETURNS TABLE("IdProducto" uuid, "IdTipoProducto" uuid, "Nombre" character varying, "Descripcion" character varying, "Precio" numeric, "Stock" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Producto" 
    SET "IdTipoProducto" = P_IdTipoProducto, "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Precio" = P_Precio, "Stock" = P_Stock, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdProducto" = P_IdProducto AND "Activo" = '1'
    RETURNING "IdProducto", "IdTipoProducto", "Nombre", "Descripcion", "Precio", "Stock", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarProducto"(p_idproducto uuid, p_idtipoproducto uuid, p_nombre character varying, p_descripcion character varying, p_precio numeric, p_stock numeric) OWNER TO postgres;

--
-- Name: ActualizarSucursal(uuid, uuid, uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarSucursal"(p_idsucursal uuid, p_idciudad uuid, p_idtienda uuid, p_nombre character varying) RETURNS TABLE("IdSucursal" uuid, "IdCiudad" uuid, "IdTienda" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Sucursal" 
    SET "IdCiudad" = P_IdCiudad, "IdTienda" = P_IdTienda, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdSucursal" = P_IdSucursal AND "Activo" = '1'
    RETURNING "IdSucursal", "IdCiudad", "IdTienda", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarSucursal"(p_idsucursal uuid, p_idciudad uuid, p_idtienda uuid, p_nombre character varying) OWNER TO postgres;

--
-- Name: ActualizarTienda(uuid, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarTienda"(p_idtienda uuid, p_nombre character varying, p_nit character varying, p_telefono character varying, p_correo character varying) RETURNS TABLE("IdTienda" uuid, "Nombre" character varying, "Nit" character varying, "Telefono" character varying, "Correo" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Tienda" 
    SET "Nombre" = P_Nombre, "Nit" = P_Nit, "Telefono" = P_Telefono, "Correo" = P_Correo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTienda" = P_IdTienda AND "Activo" = '1'
    RETURNING "IdTienda", "Nombre", "Nit", "Telefono", "Correo", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarTienda"(p_idtienda uuid, p_nombre character varying, p_nit character varying, p_telefono character varying, p_correo character varying) OWNER TO postgres;

--
-- Name: ActualizarTipoDocumento(uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarTipoDocumento"(p_idtipodocumento uuid, p_nombre character varying) RETURNS TABLE("IdTipoDocumento" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "TipoDocumento" 
    SET "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoDocumento" = P_IdTipoDocumento AND "Activo" = '1'
    RETURNING "IdTipoDocumento", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarTipoDocumento"(p_idtipodocumento uuid, p_nombre character varying) OWNER TO postgres;

--
-- Name: ActualizarTipoProducto(uuid, uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActualizarTipoProducto"(p_idtipoproducto uuid, p_idcategoriaproducto uuid, p_nombre character varying) RETURNS TABLE("IdTipoProducto" uuid, "IdCategoriaProducto" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "TipoProducto" 
    SET "IdCategoriaProducto" = P_IdCategoriaProducto, "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoProducto" = P_IdTipoProducto AND "Activo" = '1'
    RETURNING "IdTipoProducto", "IdCategoriaProducto", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."ActualizarTipoProducto"(p_idtipoproducto uuid, p_idcategoriaproducto uuid, p_nombre character varying) OWNER TO postgres;

--
-- Name: ConsultarCategoriaProducto(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarCategoriaProducto"() RETURNS TABLE("IdCategoriaProducto" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT cp."IdCategoriaProducto", cp."Nombre", cp."Descripcion", cp."Activo", cp."Actualiza"
    FROM "CategoriaProducto" cp
    WHERE cp."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarCategoriaProducto"() OWNER TO postgres;

--
-- Name: ConsultarCategoriaProductoPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarCategoriaProductoPorId"(p_idcategoriaproducto uuid) RETURNS TABLE("IdCategoriaProducto" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT cp."IdCategoriaProducto", cp."Nombre", cp."Descripcion", cp."Activo", cp."Actualiza"
    FROM "CategoriaProducto" cp
    WHERE cp."IdCategoriaProducto" = P_IdCategoriaProducto AND cp."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarCategoriaProductoPorId"(p_idcategoriaproducto uuid) OWNER TO postgres;

--
-- Name: ConsultarCiudad(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarCiudad"() RETURNS TABLE("IdCiudad" uuid, "IdDepartamento" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT c."IdCiudad", c."IdDepartamento", c."Nombre", c."Activo", c."Actualiza"
    FROM "Ciudad" c
    WHERE c."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarCiudad"() OWNER TO postgres;

--
-- Name: ConsultarCiudadPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarCiudadPorId"(p_idciudad uuid) RETURNS TABLE("IdCiudad" uuid, "IdDepartamento" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT c."IdCiudad", c."IdDepartamento", c."Nombre", c."Activo", c."Actualiza"
    FROM "Ciudad" c
    WHERE c."IdCiudad" = P_IdCiudad AND c."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarCiudadPorId"(p_idciudad uuid) OWNER TO postgres;

--
-- Name: ConsultarCliente(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarCliente"() RETURNS TABLE("IdCliente" uuid, "IdPersona" uuid, "FechaRegistro" date, "Direccion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT cl."IdCliente", cl."IdPersona", cl."FechaRegistro", cl."Direccion", cl."Activo", cl."Actualiza"
    FROM "Cliente" cl
    WHERE cl."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarCliente"() OWNER TO postgres;

--
-- Name: ConsultarClientePorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarClientePorId"(p_idcliente uuid) RETURNS TABLE("IdCliente" uuid, "IdPersona" uuid, "FechaRegistro" date, "Direccion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT cl."IdCliente", cl."IdPersona", cl."FechaRegistro", cl."Direccion", cl."Activo", cl."Actualiza"
    FROM "Cliente" cl
    WHERE cl."IdCliente" = P_IdCliente AND cl."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarClientePorId"(p_idcliente uuid) OWNER TO postgres;

--
-- Name: ConsultarDepartamento(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarDepartamento"() RETURNS TABLE("IdDepartamento" uuid, "IdPais" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT d."IdDepartamento", d."IdPais", d."Nombre", d."Activo", d."Actualiza"
    FROM "Departamento" d
    WHERE d."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarDepartamento"() OWNER TO postgres;

--
-- Name: ConsultarDepartamentoPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarDepartamentoPorId"(p_iddepartamento uuid) RETURNS TABLE("IdDepartamento" uuid, "IdPais" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT d."IdDepartamento", d."IdPais", d."Nombre", d."Activo", d."Actualiza"
    FROM "Departamento" d
    WHERE d."IdDepartamento" = P_IdDepartamento AND d."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarDepartamentoPorId"(p_iddepartamento uuid) OWNER TO postgres;

--
-- Name: ConsultarDetalleFactura(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarDetalleFactura"() RETURNS TABLE("IdDetalleFactura" uuid, "IdFactura" uuid, "IdProducto" uuid, "Cantidad" numeric, "Subtotal" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT df."IdDetalleFactura", df."IdFactura", df."IdProducto", df."Cantidad", df."Subtotal", df."Activo", df."Actualiza"
    FROM "DetalleFactura" df
    WHERE df."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarDetalleFactura"() OWNER TO postgres;

--
-- Name: ConsultarDetalleFacturaPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarDetalleFacturaPorId"(p_iddetallefactura uuid) RETURNS TABLE("IdDetalleFactura" uuid, "IdFactura" uuid, "IdProducto" uuid, "Cantidad" numeric, "Subtotal" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT df."IdDetalleFactura", df."IdFactura", df."IdProducto", df."Cantidad", df."Subtotal", df."Activo", df."Actualiza"
    FROM "DetalleFactura" df
    WHERE df."IdDetalleFactura" = P_IdDetalleFactura AND df."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarDetalleFacturaPorId"(p_iddetallefactura uuid) OWNER TO postgres;

--
-- Name: ConsultarEmpleado(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarEmpleado"() RETURNS TABLE("IdEmpleado" uuid, "IdPersona" uuid, "IdSucursal" uuid, "FechaContratacion" date, "Salario" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT e."IdEmpleado", e."IdPersona", e."IdSucursal", e."FechaContratacion", e."Salario", e."Activo", e."Actualiza"
    FROM "Empleado" e
    WHERE e."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarEmpleado"() OWNER TO postgres;

--
-- Name: ConsultarEmpleadoPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarEmpleadoPorId"(p_idempleado uuid) RETURNS TABLE("IdEmpleado" uuid, "IdPersona" uuid, "IdSucursal" uuid, "FechaContratacion" date, "Salario" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT e."IdEmpleado", e."IdPersona", e."IdSucursal", e."FechaContratacion", e."Salario", e."Activo", e."Actualiza"
    FROM "Empleado" e
    WHERE e."IdEmpleado" = P_IdEmpleado AND e."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarEmpleadoPorId"(p_idempleado uuid) OWNER TO postgres;

--
-- Name: ConsultarEstadoFactura(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarEstadoFactura"() RETURNS TABLE("IdEstadoFactura" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT e."IdEstadoFactura", e."Nombre", e."Descripcion", e."Activo", e."Actualiza"
    FROM "EstadoFactura" e
    WHERE e."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarEstadoFactura"() OWNER TO postgres;

--
-- Name: ConsultarEstadoFacturaPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarEstadoFacturaPorId"(p_idestadofactura uuid) RETURNS TABLE("IdEstadoFactura" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT e."IdEstadoFactura", e."Nombre", e."Descripcion", e."Activo", e."Actualiza"
    FROM "EstadoFactura" e
    WHERE e."IdEstadoFactura" = P_IdEstadoFactura AND e."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarEstadoFacturaPorId"(p_idestadofactura uuid) OWNER TO postgres;

--
-- Name: ConsultarFactura(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarFactura"() RETURNS TABLE("IdFactura" uuid, "IdEstadoFactura" uuid, "IdMetodoPago" uuid, "IdEmpleado" uuid, "IdCliente" uuid, "NumeroFactura" character varying, "Fecha" timestamp without time zone, "Total" numeric, "Notas" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT f."IdFactura", f."IdEstadoFactura", f."IdMetodoPago", f."IdEmpleado", f."IdCliente", f."NumeroFactura", f."Fecha", f."Total", f."Notas", f."Activo", f."Actualiza"
    FROM "Factura" f
    WHERE f."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarFactura"() OWNER TO postgres;

--
-- Name: ConsultarFacturaPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarFacturaPorId"(p_idfactura uuid) RETURNS TABLE("IdFactura" uuid, "IdEstadoFactura" uuid, "IdMetodoPago" uuid, "IdEmpleado" uuid, "IdCliente" uuid, "NumeroFactura" character varying, "Fecha" timestamp without time zone, "Total" numeric, "Notas" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT f."IdFactura", f."IdEstadoFactura", f."IdMetodoPago", f."IdEmpleado", f."IdCliente", f."NumeroFactura", f."Fecha", f."Total", f."Notas", f."Activo", f."Actualiza"
    FROM "Factura" f
    WHERE f."IdFactura" = P_IdFactura AND f."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarFacturaPorId"(p_idfactura uuid) OWNER TO postgres;

--
-- Name: ConsultarGenero(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarGenero"() RETURNS TABLE("IdGenero" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT g."IdGenero", g."Nombre", g."Activo", g."Actualiza"
    FROM "Genero" g
    WHERE g."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarGenero"() OWNER TO postgres;

--
-- Name: ConsultarGeneroPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarGeneroPorId"(p_idgenero uuid) RETURNS TABLE("IdGenero" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT g."IdGenero", g."Nombre", g."Activo", g."Actualiza"
    FROM "Genero" g
    WHERE g."IdGenero" = P_IdGenero AND g."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarGeneroPorId"(p_idgenero uuid) OWNER TO postgres;

--
-- Name: ConsultarMetodoPago(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarMetodoPago"() RETURNS TABLE("IdMetodoPago" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT m."IdMetodoPago", m."Nombre", m."Descripcion", m."Activo", m."Actualiza"
    FROM "MetodoPago" m
    WHERE m."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarMetodoPago"() OWNER TO postgres;

--
-- Name: ConsultarMetodoPagoPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarMetodoPagoPorId"(p_idmetodopago uuid) RETURNS TABLE("IdMetodoPago" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT m."IdMetodoPago", m."Nombre", m."Descripcion", m."Activo", m."Actualiza"
    FROM "MetodoPago" m
    WHERE m."IdMetodoPago" = P_IdMetodoPago AND m."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarMetodoPagoPorId"(p_idmetodopago uuid) OWNER TO postgres;

--
-- Name: ConsultarPais(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarPais"() RETURNS TABLE("IdPais" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdPais", p."Nombre", p."Activo", p."Actualiza"
    FROM "Pais" p
    WHERE p."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarPais"() OWNER TO postgres;

--
-- Name: ConsultarPaisPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarPaisPorId"(p_idpais uuid) RETURNS TABLE("IdPais" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdPais", p."Nombre", p."Activo", p."Actualiza"
    FROM "Pais" p
    WHERE p."IdPais" = P_IdPais AND p."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarPaisPorId"(p_idpais uuid) OWNER TO postgres;

--
-- Name: ConsultarPersona(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarPersona"() RETURNS TABLE("IdPersona" uuid, "IdGenero" uuid, "IdTipoDocumento" uuid, "IdCiudad" uuid, "NombreCompleto" character varying, "NumeroDocumento" character varying, "Correo" character varying, "Telefono" character varying, "FechaNacimiento" date, "Usuario" character varying, "Contrasena" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdPersona", p."IdGenero", p."IdTipoDocumento", p."IdCiudad", p."NombreCompleto", p."NumeroDocumento", p."Correo", p."Telefono", p."FechaNacimiento", p."Usuario", p."Contrasena", p."Activo", p."Actualiza"
    FROM "Persona" p
    WHERE p."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarPersona"() OWNER TO postgres;

--
-- Name: ConsultarPersonaPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarPersonaPorId"(p_idpersona uuid) RETURNS TABLE("IdPersona" uuid, "IdGenero" uuid, "IdTipoDocumento" uuid, "IdCiudad" uuid, "NombreCompleto" character varying, "NumeroDocumento" character varying, "Correo" character varying, "Telefono" character varying, "FechaNacimiento" date, "Usuario" character varying, "Contrasena" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdPersona", p."IdGenero", p."IdTipoDocumento", p."IdCiudad", p."NombreCompleto", p."NumeroDocumento", p."Correo", p."Telefono", p."FechaNacimiento", p."Usuario", p."Contrasena", p."Activo", p."Actualiza"
    FROM "Persona" p
    WHERE p."IdPersona" = P_IdPersona AND p."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarPersonaPorId"(p_idpersona uuid) OWNER TO postgres;

--
-- Name: ConsultarProducto(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarProducto"() RETURNS TABLE("IdProducto" uuid, "IdTipoProducto" uuid, "Nombre" character varying, "Descripcion" character varying, "Precio" numeric, "Stock" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdProducto", p."IdTipoProducto", p."Nombre", p."Descripcion", p."Precio", p."Stock", p."Activo", p."Actualiza"
    FROM "Producto" p
    WHERE p."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarProducto"() OWNER TO postgres;

--
-- Name: ConsultarProductoPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarProductoPorId"(p_idproducto uuid) RETURNS TABLE("IdProducto" uuid, "IdTipoProducto" uuid, "Nombre" character varying, "Descripcion" character varying, "Precio" numeric, "Stock" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdProducto", p."IdTipoProducto", p."Nombre", p."Descripcion", p."Precio", p."Stock", p."Activo", p."Actualiza"
    FROM "Producto" p
    WHERE p."IdProducto" = P_IdProducto AND p."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarProductoPorId"(p_idproducto uuid) OWNER TO postgres;

--
-- Name: ConsultarSucursal(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarSucursal"() RETURNS TABLE("IdSucursal" uuid, "IdCiudad" uuid, "IdTienda" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT s."IdSucursal", s."IdCiudad", s."IdTienda", s."Nombre", s."Activo", s."Actualiza"
    FROM "Sucursal" s
    WHERE s."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarSucursal"() OWNER TO postgres;

--
-- Name: ConsultarSucursalPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarSucursalPorId"(p_idsucursal uuid) RETURNS TABLE("IdSucursal" uuid, "IdCiudad" uuid, "IdTienda" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT s."IdSucursal", s."IdCiudad", s."IdTienda", s."Nombre", s."Activo", s."Actualiza"
    FROM "Sucursal" s
    WHERE s."IdSucursal" = P_IdSucursal AND s."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarSucursalPorId"(p_idsucursal uuid) OWNER TO postgres;

--
-- Name: ConsultarTienda(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarTienda"() RETURNS TABLE("IdTienda" uuid, "Nombre" character varying, "Nit" character varying, "Telefono" character varying, "Correo" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT t."IdTienda", t."Nombre", t."Nit", t."Telefono", t."Correo", t."Activo", t."Actualiza"
    FROM "Tienda" t
    WHERE t."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarTienda"() OWNER TO postgres;

--
-- Name: ConsultarTiendaPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarTiendaPorId"(p_idtienda uuid) RETURNS TABLE("IdTienda" uuid, "Nombre" character varying, "Nit" character varying, "Telefono" character varying, "Correo" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT t."IdTienda", t."Nombre", t."Nit", t."Telefono", t."Correo", t."Activo", t."Actualiza"
    FROM "Tienda" t
    WHERE t."IdTienda" = P_IdTienda AND t."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarTiendaPorId"(p_idtienda uuid) OWNER TO postgres;

--
-- Name: ConsultarTipoDocumento(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarTipoDocumento"() RETURNS TABLE("IdTipoDocumento" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT td."IdTipoDocumento", td."Nombre", td."Activo", td."Actualiza"
    FROM "TipoDocumento" td
    WHERE td."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarTipoDocumento"() OWNER TO postgres;

--
-- Name: ConsultarTipoDocumentoPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarTipoDocumentoPorId"(p_idtipodocumento uuid) RETURNS TABLE("IdTipoDocumento" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT td."IdTipoDocumento", td."Nombre", td."Activo", td."Actualiza"
    FROM "TipoDocumento" td
    WHERE td."IdTipoDocumento" = P_IdTipoDocumento AND td."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarTipoDocumentoPorId"(p_idtipodocumento uuid) OWNER TO postgres;

--
-- Name: ConsultarTipoProducto(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarTipoProducto"() RETURNS TABLE("IdTipoProducto" uuid, "IdCategoriaProducto" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT tp."IdTipoProducto", tp."IdCategoriaProducto", tp."Nombre", tp."Activo", tp."Actualiza"
    FROM "TipoProducto" tp
    WHERE tp."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarTipoProducto"() OWNER TO postgres;

--
-- Name: ConsultarTipoProductoPorId(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ConsultarTipoProductoPorId"(p_idtipoproducto uuid) RETURNS TABLE("IdTipoProducto" uuid, "IdCategoriaProducto" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    SELECT tp."IdTipoProducto", tp."IdCategoriaProducto", tp."Nombre", tp."Activo", tp."Actualiza"
    FROM "TipoProducto" tp
    WHERE tp."IdTipoProducto" = P_IdTipoProducto AND tp."Activo" = '1';
END;
$$;


ALTER FUNCTION public."ConsultarTipoProductoPorId"(p_idtipoproducto uuid) OWNER TO postgres;

--
-- Name: EliminarCategoriaProducto(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarCategoriaProducto"(p_idcategoriaproducto uuid) RETURNS TABLE("IdCategoriaProducto" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "CategoriaProducto" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCategoriaProducto" = P_IdCategoriaProducto AND "Activo" = '1'
    RETURNING "IdCategoriaProducto", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarCategoriaProducto"(p_idcategoriaproducto uuid) OWNER TO postgres;

--
-- Name: EliminarCiudad(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarCiudad"(p_idciudad uuid) RETURNS TABLE("IdCiudad" uuid, "IdDepartamento" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Ciudad" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = P_IdCiudad AND "Activo" = '1'
    RETURNING "IdCiudad", "IdDepartamento", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarCiudad"(p_idciudad uuid) OWNER TO postgres;

--
-- Name: EliminarCliente(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarCliente"(p_idcliente uuid) RETURNS TABLE("IdCliente" uuid, "IdPersona" uuid, "FechaRegistro" date, "Direccion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Cliente" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCliente" = P_IdCliente AND "Activo" = '1'
    RETURNING "IdCliente", "IdPersona", "FechaRegistro", "Direccion", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarCliente"(p_idcliente uuid) OWNER TO postgres;

--
-- Name: EliminarDepartamento(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarDepartamento"(p_iddepartamento uuid) RETURNS TABLE("IdDepartamento" uuid, "IdPais" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Departamento" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = P_IdDepartamento AND "Activo" = '1'
    RETURNING "IdDepartamento", "IdPais", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarDepartamento"(p_iddepartamento uuid) OWNER TO postgres;

--
-- Name: EliminarDetalleFactura(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarDetalleFactura"(p_iddetallefactura uuid) RETURNS TABLE("IdDetalleFactura" uuid, "IdFactura" uuid, "IdProducto" uuid, "Cantidad" numeric, "Subtotal" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "DetalleFactura" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDetalleFactura" = P_IdDetalleFactura AND "Activo" = '1'
    RETURNING "IdDetalleFactura", "IdFactura", "IdProducto", "Cantidad", "Subtotal", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarDetalleFactura"(p_iddetallefactura uuid) OWNER TO postgres;

--
-- Name: EliminarEmpleado(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarEmpleado"(p_idempleado uuid) RETURNS TABLE("IdEmpleado" uuid, "IdPersona" uuid, "IdSucursal" uuid, "FechaContratacion" date, "Salario" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Empleado" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEmpleado" = P_IdEmpleado AND "Activo" = '1'
    RETURNING "IdEmpleado", "IdPersona", "IdSucursal", "FechaContratacion", "Salario", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarEmpleado"(p_idempleado uuid) OWNER TO postgres;

--
-- Name: EliminarEstadoFactura(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarEstadoFactura"(p_idestadofactura uuid) RETURNS TABLE("IdEstadoFactura" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "EstadoFactura" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdEstadoFactura" = P_IdEstadoFactura AND "Activo" = '1'
    RETURNING "IdEstadoFactura", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarEstadoFactura"(p_idestadofactura uuid) OWNER TO postgres;

--
-- Name: EliminarFactura(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarFactura"(p_idfactura uuid) RETURNS TABLE("IdFactura" uuid, "IdEstadoFactura" uuid, "IdMetodoPago" uuid, "IdEmpleado" uuid, "IdCliente" uuid, "NumeroFactura" character varying, "Fecha" timestamp without time zone, "Total" numeric, "Notas" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Factura" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdFactura" = P_IdFactura AND "Activo" = '1'
    RETURNING "IdFactura", "IdEstadoFactura", "IdMetodoPago", "IdEmpleado", "IdCliente", "NumeroFactura", "Fecha", "Total", "Notas", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarFactura"(p_idfactura uuid) OWNER TO postgres;

--
-- Name: EliminarGenero(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarGenero"(p_idgenero uuid) RETURNS TABLE("IdGenero" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Genero" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdGenero" = P_IdGenero AND "Activo" = '1'
    RETURNING "IdGenero", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarGenero"(p_idgenero uuid) OWNER TO postgres;

--
-- Name: EliminarMetodoPago(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarMetodoPago"(p_idmetodopago uuid) RETURNS TABLE("IdMetodoPago" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "MetodoPago" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdMetodoPago" = P_IdMetodoPago AND "Activo" = '1'
    RETURNING "IdMetodoPago", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarMetodoPago"(p_idmetodopago uuid) OWNER TO postgres;

--
-- Name: EliminarPais(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarPais"(p_idpais uuid) RETURNS TABLE("IdPais" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
	UPDATE "Pais" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
	WHERE "Pais"."IdPais" = P_IdPais AND "Pais"."Activo" = '1'
	RETURNING "Pais"."IdPais", "Pais"."Nombre", "Pais"."Activo", "Pais"."Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarPais"(p_idpais uuid) OWNER TO postgres;

--
-- Name: EliminarPersona(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarPersona"(p_idpersona uuid) RETURNS TABLE("IdPersona" uuid, "IdGenero" uuid, "IdTipoDocumento" uuid, "IdCiudad" uuid, "NombreCompleto" character varying, "NumeroDocumento" character varying, "Correo" character varying, "Telefono" character varying, "FechaNacimiento" date, "Usuario" character varying, "Contrasena" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Persona" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdPersona" = P_IdPersona AND "Activo" = '1'
    RETURNING "IdPersona", "IdGenero", "IdTipoDocumento", "IdCiudad", "NombreCompleto", "NumeroDocumento", "Correo", "Telefono", "FechaNacimiento", "Usuario", "Contrasena", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarPersona"(p_idpersona uuid) OWNER TO postgres;

--
-- Name: EliminarProducto(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarProducto"(p_idproducto uuid) RETURNS TABLE("IdProducto" uuid, "IdTipoProducto" uuid, "Nombre" character varying, "Descripcion" character varying, "Precio" numeric, "Stock" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Producto" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdProducto" = P_IdProducto AND "Activo" = '1'
    RETURNING "IdProducto", "IdTipoProducto", "Nombre", "Descripcion", "Precio", "Stock", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarProducto"(p_idproducto uuid) OWNER TO postgres;

--
-- Name: EliminarSucursal(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarSucursal"(p_idsucursal uuid) RETURNS TABLE("IdSucursal" uuid, "IdCiudad" uuid, "IdTienda" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Sucursal" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdSucursal" = P_IdSucursal AND "Activo" = '1'
    RETURNING "IdSucursal", "IdCiudad", "IdTienda", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarSucursal"(p_idsucursal uuid) OWNER TO postgres;

--
-- Name: EliminarTienda(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarTienda"(p_idtienda uuid) RETURNS TABLE("IdTienda" uuid, "Nombre" character varying, "Nit" character varying, "Telefono" character varying, "Correo" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Tienda" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTienda" = P_IdTienda AND "Activo" = '1'
    RETURNING "IdTienda", "Nombre", "Nit", "Telefono", "Correo", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarTienda"(p_idtienda uuid) OWNER TO postgres;

--
-- Name: EliminarTipoDocumento(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarTipoDocumento"(p_idtipodocumento uuid) RETURNS TABLE("IdTipoDocumento" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "TipoDocumento" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoDocumento" = P_IdTipoDocumento AND "Activo" = '1'
    RETURNING "IdTipoDocumento", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarTipoDocumento"(p_idtipodocumento uuid) OWNER TO postgres;

--
-- Name: EliminarTipoProducto(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EliminarTipoProducto"(p_idtipoproducto uuid) RETURNS TABLE("IdTipoProducto" uuid, "IdCategoriaProducto" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    UPDATE "TipoProducto" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdTipoProducto" = P_IdTipoProducto AND "Activo" = '1'
    RETURNING "IdTipoProducto", "IdCategoriaProducto", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."EliminarTipoProducto"(p_idtipoproducto uuid) OWNER TO postgres;

--
-- Name: IngresarCategoriaProducto(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarCategoriaProducto"(p_nombre character varying, p_descripcion character varying) RETURNS TABLE("IdCategoriaProducto" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "CategoriaProducto" ("Nombre", "Descripcion") 
    VALUES (P_Nombre, P_Descripcion)
    RETURNING "IdCategoriaProducto", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarCategoriaProducto"(p_nombre character varying, p_descripcion character varying) OWNER TO postgres;

--
-- Name: IngresarCiudad(uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarCiudad"(p_iddepartamento uuid, p_nombre character varying) RETURNS TABLE("IdCiudad" uuid, "IdDepartamento" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Ciudad" ("IdDepartamento", "Nombre") 
    VALUES (P_IdDepartamento, P_Nombre)
    RETURNING "IdCiudad", "IdDepartamento", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarCiudad"(p_iddepartamento uuid, p_nombre character varying) OWNER TO postgres;

--
-- Name: IngresarCliente(uuid, date, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarCliente"(p_idpersona uuid, p_fecharegistro date, p_direccion character varying) RETURNS TABLE("IdCliente" uuid, "IdPersona" uuid, "FechaRegistro" date, "Direccion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Cliente" ("IdPersona", "FechaRegistro", "Direccion") 
    VALUES (P_IdPersona, P_FechaRegistro, P_Direccion)
    RETURNING "IdCliente", "IdPersona", "FechaRegistro", "Direccion", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarCliente"(p_idpersona uuid, p_fecharegistro date, p_direccion character varying) OWNER TO postgres;

--
-- Name: IngresarDepartamento(uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarDepartamento"(p_idpais uuid, p_nombre character varying) RETURNS TABLE("IdDepartamento" uuid, "IdPais" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Departamento" ("IdPais", "Nombre") 
    VALUES (P_IdPais, P_Nombre)
    RETURNING "IdDepartamento", "IdPais", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarDepartamento"(p_idpais uuid, p_nombre character varying) OWNER TO postgres;

--
-- Name: IngresarDetalleFactura(uuid, uuid, numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarDetalleFactura"(p_idfactura uuid, p_idproducto uuid, p_cantidad numeric, p_subtotal numeric) RETURNS TABLE("IdDetalleFactura" uuid, "IdFactura" uuid, "IdProducto" uuid, "Cantidad" numeric, "Subtotal" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "DetalleFactura" ("IdFactura", "IdProducto", "Cantidad", "Subtotal") 
    VALUES (P_IdFactura, P_IdProducto, P_Cantidad, P_Subtotal)
    RETURNING "IdDetalleFactura", "IdFactura", "IdProducto", "Cantidad", "Subtotal", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarDetalleFactura"(p_idfactura uuid, p_idproducto uuid, p_cantidad numeric, p_subtotal numeric) OWNER TO postgres;

--
-- Name: IngresarEmpleado(uuid, uuid, date, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarEmpleado"(p_idpersona uuid, p_idsucursal uuid, p_fechacontratacion date, p_salario numeric) RETURNS TABLE("IdEmpleado" uuid, "IdPersona" uuid, "IdSucursal" uuid, "FechaContratacion" date, "Salario" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Empleado" ("IdPersona", "IdSucursal", "FechaContratacion", "Salario") 
    VALUES (P_IdPersona, P_IdSucursal, P_FechaContratacion, P_Salario)
    RETURNING "IdEmpleado", "IdPersona", "IdSucursal", "FechaContratacion", "Salario", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarEmpleado"(p_idpersona uuid, p_idsucursal uuid, p_fechacontratacion date, p_salario numeric) OWNER TO postgres;

--
-- Name: IngresarEstadoFactura(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarEstadoFactura"(p_nombre character varying, p_descripcion character varying) RETURNS TABLE("IdEstadoFactura" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "EstadoFactura" ("Nombre", "Descripcion") 
    VALUES (P_Nombre, P_Descripcion)
    RETURNING "IdEstadoFactura", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarEstadoFactura"(p_nombre character varying, p_descripcion character varying) OWNER TO postgres;

--
-- Name: IngresarFactura(uuid, uuid, uuid, uuid, character varying, timestamp without time zone, numeric, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarFactura"(p_idestadofactura uuid, p_idmetodopago uuid, p_idempleado uuid, p_idcliente uuid, p_numerofactura character varying, p_fecha timestamp without time zone, p_total numeric, p_notas character varying) RETURNS TABLE("IdFactura" uuid, "IdEstadoFactura" uuid, "IdMetodoPago" uuid, "IdEmpleado" uuid, "IdCliente" uuid, "NumeroFactura" character varying, "Fecha" timestamp without time zone, "Total" numeric, "Notas" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Factura" ("IdEstadoFactura", "IdMetodoPago", "IdEmpleado", "IdCliente", "NumeroFactura", "Fecha", "Total", "Notas") 
    VALUES (P_IdEstadoFactura, P_IdMetodoPago, P_IdEmpleado, P_IdCliente, P_NumeroFactura, P_Fecha, P_Total, P_Notas)
    RETURNING "IdFactura", "IdEstadoFactura", "IdMetodoPago", "IdEmpleado", "IdCliente", "NumeroFactura", "Fecha", "Total", "Notas", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarFactura"(p_idestadofactura uuid, p_idmetodopago uuid, p_idempleado uuid, p_idcliente uuid, p_numerofactura character varying, p_fecha timestamp without time zone, p_total numeric, p_notas character varying) OWNER TO postgres;

--
-- Name: IngresarGenero(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarGenero"(p_nombre character varying) RETURNS TABLE("IdGenero" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Genero" ("Nombre") 
    VALUES (P_Nombre)
    RETURNING "IdGenero", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarGenero"(p_nombre character varying) OWNER TO postgres;

--
-- Name: IngresarMetodoPago(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarMetodoPago"(p_nombre character varying, p_descripcion character varying) RETURNS TABLE("IdMetodoPago" uuid, "Nombre" character varying, "Descripcion" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "MetodoPago" ("Nombre", "Descripcion") 
    VALUES (P_Nombre, P_Descripcion)
    RETURNING "IdMetodoPago", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarMetodoPago"(p_nombre character varying, p_descripcion character varying) OWNER TO postgres;

--
-- Name: IngresarPais(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarPais"(p_nombre character varying) RETURNS TABLE("IdPais" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Pais" ("Nombre") 
	VALUES (P_Nombre)
	RETURNING "Pais"."IdPais", "Pais"."Nombre", "Pais"."Activo", "Pais"."Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarPais"(p_nombre character varying) OWNER TO postgres;

--
-- Name: IngresarPersona(uuid, uuid, uuid, character varying, character varying, character varying, character varying, date, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarPersona"(p_idgenero uuid, p_idtipodocumento uuid, p_idciudad uuid, p_nombrecompleto character varying, p_numerodocumento character varying, p_correo character varying, p_telefono character varying, p_fechanacimiento date, p_usuario character varying, p_contrasena character varying) RETURNS TABLE("IdPersona" uuid, "IdGenero" uuid, "IdTipoDocumento" uuid, "IdCiudad" uuid, "NombreCompleto" character varying, "NumeroDocumento" character varying, "Correo" character varying, "Telefono" character varying, "FechaNacimiento" date, "Usuario" character varying, "Contrasena" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Persona" ("IdGenero", "IdTipoDocumento", "IdCiudad", "NombreCompleto", "NumeroDocumento", "Correo", "Telefono", "FechaNacimiento", "Usuario", "Contrasena") 
    VALUES (P_IdGenero, P_IdTipoDocumento, P_IdCiudad, P_NombreCompleto, P_NumeroDocumento, P_Correo, P_Telefono, P_FechaNacimiento, P_Usuario, P_Contrasena)
    RETURNING "IdPersona", "IdGenero", "IdTipoDocumento", "IdCiudad", "NombreCompleto", "NumeroDocumento", "Correo", "Telefono", "FechaNacimiento", "Usuario", "Contrasena", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarPersona"(p_idgenero uuid, p_idtipodocumento uuid, p_idciudad uuid, p_nombrecompleto character varying, p_numerodocumento character varying, p_correo character varying, p_telefono character varying, p_fechanacimiento date, p_usuario character varying, p_contrasena character varying) OWNER TO postgres;

--
-- Name: IngresarProducto(uuid, character varying, character varying, numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarProducto"(p_idtipoproducto uuid, p_nombre character varying, p_descripcion character varying, p_precio numeric, p_stock numeric) RETURNS TABLE("IdProducto" uuid, "IdTipoProducto" uuid, "Nombre" character varying, "Descripcion" character varying, "Precio" numeric, "Stock" numeric, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Producto" ("IdTipoProducto", "Nombre", "Descripcion", "Precio", "Stock") 
    VALUES (P_IdTipoProducto, P_Nombre, P_Descripcion, P_Precio, P_Stock)
    RETURNING "IdProducto", "IdTipoProducto", "Nombre", "Descripcion", "Precio", "Stock", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarProducto"(p_idtipoproducto uuid, p_nombre character varying, p_descripcion character varying, p_precio numeric, p_stock numeric) OWNER TO postgres;

--
-- Name: IngresarSucursal(uuid, uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarSucursal"(p_idciudad uuid, p_idtienda uuid, p_nombre character varying) RETURNS TABLE("IdSucursal" uuid, "IdCiudad" uuid, "IdTienda" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Sucursal" ("IdCiudad", "IdTienda", "Nombre") 
    VALUES (P_IdCiudad, P_IdTienda, P_Nombre)
    RETURNING "IdSucursal", "IdCiudad", "IdTienda", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarSucursal"(p_idciudad uuid, p_idtienda uuid, p_nombre character varying) OWNER TO postgres;

--
-- Name: IngresarTienda(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarTienda"(p_nombre character varying, p_nit character varying, p_telefono character varying, p_correo character varying) RETURNS TABLE("IdTienda" uuid, "Nombre" character varying, "Nit" character varying, "Telefono" character varying, "Correo" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Tienda" ("Nombre", "Nit", "Telefono", "Correo") 
    VALUES (P_Nombre, P_Nit, P_Telefono, P_Correo)
    RETURNING "IdTienda", "Nombre", "Nit", "Telefono", "Correo", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarTienda"(p_nombre character varying, p_nit character varying, p_telefono character varying, p_correo character varying) OWNER TO postgres;

--
-- Name: IngresarTipoDocumento(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarTipoDocumento"(p_nombre character varying) RETURNS TABLE("IdTipoDocumento" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "TipoDocumento" ("Nombre") 
    VALUES (P_Nombre)
    RETURNING "IdTipoDocumento", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarTipoDocumento"(p_nombre character varying) OWNER TO postgres;

--
-- Name: IngresarTipoProducto(uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."IngresarTipoProducto"(p_idcategoriaproducto uuid, p_nombre character varying) RETURNS TABLE("IdTipoProducto" uuid, "IdCategoriaProducto" uuid, "Nombre" character varying, "Activo" bit, "Actualiza" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "TipoProducto" ("IdCategoriaProducto", "Nombre") 
    VALUES (P_IdCategoriaProducto, P_Nombre)
    RETURNING "IdTipoProducto", "IdCategoriaProducto", "Nombre", "Activo", "Actualiza";
END;
$$;


ALTER FUNCTION public."IngresarTipoProducto"(p_idcategoriaproducto uuid, p_nombre character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: CategoriaProducto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CategoriaProducto" (
    "IdCategoriaProducto" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "Nombre" character varying(255) NOT NULL,
    "Descripcion" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."CategoriaProducto" OWNER TO postgres;

--
-- Name: Ciudad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ciudad" (
    "IdCiudad" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdDepartamento" uuid NOT NULL,
    "Nombre" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Ciudad" OWNER TO postgres;

--
-- Name: Cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cliente" (
    "IdCliente" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdPersona" uuid NOT NULL,
    "FechaRegistro" date NOT NULL,
    "Direccion" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Cliente" OWNER TO postgres;

--
-- Name: Departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Departamento" (
    "IdDepartamento" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdPais" uuid NOT NULL,
    "Nombre" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Departamento" OWNER TO postgres;

--
-- Name: DetalleFactura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DetalleFactura" (
    "IdDetalleFactura" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdFactura" uuid NOT NULL,
    "IdProducto" uuid NOT NULL,
    "Cantidad" numeric NOT NULL,
    "Subtotal" numeric NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."DetalleFactura" OWNER TO postgres;

--
-- Name: Empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Empleado" (
    "IdEmpleado" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdPersona" uuid NOT NULL,
    "IdSucursal" uuid NOT NULL,
    "FechaContratacion" date NOT NULL,
    "Salario" numeric NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Empleado" OWNER TO postgres;

--
-- Name: EstadoFactura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EstadoFactura" (
    "IdEstadoFactura" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "Nombre" character varying(255) NOT NULL,
    "Descripcion" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."EstadoFactura" OWNER TO postgres;

--
-- Name: Factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Factura" (
    "IdFactura" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdEstadoFactura" uuid NOT NULL,
    "IdMetodoPago" uuid NOT NULL,
    "IdEmpleado" uuid NOT NULL,
    "IdCliente" uuid NOT NULL,
    "NumeroFactura" character varying(255) NOT NULL,
    "Fecha" timestamp without time zone NOT NULL,
    "Total" numeric NOT NULL,
    "Notas" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Factura" OWNER TO postgres;

--
-- Name: Genero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Genero" (
    "IdGenero" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "Nombre" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Genero" OWNER TO postgres;

--
-- Name: MetodoPago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MetodoPago" (
    "IdMetodoPago" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "Nombre" character varying(255) NOT NULL,
    "Descripcion" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."MetodoPago" OWNER TO postgres;

--
-- Name: Pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pais" (
    "IdPais" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "Nombre" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Pais" OWNER TO postgres;

--
-- Name: Persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Persona" (
    "IdPersona" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdGenero" uuid NOT NULL,
    "IdTipoDocumento" uuid NOT NULL,
    "IdCiudad" uuid NOT NULL,
    "NombreCompleto" character varying(255) NOT NULL,
    "NumeroDocumento" character varying(20) NOT NULL,
    "Correo" character varying(255) NOT NULL,
    "Telefono" character varying(20) NOT NULL,
    "FechaNacimiento" date NOT NULL,
    "Usuario" character varying(255) NOT NULL,
    "Contrasena" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Persona" OWNER TO postgres;

--
-- Name: Producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Producto" (
    "IdProducto" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdTipoProducto" uuid NOT NULL,
    "Nombre" character varying(255) NOT NULL,
    "Descripcion" character varying(255) NOT NULL,
    "Precio" numeric NOT NULL,
    "Stock" numeric NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Producto" OWNER TO postgres;

--
-- Name: Sucursal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sucursal" (
    "IdSucursal" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdCiudad" uuid NOT NULL,
    "IdTienda" uuid NOT NULL,
    "Nombre" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Sucursal" OWNER TO postgres;

--
-- Name: Tienda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tienda" (
    "IdTienda" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "Nombre" character varying(255) NOT NULL,
    "Nit" character varying(20) NOT NULL,
    "Telefono" character varying(20) NOT NULL,
    "Correo" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Tienda" OWNER TO postgres;

--
-- Name: TipoDocumento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TipoDocumento" (
    "IdTipoDocumento" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "Nombre" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."TipoDocumento" OWNER TO postgres;

--
-- Name: TipoProducto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TipoProducto" (
    "IdTipoProducto" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdCategoriaProducto" uuid NOT NULL,
    "Nombre" character varying(255) NOT NULL,
    "Activo" bit(1) DEFAULT '1'::"bit" NOT NULL,
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."TipoProducto" OWNER TO postgres;

--
-- Data for Name: CategoriaProducto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CategoriaProducto" ("IdCategoriaProducto", "Nombre", "Descripcion", "Activo", "Actualiza") FROM stdin;
62e89e62-c8c8-4dbb-b03b-c8713d4d6465	Abarrotes	Productos de abarrotes y despensa	1	2024-09-01 17:33:06.839725
5e11ba5b-1196-4e97-bd0d-14a68fa75045	Lácteos	Productos lácteos y derivados	1	2024-09-01 17:33:06.839725
6ef359f6-76ee-45e8-9098-f40c2c9f124f	Panadería	Productos de panadería y repostería	1	2024-09-01 17:33:06.839725
\.


--
-- Data for Name: Ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ciudad" ("IdCiudad", "IdDepartamento", "Nombre", "Activo", "Actualiza") FROM stdin;
f456d83e-0413-4446-b619-a12f9358202c	08387c74-e08c-4ee5-a0d9-d943561febda	Medellín	1	2024-09-01 17:35:18.966192
1e90a008-93b8-46fc-8404-04200ed45914	2761fe4b-616a-478f-88c6-c5f67d07d8c9	Bogotá	1	2024-09-01 17:35:18.966192
27d8f635-7e2e-453d-80b2-c1cb53c5da1b	3e84935d-324d-4c3b-bee5-6ca6df1a4f13	Cali	1	2024-09-01 17:35:18.966192
\.


--
-- Data for Name: Cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cliente" ("IdCliente", "IdPersona", "FechaRegistro", "Direccion", "Activo", "Actualiza") FROM stdin;
02678cc1-fbd2-4798-836c-54f7c74f3d1c	8ed10e30-6257-42c7-b9ae-bf430cdb5cdc	2024-01-01	Carrera 10 # 20-30	1	2024-09-01 17:49:35.166071
7342fce4-0161-400b-b23b-6db1d0d7ac51	52ddf0ca-f3e2-40e5-93dd-9ba3def823b6	2024-02-15	Avenida 15 # 25-40	1	2024-09-01 17:49:35.166071
7d74b6f6-dc5e-4976-8252-cccaed902721	ac0cd2d7-d33d-4176-86c6-74fdcd072ecc	2024-03-22	Calle 30 # 10-50	1	2024-09-01 17:49:35.166071
\.


--
-- Data for Name: Departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Departamento" ("IdDepartamento", "IdPais", "Nombre", "Activo", "Actualiza") FROM stdin;
08387c74-e08c-4ee5-a0d9-d943561febda	9ecae1dd-3414-429c-96c5-1a70d14f122d	Antioquia	1	2024-09-01 17:34:05.740304
2761fe4b-616a-478f-88c6-c5f67d07d8c9	9ecae1dd-3414-429c-96c5-1a70d14f122d	Cundinamarca	1	2024-09-01 17:34:05.740304
3e84935d-324d-4c3b-bee5-6ca6df1a4f13	9ecae1dd-3414-429c-96c5-1a70d14f122d	Valle del Cauca	1	2024-09-01 17:34:05.740304
\.


--
-- Data for Name: DetalleFactura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DetalleFactura" ("IdDetalleFactura", "IdFactura", "IdProducto", "Cantidad", "Subtotal", "Activo", "Actualiza") FROM stdin;
9ab93560-9582-40c2-b8a0-0338966dc3b0	14ace730-3ebc-4191-b33d-d20a454d5016	b3f1fbca-1496-4b98-a393-edd3a394a45a	2	50.00	1	2024-09-01 17:54:53.747216
0ac0153f-1107-4b16-ac67-b9bf5fb59c3a	2a14ff23-4c5c-41a3-90aa-c6adb9aefc71	46dcb447-912f-4b16-be88-4d1b84bf9920	1	10.00	1	2024-09-01 17:54:53.747216
b390cf23-87d0-423a-a02a-6783dec1e7ed	2a14ff23-4c5c-41a3-90aa-c6adb9aefc71	48b0cbcc-5417-417c-a590-57a2932385d8	3	9.00	1	2024-09-01 17:54:53.747216
\.


--
-- Data for Name: Empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Empleado" ("IdEmpleado", "IdPersona", "IdSucursal", "FechaContratacion", "Salario", "Activo", "Actualiza") FROM stdin;
e3b81dc9-36a9-4150-9f72-9f5c5cb5a600	ed0d3999-acda-47ec-988b-c57f6377f0c3	238d2e0b-780a-4845-a4a1-ec8d7675732c	2024-01-01	2500.00	1	2024-09-01 17:50:18.478431
745c40ce-1d41-49fa-9779-4150f7e83c2d	ab953656-a3f2-455c-92a8-0004fc533ee3	1906cd88-c1ed-42ff-8761-4efe188128c5	2024-02-01	2700.00	1	2024-09-01 17:50:18.478431
4500e57f-06a2-44ea-ab86-a4263daab06b	d41a2c5c-efc8-4bea-9225-dbd84461d445	3014be28-24fe-4b97-9f37-67b65495ea9c	2024-03-01	2600.00	1	2024-09-01 17:50:18.478431
\.


--
-- Data for Name: EstadoFactura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."EstadoFactura" ("IdEstadoFactura", "Nombre", "Descripcion", "Activo", "Actualiza") FROM stdin;
d0935693-1e3b-432b-b036-5af22fcc3908	Pendiente	Factura pendiente de pago	1	2024-09-01 17:33:06.839725
ca99dff2-3963-419e-8f30-0199f3fbbd80	Pagada	Factura ya pagada	1	2024-09-01 17:33:06.839725
d9529479-0ebd-45e1-bd3a-35f16e3f1926	Cancelada	Factura cancelada	1	2024-09-01 17:33:06.839725
\.


--
-- Data for Name: Factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Factura" ("IdFactura", "IdEstadoFactura", "IdMetodoPago", "IdEmpleado", "IdCliente", "NumeroFactura", "Fecha", "Total", "Notas", "Activo", "Actualiza") FROM stdin;
14ace730-3ebc-4191-b33d-d20a454d5016	d0935693-1e3b-432b-b036-5af22fcc3908	2a06ee3a-ab3f-4f80-858e-c07347218baf	e3b81dc9-36a9-4150-9f72-9f5c5cb5a600	02678cc1-fbd2-4798-836c-54f7c74f3d1c	F0001	2024-08-01 10:00:00	400.00	Factura para la compra de productos electrónicos	1	2024-09-01 17:53:05.957628
2a14ff23-4c5c-41a3-90aa-c6adb9aefc71	ca99dff2-3963-419e-8f30-0199f3fbbd80	00b512d1-5023-4295-a1d6-56220357415d	745c40ce-1d41-49fa-9779-4150f7e83c2d	7342fce4-0161-400b-b23b-6db1d0d7ac51	F0002	2024-08-02 11:00:00	1200.00	Compra de una laptop	1	2024-09-01 17:53:05.957628
2953974c-598a-4916-9a1d-bd18dc4f8dc7	d9529479-0ebd-45e1-bd3a-35f16e3f1926	bc133479-7b3c-4dab-be11-34267a927c69	4500e57f-06a2-44ea-ab86-a4263daab06b	7d74b6f6-dc5e-4976-8252-cccaed902721	F0003	2024-08-03 12:00:00	90.00	Compra de camisas	1	2024-09-01 17:53:05.957628
\.


--
-- Data for Name: Genero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Genero" ("IdGenero", "Nombre", "Activo", "Actualiza") FROM stdin;
383a343c-3445-4dbc-b507-2b8e95d26dcf	Masculino	1	2024-09-01 17:33:06.839725
cf02fec1-6933-43a4-8c6f-f43ae9372c53	Femenino	1	2024-09-01 17:33:06.839725
ad8d2e97-952a-4869-ad93-5a548fbef6e8	No Binario	1	2024-09-01 17:33:06.839725
\.


--
-- Data for Name: MetodoPago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MetodoPago" ("IdMetodoPago", "Nombre", "Descripcion", "Activo", "Actualiza") FROM stdin;
2a06ee3a-ab3f-4f80-858e-c07347218baf	Tarjeta de Crédito	Pago mediante tarjeta de crédito	1	2024-09-01 17:33:06.839725
00b512d1-5023-4295-a1d6-56220357415d	Efectivo	Pago en efectivo	1	2024-09-01 17:33:06.839725
bc133479-7b3c-4dab-be11-34267a927c69	Transferencia Bancaria	Transferencia desde cuenta bancaria	1	2024-09-01 17:33:06.839725
\.


--
-- Data for Name: Pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pais" ("IdPais", "Nombre", "Activo", "Actualiza") FROM stdin;
9ecae1dd-3414-429c-96c5-1a70d14f122d	Colombia	1	2024-09-01 14:28:46.848659
c3a5b128-fadc-455c-b57b-675276c2faba	Ecuador	0	2024-09-01 15:09:22.84709
4bc0fa83-2c53-4f11-a218-5d65c0fe21b6	Argentina	1	2024-09-01 17:33:06.839725
656454cd-538a-41e2-8db3-6f3333f978b3	Perú	1	2024-09-01 17:33:06.839725
0c8cb260-2ba8-4c75-9973-9e6378c50d6d	Chile	1	2024-09-01 17:33:06.839725
\.


--
-- Data for Name: Persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Persona" ("IdPersona", "IdGenero", "IdTipoDocumento", "IdCiudad", "NombreCompleto", "NumeroDocumento", "Correo", "Telefono", "FechaNacimiento", "Usuario", "Contrasena", "Activo", "Actualiza") FROM stdin;
ed0d3999-acda-47ec-988b-c57f6377f0c3	383a343c-3445-4dbc-b507-2b8e95d26dcf	bfb32396-16b2-47bb-a276-fe4d12134555	f456d83e-0413-4446-b619-a12f9358202c	Carlos Gómez	3334445556	carlos.gomez@example.com	3006547890	1988-04-22	carlosgomez	contrasena101	1	2024-09-01 17:48:01.897419
ab953656-a3f2-455c-92a8-0004fc533ee3	cf02fec1-6933-43a4-8c6f-f43ae9372c53	bfb32396-16b2-47bb-a276-fe4d12134555	1e90a008-93b8-46fc-8404-04200ed45914	Laura Fernández	6677889900	laura.fernandez@example.com	3012345678	1991-12-10	laurafernandez	contrasena202	1	2024-09-01 17:48:01.897419
d41a2c5c-efc8-4bea-9225-dbd84461d445	383a343c-3445-4dbc-b507-2b8e95d26dcf	bfb32396-16b2-47bb-a276-fe4d12134555	27d8f635-7e2e-453d-80b2-c1cb53c5da1b	Miguel Salazar	2233445566	miguel.salazar@example.com	3006789123	1984-06-15	miguelsalazar	contrasena303	1	2024-09-01 17:48:01.897419
8ed10e30-6257-42c7-b9ae-bf430cdb5cdc	ad8d2e97-952a-4869-ad93-5a548fbef6e8	bfb32396-16b2-47bb-a276-fe4d12134555	f456d83e-0413-4446-b619-a12f9358202c	Sam Torres	4455667788	sam.torres@example.com	3023456789	1995-03-25	samtorres	contrasena404	1	2024-09-01 17:48:01.897419
52ddf0ca-f3e2-40e5-93dd-9ba3def823b6	cf02fec1-6933-43a4-8c6f-f43ae9372c53	d3edb8ed-0f8a-4e49-8db4-77adbdedff12	1e90a008-93b8-46fc-8404-04200ed45914	Daniela Ríos	5544332211	daniela.rios@example.com	3034567890	1993-09-05	danielarios	contrasena505	1	2024-09-01 17:48:01.897419
ac0cd2d7-d33d-4176-86c6-74fdcd072ecc	383a343c-3445-4dbc-b507-2b8e95d26dcf	bfb32396-16b2-47bb-a276-fe4d12134555	27d8f635-7e2e-453d-80b2-c1cb53c5da1b	Oscar Núñez	6677889922	oscar.nunez@example.com	3045678901	1986-02-11	oscarnunez	contrasena606	1	2024-09-01 17:48:01.897419
\.


--
-- Data for Name: Producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Producto" ("IdProducto", "IdTipoProducto", "Nombre", "Descripcion", "Precio", "Stock", "Activo", "Actualiza") FROM stdin;
b3f1fbca-1496-4b98-a393-edd3a394a45a	bf1ce38e-160c-40d7-8a0b-47ba76694e29	Arroz Extra	Paquete de arroz extra largo	25.00	100	1	2024-09-01 17:40:03.662943
46dcb447-912f-4b16-be88-4d1b84bf9920	19385729-588b-4fd4-bbb5-f3992146645b	Aceite Vegetal	Botella de aceite vegetal de 1 litro	10.00	50	1	2024-09-01 17:40:03.662943
0ca3ad62-8db3-4b8a-9864-1f71f387351e	df83de77-3e51-466e-ba07-7d52d78bdf6e	Leche Entera	Litro de leche entera	2.50	200	1	2024-09-01 17:40:03.662943
48b0cbcc-5417-417c-a590-57a2932385d8	cc4406f4-7394-464f-9443-7b969415a9af	Pan de Molde Integral	Paquete de pan de molde integral	3.00	80	1	2024-09-01 17:40:03.662943
\.


--
-- Data for Name: Sucursal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sucursal" ("IdSucursal", "IdCiudad", "IdTienda", "Nombre", "Activo", "Actualiza") FROM stdin;
238d2e0b-780a-4845-a4a1-ec8d7675732c	f456d83e-0413-4446-b619-a12f9358202c	bb87d792-493b-428f-95e4-f67ef5cb1f1f	Sucursal Medellín Abarrotes	1	2024-09-01 17:37:16.549613
1906cd88-c1ed-42ff-8761-4efe188128c5	1e90a008-93b8-46fc-8404-04200ed45914	7eca2826-631e-4cf8-9499-7f2cd645c70c	Sucursal Bogotá Abarrotes	1	2024-09-01 17:37:16.549613
3014be28-24fe-4b97-9f37-67b65495ea9c	27d8f635-7e2e-453d-80b2-c1cb53c5da1b	c8330701-3006-435e-9d38-59ffade1cf38	Sucursal Cali Abarrotes	1	2024-09-01 17:37:16.549613
\.


--
-- Data for Name: Tienda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tienda" ("IdTienda", "Nombre", "Nit", "Telefono", "Correo", "Activo", "Actualiza") FROM stdin;
bb87d792-493b-428f-95e4-f67ef5cb1f1f	Tienda Central	900123456	3001234567	contacto@tiendacentral.com	1	2024-09-01 17:33:06.839725
7eca2826-631e-4cf8-9499-7f2cd645c70c	Tienda Norte	900654321	3007654321	contacto@tiendanorte.com	1	2024-09-01 17:33:06.839725
c8330701-3006-435e-9d38-59ffade1cf38	Tienda Sur	900987654	3009876543	contacto@tiendasur.com	1	2024-09-01 17:33:06.839725
\.


--
-- Data for Name: TipoDocumento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TipoDocumento" ("IdTipoDocumento", "Nombre", "Activo", "Actualiza") FROM stdin;
bfb32396-16b2-47bb-a276-fe4d12134555	Cédula de Ciudadanía	1	2024-09-01 17:33:06.839725
d3edb8ed-0f8a-4e49-8db4-77adbdedff12	Pasaporte	1	2024-09-01 17:33:06.839725
969565c8-3f8f-4112-bcc5-4b079a1a7910	Tarjeta de Identidad	1	2024-09-01 17:33:06.839725
\.


--
-- Data for Name: TipoProducto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TipoProducto" ("IdTipoProducto", "IdCategoriaProducto", "Nombre", "Activo", "Actualiza") FROM stdin;
bf1ce38e-160c-40d7-8a0b-47ba76694e29	62e89e62-c8c8-4dbb-b03b-c8713d4d6465	Arroz	1	2024-09-01 17:38:49.764677
19385729-588b-4fd4-bbb5-f3992146645b	62e89e62-c8c8-4dbb-b03b-c8713d4d6465	Aceite	1	2024-09-01 17:38:49.764677
df83de77-3e51-466e-ba07-7d52d78bdf6e	5e11ba5b-1196-4e97-bd0d-14a68fa75045	Leche	1	2024-09-01 17:38:49.764677
cc4406f4-7394-464f-9443-7b969415a9af	6ef359f6-76ee-45e8-9098-f40c2c9f124f	Pan de Molde	1	2024-09-01 17:38:49.764677
\.


--
-- Name: CategoriaProducto CategoriaProducto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CategoriaProducto"
    ADD CONSTRAINT "CategoriaProducto_pkey" PRIMARY KEY ("IdCategoriaProducto");


--
-- Name: Ciudad Ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_pkey" PRIMARY KEY ("IdCiudad");


--
-- Name: Cliente Cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "Cliente_pkey" PRIMARY KEY ("IdCliente");


--
-- Name: Departamento Departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Departamento"
    ADD CONSTRAINT "Departamento_pkey" PRIMARY KEY ("IdDepartamento");


--
-- Name: DetalleFactura DetalleFactura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleFactura"
    ADD CONSTRAINT "DetalleFactura_pkey" PRIMARY KEY ("IdDetalleFactura");


--
-- Name: Empleado Empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "Empleado_pkey" PRIMARY KEY ("IdEmpleado");


--
-- Name: EstadoFactura EstadoFactura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EstadoFactura"
    ADD CONSTRAINT "EstadoFactura_pkey" PRIMARY KEY ("IdEstadoFactura");


--
-- Name: Factura Factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Factura"
    ADD CONSTRAINT "Factura_pkey" PRIMARY KEY ("IdFactura");


--
-- Name: Genero Genero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Genero"
    ADD CONSTRAINT "Genero_pkey" PRIMARY KEY ("IdGenero");


--
-- Name: MetodoPago MetodoPago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MetodoPago"
    ADD CONSTRAINT "MetodoPago_pkey" PRIMARY KEY ("IdMetodoPago");


--
-- Name: Pais Pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pais"
    ADD CONSTRAINT "Pais_pkey" PRIMARY KEY ("IdPais");


--
-- Name: Persona Persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Persona"
    ADD CONSTRAINT "Persona_pkey" PRIMARY KEY ("IdPersona");


--
-- Name: Producto Producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Producto"
    ADD CONSTRAINT "Producto_pkey" PRIMARY KEY ("IdProducto");


--
-- Name: Sucursal Sucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sucursal"
    ADD CONSTRAINT "Sucursal_pkey" PRIMARY KEY ("IdSucursal");


--
-- Name: Tienda Tienda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tienda"
    ADD CONSTRAINT "Tienda_pkey" PRIMARY KEY ("IdTienda");


--
-- Name: TipoDocumento TipoDocumento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoDocumento"
    ADD CONSTRAINT "TipoDocumento_pkey" PRIMARY KEY ("IdTipoDocumento");


--
-- Name: TipoProducto TipoProducto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoProducto"
    ADD CONSTRAINT "TipoProducto_pkey" PRIMARY KEY ("IdTipoProducto");


--
-- Name: Ciudad Ciudad_IdDepartamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_IdDepartamento_fkey" FOREIGN KEY ("IdDepartamento") REFERENCES public."Departamento"("IdDepartamento");


--
-- Name: Cliente Cliente_IdPersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "Cliente_IdPersona_fkey" FOREIGN KEY ("IdPersona") REFERENCES public."Persona"("IdPersona");


--
-- Name: Departamento Departamento_IdPais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Departamento"
    ADD CONSTRAINT "Departamento_IdPais_fkey" FOREIGN KEY ("IdPais") REFERENCES public."Pais"("IdPais");


--
-- Name: DetalleFactura DetalleFactura_IdFactura_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleFactura"
    ADD CONSTRAINT "DetalleFactura_IdFactura_fkey" FOREIGN KEY ("IdFactura") REFERENCES public."Factura"("IdFactura");


--
-- Name: DetalleFactura DetalleFactura_IdProducto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleFactura"
    ADD CONSTRAINT "DetalleFactura_IdProducto_fkey" FOREIGN KEY ("IdProducto") REFERENCES public."Producto"("IdProducto");


--
-- Name: Empleado Empleado_IdPersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "Empleado_IdPersona_fkey" FOREIGN KEY ("IdPersona") REFERENCES public."Persona"("IdPersona");


--
-- Name: Empleado Empleado_IdSucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "Empleado_IdSucursal_fkey" FOREIGN KEY ("IdSucursal") REFERENCES public."Sucursal"("IdSucursal");


--
-- Name: Factura Factura_IdCliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Factura"
    ADD CONSTRAINT "Factura_IdCliente_fkey" FOREIGN KEY ("IdCliente") REFERENCES public."Cliente"("IdCliente");


--
-- Name: Factura Factura_IdEmpleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Factura"
    ADD CONSTRAINT "Factura_IdEmpleado_fkey" FOREIGN KEY ("IdEmpleado") REFERENCES public."Empleado"("IdEmpleado");


--
-- Name: Factura Factura_IdEstadoFactura_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Factura"
    ADD CONSTRAINT "Factura_IdEstadoFactura_fkey" FOREIGN KEY ("IdEstadoFactura") REFERENCES public."EstadoFactura"("IdEstadoFactura");


--
-- Name: Factura Factura_IdMetodoPago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Factura"
    ADD CONSTRAINT "Factura_IdMetodoPago_fkey" FOREIGN KEY ("IdMetodoPago") REFERENCES public."MetodoPago"("IdMetodoPago");


--
-- Name: Persona Persona_IdCiudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Persona"
    ADD CONSTRAINT "Persona_IdCiudad_fkey" FOREIGN KEY ("IdCiudad") REFERENCES public."Ciudad"("IdCiudad");


--
-- Name: Persona Persona_IdGenero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Persona"
    ADD CONSTRAINT "Persona_IdGenero_fkey" FOREIGN KEY ("IdGenero") REFERENCES public."Genero"("IdGenero");


--
-- Name: Persona Persona_IdTipoDocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Persona"
    ADD CONSTRAINT "Persona_IdTipoDocumento_fkey" FOREIGN KEY ("IdTipoDocumento") REFERENCES public."TipoDocumento"("IdTipoDocumento");


--
-- Name: Producto Producto_IdTipoProducto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Producto"
    ADD CONSTRAINT "Producto_IdTipoProducto_fkey" FOREIGN KEY ("IdTipoProducto") REFERENCES public."TipoProducto"("IdTipoProducto");


--
-- Name: Sucursal Sucursal_IdCiudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sucursal"
    ADD CONSTRAINT "Sucursal_IdCiudad_fkey" FOREIGN KEY ("IdCiudad") REFERENCES public."Ciudad"("IdCiudad");


--
-- Name: Sucursal Sucursal_IdTienda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sucursal"
    ADD CONSTRAINT "Sucursal_IdTienda_fkey" FOREIGN KEY ("IdTienda") REFERENCES public."Tienda"("IdTienda");


--
-- Name: TipoProducto TipoProducto_IdCategoriaProducto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoProducto"
    ADD CONSTRAINT "TipoProducto_IdCategoriaProducto_fkey" FOREIGN KEY ("IdCategoriaProducto") REFERENCES public."CategoriaProducto"("IdCategoriaProducto");


--
-- PostgreSQL database dump complete
--

