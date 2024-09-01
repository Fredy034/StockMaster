CREATE TABLE "DetalleFactura" (
  "IdDetalleFactura" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdFactura" UUID NOT NULL,
  "IdProducto" UUID NOT NULL,
  "Cantidad" DECIMAL NOT NULL,
  "Subtotal" DECIMAL NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdDetalleFactura"),
  FOREIGN KEY("IdFactura") REFERENCES "Factura" ("IdFactura"),
  FOREIGN KEY("IdProducto") REFERENCES "Producto" ("IdProducto")
);

COMMENT ON COLUMN "DetalleFactura"."IdDetalleFactura" IS '';
COMMENT ON COLUMN "DetalleFactura"."IdFactura" IS '';
COMMENT ON COLUMN "DetalleFactura"."IdProducto" IS '';
COMMENT ON COLUMN "DetalleFactura"."Cantidad" IS '';
COMMENT ON COLUMN "DetalleFactura"."Subtotal" IS '';
COMMENT ON COLUMN "DetalleFactura"."Activo" IS '';
COMMENT ON COLUMN "DetalleFactura"."Actualiza" IS '';