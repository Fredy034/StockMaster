CREATE OR REPLACE FUNCTION "EliminarGeneroFisico"(P_IdGenero UUID)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM "Genero" 
    WHERE "IdGenero" = P_IdGenero AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;