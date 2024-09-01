CREATE OR REPLACE FUNCTION "EliminarMetodoPago"(P_IdMetodoPago UUID)
RETURNS TABLE ("IdMetodoPago" UUID, "Nombre" VARCHAR, "Descripcion" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "MetodoPago" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdMetodoPago" = P_IdMetodoPago AND "Activo" = '1'
    RETURNING "IdMetodoPago", "Nombre", "Descripcion", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
