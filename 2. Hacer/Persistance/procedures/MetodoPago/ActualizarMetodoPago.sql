CREATE OR REPLACE FUNCTION "ActualizarMetodoPago"(P_IdMetodoPago UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS TABLE ("IdMetodoPago" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "MetodoPago" 
    SET "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdMetodoPago" = P_IdMetodoPago AND "Activo" = '1'
    RETURNING "IdMetodoPago", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
