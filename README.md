# LinguaConnect Academy - Sistema de Inscripción

Sistema completo de inscripción con pago, cupones y agendamiento de citas para exámenes de nivelación.

## 🚀 Características

- ✅ Procesamiento de pagos con validación
- ✅ Sistema de cupones de descuento
- ✅ Agendamiento de citas para exámenes
- ✅ Integración con MongoDB
- ✅ API REST completa
- ✅ Interfaz de usuario moderna con React

## 📋 Prerequisitos

- Node.js (v16 o superior)
- MongoDB Atlas cuenta (ya tienes el cluster)
- npm o yarn

## 🛠️ Instalación

### 1. Backend (API)

```bash
# Instalar dependencias
npm install

# Configurar variables de entorno
cp .env.example .env
```

Edita el archivo `.env` y agrega tu contraseña de MongoDB:

```env
MONGODB_URI=mongodb+srv://user1:TU_PASSWORD_AQUI@cluster0.zuf8rtl.mongodb.net/cluster0?retryWrites=true&w=majority
PORT=5000
```

```bash
# Crear cupones de ejemplo en la base de datos
npm run seed

# Iniciar el servidor
npm start

# O en modo desarrollo (con auto-reload)
npm run dev
```

El servidor estará corriendo en `http://localhost:5000`

### 2. Frontend (React)

```bash
# En la carpeta del frontend
cd frontend

# Instalar dependencias
npm install

# Crear archivo .env
echo "VITE_API_URL=http://localhost:5000/api" > .env

# Iniciar el servidor de desarrollo
npm run dev
```

La aplicación estará corriendo en `http://localhost:5173`

## 📁 Estructura del Proyecto

```
linguaconnect/
├── backend/
│   ├── server.js              # Servidor principal
│   ├── package.json
│   ├── .env.example
│   └── scripts/
│       └── seedCupones.js     # Script para crear cupones
│
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   ├── Pago.jsx              # Página de pago
│   │   │   ├── Pago.css
│   │   │   ├── SeleccionarCita.jsx   # Selección de cita
│   │   │   ├── SeleccionarCita.css
│   │   │   ├── Confirmacion.jsx      # Confirmación
│   │   │   └── Confirmacion.css
│   │   ├── App.jsx            # Componente principal actualizado
│   │   └── App.css
│   └── package.json
│
└── README.md
```

## 🔄 Flujo de Inscripción

1. **Inicio**: Usuario selecciona un plan (Estándar o Premium)
2. **Pago**: Redirige a `/pago` donde ingresa:
   - Información personal
   - Nivel estimado de inglés
   - Cupón de descuento (opcional)
   - Datos de pago
3. **Cita**: Después de pago exitoso, redirige a `/seleccionar-cita`:
   - Selecciona fecha para examen
   - Selecciona hora disponible
4. **Confirmación**: Muestra detalles de inscripción y cita programada
5. **Email**: Sistema envía correo con link de videollamada

## 🎫 Cupones Pre-creados

Al ejecutar `npm run seed`, se crean estos cupones:

| Código | Descuento | Aplicable a | Usos Máximos |
|--------|-----------|-------------|--------------|
| BIENVENIDA20 | 20% | Todos | 100 |
| UNAM15 | 15% | Todos | 50 |
| POLI15 | 15% | Todos | 50 |
| PREMIUM10 | 10% | Solo Premium | Ilimitado |
| REFERIDO | 25% | Todos | Ilimitado |

## 📡 API Endpoints

### Cupones

```http
POST /api/cupones/verificar
Content-Type: application/json

{
  "codigo": "BIENVENIDA20",
  "plan": "estandar"
}
```

### Inscripción

```http
POST /api/inscripcion
Content-Type: application/json

{
  "nombre": "Juan Pérez",
  "correo": "juan@ejemplo.com",
  "telefono": "+52 55 1234 5678",
  "horario": "lunes-viernes-noche",
  "nivelEstimado": "B1",
  "plan": "Estándar - $1,725 MXN/mes",
  "pagoId": "PAY-123456",
  "montoPagado": 1380,
  "cuponCodigo": "BIENVENIDA20",
  "descuentoAplicado": 20,
  "citaExamen": "2025-03-15T14:00:00.000Z"
}
```

