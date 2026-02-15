#!/bin/bash

echo "========================================"
echo "  INSTALACION LINGUACONNECT ACADEMY"
echo "========================================"
echo ""

# Verificar si Node.js está instalado
if ! command -v node &> /dev/null; then
    echo "❌ ERROR: Node.js no está instalado"
    echo "Por favor instala Node.js desde: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js detectado: $(node --version)"
echo ""

echo "[1/6] Creando estructura de carpetas..."
mkdir -p backend
mkdir -p frontend/src/components

echo "[2/6] Moviendo archivos del backend..."
mv server.js backend/ 2>/dev/null
mv package.json backend/ 2>/dev/null
mv .env.example backend/ 2>/dev/null
mv .gitignore backend/ 2>/dev/null
mv scripts backend/ 2>/dev/null

echo "[3/6] Moviendo archivos del frontend..."
mv App.jsx frontend/src/ 2>/dev/null
mv App.css frontend/src/ 2>/dev/null
mv EJEMPLO_ROUTES.jsx frontend/src/ 2>/dev/null
mv components frontend/src/ 2>/dev/null

echo "[4/6] Instalando dependencias del backend..."
cd backend
npm install

echo ""
echo "[5/6] Configurando variables de entorno..."
echo ""
echo "IMPORTANTE: Necesitas configurar tu password de MongoDB"
read -p "Ingresa tu password de MongoDB: " MONGO_PASSWORD

cat > .env << EOF
# MongoDB Configuration
MONGODB_URI=mongodb+srv://user1:${MONGO_PASSWORD}@cluster0.zuf8rtl.mongodb.net/cluster0?retryWrites=true&w=majority

# Server Configuration
PORT=5000
NODE_ENV=development

# Frontend URL (para CORS)
FRONTEND_URL=http://localhost:5173
EOF

echo ""
echo "[6/6] Creando cupones en MongoDB..."
npm run seed

echo ""
echo "========================================"
echo "  ✅ INSTALACION COMPLETADA!"
echo "========================================"
echo ""
echo "Para iniciar el servidor:"
echo "  cd backend"
echo "  npm run dev"
echo ""
echo "El servidor estará en: http://localhost:5000"
echo ""
