CREATE TABLE "TipoProducto" (
  "IdTipoProducto" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdCategoriaProducto" UUID NOT NULL,
  "Nombre" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdTipoProducto"),
  FOREIGN KEY("IdCategoriaProducto") REFERENCES "CategoriaProducto" ("IdCategoriaProducto")
);

COMMENT ON COLUMN "TipoProducto"."IdTipoProducto" IS '';
COMMENT ON COLUMN "TipoProducto"."IdCategoriaProducto" IS '';
COMMENT ON COLUMN "TipoProducto"."Nombre" IS '';
COMMENT ON COLUMN "TipoProducto"."Activo" IS '';
COMMENT ON COLUMN "TipoProducto"."Actualiza" IS '';