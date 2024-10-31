class ModelCliente {
  constructor(IdCliente, IdPersona, FechaRegistro, Direccion, Activo, Actualiza) {
    this.IdCliente = IdCliente;
    this.IdPersona = IdPersona;
    this.FechaRegistro = FechaRegistro;
    this.Direccion = Direccion;
    this.Activo = Activo;
    this.Actualiza = Actualiza;
  }
}

export default { ModelCliente };
