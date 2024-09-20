CREATE OR REPLACE FUNCTION "ActualizarGenero"(P_IdGenero UUID, P_Nombre VARCHAR)
RETURNS VOID
AS $$
BEGIN
    UPDATE "Genero" 
    SET "Nombre" = P_Nombre, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdGenero" = P_IdGenero AND "Activo" = '1';
END;
$$ LANGUAGE plpgsql;