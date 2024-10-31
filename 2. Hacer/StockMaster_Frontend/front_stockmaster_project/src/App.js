import React from 'react';
import { Route, BrowserRouter as Router, Routes } from 'react-router-dom';
import './App.css';
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
      </Routes>
    </Router>
  );
}

export default App;
