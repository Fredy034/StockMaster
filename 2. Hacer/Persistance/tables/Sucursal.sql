CREATE TABLE "Sucursal" (
  "IdSucursal" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdCiudad" UUID NOT NULL,
  "IdTienda" UUID NOT NULL,
  "Nombre" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdSucursal"),
  FOREIGN KEY("IdCiudad") REFERENCES "Ciudad" ("IdCiudad"),
  FOREIGN KEY("IdTienda") REFERENCES "Tienda" ("IdTienda")
);

COMMENT ON COLUMN "Sucursal"."IdSucursal" IS '';
COMMENT ON COLUMN "Sucursal"."IdCiudad" IS '';
COMMENT ON COLUMN "Sucursal"."IdTienda" IS '';
COMMENT ON COLUMN "Sucursal"."Nombre" IS '';
COMMENT ON COLUMN "Sucursal"."Activo" IS '';
COMMENT ON COLUMN "Sucursal"."Actualiza" IS '';