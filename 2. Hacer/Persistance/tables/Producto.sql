CREATE TABLE "Producto" (
  "IdProducto" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdTipoProducto" UUID NOT NULL,
  "Nombre" VARCHAR(255) NOT NULL,
  "Descripcion" VARCHAR(255) NOT NULL,
  "Precio" DECIMAL NOT NULL,
  "Stock" DECIMAL NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdProducto"),
  FOREIGN KEY("IdTipoProducto") REFERENCES "TipoProducto" ("IdTipoProducto")
);

COMMENT ON COLUMN "Producto"."IdProducto" IS '';
COMMENT ON COLUMN "Producto"."IdTipoProducto" IS '';
COMMENT ON COLUMN "Producto"."Nombre" IS '';
COMMENT ON COLUMN "Producto"."Descripcion" IS '';
COMMENT ON COLUMN "Producto"."Precio" IS '';
COMMENT ON COLUMN "Producto"."Stock" IS '';
COMMENT ON COLUMN "Producto"."Activo" IS '';
COMMENT ON COLUMN "Producto"."Actualiza" IS '';