#!/bin/bash

cd ~/linguaconnect/src && \

# PASO 1: Actualizar Home.jsx con nuevas fotos y videos
cat > Home.jsx << 'ENDOFHOME'
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
              <button className="btn-secondary btn-secondary-hero" onClick={() => scrollToSection('features')}>
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
              <div className="stat-number">25</div>
              <div className="stat-label">Personas máx por grupo</div>
            </div>
          </div>
        </div>
      </section>

      {/* Schedule Section */}
      <section className="section" id="schedule">
        <h2 className="section-title">Próximos Cursos</h2>
        <p className="section-subtitle" style={{fontSize: '1.25rem', fontWeight: 600, color: 'var(--primary)'}}>
          Inicio cada 16 del mes
        </p>
        <p className="section-subtitle">Elige el horario que mejor se adapte a tu rutina</p>
        
        <div className="schedule-grid">
          <div className="schedule-card">
            <div className="schedule-icon">L-V</div>
            <h3>Lunes a Viernes</h3>
            <div className="schedule-badge">Próximo inicio: 16 de Marzo</div>
            <div className="schedule-time">
              <div className="time-block">
                <span className="time-label">Horario Nocturno</span>
                <span className="time">8:00 PM - 9:00 PM</span>
              </div>
            </div>
            <p className="schedule-total">5 horas de clase por semana</p>
            <div className="schedule-benefits">
              <p>✓ Grupos pequeños (máx. 25 personas)</p>
              <p>✓ Atención personalizada</p>
            </div>
          </div>

          <div className="schedule-card">
            <div className="schedule-icon">SAB</div>
            <h3>Sábados Intensivos</h3>
            <div className="schedule-badge">Próximo inicio: 21 de Marzo</div>
            <div className="schedule-time">
              <div className="time-block">
                <span className="time-label">Horario Matutino</span>
                <span className="time">9:00 AM - 2:00 PM</span>
              </div>
              <div className="time-divider">y</div>
              <div className="time-block">
                <span className="time-label">Horario Vespertino</span>
                <span className="time">4:00 PM - 8:00 PM</span>
              </div>
            </div>
            <p className="schedule-total">5 horas de clase por semana</p>
            <div className="schedule-benefits">
              <p>✓ Grupos pequeños (máx. 25 personas)</p>
              <p>✓ Reposición de clases en horario semanal*</p>
            </div>
          </div>
        </div>
      </section>

      {/* Teachers Section */}
      <section className="teachers-section section-alt">
        <video className="teachers-video" autoPlay muted loop playsInline>
          <source src="https://videos.pexels.com/video-files/6671234/6671234-uhd_2560_1440_25fps.mp4" type="video/mp4" />
        </video>
        <div className="teachers-content">
          <h2 className="section-title">Nuestros Maestros</h2>
          <p className="section-subtitle">Aprende con los mejores profesionales del idioma</p>
          <div className="teachers-grid">
            <div className="teacher-card">
              <h3>Certificados Nivel C2</h3>
              <p>Maestros con certificación internacional en el nivel más alto del marco CEFR</p>
            </div>
            <div className="teacher-card">
              <h3>Nivel Nativo</h3>
              <p>Profesores nativos del idioma con amplia experiencia en enseñanza</p>
            </div>
            <div className="teacher-card">
              <h3>Experiencia Internacional</h3>
              <p>Personas que vivieron en otros países y conocen la cultura de primera mano</p>
            </div>
            <div className="teacher-card">
              <h3>Experiencia Laboral</h3>
              <p>Profesionales con alto nivel de inglés y trayectoria en ambientes corporativos reales</p>
            </div>
          </div>
        </div>
      </section>

      {/* University Discount Section */}
      <section className="university-discount">
        <video className="discount-video" autoPlay muted loop playsInline>
          <source src="https://videos.pexels.com/video-files/6913852/6913852-uhd_2560_1440_25fps.mp4" type="video/mp4" />
        </video>
        <div className="discount-content">
          <div className="mission-statement">
            <h2 className="section-title" style={{fontSize: '3rem', marginBottom: '2rem'}}>Nuestra Misión</h2>
            <p style={{fontSize: '1.5rem', lineHeight: '1.8', marginBottom: '3rem', maxWidth: '900px', margin: '0 auto 3rem'}}>
              Poner en alto el nombre de México y que puedas aprender y aportar a otras culturas 
              por medio de una herramienta muy sencilla: <strong>el inglés</strong>
            </p>
          </div>
          <div className="discount-icon">15%</div>
          <h2 className="section-title">Descuentos para Estudiantes UNAM y Poli</h2>
          <div className="discount-grid">
            <div className="discount-card">
              <h3>15% de Reembolso</h3>
              <p>Obtén un 15% de reembolso en tu primer pago al enviar tu credencial estudiantil vigente</p>
            </div>
            <div className="discount-card">
              <h3>Liberación de Inglés</h3>
              <p>Te ayudamos a liberar tu requisito de inglés con preparación especializada y certificaciones válidas</p>
            </div>
          </div>
          <p style={{textAlign: 'center', marginTop: '2rem', fontSize: '1.1rem', opacity: 0.9}}>
            *Aplican términos y condiciones. Credencial debe estar vigente.
          </p>
        </div>
      </section>

      {/* Features Section */}
      <section className="section section-features" id="features">
        <video className="features-video" autoPlay muted loop playsInline>
          <source src="https://videos.pexels.com/video-files/8865703/8865703-uhd_2560_1440_25fps.mp4" type="video/mp4" />
        </video>
        <div className="features-content">
          <h2 className="section-title">¿Por qué elegirnos?</h2>
          <p className="section-subtitle">
            La mayoría de nuestros egresados trabajan en buenas empresas, mejorando e incrementando sus salarios
          </p>
          <div className="features-grid">
            <div className="feature-card">
              <div className="feature-icon">01</div>
              <h3>Marco CEFR Oficial</h3>
              <p>Seguimos el estándar internacional europeo para el aprendizaje de idiomas, desde nivel básico A1 hasta avanzado C2.</p>
            </div>
            <div className="feature-card">
              <div className="feature-icon">02</div>
              <h3>Garantía de Empleo</h3>
              <p>Te garantizamos que conseguirás trabajo y experimentarás una mejora real en tu bolsa laboral con nuestra opción premium.</p>
            </div>
            <div className="feature-card">
              <div className="feature-icon">03</div>
              <h3>Grupos Pequeños</h3>
              <p>Máximo 25 personas por grupo para asegurar atención personalizada y seguimiento individual de tu progreso.</p>
            </div>
            <div className="feature-card">
              <div className="feature-icon">04</div>
              <h3>Experiencia Real</h3>
              <p>Ganarás experiencia práctica aplicable en el mundo laboral. Nos enfocamos en situaciones reales de trabajo.</p>
            </div>
            <div className="feature-card">
              <div className="feature-icon">05</div>
              <h3>Resultados Comprobados</h3>
              <p>Nuestros egresados incrementan sus salarios hasta un 100%. El inglés abre puertas a mejores oportunidades.</p>
            </div>
            <div className="feature-card">
              <div className="feature-icon">06</div>
              <h3>Certificación Opcional</h3>
              <p>Opción de certificación oficial para validar tus conocimientos ante empleadores internacionales.</p>
            </div>
          </div>
        </div>
      </section>

      {/* Employment Guarantee Section - NUEVO VIDEO */}
      <section className="employment-guarantee">
        <video className="employment-video" autoPlay muted loop playsInline>
          <source src="https://videos.pexels.com/video-files/8865893/8865893-uhd_2560_1440_25fps.mp4" type="video/mp4" />
        </video>
        <div className="employment-content">
          <h2 className="section-title">Garantía de Empleo Remoto</h2>
          <p className="section-subtitle">
            Te ayudamos a conseguir trabajo remoto al finalizar tu curso
          </p>
          <div className="employment-grid">
            <div className="employment-card">
              <div className="employment-number">01</div>
              <h3>Trabajo Remoto Garantizado</h3>
              <p>Con nuestro Plan Premium, te garantizamos un trabajo remoto al finalizar tu curso. Conectamos con empresas internacionales buscando talento mexicano.</p>
            </div>
            <div className="employment-card">
              <div className="employment-number">02</div>
              <h3>Empresas Internacionales</h3>
              <p>Acceso a nuestra red de más de 150 empresas asociadas en Estados Unidos, Canadá, y Europa que buscan profesionales bilingües.</p>
            </div>
            <div className="employment-card">
              <div className="employment-number">03</div>
              <h3>Salarios Competitivos</h3>
              <p>Nuestros egresados obtienen salarios entre $25,000 y $80,000 MXN mensuales trabajando desde casa para empresas internacionales.</p>
            </div>
            <div className="employment-card">
              <div className="employment-number">04</div>
              <h3>Preparación para Entrevistas</h3>
              <p>Te preparamos específicamente para entrevistas en inglés, simulacros de casos reales, y técnicas de negociación salarial.</p>
            </div>
            <div className="employment-card">
              <div className="employment-number">05</div>
              <h3>CV Internacional</h3>
              <p>Optimizamos tu currículum para estándares internacionales y te ayudamos a crear un perfil profesional destacado en LinkedIn.</p>
            </div>
            <div className="employment-card">
              <div className="employment-number">06</div>
              <h3>Seguimiento Post-Contratación</h3>
              <p>No te dejamos solo. Te acompañamos durante tus primeros 3 meses en tu nuevo trabajo para asegurar tu éxito y adaptación.</p>
            </div>
          </div>
          <div style={{textAlign: 'center', marginTop: '3rem'}}>
            <button className="btn-secondary" onClick={() => navigate('/terminos')}>
              Ver Términos de Garantía de Empleo
            </button>
          </div>
        </div>
      </section>

      {/* Benefits Section */}
      <section className="section">
        <h2 className="section-title">Ventajas de Dominar el Inglés</h2>
        <div className="benefits-grid">
          <div className="benefit-card">
            <div className="benefit-icon">01</div>
            <h3>Mejora de Empleo</h3>
          </div>
          <div className="benefit-card">
            <div className="benefit-icon">02</div>
            <h3>Oportunidades en el Extranjero</h3>
          </div>
          <div className="benefit-card">
            <div className="benefit-icon">03</div>
            <h3>Oportunidades de Voluntariado</h3>
          </div>
          <div className="benefit-card">
            <div className="benefit-icon">04</div>
            <h3>Mejora Económica</h3>
          </div>
          <div className="benefit-card">
            <div className="benefit-icon">05</div>
            <h3>Conocer Otras Culturas</h3>
          </div>
        </div>
      </section>

      {/* Work Experience Section */}
      <section className="work-experience">
        <video className="work-video" autoPlay muted loop playsInline>
          <source src="https://videos.pexels.com/video-files/3842819/3842819-uhd_2560_1440_25fps.mp4" type="video/mp4" />
        </video>
        <h2 className="section-title">Te Preparamos Para el Mundo Real</h2>
        <p className="section-subtitle">Experiencia laboral auténtica que hace la diferencia en tu CV</p>
        <div className="experience-grid">
          <div className="experience-card">
            <h3>Voluntariados Internacionales</h3>
            <p>Te ayudamos a irte de voluntariado para mejorar tu currículum con experiencia internacional verificable.</p>
          </div>
          <div className="experience-card">
            <h3>Experiencia Laboral Real</h3>
            <p>Trabajarás en proyectos reales que podrás añadir a tu CV. Experiencia comprobable y referencias laborales.</p>
          </div>
          <div className="experience-card">
            <h3>Entornos Totalmente Reales</h3>
            <p>Simulaciones y prácticas en ambientes de trabajo auténticos. Prepárate para el día uno en tu nuevo empleo.</p>
          </div>
        </div>
      </section>

      {/* Testimonials Section - NUEVO VIDEO DE FONDO */}
      <section className="section testimonials-section">
        <video className="testimonials-video" autoPlay muted loop playsInline>
          <source src="https://videos.pexels.com/video-files/8061031/8061031-uhd_2560_1440_25fps.mp4" type="video/mp4" />
        </video>
        <div className="testimonials-content">
          <h2 className="section-title">Historias de Éxito</h2>
          <p className="section-subtitle">Estudiantes de toda Latinoamérica transformando sus carreras</p>
          <div className="testimonials-grid">
            
            {/* Testimonio 1 - Mujer México */}
            <div className="testimonial-card">
              <img src="https://res.cloudinary.com/daz4hx8l9/image/upload/v1771045077/WhatsApp_Image_2026-02-13_at_10.55.23_PM_u2exeh.jpg" alt="Andrea González" className="testimonial-image" />
              <div className="testimonial-content">
                <div className="testimonial-stars">★★★★★</div>
                <p className="testimonial-text">
                  "Gracias a LinguaConnectAcademy pasé de nivel B1 a C1 en solo 8 meses. Esto me abrió las puertas para trabajar con clientes internacionales y mi salario aumentó un 85%. El enfoque práctico y las sesiones de conversación fueron clave."
                </p>
                <div className="testimonial-author">
                  <h4>Andrea González</h4>
                  <p>Gerente de Marketing Digital</p>
                  <span className="testimonial-badge">🇲🇽 México | Aumento: 85%</span>
                </div>
              </div>
            </div>

            {/* Testimonio 2 - Hombre México */}
            <div className="testimonial-card">
              <img src="https://res.cloudinary.com/daz4hx8l9/image/upload/v1769916624/edit6_xj4txz.jpg" alt="Roberto Jiménez" className="testimonial-image" />
              <div className="testimonial-content">
                <div className="testimonial-stars">★★★★★</div>
                <p className="testimonial-text">
                  "Lo que más me gustó fue que no solo aprendes gramática, sino que te enseñan a comunicarte en situaciones laborales reales. Ahora participo en conferencias internacionales sin problemas. Mi carrera dio un giro de 180 grados."
                </p>
                <div className="testimonial-author">
                  <h4>Roberto Jiménez</h4>
                  <p>Ingeniero Industrial</p>
                  <span className="testimonial-badge">🇲🇽 México | Conferencias Internacionales</span>
                </div>
              </div>
            </div>

            {/* Testimonio 3 - Mujer Colombia - NUEVA FOTO */}
            <div className="testimonial-card">
              <img src="https://res.cloudinary.com/daz4hx8l9/image/upload/v1771174409/WhatsApp_Image_2026-02-15_at_10.50.18_AM_yjgj0f.jpg" alt="Camila Rodríguez" className="testimonial-image" />
              <div className="testimonial-content">
                <div className="testimonial-stars">★★★★★</div>
                <p className="testimonial-text">
                  "Desde Bogotá tomé las clases virtuales y fue increíble. Alcancé el nivel C1 y ahora trabajo remoto para una empresa de Estados Unidos. El curso es 100% en línea, perfecto para mi horario. Mi sueldo se triplicó."
                </p>
                <div className="testimonial-author">
                  <h4>Camila Rodríguez</h4>
                  <p>Diseñadora UX/UI</p>
                  <span className="testimonial-badge">🇨🇴 Colombia | Trabajo Remoto USA</span>
                </div>
              </div>
            </div>

            {/* Testimonio 4 - Elizabeth Hernández - NUEVA FOTO */}
            <div className="testimonial-card">
              <img src="https://res.cloudinary.com/daz4hx8l9/image/upload/v1771045077/WhatsApp_Image_2026-02-13_at_10.56.08_PM_onbqbt.jpg" alt="Elizabeth Hernández" className="testimonial-image" />
              <div className="testimonial-content">
                <div className="testimonial-stars">★★★★★</div>
                <p className="testimonial-text">
                  "El Plan Premium fue la mejor inversión. Ahora trabajo 100% home office para una empresa de Estados Unidos. La flexibilidad de horarios y el salario en dólares cambió mi vida completamente. Además, los grupos pequeños hicieron que el aprendizaje fuera mucho más efectivo."
                </p>
                <div className="testimonial-author">
                  <h4>Elizabeth Hernández</h4>
                  <p>Coordinadora de Proyectos</p>
                  <span className="testimonial-badge">🇲🇽 México | Home Office USA</span>
                </div>
              </div>
            </div>

            {/* Testimonio 5 - Carlos Mendoza - NUEVA FOTO */}
            <div className="testimonial-card">
              <img src="https://res.cloudinary.com/daz4hx8l9/image/upload/v1771174409/WhatsApp_Image_2026-02-15_at_10.52.41_AM_qb2oyu.jpg" alt="Carlos Mendoza" className="testimonial-image" />
              <div className="testimonial-content">
                <div className="testimonial-stars">★★★★★</div>
                <p className="testimonial-text">
                  "Empecé desde cero con el nivel A1 desde Medellín y ahora estoy en B2. Conseguí mi primer trabajo en una empresa internacional gracias al inglés. Las clases virtuales me permitieron estudiar mientras trabajaba. ¡Totalmente recomendado!"
                </p>
                <div className="testimonial-author">
                  <h4>Carlos Mendoza</h4>
                  <p>Desarrollador de Software</p>
                  <span className="testimonial-badge">🇨🇴 Colombia | Trabajo Internacional</span>
                </div>
              </div>
            </div>

            {/* Testimonio 6 - Hombre México */}
            <div className="testimonial-card">
              <img src="https://res.cloudinary.com/daz4hx8l9/image/upload/v1769916252/edit4_ct2x02.jpg" alt="Diego Torres" className="testimonial-image" />
              <div className="testimonial-content">
                <div className="testimonial-stars">★★★★★</div>
                <p className="testimonial-text">
                  "La experiencia con LinguaConnectAcademy superó mis expectativas. Los profesores son excelentes y el material está muy bien estructurado. Pasé de A2 a B2 y conseguí una promoción importante en mi empresa. Vale cada peso invertido."
                </p>
                <div className="testimonial-author">
                  <h4>Diego Torres</h4>
                  <p>Analista de Negocios</p>
                  <span className="testimonial-badge">🇲🇽 México | Promoción en Empresa</span>
                </div>
              </div>
            </div>

            {/* Testimonio 7 - Mujer Chile */}
            <div className="testimonial-card">
              <img src="https://res.cloudinary.com/daz4hx8l9/image/upload/v1771085557/WhatsApp_Image_2026-02-14_at_10.11.11_AM_tiq3k4.jpg" alt="Valentina Morales" className="testimonial-image" />
              <div className="testimonial-content">
                <div className="testimonial-stars">★★★★★</div>
                <p className="testimonial-text">
                  "Desde Santiago tomé el curso y alcancé el C1. Ahora trabajo como Project Manager para una empresa canadiense de forma remota. El inglés me abrió un mundo de oportunidades que nunca imaginé. Mi calidad de vida mejoró completamente."
                </p>
                <div className="testimonial-author">
                  <h4>Valentina Morales</h4>
                  <p>Project Manager</p>
                  <span className="testimonial-badge">🇨🇱 Chile | Remoto para Canadá</span>
                </div>
              </div>
            </div>

            {/* Testimonio 8 - Mujer CDMX - NUEVA */}
            <div className="testimonial-card">
              <img src="https://res.cloudinary.com/daz4hx8l9/image/upload/v1771174409/WhatsApp_Image_2026-02-15_at_10.50.18_AM_1_wu9isi.jpg" alt="Sofía Ramírez" className="testimonial-image" />
              <div className="testimonial-content">
                <div className="testimonial-stars">★★★★★</div>
                <p className="testimonial-text">
                  "Los grupos pequeños de máximo 25 personas hicieron una gran diferencia. La atención personalizada me ayudó a superar mis miedos de hablar en inglés. Ahora trabajo en customer success para una startup internacional desde CDMX."
                </p>
                <div className="testimonial-author">
                  <h4>Sofía Ramírez</h4>
                  <p>Customer Success Manager</p>
                  <span className="testimonial-badge">🇲🇽 CDMX | Startup Internacional</span>
                </div>
              </div>
            </div>

          </div>
        </div>
      </section>

      {/* Pricing Section */}
      <section className="section section-alt" id="pricing">
        <h2 className="section-title">Planes de Estudio</h2>
        <p className="section-subtitle">Elige el plan que mejor se adapte a tus objetivos profesionales. Curso 100% virtual en línea.</p>
        <div style={{maxWidth: '1200px', margin: '0 auto', display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '3rem'}}>
          
          {/* Plan Estándar */}
          <div style={{background: 'white', padding: '3.5rem', borderRadius: '20px', position: 'relative', transition: 'all 0.4s ease', border: '3px solid var(--lavender)'}}>
            <h3 style={{fontFamily: 'Space Grotesk, sans-serif', fontSize: '2.5rem', color: 'var(--primary)', marginBottom: '1rem', letterSpacing: '1px', fontWeight: 600}}>Plan Estándar</h3>
            <div style={{fontFamily: 'Space Grotesk, sans-serif', fontSize: '4rem', color: 'var(--primary)', marginBottom: '0.5rem', fontWeight: 700}}>
              $1,725 <span style={{fontSize: '1.5rem', color: 'var(--text-light)'}}>MXN/mes</span>
            </div>
            <p style={{fontSize: '1.1rem', color: 'var(--accent)', fontWeight: 600, marginBottom: '2rem'}}>🌐 Curso 100% Virtual en Línea</p>
            <ul style={{listStyle: 'none', margin: '2rem 0'}}>
              <li style={{padding: '1rem 0', borderBottom: '1px solid #f0f0f0', color: 'var(--text)', fontSize: '1.05rem', display: 'flex', alignItems: 'center', gap: '1rem'}}>
                <span style={{color: 'var(--primary)', fontWeight: 'bold', fontSize: '1.3rem'}}>✓</span>
                Metodología CEFR completa (A1 - C2)
              </li>
              <li style={{padding: '1rem 0', borderBottom: '1px solid #f0f0f0', color: 'var(--text)', fontSize: '1.05rem', display: 'flex', alignItems: 'center', gap: '1rem'}}>
                <span style={{color: 'var(--primary)', fontWeight: 'bold', fontSize: '1.3rem'}}>✓</span>
                Grupos pequeños (máx. 25 personas)
              </li>
              <li style={{padding: '1rem 0', borderBottom: '1px solid #f0f0f0', color: 'var(--text)', fontSize: '1.05rem', display: 'flex', alignItems: 'center', gap: '1rem'}}>
                <span style={{color: 'var(--primary)', fontWeight: 'bold', fontSize: '1.3rem'}}>✓</span>
                Atención personalizada
              </li>
              <li style={{padding: '1rem 0', borderBottom: '1px solid #f0f0f0', color: 'var(--text)', fontSize: '1.05rem', display: 'flex', alignItems: 'center', gap: '1rem'}}>
                <span style={{color: 'var(--primary)', fontWeight: 'bold', fontSize: '1.3rem'}}>✓</span>
                Material didáctico incluido
              </li>
              <li style={{padding: '1rem 0', borderBottom: '1px solid #f0f0f0', color: 'var(--text)', fontSize: '1.05rem', display: 'flex', alignItems: 'center', gap: '1rem'}}>
                <span style={{color: 'var(--primary)', fontWeight: 'bold', fontSize: '1.3rem'}}>✓</span>
                Grupos de conversación en línea
              </li>
              <li style={{padding: '1rem 0', color: 'var(--text)', fontSize: '1.05rem', display: 'flex', alignItems: 'center', gap: '1rem'}}>
                <span style={{color: 'var(--primary)', fontWeight: 'bold', fontSize: '1.3rem'}}>✓</span>
                Acceso a comunidad de estudiantes
              </li>
            </ul>
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
            <div style={{position: 'absolute', top: '-15px', right: '30px', background: 'var(--mint)', color: 'var(--text)', padding: '0.5rem 1.5rem', borderRadius: '50px', fontWeight: 700, fontSize: '0.9rem', letterSpacing: '1px'}}>
              MÁS POPULAR
            </div>
            <h3 style={{fontFamily: 'Space Grotesk, sans-serif', fontSize: '2.5rem', color: 'var(--primary)', marginBottom: '1rem', letterSpacing: '1px', fontWeight: 600}}>Plan Premium</h3>
            <div style={{fontFamily: 'Space Grotesk, sans-serif', fontSize: '4rem', color: 'var(--primary)', marginBottom: '0.5rem', fontWeight: 700}}>
              $1,980 <span style={{fontSize: '1.5rem', color: 'var(--text-light)'}}>MXN/mes</span>
            </div>
            <p style={{fontSize: '1.1rem', color: 'var(--accent)', fontWeight: 600, marginBottom: '2rem'}}>🌐 Curso 100% Virtual en Línea</p>
            <ul style={{listStyle: 'none', margin: '2rem 0'}}>
              <li style={{padding: '1rem 0', borderBottom: '1px solid #f0f0f0', color: 'var(--text)', fontSize: '1.05rem', display: 'flex', alignItems: 'center', gap: '1rem'}}>
                <span style={{color: 'var(--primary)', fontWeight: 'bold', fontSize: '1.3rem'}}>✓</span>
                Todo lo del Plan Estándar
              </li>
              <li style={{padding: '1rem 0', borderBottom: '1px solid #f0f0f0', color: 'var(--text)', fontSize: '1.05rem', display: 'flex', alignItems: 'center', gap: '1rem'}}>
                <span style={{color: 'var(--accent)', fontWeight: 'bold', fontSize: '1.3rem'}}>✨</span>
                Garantía de empleo
              </li>
              <li style={{padding: '1rem 0', borderBottom: '1px solid #f0f0f0', color: 'var(--text)', fontSize: '1.05rem', display: 'flex', alignItems: 'center', gap: '1rem'}}>
                <span style={{color: 'var(--accent)', fontWeight: 'bold', fontSize: '1.3rem'}}>✨</span>
                Certificación oficial incluida
              </li>
              <li style={{padding: '1rem 0', borderBottom: '1px solid #f0f0f0', color: 'var(--text)', fontSize: '1.05rem', display: 'flex', alignItems: 'center', gap: '1rem'}}>
                <span style={{color: 'var(--primary)', fontWeight: 'bold', fontSize: '1.3rem'}}>✓</span>
                Asesoría laboral personalizada
              </li>
              <li style={{padding: '1rem 0', borderBottom: '1px solid #f0f0f0', color: 'var(--text)', fontSize: '1.05rem', display: 'flex', alignItems: 'center', gap: '1rem'}}>
                <span style={{color: 'var(--primary)', fontWeight: 'bold', fontSize: '1.3rem'}}>✓</span>
                Preparación para entrevistas
              </li>
              <li style={{padding: '1rem 0', borderBottom: '1px solid #f0f0f0', color: 'var(--text)', fontSize: '1.05rem', display: 'flex', alignItems: 'center', gap: '1rem'}}>
                <span style={{color: 'var(--primary)', fontWeight: 'bold', fontSize: '1.3rem'}}>✓</span>
                Red de empresas asociadas
              </li>
              <li style={{padding: '1rem 0', color: 'var(--text)', fontSize: '1.05rem', display: 'flex', alignItems: 'center', gap: '1rem'}}>
                <span style={{color: 'var(--primary)', fontWeight: 'bold', fontSize: '1.3rem'}}>✓</span>
                Seguimiento post-graduación
              </li>
            </ul>
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

      {/* Footer */}
      <footer>
        <div className="footer-content">
          <div className="footer-section">
            <h3>Próximo Inicio</h3>
            <div style={{fontFamily: 'Space Grotesk, sans-serif', fontSize: '3rem', color: 'var(--primary)', lineHeight: 1, margin: '1rem 0', fontWeight: 700}}>
              Cada 16 del Mes
            </div>
            <p style={{color: 'var(--text)', fontSize: '1.1rem'}}>¡No te quedes sin lugar!</p>
          </div>

          <div className="footer-section">
            <h3>Contacto</h3>
            <a href="mailto:info@linguaconnect.com">📧 info@linguaconnectacademy.com</a>
            <a href="https://wa.me/525512345678" target="_blank" rel="noreferrer">💬 WhatsApp</a>
            <p style={{marginTop: '1rem'}}>📍 Ciudad de México, México</p>
          </div>

          <div className="footer-section">
            <h3>Legal</h3>
            <a href="/terminos">Términos y Condiciones</a>
            <a href="/privacidad">Política de Privacidad</a>
          </div>
        </div>

        <div className="footer-bottom">
          <p>&copy; 2025 LinguaConnectAcademy. Todos los derechos reservados. | Marco CEFR Oficial</p>
        </div>
      </footer>
    </>
  );
}