### Horarios Disponibles

```http
GET /api/citas/disponibles?fecha=2025-03-15
```

### Crear Cupón (Admin)

```http
POST /api/cupones
Content-Type: application/json

{
  "codigo": "DESCUENTO30",
  "descuento": 30,
  "tipo": "porcentaje",
  "activo": true,
  "fechaExpiracion": "2025-12-31",
  "usosMaximos": 50,
  "aplicableA": ["premium"]
}
```

## 🗄️ Colecciones de MongoDB

### alumnos
```javascript
{
  _id: ObjectId,
  nombre: String,
  correo: String (único),
  telefono: String,
  horario: String,
  nivelEstimado: String,
  plan: String,
  pagoId: String,
  montoPagado: Number,
  cuponAplicado: String,
  descuentoAplicado: Number,
  citaExamen: Date,
  estadoPago: String, // 'pendiente' | 'completado' | 'fallido'
  estadoExamen: String, // 'pendiente' | 'realizado' | 'aprobado' | 'reprobado'
  nivelAsignado: String,
  fechaInscripcion: Date
}
```

### cupones
```javascript
{
  _id: ObjectId,
  codigo: String (único, uppercase),
  descuento: Number,
  tipo: String, // 'porcentaje' | 'monto'
  activo: Boolean,
  fechaExpiracion: Date,
  usosMaximos: Number,
  usosActuales: Number,
  aplicableA: [String], // ['estandar', 'premium'] o []
  fechaCreacion: Date
}
```

### citas
```javascript
{
  _id: ObjectId,
  alumnoId: ObjectId (ref: 'Alumno'),
  fechaHora: Date,
  duracion: Number, // minutos
  tipo: String, // 'examen' | 'seguimiento' | 'consulta'
  estado: String, // 'programada' | 'completada' | 'cancelada' | 'reprogramada'
  linkVideoLlamada: String,
  notas: String,
  fechaCreacion: Date
}
```

## 🔧 Configuración de React Router

Asegúrate de tener instalado React Router:

```bash
npm install react-router-dom
```

Actualiza tu `main.jsx`:

```javascript
import { BrowserRouter } from 'react-router-dom';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </React.StrictMode>,
);
```

## 🎨 Variables CSS Necesarias

Asegúrate de que tu `App.css` tenga estas variables:

```css
:root {
  --primary: #a78bfa;
  --primary-dark: #8b5cf6;
  --accent: #67e8f9;
  --accent-dark: #22d3ee;
  --mint: #99f6e4;
  --purple-light: #c4b5fd;
  --lavender: #e9d5ff;
  --bg: #ffffff;
  --bg-alt: #faf5ff;
  --text: #374151;
  --text-light: #9ca3af;
  --border: #e9ecef;
  --gray-dark: #6b7280;
  --black: #1f2937;
}
```

## 📝 Notas Importantes

1. **Seguridad**: En producción, implementa:
   - Autenticación JWT para rutas admin
   - Validación de datos en backend
   - Rate limiting
   - HTTPS obligatorio
   - Integración real de pagos (Stripe, PayPal, etc.)

2. **Emails**: Integra un servicio de email como:
   - SendGrid
   - AWS SES
   - Mailgun

3. **Videollamadas**: Integra un servicio real como:
   - Zoom API
   - Google Meet API
   - Jitsi
   - Daily.co

## 🚀 Despliegue

### Backend (Render, Railway, Heroku)

```bash
# Asegúrate de tener estas variables de entorno
MONGODB_URI=tu_url_de_mongodb
PORT=5000
NODE_ENV=production
```

### Frontend (Vercel, Netlify)

```bash
# Variable de entorno
VITE_API_URL=https://tu-api.com/api
```

## 📞 Soporte

Para problemas o preguntas:
- Email: info@linguaconnectacademy.com
- WhatsApp: +52 55 1234 5678

## 📄 Licencia

MIT License - LinguaConnect Academy 2025
