CREATE TABLE "Departamento" (
	"IdDepartamento" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
	"IdPais" UUID NOT NULL,
	"Nombre" VARCHAR(255) NOT NULL,
	"Activo" BIT NOT NULL DEFAULT b'1',
	"Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("IdDepartamento"),
	FOREIGN KEY("IdPais") REFERENCES "Pais" ("IdPais")
);

COMMENT ON COLUMN "Departamento"."IdDepartamento" IS '';
COMMENT ON COLUMN "Departamento"."IdPais" IS '';
COMMENT ON COLUMN "Departamento"."Nombre" IS '';
COMMENT ON COLUMN "Departamento"."Activo" IS '';
COMMENT ON COLUMN "Departamento"."Actualiza" IS '';