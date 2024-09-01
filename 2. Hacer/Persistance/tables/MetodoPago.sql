CREATE TABLE "MetodoPago" (
  "IdMetodoPago" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "Nombre" VARCHAR(255) NOT NULL,
  "Descripcion" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdMetodoPago")
);

COMMENT ON COLUMN "MetodoPago"."IdMetodoPago" IS '';
COMMENT ON COLUMN "MetodoPago"."Nombre" IS '';
COMMENT ON COLUMN "MetodoPago"."Descripcion" IS '';
COMMENT ON COLUMN "MetodoPago"."Activo" IS '';
COMMENT ON COLUMN "MetodoPago"."Actualiza" IS '';