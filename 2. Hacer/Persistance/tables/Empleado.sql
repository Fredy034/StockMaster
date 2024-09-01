CREATE TABLE "Empleado" (
  "IdEmpleado" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  "IdPersona" UUID NOT NULL,
  "IdSucursal" UUID NOT NULL,
  "FechaContratacion" DATE NOT NULL,
  "Salario" NUMERIC NOT NULL,
  "Activo" BIT NOT NULL DEFAULT b'1',
  "Actualiza" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY("IdEmpleado"),
  FOREIGN KEY("IdPersona") REFERENCES "Persona" ("IdPersona"),
  FOREIGN KEY("IdSucursal") REFERENCES "Sucursal" ("IdSucursal")
);

COMMENT ON COLUMN "Empleado"."IdEmpleado" IS '';
COMMENT ON COLUMN "Empleado"."IdPersona" IS '';
COMMENT ON COLUMN "Empleado"."IdSucursal" IS '';
COMMENT ON COLUMN "Empleado"."FechaContratacion" IS '';
COMMENT ON COLUMN "Empleado"."Salario" IS '';
COMMENT ON COLUMN "Empleado"."Activo" IS '';
COMMENT ON COLUMN "Empleado"."Actualiza" IS '';