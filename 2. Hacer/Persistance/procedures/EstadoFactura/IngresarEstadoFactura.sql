CREATE OR REPLACE FUNCTION "IngresarEstadoFactura"(P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS TABLE ("IdEstadoFactura" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "EstadoFactura" ("Nombre", "Descripcion") 
    VALUES (P_Nombre, P_Descripcion)
    RETURNING "IdEstadoFactura", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
