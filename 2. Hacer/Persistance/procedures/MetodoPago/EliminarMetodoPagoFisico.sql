CREATE OR REPLACE FUNCTION "EliminarMetodoPagoFisico"(P_IdMetodoPago UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "MetodoPago" 
    WHERE "IdMetodoPago" = P_IdMetodoPago AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;