export default Home;
ENDOFHOME

echo "✅ Home.jsx actualizado con nuevas fotos y videos" && \

# PASO 2: Crear página de Términos y Condiciones
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
          <p>
            Al inscribirte en LinguaConnectAcademy, aceptas cumplir con estos términos y condiciones. 
            Estos términos rigen tu relación con nuestra academia y el uso de nuestros servicios educativos.
          </p>
        </section>

        <section className="legal-section">
          <h2>2. Características del Servicio</h2>
          <h3>2.1 Grupos Pequeños</h3>
          <ul>
            <li>Nuestros grupos tienen un máximo de 25 personas para garantizar atención personalizada</li>
            <li>Cada estudiante recibe seguimiento individual de su progreso</li>
            <li>Los grupos son organizados por nivel según el marco CEFR</li>
          </ul>

          <h3>2.2 Modalidad Virtual</h3>
          <ul>
            <li>Todas las clases son 100% virtuales en línea</li>
            <li>Se requiere conexión a internet estable</li>
            <li>Plataformas de videoconferencia proporcionadas por la academia</li>
          </ul>
        </section>

        <section className="legal-section highlight-section">
          <h2>3. Garantía de Empleo (Plan Premium)</h2>
          <p className="important-notice">
            ⚠️ La garantía de empleo solo aplica para el Plan Premium y está sujeta al cumplimiento 
            de TODOS los siguientes requisitos:
          </p>

          <h3>3.1 Requisitos de Asistencia - Horario de Lunes a Viernes</h3>
          <div className="requirement-box">
            <h4>✓ Asistencia Mínima: 90%</h4>
            <ul>
              <li>Debes asistir al menos al 90% de todas las clases programadas</li>
              <li><strong>Máximo 3 inasistencias por mes</strong></li>
              <li>Más de 3 inasistencias en un mes <strong>anulan la garantía de empleo</strong></li>
            </ul>

            <h4>✓ Inasistencias Justificadas</h4>
            <ul>
              <li>Las inasistencias pueden ser justificadas con documentación real y verificable</li>
              <li>Justificantes válidos:
                <ul>
                  <li>Incapacidad médica (con documento oficial)</li>
                  <li>Emergencia familiar (con comprobante)</li>
                  <li>Caso fortuito o fuerza mayor (documentado)</li>
                </ul>
              </li>
              <li>Los justificantes deben presentarse dentro de las 48 horas posteriores a la inasistencia</li>
              <li><strong>Importante:</strong> Aún justificadas, las inasistencias cuentan para el límite de 3 por mes</li>
            </ul>
          </div>

          <h3>3.2 Requisitos de Asistencia - Horario Sabatino</h3>
          <div className="requirement-box">
            <h4>✓ Asistencia Mínima: 90%</h4>
            <ul>
              <li>Debes asistir al menos al 90% de todas las clases de sábado</li>
              <li><strong>Máximo 1 inasistencia por mes</strong></li>
              <li>Más de 1 inasistencia en un mes <strong>anula la garantía de empleo</strong></li>
            </ul>

            <h4>✓ Reposición de Clases</h4>
            <ul>
              <li>Los estudiantes sabatinos pueden reponer clases en horario semanal</li>
              <li>Sujeto a disponibilidad de cupo en los grupos de L-V</li>
              <li>Debe solicitarse con al menos 24 horas de anticipación</li>
              <li>La reposición no elimina la inasistencia del registro</li>
            </ul>

            <h4>✓ Mismos Requisitos</h4>
            <ul>
              <li>Todos los demás requisitos (evaluaciones, trabajos, calificaciones) aplican igual</li>
            </ul>
          </div>

          <h3>3.3 Requisitos Académicos</h3>
          <div className="requirement-box">
            <h4>✓ Entrega de Trabajos y Tareas: 80% mínimo</h4>
            <ul>
              <li>Debes entregar al menos el 80% de todos los trabajos y tareas asignadas</li>
              <li>Las entregas deben cumplir con los criterios de calidad establecidos</li>
              <li>Entregas fuera de tiempo pueden no contar para el porcentaje</li>
            </ul>

            <h4>✓ Presentación de Exámenes: 80% mínimo</h4>
            <ul>
              <li>Debes presentar al menos el 80% de todos los exámenes programados</li>
              <li>Los exámenes no presentados cuentan como no aprobados</li>
            </ul>

            <h4>✓ Aprobación de Exámenes: 70% mínimo</h4>
            <ul>
              <li>Debes aprobar al menos el 70% de todos los exámenes presentados</li>
              <li>La calificación de cada examen debe ser mínimo 6.0 para considerarse aprobado</li>
            </ul>

            <h4>✓ Calificación Final del Curso: 8.0 mínimo</h4>
            <ul>
              <li>Tu calificación promedio final del curso debe ser mínimo 8.0</li>
              <li>Esta calificación incluye exámenes, trabajos, tareas y participación</li>
            </ul>
          </div>

          <h3>3.4 Alcance de la Garantía</h3>
          <div className="requirement-box">
            <p><strong>Al cumplir TODOS los requisitos anteriores, LinguaConnectAcademy garantiza:</strong></p>
            <ul>
              <li>✓ Acceso a nuestra red de más de 150 empresas asociadas</li>
              <li>✓ Preparación personalizada para entrevistas laborales</li>
              <li>✓ Optimización de CV y perfil profesional</li>
              <li>✓ Conexión directa con empleadores que buscan profesionales bilingües</li>
              <li>✓ Seguimiento durante tus primeros 3 meses de empleo</li>
            </ul>

            <p className="important-notice">
              <strong>Nota importante:</strong> La garantía de empleo no garantiza un puesto específico, 
              salario específico, ni empresa específica. LinguaConnectAcademy se compromete a conectarte 
              con oportunidades laborales reales y apoyarte en tu proceso de búsqueda de empleo.
            </p>
          </div>

          <h3>3.5 Pérdida de la Garantía</h3>
          <div className="warning-box">
            <p><strong>⚠️ La garantía de empleo se pierde automáticamente si:</strong></p>
            <ul>
              <li>❌ Tienes más de 3 inasistencias en un mes (horario L-V)</li>
              <li>❌ Tienes más de 1 inasistencia en un mes (horario sabatino)</li>
              <li>❌ Tu asistencia total es menor al 90%</li>
              <li>❌ Entregas menos del 80% de trabajos y tareas</li>
              <li>❌ Presentas menos del 80% de exámenes</li>
              <li>❌ Apruebas menos del 70% de los exámenes presentados</li>
              <li>❌ Tu calificación final es menor a 8.0</li>
              <li>❌ Abandonas el curso antes de finalizarlo</li>
              <li>❌ Incumples con las políticas de conducta de la academia</li>
            </ul>
          </div>
        </section>

        <section className="legal-section">
          <h2>4. Pagos y Facturación</h2>
          <h3>4.1 Métodos de Pago</h3>
          <ul>
            <li>Tarjeta de crédito/débito (pago inmediato)</li>
            <li>OXXO (pago en efectivo, válido 3 días)</li>
            <li>Transferencia SPEI (válida 24 horas)</li>
          </ul>

          <h3>4.2 Pagos Mensuales</h3>
          <ul>
            <li>Los pagos son mensuales y deben realizarse antes del día 5 de cada mes</li>
            <li>El retraso en pagos puede resultar en suspensión temporal del servicio</li>
            <li>No se realizan devoluciones por clases no tomadas por decisión del estudiante</li>
          </ul>

          <h3>4.3 Descuentos Estudiantes UNAM y Poli</h3>
          <ul>
            <li>15% de reembolso en el primer pago al presentar credencial vigente</li>
            <li>La credencial debe ser verificable y estar vigente</li>
            <li>Aplica solo para estudiantes activos</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>5. Políticas de Clase</h2>
          <h3>5.1 Puntualidad</h3>
          <ul>
            <li>Las clases inician puntualmente según el horario establecido</li>
            <li>Se recomienda conectarse 5 minutos antes del inicio</li>
            <li>Retrasos mayores a 15 minutos pueden contar como inasistencia</li>
          </ul>

          <h3>5.2 Conducta en Clase</h3>
          <ul>
            <li>Se espera respeto hacia profesores y compañeros</li>
            <li>Mantener cámara encendida durante las clases (salvo situación justificada)</li>
            <li>Participación activa en las actividades</li>
            <li>Conductas inapropiadas pueden resultar en expulsión del programa</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>6. Propiedad Intelectual</h2>
          <ul>
            <li>Todo el material didáctico es propiedad de LinguaConnectAcademy</li>
            <li>Prohibida la reproducción, distribución o venta del material</li>
            <li>El material es para uso personal y educativo únicamente</li>
            <li>Las grabaciones de clase no pueden ser compartidas públicamente</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>7. Certificación</h2>
          <ul>
            <li>Se otorga certificado de finalización al completar el curso exitosamente</li>
            <li>El certificado incluye el nivel CEFR alcanzado</li>
            <li>Plan Premium incluye certificación oficial sin costo adicional</li>
            <li>Plan Estándar puede adquirir certificación oficial por separado</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>8. Cancelación y Reembolsos</h2>
          <h3>8.1 Cancelación por el Estudiante</h3>
          <ul>
            <li>Puedes cancelar tu inscripción antes del inicio del curso con reembolso del 100%</li>
            <li>Después del inicio del curso, no hay reembolsos</li>
            <li>Puedes pausar tu curso por razones médicas documentadas (una vez por año)</li>
          </ul>

          <h3>8.2 Cancelación por la Academia</h3>
          <ul>
            <li>LinguaConnectAcademy se reserva el derecho de cancelar grupos con inscripción insuficiente</li>
            <li>En caso de cancelación por la academia, se ofrece reembolso del 100% o cambio de horario</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>9. Limitación de Responsabilidad</h2>
          <ul>
            <li>LinguaConnectAcademy no es responsable por problemas técnicos del estudiante</li>
            <li>No garantizamos resultados específicos en exámenes externos</li>
            <li>La garantía de empleo está sujeta a los términos especificados en la sección 3</li>
            <li>No nos hacemos responsables por el desempeño laboral posterior a la contratación</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>10. Modificaciones a los Términos</h2>
          <p>
            LinguaConnectAcademy se reserva el derecho de modificar estos términos y condiciones. 
            Los cambios serán notificados por correo electrónico con al menos 15 días de anticipación. 
            El uso continuado del servicio después de los cambios constituye aceptación de los nuevos términos.
          </p>
        </section>

        <section className="legal-section">
          <h2>11. Contacto</h2>
          <p>
            Para cualquier duda o aclaración sobre estos términos y condiciones, puedes contactarnos:
          </p>
          <ul>
            <li>📧 Email: info@linguaconnectacademy.com</li>
            <li>💬 WhatsApp: +52 55 1234 5678</li>
            <li>📍 Ubicación: Ciudad de México, México</li>
          </ul>
        </section>
      </div>

      <div className="legal-footer">
        <button className="btn-primary" onClick={() => navigate('/')}>
          Volver al inicio
        </button>
      </div>
    </div>
  );
}

