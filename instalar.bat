@echo off
echo ========================================
echo   INSTALACION LINGUACONNECT ACADEMY
echo ========================================
echo.

REM Verificar si Node.js esta instalado
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Node.js no esta instalado
    echo Por favor instala Node.js desde: https://nodejs.org/
    pause
    exit /b 1
)

echo [1/6] Creando estructura de carpetas...
mkdir backend 2>nul
mkdir frontend 2>nul
mkdir frontend\src 2>nul
mkdir frontend\src\components 2>nul

echo [2/6] Moviendo archivos del backend...
move server.js backend\ >nul 2>nul
move package.json backend\ >nul 2>nul
move .env.example backend\ >nul 2>nul
move .gitignore backend\ >nul 2>nul
move scripts backend\ >nul 2>nul

echo [3/6] Moviendo archivos del frontend...
move App.jsx frontend\src\ >nul 2>nul
move App.css frontend\src\ >nul 2>nul
move EJEMPLO_ROUTES.jsx frontend\src\ >nul 2>nul
move components frontend\src\ >nul 2>nul

echo [4/6] Instalando dependencias del backend...
cd backend
call npm install

echo [5/6] Configurando variables de entorno...
echo.
echo IMPORTANTE: Necesitas configurar tu password de MongoDB
echo.
set /p MONGO_PASSWORD="Ingresa tu password de MongoDB: "

(
echo # MongoDB Configuration
echo MONGODB_URI=mongodb+srv://user1:%MONGO_PASSWORD%@cluster0.zuf8rtl.mongodb.net/cluster0?retryWrites=true^&w=majority
echo.
echo # Server Configuration
echo PORT=5000
echo NODE_ENV=development
echo.
echo # Frontend URL ^(para CORS^)
echo FRONTEND_URL=http://localhost:5173
) > .env

echo [6/6] Creando cupones en MongoDB...
call npm run seed

echo.
echo ========================================
echo   INSTALACION COMPLETADA!
echo ========================================
echo.
echo Para iniciar el servidor:
echo   cd backend
echo   npm run dev
echo.
echo El servidor estara en: http://localhost:5000
echo.
pause
