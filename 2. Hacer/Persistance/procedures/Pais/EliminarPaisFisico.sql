-- SELECT * FROM "EliminarPaisFisico"('c3a5b128-fadc-455c-b57b-675276c2faba');

CREATE OR REPLACE FUNCTION "EliminarPaisFisico"(P_IdPais UUID)
RETURNS VOID
AS $$
BEGIN
	DELETE FROM "Pais"
	WHERE "IdPais" = P_IdPais AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;