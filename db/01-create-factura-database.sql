-- Crear segunda base de datos para facturación
CREATE DATABASE IF NOT EXISTS factura2026 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Dar permisos al usuario existente sobre la nueva base de datos
GRANT ALL PRIVILEGES ON factura2026.* TO 'cochera_user'@'%';

-- Aplicar cambios
FLUSH PRIVILEGES;

-- Mostrar bases de datos creadas
SHOW DATABASES;
