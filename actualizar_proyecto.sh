#!/bin/bash

echo "🚀 Iniciando configuración completa de LinguaConnect..."
echo ""

cd ~/Downloads/linguaconnect-completo/src || exit 1

echo "📁 Ubicación: $(pwd)"
echo ""

# Crear index.css
echo "📝 Creando index.css..."
cat > index.css << 'ENDOFINDEX'
:root {
  font-family: Inter, system-ui, Avenir, Helvetica, Arial, sans-serif;
  line-height: 1.5;
  font-weight: 400;
  color-scheme: light dark;
  color: rgba(255, 255, 255, 0.87);
  background-color: #242424;
  font-synthesis: none;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  margin: 0;
  min-width: 320px;
  min-height: 100vh;
}

#root {
  width: 100%;
  margin: 0;
  padding: 0;
}
ENDOFINDEX

echo "✅ index.css creado"
echo ""

# Crear Terminos.jsx
echo "📝 Creando Terminos.jsx..."
cat > Terminos.jsx << 'ENDOFTERMINOS'
import { useNavigate } from 'react-router-dom';
import './App.css';

function Terminos() {
  const navigate = useNavigate();

  return (
    <div className="legal-page">
      <div className="legal-header">
        <button className="btn-back" onClick={() => navigate('/')}>← Volver al inicio</button>
        <h1>Términos y Condiciones</h1>
        <p className="legal-date">Última actualización: Febrero 2026</p>
      </div>

      <div className="legal-content">
        <section className="legal-section">
          <h2>1. Aceptación de Términos</h2>
          <p>Al inscribirte en LinguaConnectAcademy, aceptas cumplir con estos términos y condiciones.</p>
        </section>

        <section className="legal-section highlight-section">
          <h2>2. Garantía de Empleo (Plan Premium)</h2>
          <p className="important-notice">⚠️ Solo aplica para Plan Premium</p>
          <div className="requirement-box">
            <h4>✓ Asistencia Mínima: 90%</h4>
            <h4>✓ L-V: Máximo 3 faltas/mes</h4>
            <h4>✓ Sábados: Máximo 1 falta/mes</h4>
            <h4>✓ 80% trabajos entregados</h4>
            <h4>✓ 70% exámenes aprobados</h4>
            <h4>✓ Calificación final: 8.0 mínimo</h4>
          </div>
        </section>

        <section className="legal-section">
          <h2>3. Contacto</h2>
          <ul>
            <li>📧 info@linguaconnectacademy.com</li>
            <li>💬 WhatsApp: +52 55 1234 5678</li>
          </ul>
        </section>
      </div>

      <div className="legal-footer">
        <button className="btn-primary" onClick={() => navigate('/')}>Volver al inicio</button>
      </div>
    </div>
  );
}

export default Terminos;
ENDOFTERMINOS

echo "✅ Terminos.jsx creado"
echo ""

# Crear Privacidad.jsx
echo "📝 Creando Privacidad.jsx..."
cat > Privacidad.jsx << 'ENDOFPRIVACIDAD'
import { useNavigate } from 'react-router-dom';
import './App.css';

function Privacidad() {
  const navigate = useNavigate();

  return (
    <div className="legal-page">
      <div className="legal-header">
        <button className="btn-back" onClick={() => navigate('/')}>← Volver al inicio</button>
        <h1>Política de Privacidad</h1>
        <p className="legal-date">Última actualización: Febrero 2026</p>
      </div>

      <div className="legal-content">
        <section className="legal-section">
          <h2>1. Introducción</h2>
          <p>En LinguaConnectAcademy, respetamos y protegemos la privacidad de nuestros estudiantes.</p>
        </section>

        <section className="legal-section highlight-section">
          <h2>2. Información que Recopilamos</h2>
          <ul>
            <li>Información personal (nombre, email, teléfono)</li>
            <li>Información académica (calificaciones, asistencia)</li>
            <li>Información de pago (procesada por Conekta)</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>3. Uso de la Información</h2>
          <div className="requirement-box">
            <h3>Solo compartimos con empresas si TÚ lo autorizas</h3>
            <p className="important-notice">⚠️ Tu información NO se comparte sin tu consentimiento</p>
          </div>
        </section>

        <section className="legal-section">
          <h2>4. Contacto</h2>
          <ul>
            <li>📧 privacidad@linguaconnectacademy.com</li>
            <li>💬 WhatsApp: +52 55 1234 5678</li>
          </ul>
        </section>
      </div>

      <div className="legal-footer">
        <button className="btn-primary" onClick={() => navigate('/')}>Volver al inicio</button>
      </div>
    </div>
  );
}