export default Terminos;
ENDOFTERMINOS

echo "✅ Términos y Condiciones creado" && \

# PASO 3: Crear página de Política de Privacidad
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
          <p>
            En LinguaConnectAcademy, respetamos y protegemos la privacidad de nuestros estudiantes. 
            Esta política describe qué información recopilamos, cómo la utilizamos y cómo la protegemos.
          </p>
        </section>

        <section className="legal-section highlight-section">
          <h2>2. Información que Recopilamos</h2>
          
          <h3>2.1 Información Personal</h3>
          <ul>
            <li>Nombre completo</li>
            <li>Correo electrónico</li>
            <li>Número de teléfono</li>
            <li>Fecha de nacimiento</li>
            <li>País de residencia</li>
          </ul>

          <h3>2.2 Información Académica</h3>
          <ul>
            <li>Nivel de inglés inicial y progreso</li>
            <li>Calificaciones y evaluaciones</li>
            <li>Asistencia a clases</li>
            <li>Trabajos y tareas entregadas</li>
            <li>Certificaciones obtenidas</li>
          </ul>

          <h3>2.3 Información de Pago</h3>
          <ul>
            <li>Método de pago utilizado</li>
            <li>Historial de pagos</li>
            <li><strong>Importante:</strong> No almacenamos información completa de tarjetas de crédito</li>
            <li>Los datos de pago son procesados de forma segura por Conekta</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>3. Uso de la Información</h2>
          
          <div className="requirement-box">
            <h3>3.1 Procesamiento de Pagos</h3>
            <p>Utilizamos tu información para:</p>
            <ul>
              <li>✓ Procesar tus pagos mensuales</li>
              <li>✓ Emitir facturas y recibos</li>
              <li>✓ Gestionar reembolsos cuando aplique</li>
              <li>✓ Verificar descuentos estudiantiles</li>
            </ul>
          </div>

          <div className="requirement-box">
            <h3>3.2 Entrega de Diplomas y Certificaciones</h3>
            <p>Utilizamos tu información para:</p>
            <ul>
              <li>✓ Generar certificados oficiales con tu nombre</li>
              <li>✓ Enviar diplomas digitales y físicos</li>
              <li>✓ Mantener registro de certificaciones otorgadas</li>
              <li>✓ Verificar autenticidad de certificados si es requerido</li>
            </ul>
          </div>

          <div className="requirement-box">
            <h3>3.3 Conexión con Empresas (Solo si el alumno lo solicita)</h3>
            <p>
              <strong>IMPORTANTE:</strong> Solo compartimos tu información con empresas empleadoras 
              si tú lo autorizas explícitamente.
            </p>
            <p>Cuando solicitas ayuda para conseguir empleo, utilizamos tu información para:</p>
            <ul>
              <li>✓ Conectarte con empresas que buscan profesionales bilingües</li>
              <li>✓ Compartir tu CV y nivel de inglés con empleadores potenciales</li>
              <li>✓ Recomendar vacantes acordes a tu perfil</li>
              <li>✓ Coordinar entrevistas con empresas asociadas</li>
            </ul>
            <p className="important-notice">
              ⚠️ Si NO solicitas ayuda laboral, tu información NO será compartida con ninguna empresa.
            </p>
          </div>

          <h3>3.4 Mejora del Servicio Educativo</h3>
          <ul>
            <li>Personalizar tu experiencia de aprendizaje</li>
            <li>Mejorar nuestros métodos de enseñanza</li>
            <li>Analizar el progreso general de los estudiantes</li>
            <li>Desarrollar nuevo material didáctico</li>
          </ul>

          <h3>3.5 Comunicación</h3>
          <ul>
            <li>Enviar recordatorios de clases</li>
            <li>Notificar sobre cambios de horario</li>
            <li>Compartir material de estudio</li>
            <li>Enviar información sobre nuevos cursos (puedes darte de baja en cualquier momento)</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>4. Protección de tu Información</h2>
          
          <h3>4.1 Medidas de Seguridad</h3>
          <ul>
            <li>🔒 Encriptación SSL/TLS para todas las transmisiones de datos</li>
            <li>🔒 Servidores seguros con acceso restringido</li>
            <li>🔒 Respaldos periódicos de información</li>
            <li>🔒 Autenticación de dos factores para acceso administrativo</li>
          </ul>

          <h3>4.2 Acceso a la Información</h3>
          <p><strong>¿Quién tiene acceso a tu información?</strong></p>
          <ul>
            <li>✓ Personal autorizado de LinguaConnectAcademy</li>
            <li>✓ Profesores asignados a tus clases (solo información académica)</li>
            <li>✓ Procesadores de pago (Conekta) para transacciones</li>
            <li>✓ Empresas empleadoras (solo si TÚ lo autorizas)</li>
          </ul>

          <h3>4.3 Lo que NO hacemos con tu información</h3>
          <div className="warning-box">
            <p><strong>❌ NUNCA:</strong></p>
            <ul>
              <li>❌ Vendemos tu información personal a terceros</li>
              <li>❌ Compartimos tu información con fines publicitarios</li>
              <li>❌ Enviamos tu información a empresas sin tu consentimiento</li>
              <li>❌ Publicamos tus calificaciones o información académica</li>
            </ul>
          </div>
        </section>

        <section className="legal-section">
          <h2>5. Tus Derechos</h2>
          
          <h3>5.1 Acceso a tu Información</h3>
          <ul>
            <li>Puedes solicitar una copia de toda la información que tenemos sobre ti</li>
            <li>Respondemos a solicitudes en un máximo de 15 días hábiles</li>
          </ul>

          <h3>5.2 Corrección de Datos</h3>
          <ul>
            <li>Puedes solicitar corrección de información incorrecta</li>
            <li>Puedes actualizar tus datos de contacto en cualquier momento</li>
          </ul>

          <h3>5.3 Eliminación de Datos</h3>
          <ul>
            <li>Puedes solicitar la eliminación de tu información personal</li>
            <li>Algunas informaciones (historial académico, pagos) deben conservarse por obligaciones legales</li>
            <li>La eliminación puede tardar hasta 30 días en completarse</li>
          </ul>

          <h3>5.4 Portabilidad</h3>
          <ul>
            <li>Puedes solicitar tus datos en formato electrónico portable</li>
            <li>Puedes transferir tus datos a otro servicio educativo</li>
          </ul>

          <h3>5.5 Oposición al Uso de Datos</h3>
          <ul>
            <li>Puedes oponerte al uso de tus datos para fines de marketing</li>
            <li>Puedes retirar tu consentimiento para compartir información con empresas</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>6. Cookies y Tecnologías Similares</h2>
          <ul>
            <li>Utilizamos cookies para mejorar tu experiencia en nuestro sitio web</li>
            <li>Las cookies nos ayudan a recordar tus preferencias</li>
            <li>Puedes desactivar las cookies en tu navegador</li>
            <li>Algunas funcionalidades pueden no estar disponibles sin cookies</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>7. Compartir Información con Terceros</h2>
          
          <h3>7.1 Procesadores de Servicios</h3>
          <p>Compartimos información limitada con:</p>
          <ul>
            <li><strong>Conekta:</strong> Para procesar pagos de forma segura</li>
            <li><strong>Proveedores de email:</strong> Para enviar comunicaciones</li>
            <li><strong>Servicios de videoconferencia:</strong> Para impartir clases virtuales</li>
          </ul>
          <p>Todos estos proveedores están obligados contractualmente a proteger tu información.</p>

          <h3>7.2 Empresas Empleadoras</h3>
          <ul>
            <li>Solo compartimos información si TÚ lo solicitas para búsqueda de empleo</li>
            <li>Compartimos solo información relevante (nivel de inglés, certificaciones, CV)</li>
            <li>Las empresas deben cumplir con políticas de privacidad</li>
            <li>Puedes revocar tu autorización en cualquier momento</li>
          </ul>

          <h3>7.3 Requerimientos Legales</h3>
          <ul>
            <li>Podemos compartir información si es requerido por ley</li>
            <li>Cooperamos con autoridades cuando es legalmente necesario</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>8. Retención de Datos</h2>
          <ul>
            <li><strong>Información personal:</strong> Mientras seas estudiante activo + 5 años</li>
            <li><strong>Información académica:</strong> 10 años para verificación de certificados</li>
            <li><strong>Información de pagos:</strong> 10 años por obligaciones fiscales</li>
            <li>Puedes solicitar eliminación anticipada excepto donde sea legalmente requerido</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>9. Transferencias Internacionales</h2>
          <ul>
            <li>Tu información se almacena principalmente en servidores en México</li>
            <li>Algunos servicios pueden usar servidores en Estados Unidos</li>
            <li>Todos los servidores cumplen con estándares internacionales de seguridad</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>10. Menores de Edad</h2>
          <ul>
            <li>Aceptamos estudiantes mayores de 16 años</li>
            <li>Menores de 18 requieren consentimiento de padre o tutor</li>
            <li>Los padres tienen derecho de acceder a la información de sus hijos menores</li>
          </ul>
        </section>

        <section className="legal-section">
          <h2>11. Cambios a esta Política</h2>
          <p>
            Podemos actualizar esta política de privacidad ocasionalmente. Te notificaremos de cambios 
            significativos por correo electrónico. La fecha de última actualización siempre estará visible 
            al inicio de este documento.
          </p>
        </section>

        <section className="legal-section">
          <h2>12. Contacto</h2>
          <p>
            Si tienes preguntas sobre esta política de privacidad o quieres ejercer tus derechos, contáctanos:
          </p>
          <ul>
            <li>📧 Email: privacidad@linguaconnectacademy.com</li>
            <li>💬 WhatsApp: +52 55 1234 5678</li>
            <li>📍 Ubicación: Ciudad de México, México</li>
          </ul>
          <p>
            <strong>Oficial de Protección de Datos:</strong> Responderemos a tu solicitud en un máximo de 15 días hábiles.
          </p>
        </section>
      </div>

      <div className="legal-footer">
        <button className="btn-primary" onClick={() => navigate('/')}>
          Volver al inicio
        </button>
      </div>
    </div>
  );
}

