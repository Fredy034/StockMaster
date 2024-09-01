CREATE OR REPLACE FUNCTION "ConsultarTiendaPorId"(P_IdTienda UUID)
RETURNS TABLE ("IdTienda" UUID, "Nombre" VARCHAR, "Nit" VARCHAR, "Telefono" VARCHAR, "Correo" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT t."IdTienda", t."Nombre", t."Nit", t."Telefono", t."Correo", t."Activo", t."Actualiza"
    FROM "Tienda" t
    WHERE t."IdTienda" = P_IdTienda AND t."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
