CREATE OR REPLACE FUNCTION "ActualizarGenero"(P_IdGenero UUID, P_Nombre VARCHAR)
RETURNS TABLE ("IdGenero" UUID, "Nombre" VARCHAR, "Activo" BIT, "Actualiza" TIMESTAMP) 
AS $$
BEGIN
    RETURN QUERY 
    UPDATE "Genero" 
    SET "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdGenero" = P_IdGenero AND "Activo" = '1'
    RETURNING "IdGenero", "Nombre", "Activo", "Actualiza";
END;
$$ LANGUAGE plpgsql;
