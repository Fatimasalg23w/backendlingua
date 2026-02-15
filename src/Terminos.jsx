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
