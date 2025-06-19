@echo off
echo 🚀 Configurando entorno de desarrollo con migraciones automáticas...

echo 📦 Construyendo e iniciando contenedores...
docker-compose up --build -d

echo ⏳ Esperando que las bases de datos estén listas...
timeout /t 10 /nobreak >nul

echo ✅ ¡Entorno de desarrollo listo!
echo.
echo 📝 Los siguientes servicios están ejecutándose:
echo    - API Gateway: http://localhost:3000/api/docs
echo    - Auth DB: localhost:5435
echo    - Payments DB: localhost:5433
echo    - Orders DB: localhost:5434
echo.
echo 🔄 Las migraciones de Prisma se ejecutan automáticamente al iniciar cada microservicio
echo 📊 Para ver logs: docker-compose logs -f [nombre-del-servicio]
echo 🛑 Para detener: docker-compose down
echo.
echo 🎉 ¡Desarrollo listo para comenzar!
pause 