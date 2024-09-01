CREATE TABLE "Genero" (
  "IdGenero" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "Nombre" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdGenero")
);

COMMENT ON COLUMN "Genero"."IdGenero" IS '';
COMMENT ON COLUMN "Genero"."Nombre" IS '';
COMMENT ON COLUMN "Genero"."Activo" IS '';
COMMENT ON COLUMN "Genero"."Actualiza" IS '';