const mongoose = require('mongoose');
require('dotenv').config();

const MONGODB_URI = process.env.MONGODB_URI || 'mongodb+srv://user1:<db_password>@cluster0.zuf8rtl.mongodb.net/cluster0?retryWrites=true&w=majority';

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

const Cupon = mongoose.model('Cupon', cuponSchema);

const cuponesEjemplo = [
  {
    codigo: 'BIENVENIDA20',
    descuento: 20,
    tipo: 'porcentaje',
    activo: true,
    fechaExpiracion: new Date('2025-12-31'),
    usosMaximos: 100,
    aplicableA: []
  },
  {
    codigo: 'UNAM15',
    descuento: 15,
    tipo: 'porcentaje',
    activo: true,
    fechaExpiracion: new Date('2025-12-31'),
    usosMaximos: 50,
    aplicableA: []
  },
  {
    codigo: 'POLI15',
    descuento: 15,
    tipo: 'porcentaje',
    activo: true,
    fechaExpiracion: new Date('2025-12-31'),
    usosMaximos: 50,
    aplicableA: []
  },
  {
    codigo: 'PREMIUM10',
    descuento: 10,
    tipo: 'porcentaje',
    activo: true,
    fechaExpiracion: new Date('2025-12-31'),
    usosMaximos: null,
    aplicableA: ['premium']
  },
  {
    codigo: 'REFERIDO',
    descuento: 25,
    tipo: 'porcentaje',
    activo: true,
    fechaExpiracion: new Date('2025-12-31'),
    usosMaximos: null,
    aplicableA: []
  }
];

async function seedCupones() {
  try {
    await mongoose.connect(MONGODB_URI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    
    console.log('✅ Conectado a MongoDB');

    // Limpiar cupones existentes (opcional)
    // await Cupon.deleteMany({});
    // console.log('🗑️  Cupones anteriores eliminados');

    // Insertar cupones de ejemplo
    for (const cuponData of cuponesEjemplo) {
      try {
        const cupon = new Cupon(cuponData);
        await cupon.save();
        console.log(`✅ Cupón creado: ${cuponData.codigo}`);
      } catch (error) {
        if (error.code === 11000) {
          console.log(`⚠️  Cupón ${cuponData.codigo} ya existe`);
        } else {
          console.error(`❌ Error creando ${cuponData.codigo}:`, error.message);
        }
      }
    }

    console.log('\n🎉 Proceso completado');
    process.exit(0);

  } catch (error) {
    console.error('❌ Error:', error);
    process.exit(1);
  }
}

seedCupones();
