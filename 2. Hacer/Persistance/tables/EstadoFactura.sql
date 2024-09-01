CREATE TABLE "EstadoFactura" (
  "IdEstadoFactura" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "Nombre" VARCHAR(255) NOT NULL,
  "Descripcion" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdEstadoFactura")
);

COMMENT ON COLUMN "EstadoFactura"."IdEstadoFactura" IS '';
COMMENT ON COLUMN "EstadoFactura"."Nombre" IS '';
COMMENT ON COLUMN "EstadoFactura"."Descripcion" IS '';
COMMENT ON COLUMN "EstadoFactura"."Activo" IS '';
COMMENT ON COLUMN "EstadoFactura"."Actualiza" IS '';