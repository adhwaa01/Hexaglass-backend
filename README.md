# 🚀 Hexaglass - MigasQueue Backend

Sistem manajemen antrean kendaraan untuk stasiun pengisian gas migas dengan integrasi mobile app dan web dashboard.

## 📋 Daftar Isi
- [Fitur Utama](#fitur-utama)
- [Stack Teknologi](#stack-teknologi)
- [Instalasi Local](#instalasi-local)
- [Setup Database](#setup-database)
- [Deployment Railway](#deployment-railway)
- [API Documentation](#api-documentation)
- [Support & Contact](#support--contact)

---

## ✨ Fitur Utama

### Admin Dashboard
- 📊 **Dashboard** - Analytics antrean harian, laporan gas, dan statistik operasional
- 🚗 **Data Antrean** - Kelola antrian kendaraan dengan filter status dan tanggal
- 📋 **Laporan** - Verifikasi laporan ketidaksesuaian dari operator
- 📈 **Rekap Pengisian** - Laporan volume gas yang diisi per hari
- 🏢 **Perusahaan** - Kelola informasi perusahaan dan prioritas antrean
- 👥 **Manajemen User** - Kelola akun admin, operator, satpam, dan supir

### Operator Interface
- ⚡ **Antrean Aktif** - Pantau dan kelola antrian dengan tombol aksi
- 📝 **Data Pengisian** - Input dan review data pengisian gas
- 📑 **Laporan** - Buat laporan ketidaksesuaian operasional
- 🏢 **Info Perusahaan** - Lihat informasi perusahaan prioritas

### Mobile App (Expo)
- 🔐 **Login & Authentication** - Autentikasi pengguna dengan Sanctum
- 📱 **Role-Based Interface** - UI berbeda untuk admin, operator, satpam, supir
- 🔍 **QR Barcode Scanner** - Scan barcode kendaraan
- 📤 **Export & Reports** - Export data ke Excel
- 🔔 **Real-time Updates** - Status antrean real-time

### Core Features
- 🔐 **Authentication & Authorization** - Login dengan role-based access control
- 📊 **Data Export** - Export ke format Excel
- 📁 **File Management** - Upload dan download dokumen
- 🔔 **Logging** - Comprehensive application logging
- 🛡️ **Security** - CORS, CSRF protection, SQL injection prevention

---

## 🛠️ Stack Teknologi

### Backend
- **Framework**: Laravel 13 (PHP 8.3+)
- **Database**: MySQL 8.0+
- **Authentication**: Laravel Sanctum
- **Permissions**: Spatie Laravel Permission
- **Export**: Maatwebsite Laravel Excel
- **PDF**: Barryvdh Laravel DomPDF

### Frontend
- **Template Engine**: Blade PHP
- **CSS Framework**: Tailwind CSS 3
- **CSS Utility**: Alpine.js
- **Build Tool**: Vite
- **Icons**: FontAwesome 6
- **Data Tables**: DataTables 1.13.6

### DevOps
- **Hosting**: Railway.app
- **Web Server**: Apache2 (via Heroku PHP buildpack)
- **CI/CD**: Auto-deploy on Git push
- **Database**: MySQL (Railway Plugin)

---

## 📦 Instalasi Local

### Prerequisites
- PHP 8.3+
- MySQL 8.0+
- Node.js 18+
- Composer
- Git

### Step 1: Clone Repository
```bash
git clone <repository-url>
cd hexaglass-backend
```

### Step 2: Install Dependencies
```bash
# Install PHP dependencies
composer install

# Copy environment file
cp .env.example .env

# Generate application key
php artisan key:generate

# Install Node dependencies
npm install
```

### Step 3: Configure Environment
Edit `.env` file:
```env
APP_NAME=MigasQueue
APP_ENV=local
APP_DEBUG=true
APP_URL=http://localhost:8000

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=hexaglass_db
DB_USERNAME=hexaglass
DB_PASSWORD=hexaglass123

APP_LOCALE=id
APP_TIMEZONE=Asia/Jakarta
```

### Step 4: Database Setup
```bash
# Run migrations
php artisan migrate

# Seed sample data (optional)
php artisan db:seed
```

### Step 5: Build Assets
```bash
# Development build with hot reload
npm run dev

# Production build
npm run build
```

### Step 6: Start Development Server
```bash
# Terminal 1: Start Laravel server
php artisan serve

# Terminal 2: Start Vite dev server
npm run dev
```

Access aplikasi di: `http://localhost:8000`

### Default Credentials
```
Email: admin@example.com
Password: password

Role: Admin
```

---

## 🗄️ Setup Database

### Migrations Available
```bash
# Create users table
php artisan migrate --path=database/migrations/0001_01_01_000000_create_users_table.php

# Create custom tables
php artisan migrate

# Rollback last migration
php artisan migrate:rollback

# Rollback all
php artisan migrate:reset

# Refresh dan seed
php artisan migrate:refresh --seed
```

### Database Schema
- `users` - User accounts dengan role
- `antrean` - Queue data kendaraan
- `laporan` - Incident reports
- `pengisian` - Gas filling data
- `perusahaan` - Company information

---

## 🚀 Deployment Railway

### Quick Start
1. Push code ke GitHub
2. Buka [railway.app](https://railway.app)
3. New Project → Deploy from GitHub
4. Add MySQL Plugin
5. Set environment variables
6. Deploy!

### Environment Variables
```env
APP_NAME=MigasQueue
APP_ENV=production
APP_DEBUG=false
APP_URL=https://your-domain.railway.app

APP_LOCALE=id
APP_TIMEZONE=Asia/Jakarta

LOG_LEVEL=warning

# Railway auto-fills these:
DB_HOST=${{MYSQL_HOST}}
DB_PORT=${{MYSQL_PORT}}
DB_DATABASE=${{MYSQL_NAME}}
DB_USERNAME=${{MYSQL_USER}}
DB_PASSWORD=${{MYSQL_PASSWORD}}
```

### Deployment Files
- ✅ `Procfile` - Web process configuration
- ✅ `railway.json` - Build configuration
- ✅ `build.sh` - Build script
- ✅ `.env.production` - Production template
- ✅ `RAILWAY_DEPLOYMENT.md` - Full deployment guide
- ✅ `DEPLOYMENT_CHECKLIST.md` - Pre-deployment checklist

### Useful Commands
```bash
# View logs
railway logs

# Run artisan command
railway run php artisan migrate

# Run bash command
railway run bash

# Connect to database
railway connect mysql
```

For detailed deployment guide, see [RAILWAY_DEPLOYMENT.md](RAILWAY_DEPLOYMENT.md)

---

## 📚 API Documentation

### Authentication Endpoints
```
POST   /api/auth/login       - Login user
POST   /api/auth/register    - Register user
```

### Queue Endpoints
```
GET    /api/antrean          - Get all queues
POST   /api/antrean          - Create new queue
GET    /api/antrean/{id}     - Get queue detail
PATCH  /api/antrean/{id}     - Update queue
DELETE /api/antrean/{id}     - Delete queue
```

### Report Endpoints
```
GET    /api/laporan          - Get all reports
POST   /api/laporan          - Create report
GET    /api/laporan/{id}     - Get report detail
PATCH  /api/laporan/{id}     - Update report
DELETE /api/laporan/{id}     - Delete report
```

For full API documentation, check route files in `routes/api.php`

---

## 🔧 Development Commands

```bash
# Install all dependencies
composer install
npm install

# Build assets
npm run build

# Watch for changes (dev)
npm run dev

# Start dev server with live reload
php artisan serve & npm run dev

# Database
php artisan migrate              # Run migrations
php artisan migrate:rollback    # Rollback migrations
php artisan db:seed             # Seed database
php artisan tinker              # Interactive shell

# Cache
php artisan cache:clear         # Clear cache
php artisan config:clear        # Clear config cache
php artisan view:clear          # Clear view cache

# Routes
php artisan route:list          # List all routes
php artisan route:cache         # Cache routes (production)

# Testing
composer run test               # Run PHPUnit tests

# Code Quality
php artisan pint                # Fix code style
```

---

## 📁 Project Structure

```
hexaglass-backend/
├── app/
│   ├── Http/
│   │   ├── Controllers/      # API & Web controllers
│   │   ├── Middleware/       # Request middleware
│   │   └── Requests/         # Form requests
│   ├── Models/               # Eloquent models
│   ├── Services/             # Business logic
│   └── Exports/              # Excel exports
├── config/                   # Configuration files
├── database/
│   ├── migrations/           # Database migrations
│   ├── seeders/              # Database seeders
│   └── factories/            # Model factories
├── public/
│   ├── index.php             # Application entry point
│   ├── build/                # Compiled assets
│   └── storage/              # Public file uploads
├── resources/
│   ├── css/                  # Tailwind CSS
│   ├── js/                   # JavaScript files
│   └── views/                # Blade templates
├── routes/
│   ├── api.php               # API routes
│   ├── web.php               # Web routes
│   └── auth.php              # Auth routes
├── storage/                  # User files & logs
├── tests/                    # Unit & feature tests
├── bootstrap/                # Framework bootstrap
├── .env                      # Environment variables
├── composer.json             # PHP dependencies
├── package.json              # Node dependencies
├── vite.config.js            # Vite configuration
├── Procfile                  # Railway web process
├── railway.json              # Railway deployment
└── build.sh                  # Build script
```

---

## 🔐 Security

### Best Practices Implemented
- ✅ CORS headers configured
- ✅ CSRF token protection
- ✅ SQL injection prevention (Eloquent ORM)
- ✅ XSS protection (Blade escaping)
- ✅ Password hashing (Bcrypt)
- ✅ HTTPS enforced (Railway SSL)
- ✅ Environment variables for secrets
- ✅ Request validation & sanitization

### Security Checklist
- [ ] Update dependencies: `composer update`
- [ ] Review security advisories: `composer audit`
- [ ] Check for secrets in code: `git log -p`
- [ ] Rotate database credentials regularly
- [ ] Enable database backups
- [ ] Monitor application logs
- [ ] Review access logs

---

## 🚨 Troubleshooting

### Common Issues

**1. Database Connection Error**
```bash
# Check database credentials in .env
php artisan migrate --force
```

**2. Permission Denied on Storage**
```bash
chmod -R 775 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache
```

**3. Assets Not Loading (404)**
```bash
npm run build
php artisan storage:link
```

**4. Clear Cache Issues**
```bash
php artisan cache:clear
php artisan config:clear
php artisan view:clear
```

**5. Composer Dependency Conflict**
```bash
composer update
# or use --no-deps flag if needed
```

### Debug Mode
Set in `.env`:
```env
APP_DEBUG=true    # Development only!
LOG_LEVEL=debug
```

View logs:
```bash
tail -f storage/logs/laravel.log
```

---

## 📞 Support & Contact

### Documentation
- [Laravel Documentation](https://laravel.com/docs)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [Alpine.js](https://alpinejs.dev)
- [Vite Guide](https://vitejs.dev)
- [Railway Docs](https://docs.railway.app)

### Team
- **Project Manager**: [Name]
- **Lead Developer**: [Name]
- **DevOps**: [Name]

### Reporting Issues
1. Create issue on GitHub
2. Include steps to reproduce
3. Attach error logs
4. Specify environment (local/production)

### Change Log
See [CHANGELOG.md](CHANGELOG.md) for version history

---

## 📄 License

MIT License - see LICENSE file for details

---

**Last Updated**: June 4, 2026  
**Version**: 1.0.0  
**Status**: ✅ Production Ready


## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
