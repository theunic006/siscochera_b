#!/usr/bin/env bash
set -euo pipefail

# ============================================================================
#  Setup script for back_siscochera (Laravel 12) on Ubuntu (tested on 22.04+)
#  - Installs PHP 8.2, Nginx, MariaDB, Composer
#  - Creates database and user
#  - Configures permissions
#  - Installs Composer deps and optimizes Laravel
#  - Configures Nginx vhost
#  - Imports DB dump if provided
#
#  Usage (as root):
#    sudo bash setup_back_siscochera.sh \
#      --app-root /opt/back_siscochera \
#      --server-name 89.117.148.98 \
#      --db-name cochera2026 \
#      --db-user cochera_user \
#      --db-pass 'cochera_password' \
#      [--sql-dump /opt/back_siscochera/database/cochera2026.sql]
#
#  Notes:
#   - If --sql-dump is omitted, migrations will NOT run automatically; uncomment
#     MIGRATE=1 to run php artisan migrate --force.
#   - Ensure your .env is in place or provide one after this script.
# ============================================================================

# Defaults
APP_ROOT="/opt/back_siscochera"
SERVER_NAME="89.117.148.98"
DB_NAME="cochera2026"
DB_USER="cochera_user"
DB_PASS="cochera_password"
SQL_DUMP=""
PHP_VERSION="8.2"
NGINX_SITE="back_siscochera"
MIGRATE=${MIGRATE:-0}

# Parse args
while [[ $# -gt 0 ]]; do
  case "$1" in
    --app-root) APP_ROOT="$2"; shift 2 ;;
    --server-name) SERVER_NAME="$2"; shift 2 ;;
    --db-name) DB_NAME="$2"; shift 2 ;;
    --db-user) DB_USER="$2"; shift 2 ;;
    --db-pass) DB_PASS="$2"; shift 2 ;;
    --sql-dump) SQL_DUMP="$2"; shift 2 ;;
    --php-version) PHP_VERSION="$2"; shift 2 ;;
    --migrate) MIGRATE=1; shift 1 ;;
    *) echo "Unknown arg: $1"; exit 1 ;;
  esac
done

if [[ $EUID -ne 0 ]]; then
  echo "Please run as root (sudo)." >&2
  exit 1
fi

log() { echo -e "\n====> $*\n"; }

# 1) System update and install base packages
log "Updating apt and installing base packages"
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y ca-certificates curl software-properties-common gnupg lsb-release

# 2) Install Nginx and MariaDB
log "Installing Nginx and MariaDB"
apt-get install -y nginx mariadb-server
systemctl enable --now nginx mariadb

# 3) Install PHP
log "Installing PHP ${PHP_VERSION}"
add-apt-repository ppa:ondrej/php -y
apt-get update -y
apt-get install -y \
  php${PHP_VERSION} php${PHP_VERSION}-fpm php${PHP_VERSION}-mysql \
  php${PHP_VERSION}-xml php${PHP_VERSION}-curl php${PHP_VERSION}-zip \
  php${PHP_VERSION}-mbstring php${PHP_VERSION}-bcmath php${PHP_VERSION}-gd
systemctl enable --now php${PHP_VERSION}-fpm

# 4) Install Composer
if ! command -v composer >/dev/null 2>&1; then
  log "Installing Composer"
  EXPECTED_SIGNATURE=$(curl -s https://composer.github.io/installer.sig)
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  ACTUAL_SIGNATURE=$(php -r "echo hash_file('sha384', 'composer-setup.php');")
  if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]; then
    echo 'ERROR: Invalid Composer installer signature' >&2
    rm composer-setup.php
    exit 1
  fi
  php composer-setup.php --install-dir=/usr/local/bin --filename=composer
  rm composer-setup.php
else
  log "Composer already installed"
fi

# 5) Ensure app root exists
log "Ensuring app root exists at ${APP_ROOT}"
mkdir -p "$APP_ROOT"

# 6) Database setup
log "Creating database and user if not exist"
mysql -u root <<SQL
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'localhost';
FLUSH PRIVILEGES;
SQL

# Optionally import dump
if [[ -n "$SQL_DUMP" && -f "$SQL_DUMP" ]]; then
  log "Importing SQL dump from ${SQL_DUMP} into ${DB_NAME}"
  mysql -u root "$DB_NAME" < "$SQL_DUMP"
else
  log "No SQL dump provided or file not found. Skipping import."
fi

# 7) Laravel permissions
log "Setting permissions for storage and cache"
chown -R www-data:www-data "$APP_ROOT/storage" "$APP_ROOT/bootstrap/cache" || true
find "$APP_ROOT/storage" -type d -exec chmod 775 {} \; || true
find "$APP_ROOT/bootstrap/cache" -type d -exec chmod 775 {} \; || true

# 8) Composer install (optimize)
log "Running Composer install"
cd "$APP_ROOT"
sudo -u www-data composer install --no-dev --prefer-dist --optimize-autoloader

# 9) Laravel optimize
log "Laravel optimize commands"
php artisan key:generate --force || true
php artisan storage:link || true
php artisan config:cache || true
php artisan route:cache || true
php artisan view:cache || true

if [[ "$MIGRATE" -eq 1 ]]; then
  log "Running database migrations"
  php artisan migrate --force
fi

# 10) Nginx vhost
log "Configuring Nginx site ${NGINX_SITE}"
cat > "/etc/nginx/sites-available/${NGINX_SITE}.conf" <<NGINX
server {
    listen 80;
    server_name ${SERVER_NAME};

    root ${APP_ROOT}/public;
    index index.php index.html;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";
    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php${PHP_VERSION}-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.[^/]+ { deny all; }
}
NGINX

ln -sf "/etc/nginx/sites-available/${NGINX_SITE}.conf" "/etc/nginx/sites-enabled/${NGINX_SITE}.conf"
nginx -t
systemctl reload nginx

log "Done. Summary:"
echo "- App root:        ${APP_ROOT}"
echo "- Server name:      ${SERVER_NAME}"
echo "- DB:               ${DB_NAME} (user: ${DB_USER})"
echo "- PHP:              ${PHP_VERSION}"
echo "- Nginx site:       /etc/nginx/sites-available/${NGINX_SITE}.conf"

echo "\nNext steps:"
echo "1) Ensure your .env is present at ${APP_ROOT}/.env (use the .env.production.server template)"
echo "2) If needed, re-run with --sql-dump to import an initial database, or with --migrate to run migrations"
echo "3) Access: http://${SERVER_NAME}"
