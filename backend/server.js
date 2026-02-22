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

mongoose.connect(MONGODB_URI)
.then(() => console.log('✅ Conectado a MongoDB'))
.catch(err => console.error('❌ Error de conexión a MongoDB:', err));

// ==================== SCHEMAS ====================

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
  descuento: { type: Number, required: true },
  tipo: { type: String, enum: ['porcentaje', 'monto'], default: 'porcentaje' },
  activo: { type: Boolean, default: true },
  fechaExpiracion: { type: Date },
  usosMaximos: { type: Number, default: null },
  usosActuales: { type: Number, default: 0 },
  aplicableA: { type: [String], default: [] },
  fechaCreacion: { type: Date, default: Date.now },
});

const citaSchema = new mongoose.Schema({
  alumnoId: { type: mongoose.Schema.Types.ObjectId, ref: 'Alumno', required: true },
  fechaHora: { type: Date, required: true },
  duracion: { type: Number, default: 60 },
  tipo: { type: String, enum: ['examen', 'seguimiento', 'consulta'], default: 'examen' },
  estado: { type: String, enum: ['programada', 'completada', 'cancelada', 'reprogramada'], default: 'programada' },
  linkVideoLlamada: { type: String },
  notas: { type: String },
  fechaCreacion: { type: Date, default: Date.now },
});

const Alumno = mongoose.model('Alumno', alumnoSchema);
const Cupon = mongoose.model('Cupon', cuponSchema);
const Cita = mongoose.model('Cita', citaSchema);

// ==================== RUTAS CONEKTA ====================

app.post('/api/payment/create-order', async (req, res) => {
  try {
    const {
      nombre,
      correo,
      telefono,
      plan,
      montoPagado,
      cuponCodigo,
      nivelEstimado,
      horario
    } = req.body;

    if (!nombre || !correo || !montoPagado || !plan) {
      return res.status(400).json({ success: false, mensaje: 'Faltan datos requeridos' });
    }

    // Conekta trabaja en centavos
    const montoCentavos = Math.round(Number(montoPagado) * 100);

    const FRONTEND_URL = process.env.FRONTEND_URL || 'http://localhost:5173';
    const CONEKTA_KEY = process.env.CONEKTA_PRIVATE_KEY;

    if (!CONEKTA_KEY) {
      return res.status(500).json({ success: false, mensaje: 'Conekta no configurado en el servidor' });
    }

    // Llamada directa a la API de Conekta v2 con fetch nativo
    const conektaResponse = await fetch('https://api.conekta.io/orders', {
      method: 'POST',
      headers: {
        'Accept': 'application/vnd.conekta-v2.1.0+json',
        'Content-Type': 'application/json',
        'Authorization': `Basic ${Buffer.from(CONEKTA_KEY + ':').toString('base64')}`
      },
      body: JSON.stringify({
        currency: 'MXN',
        customer_info: {
          name: nombre,
          email: correo,
          phone: telefono?.replace(/\D/g, '').length >= 10
            ? `+52${telefono.replace(/\D/g, '').slice(-10)}`
            : '+5215500000000'
        },
        line_items: [{
          name: `LinguaConnect — ${plan}`,
          unit_price: montoCentavos,
          quantity: 1
        }],
        checkout: {
          type: 'HostedPayment',
          allowed_payment_methods: ['card', 'cash', 'bank_transfer'],
          success_url: `${FRONTEND_URL}/seleccionar-cita`,
          failure_url: `${FRONTEND_URL}/pago`,
          monthly_installments_enabled: false,
          redirection_time: 5
        },
        metadata: {
          cupon: cuponCodigo || '',
          nivel: nivelEstimado || '',
          horario: horario || ''
        }
      })
    });

    const ordenData = await conektaResponse.json();

    if (!conektaResponse.ok) {
      console.error('Error Conekta:', ordenData);
      return res.status(400).json({
        success: false,
        mensaje: ordenData.details?.[0]?.message || 'Error al crear la orden en Conekta'
      });
    }

    res.json({
      success: true,
      checkout_url: ordenData.checkout?.url,
      order_id: ordenData.id
    });

  } catch (error) {
    console.error('Error en /payment/create-order:', error);
    res.status(500).json({ success: false, mensaje: 'Error interno del servidor' });
  }
});

