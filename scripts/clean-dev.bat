@echo off
echo 🧹 Limpiando entorno de desarrollo...

echo 🛑 Deteniendo contenedores...
docker-compose down

echo 🗑️ Eliminando volúmenes de base de datos...
docker-compose down -v

echo 🧽 Eliminando imágenes no utilizadas...
docker system prune -f

echo ✅ ¡Entorno de desarrollo limpiado!
echo.
echo 📝 Para volver a configurar el entorno, ejecuta:
echo    scripts\dev-setup.bat
pause 