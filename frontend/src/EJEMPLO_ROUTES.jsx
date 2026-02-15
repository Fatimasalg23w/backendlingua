// IMPORTANTE: Este es un ejemplo de cómo actualizar tu App.jsx para incluir las rutas
// Necesitas instalar: npm install react-router-dom

import { Routes, Route } from 'react-router-dom';
import Home from './Home'; // Tu componente actual App.jsx renombrado a Home.jsx
import Pago from './components/Pago';
import SeleccionarCita from './components/SeleccionarCita';
import Confirmacion from './components/Confirmacion';
import './App.css';

function App() {
  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/pago" element={<Pago />} />
      <Route path="/seleccionar-cita" element={<SeleccionarCita />} />
      <Route path="/confirmacion" element={<Confirmacion />} />
    </Routes>
  );
}

export default App;

// ===================================================
// TAMBIÉN NECESITAS ACTUALIZAR TU ARCHIVO HOME.JSX
// (el que anteriormente era App.jsx)
// ===================================================

// Cambia los botones de "Inscribirme Ahora" para que naveguen a /pago
// En lugar de:
// onClick={() => handlePlanSelection('Estándar - $1,725 MXN/mes')}

// Usa esto:
import { useNavigate } from 'react-router-dom';

function Home() {
  const navigate = useNavigate();

  const handlePlanSelection = (plan, precio) => {
    navigate('/pago', {
      state: {
        plan: plan,
        precio: precio
      }
    });
  };

  // Luego en tus botones:
  // <button onClick={() => handlePlanSelection('Estándar', 1725)}>
  //   Inscribirme Ahora
  // </button>

  // Y para Premium:
  // <button onClick={() => handlePlanSelection('Premium', 1980)}>
  //   Inscribirme Ahora
  // </button>
}