// Webhook de Conekta — se llama automáticamente cuando el pago es confirmado
app.post('/api/payment/webhook', express.raw({ type: 'application/json' }), async (req, res) => {
  try {
    const evento = JSON.parse(req.body.toString());

    if (evento.type === 'order.paid') {
      const orden = evento.data.object;
      // Actualizar estado del alumno si ya fue registrado
      await Alumno.findOneAndUpdate(
        { correo: orden.customer_info?.email },
        { estadoPago: 'completado', pagoId: orden.id }
      );
      console.log('✅ Pago confirmado vía webhook:', orden.customer_info?.email);
    }

    res.json({ received: true });
  } catch (error) {
    console.error('Error en webhook:', error);
    res.status(400).json({ error: 'Webhook error' });
  }
});

// ==================== RUTAS CUPONES ====================

app.post('/api/cupones/verificar', async (req, res) => {
  try {
    const { codigo, plan } = req.body;
    const cupon = await Cupon.findOne({ codigo: codigo.toUpperCase(), activo: true });

    if (!cupon) {
      return res.status(404).json({ valido: false, mensaje: 'Cupón no válido o expirado' });
    }
    if (cupon.fechaExpiracion && new Date(cupon.fechaExpiracion) < new Date()) {
      return res.status(400).json({ valido: false, mensaje: 'Cupón expirado' });
    }
    if (cupon.usosMaximos && cupon.usosActuales >= cupon.usosMaximos) {
      return res.status(400).json({ valido: false, mensaje: 'Cupón agotado' });
    }
    if (cupon.aplicableA.length > 0 && !cupon.aplicableA.includes(plan)) {
      return res.status(400).json({ valido: false, mensaje: 'Cupón no aplicable a este plan' });
    }

    res.json({
      valido: true,
      descuento: cupon.descuento,
      tipo: cupon.tipo,
      mensaje: `¡Cupón válido! ${cupon.descuento}% de descuento aplicado`
    });
  } catch (error) {
    console.error('Error al verificar cupón:', error);
    res.status(500).json({ valido: false, mensaje: 'Error al verificar el cupón' });
  }
});

app.post('/api/cupones', async (req, res) => {
  try {
    const cupon = new Cupon(req.body);
    await cupon.save();
    res.status(201).json({ success: true, mensaje: 'Cupón creado exitosamente', cupon });
  } catch (error) {
    res.status(500).json({ success: false, mensaje: 'Error al crear el cupón' });
  }
});

// ==================== RUTAS INSCRIPCIÓN ====================

