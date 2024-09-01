CREATE TABLE "Cliente" (
  "IdCliente" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdPersona" UUID NOT NULL,
  "FechaRegistro" DATE NOT NULL,
  "Direccion" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdCliente"),
  FOREIGN KEY("IdPersona") REFERENCES "Persona" ("IdPersona")
);

COMMENT ON COLUMN "Cliente"."IdCliente" IS '';
COMMENT ON COLUMN "Cliente"."IdPersona" IS '';
COMMENT ON COLUMN "Cliente"."FechaRegistro" IS '';
COMMENT ON COLUMN "Cliente"."Direccion" IS '';
COMMENT ON COLUMN "Cliente"."Activo" IS '';
COMMENT ON COLUMN "Cliente"."Actualiza" IS '';