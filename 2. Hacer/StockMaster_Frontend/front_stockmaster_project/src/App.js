import React from 'react';
import { Route, BrowserRouter as Router, Routes } from 'react-router-dom';
import './App.css';
import ClientList from './components/ClientList';
import Mongo from './pages/Mongo';
import Postgre from './pages/Postgre';
import Root from './pages/Root';

function App() {
  return (
    <Router>
      <Routes>
        <Route path='/' element={<Root />} />
        <Route path='/mongo' element={<Mongo />} />
        <Route path='/postgre' element={<Postgre />} />
        <Route path='/postgre/genero' element={<ClientList keyword={'gender'} />} />
        <Route path='/postgre/tipodocumento' element={<ClientList keyword={'documenttype'} />} />
        <Route path='/postgre/persona' element={<ClientList keyword={'people'} />} />
        <Route path='/postgre/cliente' element={<ClientList keyword={'client'} />} />
      </Routes>
    </Router>
  );
}

export default App;
