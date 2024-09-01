CREATE TABLE "Persona" (
  "IdPersona" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdGenero" UUID NOT NULL,
  "IdTipoDocumento" UUID NOT NULL,
  "IdCiudad" UUID NOT NULL,
  "NombreCompleto" VARCHAR(255) NOT NULL,
  "NumeroDocumento" VARCHAR(20) NOT NULL,
  "Correo" VARCHAR(255) NOT NULL,
  "Telefono" VARCHAR(20) NOT NULL,
  "FechaNacimiento" DATE NOT NULL,
  "Usuario" VARCHAR(255) NOT NULL,
  "Contrasena" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdPersona"),
  FOREIGN KEY("IdGenero") REFERENCES "Genero" ("IdGenero"),
  FOREIGN KEY("IdTipoDocumento") REFERENCES "TipoDocumento" ("IdTipoDocumento"),
  FOREIGN KEY("IdCiudad") REFERENCES "Ciudad" ("IdCiudad")
);

COMMENT ON COLUMN "Persona"."IdPersona" IS '';
COMMENT ON COLUMN "Persona"."IdGenero" IS '';
COMMENT ON COLUMN "Persona"."IdTipoDocumento" IS '';
COMMENT ON COLUMN "Persona"."IdCiudad" IS '';
COMMENT ON COLUMN "Persona"."NombreCompleto" IS '';
COMMENT ON COLUMN "Persona"."NumeroDocumento" IS '';
COMMENT ON COLUMN "Persona"."Correo" IS '';
COMMENT ON COLUMN "Persona"."Telefono" IS '';
COMMENT ON COLUMN "Persona"."FechaNacimiento" IS '';
COMMENT ON COLUMN "Persona"."Usuario" IS '';
COMMENT ON COLUMN "Persona"."Contrasena" IS '';
COMMENT ON COLUMN "Persona"."Activo" IS '';
COMMENT ON COLUMN "Persona"."Actualiza" IS '';