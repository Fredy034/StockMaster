CREATE TABLE "TipoDocumento" (
  "IdTipoDocumento" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "Nombre" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdTipoDocumento")
);

COMMENT ON COLUMN "TipoDocumento"."IdTipoDocumento" IS '';
COMMENT ON COLUMN "TipoDocumento"."Nombre" IS '';
COMMENT ON COLUMN "TipoDocumento"."Activo" IS '';
COMMENT ON COLUMN "TipoDocumento"."Actualiza" IS '';