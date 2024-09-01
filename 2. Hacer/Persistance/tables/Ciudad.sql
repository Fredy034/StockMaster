CREATE TABLE "Ciudad" (
  "IdCiudad" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdDepartamento" UUID NOT NULL,
  "Nombre" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdCiudad"),
  FOREIGN KEY("IdDepartamento") REFERENCES "Departamento" ("IdDepartamento")
);

COMMENT ON COLUMN "Ciudad"."IdCiudad" IS '';
COMMENT ON COLUMN "Ciudad"."IdDepartamento" IS '';
COMMENT ON COLUMN "Ciudad"."Nombre" IS '';
COMMENT ON COLUMN "Ciudad"."Activo" IS '';
COMMENT ON COLUMN "Ciudad"."Actualiza" IS '';