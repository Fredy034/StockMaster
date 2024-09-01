CREATE TABLE "Factura" (
  "IdFactura" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdEstadoFactura" UUID NOT NULL,
  "IdMetodoPago" UUID NOT NULL,
  "IdEmpleado" UUID NOT NULL,
  "IdCliente" UUID NOT NULL,
  "NumeroFactura" VARCHAR(255) NOT NULL,
  "Fecha" TIMESTAMP NOT NULL,
  "Total" DECIMAL NOT NULL,
  "Notas" VARCHAR(255) NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdFactura"),
  FOREIGN KEY("IdEstadoFactura") REFERENCES "EstadoFactura"("IdEstadoFactura"),
  FOREIGN KEY("IdMetodoPago") REFERENCES "MetodoPago" ("IdMetodoPago"),
  FOREIGN KEY("IdEmpleado") REFERENCES "Empleado" ("IdEmpleado"),
  FOREIGN KEY("IdCliente") REFERENCES "Cliente" ("IdCliente")
);

COMMENT ON COLUMN "Factura"."IdFactura" IS '';
COMMENT ON COLUMN "Factura"."IdEstadoFactura" IS '';
COMMENT ON COLUMN "Factura"."IdMetodoPago" IS '';
COMMENT ON COLUMN "Factura"."IdEmpleado" IS '';
COMMENT ON COLUMN "Factura"."IdCliente" IS '';
COMMENT ON COLUMN "Factura"."NumeroFactura" IS '';
COMMENT ON COLUMN "Factura"."Fecha" IS '';
COMMENT ON COLUMN "Factura"."Total" IS '';
COMMENT ON COLUMN "Factura"."Notas" IS '';
COMMENT ON COLUMN "Factura"."Activo" IS '';
COMMENT ON COLUMN "Factura"."Actualiza" IS '';