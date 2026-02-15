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
