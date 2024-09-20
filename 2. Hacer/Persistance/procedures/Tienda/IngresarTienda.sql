CREATE OR REPLACE FUNCTION "IngresarTienda"(P_Nombre VARCHAR, P_Nit VARCHAR, P_Telefono VARCHAR, P_Correo VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Tienda" ("Nombre", "Nit", "Telefono", "Correo") 
    VALUES (P_Nombre, P_Nit, P_Telefono, P_Correo);
END;
$$ LANGUAGE plpgsql;