export default Privacidad;
ENDOFPRIVACIDAD

echo "✅ Política de Privacidad creada" && \

# PASO 4: Agregar estilos CSS para páginas legales y testimonios
cat >> App.css << 'ENDOFCSS'

/* ========================================
   ESTILOS PARA TESTIMONIOS CON VIDEO
   ======================================== */

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

.testimonials-video::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(255, 255, 255, 0.92);
  z-index: 1;
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

/* ========================================
   PÁGINAS LEGALES
   ======================================== */

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
  margin-bottom: 1rem;
  padding: 0.5rem 0;
  transition: all 0.3s;
}

.btn-back:hover {
  color: var(--secondary);
  transform: translateX(-5px);
}

.legal-header h1 {
  color: var(--primary);
  margin: 1rem 0 0.5rem 0;
  font-size: 2.5rem;
}

.legal-date {
  color: var(--text-secondary);
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
  margin-bottom: 1.5rem;
  font-size: 1.8rem;
}

.legal-section h3 {
  color: var(--secondary);
  margin: 1.5rem 0 1rem 0;
  font-size: 1.3rem;
}

.legal-section h4 {
  color: var(--text);
  margin: 1rem 0 0.5rem 0;
  font-size: 1.1rem;
}

.legal-section p {
  margin-bottom: 1rem;
  color: var(--text);
}

