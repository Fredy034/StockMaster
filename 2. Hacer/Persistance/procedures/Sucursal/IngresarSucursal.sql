CREATE OR REPLACE FUNCTION "IngresarSucursal"(P_IdCiudad UUID, P_IdTienda UUID, P_Nombre VARCHAR)
RETURNS TABLE ("IdSucursal" UUID, "IdCiudad" UUID, "IdTienda" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Sucursal" ("IdCiudad", "IdTienda", "Nombre") 
    VALUES (P_IdCiudad, P_IdTienda, P_Nombre)
    RETURNING "IdSucursal", "IdCiudad", "IdTienda", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
