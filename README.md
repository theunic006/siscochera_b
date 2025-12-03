# SisCochera - Backend API

Sistema de gestión de cochera desarrollado con Laravel 11.

<p align="center">
<a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="300" alt="Laravel Logo"></a>
</p>

## 🚀 Tecnologías

- **Laravel 11** - Framework PHP
- **MySQL/MariaDB** - Base de datos
- **JWT Auth** - Autenticación
- **Laravel Sanctum** - API Authentication
- **Composer** - Gestión de dependencias
- **Docker** - Contenedorización

## 📋 Características

- ✅ API RESTful completa
- ✅ Autenticación JWT
- ✅ CRUD de Usuarios, Roles y Permisos
- ✅ Gestión de Vehículos y Propietarios
- ✅ Control de Ingresos y Salidas
- ✅ Sistema de Empresas
- ✅ Facturación integrada
- ✅ Reportes y Estadísticas
- ✅ Middleware de autenticación y permisos
- ✅ Validación de datos

## 📦 Instalación

### Requisitos previos
- PHP >= 8.2
- Composer
- MySQL/MariaDB >= 8.0
- Node.js (opcional, para assets)

### Pasos de instalación

```bash
# Clonar el repositorio
git clone https://github.com/theunic006/siscochera_b.git
cd siscochera_b

# Instalar dependencias
composer install

# Copiar archivo de configuración
cp .env.example .env

# Generar key de aplicación
php artisan key:generate

# Configurar base de datos en .env
# DB_CONNECTION=mysql
# DB_HOST=127.0.0.1
# DB_PORT=3306
# DB_DATABASE=siscochera
# DB_USERNAME=tu_usuario
# DB_PASSWORD=tu_contraseña

# Ejecutar migraciones
php artisan migrate

# Ejecutar seeders (opcional)
php artisan db:seed

# Iniciar servidor de desarrollo
php artisan serve
```

La API estará disponible en `http://localhost:8000`

## 🐳 Docker

El proyecto incluye configuración Docker:

```bash
# Build y ejecutar con Docker Compose
docker-compose up -d

# Ver logs
docker-compose logs -f

# Detener contenedores
docker-compose down
```

## 🏗️ Estructura del Proyecto

```
back_siscochera/
├── app/
│   ├── Http/
│   │   ├── Controllers/    # Controladores de la API
│   │   ├── Middleware/     # Middleware personalizado
│   │   └── Requests/       # Form Requests
│   ├── Models/             # Modelos Eloquent
│   └── Services/           # Lógica de negocio
├── config/                 # Archivos de configuración
├── database/
│   ├── migrations/         # Migraciones de BD
│   └── seeders/           # Seeders
├── routes/
│   ├── api.php            # Rutas de la API
│   └── web.php            # Rutas web
├── storage/               # Almacenamiento
└── tests/                 # Tests unitarios
```

## 🔌 Endpoints Principales

### Autenticación
```
POST   /api/auth/login       - Iniciar sesión
POST   /api/auth/register    - Registrar usuario
POST   /api/auth/logout      - Cerrar sesión
GET    /api/auth/me          - Obtener usuario actual
```

### Usuarios
```
GET    /api/users            - Listar usuarios
POST   /api/users            - Crear usuario
GET    /api/users/{id}       - Obtener usuario
PUT    /api/users/{id}       - Actualizar usuario
DELETE /api/users/{id}       - Eliminar usuario
```

### Vehículos
```
GET    /api/vehicles         - Listar vehículos
POST   /api/vehicles         - Crear vehículo
GET    /api/vehicles/{id}    - Obtener vehículo
PUT    /api/vehicles/{id}    - Actualizar vehículo
DELETE /api/vehicles/{id}    - Eliminar vehículo
```

### Ingresos
```
GET    /api/ingresos         - Listar ingresos
POST   /api/ingresos         - Crear ingreso
GET    /api/ingresos/{id}    - Obtener ingreso
PUT    /api/ingresos/{id}    - Actualizar ingreso
DELETE /api/ingresos/{id}    - Eliminar ingreso
```

## 🔐 Autenticación

La API utiliza JWT para autenticación. Incluir el token en el header:

```
Authorization: Bearer {token}
```

## 🧪 Testing

```bash
# Ejecutar tests
php artisan test

# Ejecutar tests con coverage
php artisan test --coverage
```

## 📝 Variables de Entorno

Principales variables en `.env`:

```env
APP_NAME="SisCochera API"
APP_ENV=production
APP_DEBUG=false
APP_URL=http://localhost

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=siscochera
DB_USERNAME=root
DB_PASSWORD=

JWT_SECRET=your-secret-key
JWT_TTL=60

CORS_ALLOWED_ORIGINS=http://localhost:5173
```

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -m 'Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

## 👥 Autor

**theunic006**

## 📄 Licencia

Este proyecto es privado.

## 🔗 Enlaces

- Frontend: [siscochera_f](https://github.com/theunic006/siscochera_f)
- Documentación Laravel: [laravel.com/docs](https://laravel.com/docs)
