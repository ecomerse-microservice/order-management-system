#!/usr/bin/env node

const { exec } = require('child_process');

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

async function cleanDevelopment() {
  try {
    console.log('🧹 Limpiando entorno de desarrollo...\n');

    console.log('🛑 Deteniendo contenedores...');
    await runCommand('docker-compose down');

    console.log('\n🗑️ Eliminando volúmenes de base de datos...');
    await runCommand('docker-compose down -v');

    console.log('\n🧽 Eliminando imágenes no utilizadas...');
    await runCommand('docker system prune -f');

    console.log('\n✅ ¡Entorno de desarrollo limpiado!\n');
    console.log('📝 Para volver a configurar el entorno, ejecuta:');
    console.log('   node scripts/dev-setup.js');
    console.log('   o');
    console.log('   npm run dev:setup\n');

  } catch (error) {
    console.error('❌ Error limpiando el entorno:', error.message);
    process.exit(1);
  }
}

cleanDevelopment(); 