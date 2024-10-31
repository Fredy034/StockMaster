class ModelPersona {
  constructor(
    IdPersona,
    IdGenero,
    IdTipoDocumento,
    IdCiudad,
    NombreCompleto,
    NumeroDocumento,
    Correo,
    Telefono,
    FechaNacimiento,
    Usuario,
    Contrasena,
    Activo,
    Actualiza
  ) {
    this.IdPersona = IdPersona;
    this.IdGenero = IdGenero;
    this.IdTipoDocumento = IdTipoDocumento;
    this.IdCiudad = IdCiudad;
    this.NombreCompleto = NombreCompleto;
    this.NumeroDocumento = NumeroDocumento;
    this.Correo = Correo;
    this.Telefono = Telefono;
    this.FechaNacimiento = FechaNacimiento;
    this.Usuario = Usuario;
    this.Contrasena = Contrasena;
    this.Activo = Activo;
    this.Actualiza = Actualiza;
  }
}

export default { ModelPersona };
