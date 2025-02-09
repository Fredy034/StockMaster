import { useState } from 'react';
import ClientCard from './ClientCard';

const ClientSearch = ({ keyword }) => {
  const searchTypes = [
    {
      name: 'ID',
      value: 'id',
    },
    {
      name: 'Nombre',
      value: 'name',
    },
  ];

  const [selectedValue, setSelectedValue] = useState('Filtrar por');
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [search, setSearch] = useState('');
  const [submittedValue, setSubmittedValue] = useState('');

  const handleSelect = (value) => {
    setSelectedValue(value);
    setIsDropdownOpen(false);
  };

  const handleInputChange = (e) => {
    setSearch(e.target.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    setSubmittedValue(search);
    setIsSubmitted(true);
  };

  return (
    <article className='card-container'>
      <div className='card-inner-container'>
        <form className='card-input' onSubmit={handleSubmit}>
          <input type='text' value={search} placeholder='Buscar producto específico ...' onChange={handleInputChange} />
          <div className='card-filter-box'>
            <button
              type='button'
              className={`filter-select ${isDropdownOpen ? 'active' : ''}`}
              onClick={() => setIsDropdownOpen(!isDropdownOpen)}
            >
              <div className='select-value'>
                {selectedValue && selectedValue !== 'Filtrar por'
                  ? searchTypes.find((type) => type.value === selectedValue)?.name
                  : 'Filtrar por'}
              </div>
              <div className='select-icon'>
                <i className='fas fa-chevron-down'></i>
              </div>
            </button>
            {isDropdownOpen && (
              <ul className='select-list'>
                {searchTypes.map((type, index) => (
                  <li key={index} className='select-item'>
                    <button
                      type='button'
                      className={`select-btn ${selectedValue === type.value.toLowerCase() ? 'active' : ''}`}
                      onClick={(e) => {
                        e.preventDefault();
                        handleSelect(type.value.toLowerCase());
                      }}
                    >
                      {type.name}
                    </button>
                  </li>
                ))}
              </ul>
            )}
          </div>
          <button className='card-search-btn' type='submit'>
            Buscar
          </button>
        </form>
        {search && <p>Escribiendo: {search}</p>}
        {submittedValue &&
          (selectedValue === 'id' || selectedValue === 'name' ? (
            <p>
              Buscando producto por {searchTypes.find((type) => type.value === selectedValue)?.name.toLowerCase()}:{' '}
              {submittedValue}
            </p>
          ) : (
            'Debes seleccionar un filtro de búsqueda'
          ))}
        {isSubmitted && (
          <ClientCard keyword={keyword} urlType={selectedValue} parameter={encodeURIComponent(submittedValue)} />
        )}
      </div>
    </article>
  );
};

export default ClientSearch;
