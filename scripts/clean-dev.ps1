# Script de PowerShell para limpiar entorno de desarrollo
Write-Host "🧹 Limpiando entorno de desarrollo..." -ForegroundColor Yellow

Write-Host "🛑 Deteniendo contenedores..." -ForegroundColor Red
docker-compose down

Write-Host "🗑️ Eliminando volúmenes de base de datos..." -ForegroundColor Red
docker-compose down -v

Write-Host "🧽 Eliminando imágenes no utilizadas..." -ForegroundColor Red
docker system prune -f

Write-Host ""
Write-Host "✅ ¡Entorno de desarrollo limpiado!" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Para volver a configurar el entorno, ejecuta:" -ForegroundColor Cyan
Write-Host "   .\scripts\dev-setup.ps1" -ForegroundColor White
Write-Host "   o" -ForegroundColor White
Write-Host "   npm run dev:setup" -ForegroundColor White

Read-Host "Presiona Enter para continuar..." 