.legal-section ul {
  margin: 1rem 0;
  padding-left: 2rem;
}

.legal-section li {
  margin: 0.5rem 0;
  color: var(--text);
}

.legal-section ul ul {
  margin-top: 0.5rem;
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

.requirement-box h4 {
  color: var(--primary);
  margin-bottom: 1rem;
}

.warning-box {
  background: #fff3e0;
  padding: 1.5rem;
  border-radius: 8px;
  margin: 1.5rem 0;
  border-left: 4px solid #ff6f00;
}

.warning-box strong {
  color: #ff6f00;
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
  
  .legal-section h2 {
    font-size: 1.5rem;
  }
  
  .legal-section h3 {
    font-size: 1.2rem;
  }
}

ENDOFCSS

echo "✅ Estilos CSS agregados" && \

# PASO 5: Actualizar main.jsx con las nuevas rutas
cat > main.jsx << 'ENDOFMAIN'
import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import App from './App.jsx'
import Home from './Home.jsx'
import PaymentForm from './PaymentForm.jsx'
import Terminos from './Terminos.jsx'
import Privacidad from './Privacidad.jsx'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<App />}>
          <Route index element={<Home />} />
          <Route path="pago" element={<PaymentForm />} />
          <Route path="terminos" element={<Terminos />} />
          <Route path="privacidad" element={<Privacidad />} />
        </Route>
      </Routes>
    </BrowserRouter>
  </React.StrictMode>,
)
ENDOFMAIN

