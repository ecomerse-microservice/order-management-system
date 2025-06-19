#!/usr/bin/env node

const { exec } = require('child_process');
const os = require('os');

function runCommand(command) {
  return new Promise((resolve, reject) => {
    const child = exec(command, (error, stdout, stderr) => {
      if (error) {
        console.error(`Error: ${error.message}`);
        reject(error);
        return;
      }
      if (stderr) {
        console.error(`stderr: ${stderr}`);
      }
      console.log(stdout);
      resolve(stdout);
    });
    
    child.stdout.on('data', (data) => {
      process.stdout.write(data);
    });
    
    child.stderr.on('data', (data) => {
      process.stderr.write(data);
    });
  });
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function setupDevelopment() {
  try {
    console.log('🚀 Configurando entorno de desarrollo con migraciones automáticas...\n');

    console.log('📦 Construyendo e iniciando contenedores...');
    await runCommand('docker-compose up --build -d');

    console.log('\n⏳ Esperando que las bases de datos estén listas...');
    await sleep(10000); // 10 segundos

    console.log('\n✅ ¡Entorno de desarrollo listo!\n');
    console.log('📝 Los siguientes servicios están ejecutándose:');
    console.log('   - API Gateway: http://localhost:3000/api/docs');
    console.log('   - Auth DB: localhost:5435');
    console.log('   - Payments DB: localhost:5433');
    console.log('   - Orders DB: localhost:5434\n');
    console.log('🔄 Las migraciones de Prisma se ejecutan automáticamente al iniciar cada microservicio');
    console.log('📊 Para ver logs: docker-compose logs -f [nombre-del-servicio]');
    console.log('🛑 Para detener: docker-compose down\n');
    console.log('🎉 ¡Desarrollo listo para comenzar!');

  } catch (error) {
    console.error('❌ Error configurando el entorno:', error.message);
    process.exit(1);
  }
}

setupDevelopment(); 