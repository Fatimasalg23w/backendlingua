import { useNavigate } from 'react-router-dom';
import './App.css';

function Home() {
  const navigate = useNavigate();

  const scrollToSection = (id) => {
    const element = document.getElementById(id);
    const navHeight = 60;
    const elementPosition = element.offsetTop - navHeight;
    window.scrollTo({
      top: elementPosition,
      behavior: 'smooth'
    });
  };

  const handlePlanSelection = (planName, precio) => {
    navigate('/pago', {
      state: {
        plan: planName,
        precio: precio
      }
    });
  };

  return (
    <>
      {/* Navigation */}
      <nav>
        <div className="nav-content">
          <div className="logo">
            <img src="/logo.png" alt="Logo" />
            <span className="logo-text">LinguaConnectAcademy</span>
          </div>
          <button className="nav-btn" onClick={() => scrollToSection('pricing')}>
            Planes y Precios
          </button>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="hero">
        <video className="hero-video" autoPlay muted loop playsInline>
          <source src="https://videos.pexels.com/video-files/6985424/6985424-uhd_2560_1440_25fps.mp4" type="video/mp4" />
        </video>
        <div className="hero-content">
          <div className="hero-text">
            <h1>
              Domina el inglés
              <span>de A1 a C2</span>
            </h1>
            <p>
              <strong>Curso 100% Virtual en Línea. Trabajamos bajo el marco CEFR. Te garantizamos que conseguirás trabajo, 
              experimentarás una mejora en tu bolsa laboral y ganarás experiencia real. 
              Nos enfocamos en que puedas expresarlo, escribirlo y leerlo.</strong>
            </p>
            <div className="cta-buttons">
              <button className="btn-primary" onClick={() => scrollToSection('pricing')}>
                Comenzar Ahora
              </button>
              <button className="btn-secondary" onClick={() => scrollToSection('features')}>
                Conocer Más
              </button>
            </div>
          </div>
          <div className="hero-stats">
            <div className="stat">
              <div className="stat-number">100%</div>
              <div className="stat-label">Hasta 100% extra salarial han experimentado nuestros alumnos</div>
            </div>
            <div className="stat">
              <div className="stat-number">A1→C2</div>
              <div className="stat-label">Marco CEFR completo</div>
            </div>
            <div className="stat">
              <div className="stat-number">1,725</div>
              <div className="stat-label">MXN mensuales desde</div>
            </div>
            <div className="stat">
              <div className="stat-number">100%</div>
              <div className="stat-label">Virtual - Clases en línea</div>
            </div>
          </div>
        </div>
      </section>

      {/* Resto de las secciones... (copio todo el contenido que ya tienes) */}
      {/* Por brevedad, aquí iría todo el resto del contenido */}
      
      {/* IMPORTANTE: Solo cambian los botones de "Inscribirme Ahora" */}
      {/* Ejemplo en la sección de Pricing: */}
      
      <section className="section section-alt" id="pricing">
        <h2 className="section-title">Planes de Estudio</h2>
        <p className="section-subtitle">Elige el plan que mejor se adapte a tus objetivos profesionales. Curso 100% virtual en línea.</p>
        <div style={{maxWidth: '1200px', margin: '0 auto', display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '3rem'}}>
          
          {/* Plan Estándar */}
          <div style={{background: 'white', padding: '3.5rem', borderRadius: '20px', position: 'relative', transition: 'all 0.4s ease', border: '3px solid var(--lavender)'}}>
            {/* ... todo el contenido del plan ... */}
            <button 
              className="btn-primary" 
              style={{width: '100%', padding: '1.3rem', fontSize: '1.2rem'}}
              onClick={() => handlePlanSelection('Estándar', 1725)}
            >
              Inscribirme Ahora
            </button>
          </div>

          {/* Plan Premium */}
          <div style={{background: 'white', padding: '3.5rem', borderRadius: '20px', position: 'relative', transition: 'all 0.4s ease', border: '3px solid var(--primary)'}}>
            {/* ... todo el contenido del plan ... */}
            <button 
              className="btn-primary" 
              style={{width: '100%', padding: '1.3rem', fontSize: '1.2rem'}}
              onClick={() => handlePlanSelection('Premium', 1980)}
            >
              Inscribirme Ahora
            </button>
          </div>
        </div>
      </section>

      {/* Footer y demás secciones */}
    </>
  );
}

export default Home;