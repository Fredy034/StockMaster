CREATE OR REPLACE FUNCTION "IngresarMetodoPago"(P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS TABLE ("IdMetodoPago" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    INSERT INTO "MetodoPago" ("Nombre", "Descripcion") 
    VALUES (P_Nombre, P_Descripcion)
    RETURNING "IdMetodoPago", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
