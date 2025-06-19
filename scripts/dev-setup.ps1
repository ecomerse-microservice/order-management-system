# Script de PowerShell para configurar entorno de desarrollo
Write-Host "🚀 Configurando entorno de desarrollo con migraciones automáticas..." -ForegroundColor Green

Write-Host "📦 Construyendo e iniciando contenedores..." -ForegroundColor Yellow
docker-compose up --build -d

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Error al iniciar contenedores" -ForegroundColor Red
    exit 1
}

Write-Host "⏳ Esperando que las bases de datos estén listas..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

Write-Host ""
Write-Host "✅ ¡Entorno de desarrollo listo!" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Los siguientes servicios están ejecutándose:" -ForegroundColor Cyan
Write-Host "   - API Gateway: http://localhost:3000/api/docs" -ForegroundColor White
Write-Host "   - Auth DB: localhost:5435" -ForegroundColor White
Write-Host "   - Payments DB: localhost:5433" -ForegroundColor White
Write-Host "   - Orders DB: localhost:5434" -ForegroundColor White
Write-Host ""
Write-Host "🔄 Las migraciones de Prisma se ejecutan automáticamente al iniciar cada microservicio" -ForegroundColor Blue
Write-Host "📊 Para ver logs: docker-compose logs -f [nombre-del-servicio]" -ForegroundColor Blue
Write-Host "🛑 Para detener: docker-compose down" -ForegroundColor Blue
Write-Host ""
Write-Host "🎉 ¡Desarrollo listo para comenzar!" -ForegroundColor Green

Read-Host "Presiona Enter para continuar..." 