echo "✅ Rutas actualizadas" && \

echo "" && echo "========================================" && \
echo "✅ ACTUALIZACIÓN COMPLETA" && echo "" && \
echo "📸 Fotos actualizadas:" && \
echo "   - Camila Rodríguez (nueva foto Colombia)" && \
echo "   - Elizabeth Hernández (nueva foto México, home office USA)" && \
echo "   - Carlos Mendoza (nueva foto Colombia)" && \
echo "   - Sofía Ramírez (nueva foto CDMX)" && echo "" && \
echo "🎥 Videos actualizados:" && \
echo "   - Garantía de empleabilidad: Video oficina trabajando" && \
echo "   - Testimonios: Video de éxito y logros" && echo "" && \
echo "📄 Páginas legales creadas:" && \
echo "   - /terminos - Términos y Condiciones completos" && \
echo "   - /privacidad - Política de Privacidad" && echo "" && \
echo "✨ Requisitos de garantía de empleo:" && \
echo "   - Asistencia 90% mínimo" && \
echo "   - L-V: máx 3 inasistencias/mes" && \
echo "   - Sábados: máx 1 inasistencia/mes" && \
echo "   - 80% trabajos y exámenes" && \
echo "   - 70% exámenes aprobados" && \
echo "   - Calificación final 8.0 mínimo" && echo "" && \
echo "🚀 Para iniciar:" && \
echo "   cd ~/linguaconnect && npm run dev" && echo "" && \
echo "========================================"