app.post('/api/inscripcion', async (req, res) => {
  try {
    const {
      nombre, correo, telefono, horario, nivelEstimado, plan,
      pagoId, montoPagado, cuponCodigo, descuentoAplicado, citaExamen
    } = req.body;

    if (cuponCodigo) {
      await Cupon.findOneAndUpdate(
        { codigo: cuponCodigo.toUpperCase() },
        { $inc: { usosActuales: 1 } }
      );
    }

    // Si el alumno ya existe (por webhook), actualizarlo; si no, crearlo
    let alumno = await Alumno.findOne({ correo });
    if (alumno) {
      alumno.citaExamen = citaExamen || null;
      alumno.estadoPago = 'completado';
      await alumno.save();
    } else {
      alumno = new Alumno({
        nombre, correo, telefono, horario, nivelEstimado, plan,
        pagoId, montoPagado,
        cuponAplicado: cuponCodigo || null,
        descuentoAplicado: descuentoAplicado || 0,
        citaExamen: citaExamen || null,
        estadoPago: 'completado'
      });
      await alumno.save();
    }

    let cita = null;
    if (citaExamen) {
      cita = new Cita({
        alumnoId: alumno._id,
        fechaHora: new Date(citaExamen),
        tipo: 'examen',
        linkVideoLlamada: `https://meet.linguaconnect.com/${alumno._id}`
      });
      await cita.save();
    }

    res.status(201).json({
      success: true,
      mensaje: 'Inscripción completada exitosamente',
      alumno: { id: alumno._id, nombre: alumno.nombre, correo: alumno.correo, plan: alumno.plan },
      cita: cita ? { id: cita._id, fechaHora: cita.fechaHora, linkVideoLlamada: cita.linkVideoLlamada } : null
    });

  } catch (error) {
    console.error('Error en inscripción:', error);
    if (error.code === 11000) {
      // Si el correo ya existe, intentar actualizar la cita
      try {
        const alumno = await Alumno.findOne({ correo: req.body.correo });
        if (alumno && req.body.citaExamen) {
          const cita = new Cita({
            alumnoId: alumno._id,
            fechaHora: new Date(req.body.citaExamen),
            tipo: 'examen',
            linkVideoLlamada: `https://meet.linguaconnect.com/${alumno._id}`
          });
          await cita.save();
          return res.status(201).json({
            success: true,
            mensaje: 'Cita programada exitosamente',
            alumno: { id: alumno._id, nombre: alumno.nombre, correo: alumno.correo, plan: alumno.plan },
            cita: { id: cita._id, fechaHora: cita.fechaHora, linkVideoLlamada: cita.linkVideoLlamada }
          });
        }
      } catch (e) {
        console.error(e);
      }
      return res.status(400).json({ success: false, mensaje: 'Este correo ya está registrado' });
    }
    res.status(500).json({ success: false, mensaje: 'Error al procesar la inscripción' });
  }
});

// ==================== RUTAS CITAS ====================

app.get('/api/citas/disponibles', async (req, res) => {
  try {
    const { fecha } = req.query;
    const inicioFecha = new Date(fecha);
    inicioFecha.setHours(0, 0, 0, 0);
    const finFecha = new Date(fecha);
    finFecha.setHours(23, 59, 59, 999);

    const citasProgramadas = await Cita.find({
      fechaHora: { $gte: inicioFecha, $lte: finFecha },
      estado: 'programada'
    });

    const horariosDisponibles = [];
    for (let hora = 9; hora < 18; hora++) {
      const horaCompleta = new Date(fecha);
      horaCompleta.setHours(hora, 0, 0, 0);
      const ocupado = citasProgramadas.some(c => new Date(c.fechaHora).getHours() === hora);
      if (!ocupado) {
        horariosDisponibles.push({ hora: `${hora}:00`, disponible: true, fechaHora: horaCompleta });
      }
    }

    res.json({ fecha, horariosDisponibles });
  } catch (error) {
    res.status(500).json({ mensaje: 'Error al obtener horarios disponibles' });
  }
});

// ==================== RUTAS ADMIN ====================

app.get('/api/alumnos', async (req, res) => {
  try {
    const alumnos = await Alumno.find().sort({ fechaInscripcion: -1 });
    res.json({ alumnos });
  } catch (error) {
    res.status(500).json({ mensaje: 'Error al obtener alumnos' });
  }
});

app.get('/api/alumnos/:id', async (req, res) => {
  try {
    const alumno = await Alumno.findById(req.params.id);
    if (!alumno) return res.status(404).json({ mensaje: 'Alumno no encontrado' });
    const citas = await Cita.find({ alumnoId: alumno._id });
    res.json({ alumno, citas });
  } catch (error) {
    res.status(500).json({ mensaje: 'Error al obtener alumno' });
  }
});

app.get('/api/health', (req, res) => {
  res.json({ status: 'OK', message: 'API LinguaConnect funcionando', timestamp: new Date().toISOString() });
});

// ==================== INICIO ====================

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`🚀 Servidor corriendo en puerto ${PORT}`);
});

module.exports = app;