CREATE OR REPLACE FUNCTION "ConsultarSucursal"()
RETURNS TABLE ("IdSucursal" UUID, "IdCiudad" UUID, "IdTienda" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    SELECT s."IdSucursal", s."IdCiudad", s."IdTienda", s."Nombre", s."Activo", s."Actualiza"
    FROM "Sucursal" s
    WHERE s."Activo" = '1';
END;
$$ LANGUAGE plpgsql;
