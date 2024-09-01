-- SELECT * FROM "ConsultarTienda"();

CREATE OR REPLACE FUNCTION "ConsultarTienda"()
RETURNS TABLE ("IdTienda" UUID, "Nombre" VARCHAR, "Nit" VARCHAR, "Telefono" VARCHAR, "Correo" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT t."IdTienda", t."Nombre", t."Nit", t."Telefono", t."Correo", t."Activo", t."Actualiza"
    FROM "Tienda" t
    WHERE t."Activo" = '1';
END;
$$ LANGUAGE plpgsql;