export default Privacidad;
ENDOFPRIVACIDAD

echo "✅ Privacidad.jsx creado"
echo ""

# Agregar estilos CSS
echo "📝 Agregando estilos a App.css..."
cat >> App.css << 'ENDOFCSS'

/* PÁGINAS LEGALES */
.legal-page {
  max-width: 900px;
  margin: 0 auto;
  padding: 2rem;
  background: #f9f9f9;
  min-height: 100vh;
}

.legal-header {
  background: white;
  padding: 3rem 2rem;
  border-radius: 12px;
  margin-bottom: 2rem;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

.btn-back {
  background: none;
  border: none;
  color: var(--primary);
  font-size: 1rem;
  cursor: pointer;
  padding: 0.5rem 0;
  transition: all 0.3s;
}

.btn-back:hover {
  color: var(--secondary);
  transform: translateX(-5px);
}

.legal-header h1 {
  color: var(--primary);
  font-size: 2.5rem;
  margin: 1rem 0 0.5rem 0;
}

.legal-date {
  color: #666;
  font-size: 0.9rem;
}

.legal-content {
  background: white;
  padding: 3rem;
  border-radius: 12px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
  line-height: 1.8;
}

.legal-section {
  margin-bottom: 3rem;
  padding-bottom: 2rem;
  border-bottom: 1px solid #e0e0e0;
}

.legal-section:last-child {
  border-bottom: none;
}

.legal-section h2 {
  color: var(--primary);
  font-size: 1.8rem;
  margin-bottom: 1.5rem;
}

.legal-section h3 {
  color: var(--secondary);
  font-size: 1.3rem;
  margin: 1.5rem 0 1rem 0;
}

.legal-section h4 {
  color: var(--text);
  font-size: 1.1rem;
  margin: 1rem 0 0.5rem 0;
}

.legal-section ul {
  margin: 1rem 0;
  padding-left: 2rem;
}

.legal-section li {
  margin: 0.5rem 0;
}

.highlight-section {
  background: linear-gradient(135deg, rgba(155, 135, 245, 0.05), rgba(126, 105, 171, 0.05));
  padding: 2rem;
  border-radius: 12px;
  border: 2px solid var(--lavender);
}

.requirement-box {
  background: white;
  padding: 1.5rem;
  border-radius: 8px;
  margin: 1.5rem 0;
  border-left: 4px solid var(--primary);
  box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}

.important-notice {
  background: #e3f2fd;
  padding: 1rem;
  border-radius: 8px;
  border-left: 4px solid #1976d2;
  margin: 1rem 0;
  font-weight: 600;
}

.legal-footer {
  text-align: center;
  margin-top: 2rem;
  padding: 2rem;
}

.testimonials-section {
  position: relative;
  overflow: hidden;
  padding: 6rem 2rem;
}

.testimonials-video {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  z-index: 0;
}

.testimonials-content {
  position: relative;
  z-index: 2;
}

.schedule-benefits {
  margin-top: 1rem;
  padding-top: 1rem;
  border-top: 2px solid var(--lavender);
}

.schedule-benefits p {
  margin: 0.5rem 0;
  font-size: 0.95rem;
  color: var(--text);
}

@media (max-width: 768px) {
  .legal-page {
    padding: 1rem;
  }
  
  .legal-header {
    padding: 2rem 1rem;
  }
  
  .legal-header h1 {
    font-size: 1.8rem;
  }
  
  .legal-content {
    padding: 1.5rem;
  }
}
ENDOFCSS

echo "✅ Estilos CSS agregados"
echo ""

echo "========================================="
echo "✅ CONFIGURACIÓN COMPLETA"
echo ""
echo "Archivos creados:"
echo "  ✓ index.css"
echo "  ✓ Terminos.jsx"
echo "  ✓ Privacidad.jsx"
echo "  ✓ Estilos agregados a App.css"
echo ""
echo "Ahora ejecuta:"
echo "  cd ~/Downloads/linguaconnect-completo"
echo "  npm run dev"
echo ""
echo "========================================="