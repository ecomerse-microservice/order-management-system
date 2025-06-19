# Scripts de Desarrollo - Multiplataforma

Este directorio contiene scripts para facilitar el desarrollo en diferentes sistemas operativos.

## 🚀 Scripts Disponibles

### Scripts de Configuración

#### Linux/Mac (Bash)
- `dev-setup.sh`: Configura el entorno de desarrollo completo
- `clean-dev.sh`: Limpia completamente el entorno de desarrollo

#### Windows (Batch)
- `dev-setup.bat`: Configura el entorno de desarrollo completo
- `clean-dev.bat`: Limpia completamente el entorno de desarrollo

#### Windows (PowerShell)
- `dev-setup.ps1`: Configura el entorno de desarrollo completo
- `clean-dev.ps1`: Limpia completamente el entorno de desarrollo

#### Multiplataforma (Node.js)
- `dev-setup.js`: Configura el entorno de desarrollo completo
- `clean-dev.js`: Limpia completamente el entorno de desarrollo

## 📋 Instrucciones de Uso

### Linux/Mac

```bash
# Configurar entorno
chmod +x scripts/dev-setup.sh
./scripts/dev-setup.sh

# Limpiar entorno
chmod +x scripts/clean-dev.sh
./scripts/clean-dev.sh
```

### Windows (Command Prompt)

```batch
REM Configurar entorno
scripts\dev-setup.bat

REM Limpiar entorno
scripts\clean-dev.bat
```

### Windows (PowerShell)

```powershell
# Configurar entorno
.\scripts\dev-setup.ps1

# Limpiar entorno
.\scripts\clean-dev.ps1
```

### Cualquier Sistema (Node.js) - **RECOMENDADO**

```bash
# Instalar dependencias (solo la primera vez)
npm install

# Configurar entorno
npm run dev:setup

# Limpiar entorno
npm run dev:clean

# Otros comandos útiles
npm run dev:start    # Solo iniciar contenedores
npm run dev:stop     # Solo detener contenedores
npm run dev:restart  # Reiniciar contenedores
npm run dev:logs     # Ver logs de todos los servicios
npm run dev:status   # Ver estado de contenedores
npm run help         # Ver ayuda
```

## 🔧 Configuración PowerShell (Windows)

Si tienes problemas ejecutando scripts de PowerShell, ejecuta este comando como Administrador:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 📝 Lo que hacen los scripts

### Scripts de Configuración (`dev-setup.*`)
1. Construyen las imágenes Docker de todos los microservicios
2. Inician todos los contenedores (microservicios + bases de datos PostgreSQL)
3. Esperan a que las bases de datos estén listas
4. Muestran información sobre los servicios disponibles

### Scripts de Limpieza (`clean-dev.*`)
1. Detienen todos los contenedores
2. Eliminan volúmenes de bases de datos
3. Limpian imágenes Docker no utilizadas

## ⚡ Scripts NPM (Recomendados)

Los scripts NPM son la forma más sencilla y compatible de trabajar:

- ✅ Funcionan en Windows, Linux y Mac
- ✅ No requieren configuración adicional
- ✅ Usan Node.js que ya está instalado para el desarrollo
- ✅ Proporcionan mejor feedback y manejo de errores

## 🎯 Recomendación

**Para el mejor soporte multiplataforma, usa:**

```bash
npm run dev:setup
```

Esto funcionará exactamente igual en Windows, Linux y Mac. 