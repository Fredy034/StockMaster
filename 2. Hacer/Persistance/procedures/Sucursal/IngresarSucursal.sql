CREATE OR REPLACE FUNCTION "IngresarSucursal"(P_IdCiudad UUID, P_IdTienda UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Sucursal" ("IdCiudad", "IdTienda", "Nombre") 
    VALUES (P_IdCiudad, P_IdTienda, P_Nombre);
END;
$$ LANGUAGE plpgsql;