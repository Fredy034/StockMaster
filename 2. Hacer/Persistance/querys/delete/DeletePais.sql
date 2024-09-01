UPDATE "Pais"
SET "Activo" = '0',
	"Actualiza" = CURRENT_TIMESTAMP
WHERE "IdPais" = '309a0c1f-7000-4797-bdbe-0e8fda23ef73'
	AND "Activo" = '1'