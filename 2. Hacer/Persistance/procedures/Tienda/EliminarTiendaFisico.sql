CREATE OR REPLACE FUNCTION "EliminarTiendaFisico"(P_IdTienda UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Tienda" 
    WHERE "IdTienda" = P_IdTienda AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;