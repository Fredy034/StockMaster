CREATE OR REPLACE FUNCTION "ActualizarMetodoPago"(P_IdMetodoPago UUID, P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "MetodoPago" 
    SET "Nombre" = P_Nombre, "Descripcion" = P_Descripcion, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdMetodoPago" = P_IdMetodoPago AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;