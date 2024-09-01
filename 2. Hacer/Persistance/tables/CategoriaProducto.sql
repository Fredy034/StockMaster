CREATE TABLE "CategoriaProducto" (
  "IdCategoriaProducto" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "Nombre" VARCHAR(255) NOT NULL,
  "Descripcion" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdCategoriaProducto")
);

COMMENT ON COLUMN "CategoriaProducto"."IdCategoriaProducto" IS '';
COMMENT ON COLUMN "CategoriaProducto"."Nombre" IS '';
COMMENT ON COLUMN "CategoriaProducto"."Descripcion" IS '';
COMMENT ON COLUMN "CategoriaProducto"."Activo" IS '';
COMMENT ON COLUMN "CategoriaProducto"."Actualiza" IS '';