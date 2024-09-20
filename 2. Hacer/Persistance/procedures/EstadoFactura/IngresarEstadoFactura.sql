CREATE OR REPLACE FUNCTION "IngresarEstadoFactura"(P_Nombre VARCHAR, P_Descripcion VARCHAR)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "EstadoFactura" ("Nombre", "Descripcion") 
    VALUES (P_Nombre, P_Descripcion);
END;
$$ LANGUAGE plpgsql;