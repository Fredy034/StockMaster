CREATE OR REPLACE FUNCTION "EliminarMetodoPago"(P_IdMetodoPago UUID)
RETURNS VOID
AS $$
BEGIN
    UPDATE "MetodoPago" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdMetodoPago" = P_IdMetodoPago AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;