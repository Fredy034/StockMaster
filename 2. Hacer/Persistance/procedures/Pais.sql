-- SELECT * FROM "ConsultarPais"();

CREATE OR REPLACE FUNCTION "ConsultarPais"()
RETURNS TABLE ("IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdPais", p."Nombre", p."Activo", p."Actualiza"
    FROM "Pais" p
    WHERE p."Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- SELECT * FROM "ConsultarPaisPorId"('9ecae1dd-3414-429c-96c5-1a70d14f122d');

CREATE OR REPLACE FUNCTION "ConsultarPaisPorId"(P_IdPais UUID)
RETURNS TABLE ("IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdPais", p."Nombre", p."Activo", p."Actualiza"
    FROM "Pais" p
    WHERE p."IdPais" = P_IdPais AND p."Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- SELECT * FROM "ConsultarPaisPorNombre"('9ecae1dd-3414-429c-96c5-1a70d14f122d');

CREATE OR REPLACE FUNCTION "ConsultarPaisPorNombre"(P_NombrePais VARCHAR)
RETURNS TABLE ("IdPais" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT p."IdPais", p."Nombre", p."Activo", p."Actualiza"
    FROM "Pais" p
    WHERE p."Nombre" = P_NombrePais AND p."Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- SELECT * FROM "IngresarPais"('Venezuela');

CREATE OR REPLACE FUNCTION "IngresarPais"(P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Pais" ("Nombre") 
	VALUES (P_Nombre);
END;
$$ LANGUAGE plpgsql;

-- SELECT * FROM "ActualizarPais"('c3a5b128-fadc-455c-b57b-675276c2faba', 'Ecuador');

CREATE OR REPLACE FUNCTION "ActualizarPais"(P_IdPais UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
	UPDATE "Pais" 
    SET "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
	WHERE "Pais"."IdPais" = P_IdPais AND "Pais"."Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- SELECT * FROM "EliminarPais"('c3a5b128-fadc-455c-b57b-675276c2faba');

CREATE OR REPLACE FUNCTION "EliminarPais"(P_IdPais UUID)
RETURNS VOID
AS $$
BEGIN
	UPDATE "Pais" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
	WHERE "Pais"."IdPais" = P_IdPais AND "Pais"."Activo" = '1';
END;
$$ LANGUAGE plpgsql;

-- SELECT * FROM "EliminarPaisFisico"('c3a5b128-fadc-455c-b57b-675276c2faba');

CREATE OR REPLACE FUNCTION "EliminarPaisFisico"(P_IdPais UUID)
RETURNS VOID
AS $$
BEGIN
	DELETE FROM "Pais"
	WHERE "IdPais" = P_IdPais AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;