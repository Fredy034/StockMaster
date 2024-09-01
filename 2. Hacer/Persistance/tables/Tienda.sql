CREATE TABLE "Tienda" (
  "IdTienda" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "Nombre" VARCHAR(255) NOT NULL,
  "Nit" VARCHAR(20) NOT NULL,
  "Telefono" VARCHAR(20) NOT NULL,
  "Correo" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdTienda")
);

COMMENT ON COLUMN "Tienda"."IdTienda" IS '';
COMMENT ON COLUMN "Tienda"."Nombre" IS '';
COMMENT ON COLUMN "Tienda"."Nit" IS '';
COMMENT ON COLUMN "Tienda"."Telefono" IS '';
COMMENT ON COLUMN "Tienda"."Correo" IS '';
COMMENT ON COLUMN "Tienda"."Activo" IS '';
COMMENT ON COLUMN "Tienda"."Actualiza" IS '';