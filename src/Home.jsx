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

      {/* University Discount Section - VIDEO ACTUALIZADO */}
      <section className="university-discount">
        <video className="discount-video" autoPlay muted loop playsInline>
          <source src="https://videos.pexels.com/video-files/8061031/8061031-uhd_2560_1440_25fps.mp4" type="video/mp4" />
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

      {/* Employment Guarantee Section - VIDEO AGREGADO */}
      <section className="employment-guarantee">
        <video className="employment-video" autoPlay muted loop playsInline>
          <source src="https://videos.pexels.com/video-files/7591981/7591981-uhd_2560_1440_25fps.mp4" type="video/mp4" />
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

      {/* Testimonials Section - VIDEO ACTUALIZADO */}
      <section className="section testimonials-section">
        <video className="testimonials-video" autoPlay muted loop playsInline>
          <source src="https://videos.pexels.com/video-files/8061031/8061031-uhd_2560_1440_25fps.mp4" type="video/mp4" />
        </video>
        <div className="testimonials-content">
          <h2 className="section-title">Historias de Éxito</h2>
          <p className="section-subtitle">Estudiantes de toda Latinoamérica transformando sus carreras</p>
          <div className="testimonials-grid">
            
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

      {/* Pricing Section - PLAN PREMIUM CORREGIDO */}
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

          {/* Plan Premium - CORREGIDO */}
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
