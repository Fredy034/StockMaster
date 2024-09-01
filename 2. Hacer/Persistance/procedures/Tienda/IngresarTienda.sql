CREATE OR REPLACE FUNCTION "IngresarTienda"(P_Nombre VARCHAR, P_Nit VARCHAR, P_Telefono VARCHAR, P_Correo VARCHAR)
RETURNS TABLE ("IdTienda" UUID, "Nombre" VARCHAR, "Nit" VARCHAR, "Telefono" VARCHAR, "Correo" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "Tienda" ("Nombre", "Nit", "Telefono", "Correo") 
    VALUES (P_Nombre, P_Nit, P_Telefono, P_Correo)
    RETURNING "IdTienda", "Nombre", "Nit", "Telefono", "Correo", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
