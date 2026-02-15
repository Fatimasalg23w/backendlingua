const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const dotenv = require('dotenv');

dotenv.config();

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// MongoDB Connection
const MONGODB_URI = process.env.MONGODB_URI || 'mongodb+srv://user1:<db_password>@cluster0.zuf8rtl.mongodb.net/cluster0?retryWrites=true&w=majority';

mongoose.connect(MONGODB_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(() => console.log('✅ Conectado a MongoDB'))
.catch(err => console.error('❌ Error de conexión a MongoDB:', err));

// Schemas
const alumnoSchema = new mongoose.Schema({
  nombre: { type: String, required: true },
  correo: { type: String, required: true, unique: true },
  telefono: { type: String, required: true },
  horario: { type: String, required: true },
  nivelEstimado: { type: String, required: true },
  plan: { type: String, required: true },
  pagoId: { type: String },
  montoPagado: { type: Number, required: true },
  cuponAplicado: { type: String, default: null },
  descuentoAplicado: { type: Number, default: 0 },
  citaExamen: { type: Date },
  estadoPago: { type: String, enum: ['pendiente', 'completado', 'fallido'], default: 'pendiente' },
  estadoExamen: { type: String, enum: ['pendiente', 'realizado', 'aprobado', 'reprobado'], default: 'pendiente' },
  nivelAsignado: { type: String },
  fechaInscripcion: { type: Date, default: Date.now },
});

const cuponSchema = new mongoose.Schema({
  codigo: { type: String, required: true, unique: true, uppercase: true },
  descuento: { type: Number, required: true }, // Porcentaje de descuento
  tipo: { type: String, enum: ['porcentaje', 'monto'], default: 'porcentaje' },
  activo: { type: Boolean, default: true },
  fechaExpiracion: { type: Date },
  usosMaximos: { type: Number, default: null },
  usosActuales: { type: Number, default: 0 },
  aplicableA: { type: [String], default: [] }, // ['estandar', 'premium'] o vacío para todos
  fechaCreacion: { type: Date, default: Date.now },
});

const citaSchema = new mongoose.Schema({
  alumnoId: { type: mongoose.Schema.Types.ObjectId, ref: 'Alumno', required: true },
  fechaHora: { type: Date, required: true },
  duracion: { type: Number, default: 60 }, // minutos
  tipo: { type: String, enum: ['examen', 'seguimiento', 'consulta'], default: 'examen' },
  estado: { type: String, enum: ['programada', 'completada', 'cancelada', 'reprogramada'], default: 'programada' },
  linkVideoLlamada: { type: String },
  notas: { type: String },
  fechaCreacion: { type: Date, default: Date.now },
});

// Models
const Alumno = mongoose.model('Alumno', alumnoSchema);
const Cupon = mongoose.model('Cupon', cuponSchema);
const Cita = mongoose.model('Cita', citaSchema);

// ==================== RUTAS ====================

// Verificar cupón
app.post('/api/cupones/verificar', async (req, res) => {
  try {
    const { codigo, plan } = req.body;

    const cupon = await Cupon.findOne({ 
      codigo: codigo.toUpperCase(),
      activo: true 
    });

    if (!cupon) {
      return res.status(404).json({ 
        valido: false, 
        mensaje: 'Cupón no válido o expirado' 
      });
    }

    // Verificar fecha de expiración
    if (cupon.fechaExpiracion && new Date(cupon.fechaExpiracion) < new Date()) {
      return res.status(400).json({ 
        valido: false, 
        mensaje: 'Cupón expirado' 
      });
    }

    // Verificar usos máximos
    if (cupon.usosMaximos && cupon.usosActuales >= cupon.usosMaximos) {
      return res.status(400).json({ 
        valido: false, 
        mensaje: 'Cupón agotado' 
      });
    }

    // Verificar si aplica al plan
    if (cupon.aplicableA.length > 0 && !cupon.aplicableA.includes(plan)) {
      return res.status(400).json({ 
        valido: false, 
        mensaje: 'Cupón no aplicable a este plan' 
      });
    }

    res.json({ 
      valido: true, 
      descuento: cupon.descuento,
      tipo: cupon.tipo,
      mensaje: `¡Cupón válido! ${cupon.descuento}% de descuento aplicado`
    });

  } catch (error) {
    console.error('Error al verificar cupón:', error);
    res.status(500).json({ 
      valido: false, 
      mensaje: 'Error al verificar el cupón' 
    });
  }
});

// Procesar pago e inscripción
app.post('/api/inscripcion', async (req, res) => {
  try {
    const {
      nombre,
      correo,
      telefono,
      horario,
      nivelEstimado,
      plan,
      pagoId,
      montoPagado,
      cuponCodigo,
      descuentoAplicado,
      citaExamen
    } = req.body;

    // Si hay cupón, incrementar usos
    if (cuponCodigo) {
      await Cupon.findOneAndUpdate(
        { codigo: cuponCodigo.toUpperCase() },
        { $inc: { usosActuales: 1 } }
      );
    }

    // Crear alumno
    const alumno = new Alumno({
      nombre,
      correo,
      telefono,
      horario,
      nivelEstimado,
      plan,
      pagoId,
      montoPagado,
      cuponAplicado: cuponCodigo || null,
      descuentoAplicado: descuentoAplicado || 0,
      citaExamen: citaExamen || null,
      estadoPago: 'completado'
    });

    await alumno.save();

    // Crear cita para examen si se proporcionó fecha
    let cita = null;
    if (citaExamen) {
      cita = new Cita({
        alumnoId: alumno._id,
        fechaHora: new Date(citaExamen),
        tipo: 'examen',
        linkVideoLlamada: `https://meet.linguaconnect.com/${alumno._id}` // Placeholder
      });
      await cita.save();
    }

    res.status(201).json({ 
      success: true,
      mensaje: 'Inscripción completada exitosamente',
      alumno: {
        id: alumno._id,
        nombre: alumno.nombre,
        correo: alumno.correo,
        plan: alumno.plan
      },
      cita: cita ? {
        id: cita._id,
        fechaHora: cita.fechaHora,
        linkVideoLlamada: cita.linkVideoLlamada
      } : null
    });

  } catch (error) {
    console.error('Error en inscripción:', error);
    
    if (error.code === 11000) {
      return res.status(400).json({ 
        success: false,
        mensaje: 'Este correo ya está registrado' 
      });
    }

    res.status(500).json({ 
      success: false,
      mensaje: 'Error al procesar la inscripción' 
    });
  }
});

// Obtener horarios disponibles para citas
app.get('/api/citas/disponibles', async (req, res) => {
  try {
    const { fecha } = req.query; // Formato: YYYY-MM-DD

    const inicioFecha = new Date(fecha);
    inicioFecha.setHours(0, 0, 0, 0);
    
    const finFecha = new Date(fecha);
    finFecha.setHours(23, 59, 59, 999);

    // Obtener citas ya programadas para ese día
    const citasProgramadas = await Cita.find({
      fechaHora: {
        $gte: inicioFecha,
        $lte: finFecha
      },
      estado: 'programada'
    });

    // Horarios disponibles (9 AM - 6 PM, cada hora)
    const horariosDisponibles = [];
    const horaInicio = 9;
    const horaFin = 18;

    for (let hora = horaInicio; hora < horaFin; hora++) {
      const horaCompleta = new Date(fecha);
      horaCompleta.setHours(hora, 0, 0, 0);

      // Verificar si ya hay una cita a esa hora
      const ocupado = citasProgramadas.some(cita => {
        const horaCita = new Date(cita.fechaHora).getHours();
        return horaCita === hora;
      });

      if (!ocupado) {
        horariosDisponibles.push({
          hora: `${hora}:00`,
          disponible: true,
          fechaHora: horaCompleta
        });
      }
    }

    res.json({ 
      fecha,
      horariosDisponibles 
    });

  } catch (error) {
    console.error('Error al obtener horarios:', error);
    res.status(500).json({ 
      mensaje: 'Error al obtener horarios disponibles' 
    });
  }
});

// Crear cupón (ruta administrativa)
app.post('/api/cupones', async (req, res) => {
  try {
    const cupon = new Cupon(req.body);
    await cupon.save();
    
    res.status(201).json({ 
      success: true,
      mensaje: 'Cupón creado exitosamente',
      cupon 
    });

  } catch (error) {
    console.error('Error al crear cupón:', error);
    res.status(500).json({ 
      success: false,
      mensaje: 'Error al crear el cupón' 
    });
  }
});

// Obtener todos los alumnos (ruta administrativa)
app.get('/api/alumnos', async (req, res) => {
  try {
    const alumnos = await Alumno.find().sort({ fechaInscripcion: -1 });
    res.json({ alumnos });
  } catch (error) {
    console.error('Error al obtener alumnos:', error);
    res.status(500).json({ mensaje: 'Error al obtener alumnos' });
  }
});

// Obtener un alumno por ID
app.get('/api/alumnos/:id', async (req, res) => {
  try {
    const alumno = await Alumno.findById(req.params.id);
    
    if (!alumno) {
      return res.status(404).json({ mensaje: 'Alumno no encontrado' });
    }

    const citas = await Cita.find({ alumnoId: alumno._id });

    res.json({ alumno, citas });
  } catch (error) {
    console.error('Error al obtener alumno:', error);
    res.status(500).json({ mensaje: 'Error al obtener alumno' });
  }
});

// Health check
app.get('/api/health', (req, res) => {
  res.json({ 
    status: 'OK', 
    message: 'API LinguaConnect funcionando correctamente',
    timestamp: new Date().toISOString()
  });
});

// Puerto
const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`🚀 Servidor corriendo en puerto ${PORT}`);
});

module.exports = app;
