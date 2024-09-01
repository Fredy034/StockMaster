CREATE OR REPLACE FUNCTION "EliminarGenero"(P_IdGenero UUID)
RETURNS TABLE ("IdGenero" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Genero" 
    SET "Activo" = '0', "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdGenero" = P_IdGenero AND "Activo" = '1'
    RETURNING "IdGenero", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
