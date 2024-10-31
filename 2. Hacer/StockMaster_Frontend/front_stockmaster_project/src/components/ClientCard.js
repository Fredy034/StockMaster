import { useEffect, useState } from 'react';

const ClientCard = ({ keyword }) => {
  const [clientInfo, setClientInfo] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const uriAPI =
    keyword === 'gender'
      ? 'http://localhost:8068/getgenders'
      : keyword === 'documenttype'
      ? 'http://localhost:8068/getdocumenttypes'
      : keyword === 'people'
      ? 'http://localhost:8068/getpeople'
      : 'http://localhost:8068/getclients';

  const keywordTitle =
    keyword === 'gender'
      ? 'genders'
      : keyword === 'documenttype'
      ? 'documents'
      : keyword === 'people'
      ? 'people'
      : 'clients';

  useEffect(() => {
    setLoading(true);
    setError(null);

    fetch(uriAPI)
      .then((response) => response.json())
      .then((data) => {
        if (data && data[keywordTitle]) {
          setClientInfo(Array.isArray(data[keywordTitle]) ? data[keywordTitle] : [data[keywordTitle]]);
        } else {
          setClientInfo([]);
        }
        setLoading(false);
      })
      .catch((error) => {
        console.error('Error al cargar datos:', error);
        setError('No se pudieron cargar los datos del cliente.');
        setLoading(false);
      });
  }, [keywordTitle, uriAPI]);

  if (loading) {
    return (
      <div className='loading-products'>
        <p className='loading-text'>Cargando datos ...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className='loading-products'>
        <p className='loading-text'>{error}</p>
      </div>
    );
  }

  if (!clientInfo.length && !loading) {
    return (
      <div className='loading-products'>
        <p className='loading-text'>No se encontraron clientes con el criterio seleccionado.</p>
      </div>
    );
  }

  return (
    <div className='card-container'>
      {clientInfo.map((client) => (
        <div key={client.id} className='product-card'>
          {keyword === 'gender' && (
            <>
              <p>
                <span>IdGenero:</span> {client.IdGenero}
              </p>
              <p>
                <span>NombreGenero:</span> {client.Nombre}
              </p>
              <p>
                <span>Activo:</span> {client.Activo}
              </p>
              <p>
                <span>Actualiza:</span> {client.Actualiza}
              </p>
            </>
          )}
          {keyword === 'documenttype' && (
            <>
              <p>
                <span>IdTipoDocumento:</span> {client.IdTipoDocumento}
              </p>
              <p>
                <span>NombreTipoDocumento:</span> {client.Nombre}
              </p>
              <p>
                <span>Activo:</span> {client.Activo}
              </p>
              <p>
                <span>Actualiza:</span> {client.Actualiza}
              </p>
            </>
          )}
          {keyword === 'people' && (
            <>
              <p>
                <span>IdPersona:</span> {client.IdPersona}
              </p>
              <p>
                <span>IdGenero:</span> {client.IdGenero}
              </p>
              <p>
                <span>IdTipoDocumento:</span> {client.IdTipoDocumento}
              </p>
              <p>
                <span>IdCiudad:</span> {client.IdCiudad}
              </p>
              <p>
                <span>NombreCompleto:</span> {client.NombreCompleto}
              </p>
              <p>
                <span>NumeroDocumento:</span> {client.NumeroDocumento}
              </p>
              <p>
                <span>Correo:</span> {client.Correo}
              </p>
              <p>
                <span>Telefono:</span> {client.Telefono}
              </p>
              <p>
                <span>Usuario:</span> {client.Usuario}
              </p>
              <p>
                <span>Contrasena:</span> {client.Contrasena}
              </p>
              <p>
                <span>Activo:</span> {client.Activo}
              </p>
              <p>
                <span>Actualiza:</span> {client.Actualiza}
              </p>
            </>
          )}
          {keyword === 'client' && (
            <>
              <p>
                <span>IdCliente:</span> {client.IdCliente}
              </p>
              <p>
                <span>IdPersona:</span> {client.IdPersona}
              </p>
              <p>
                <span>FechaRegistro:</span> {client.FechaRegistro}
              </p>
              <p>
                <span>Direccion:</span> {client.Direccion}
              </p>
              <p>
                <span>Activo:</span> {client.Activo}
              </p>
              <p>
                <span>Actualiza:</span> {client.Actualiza}
              </p>
            </>
          )}
        </div>
      ))}
    </div>
  );
};

export default ClientCard;
