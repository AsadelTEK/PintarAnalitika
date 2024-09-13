# PintarAnalitika: Sistem Analitik Bisnis

PintarAnalitika adalah sebuah aplikasi web berbasis **CodeIgniter** yang dirancang untuk membantu pengguna dalam mengelola dan menganalisis data bisnis. Aplikasi ini mendukung berbagai fungsi seperti input data bisnis, visualisasi laporan, dan analisis data untuk membantu pengambilan keputusan.

## Fitur Utama

- **Manajemen Data Bisnis**: Input dan kelola data penjualan, inventaris, dan pengeluaran.
- **Analisis Data**: Menganalisis data bisnis untuk memahami tren dan melakukan prediksi.
- **Laporan Visual**: Visualisasi data menggunakan tabel dan grafik berbasis **Bootstrap**.
- **User Management**: Sistem otentikasi dengan dukungan berbagai peran pengguna (admin, manager, staf).

## Teknologi yang Digunakan

- **Framework**: [CodeIgniter 3.1.11](https://codeigniter.com/)
- **Frontend**: [Bootstrap 5.1](https://getbootstrap.com/)
- **Database**: MySQL
- **Bahasa Pemrograman**: PHP

## Persyaratan

Sebelum memulai, pastikan Anda memiliki perangkat lunak berikut:

- **PHP** >= 7.2
- **MySQL** atau **MariaDB**
- **Apache** (disarankan menggunakan XAMPP atau LAMP)
- **Composer** (opsional, untuk mengelola dependensi)

## Instalasi

Ikuti langkah-langkah berikut untuk mengatur aplikasi di server lokal Anda.

### 1. Clone Repository
Clone repository ini ke dalam direktori lokal Anda:
```bash
git clone https://github.com/username/pintar_analitika.git
cd pintar_analitika
```

### 2. Unduh dan Setup CodeIgniter & Bootstrap
Jalankan file bash `setup_pintar_analitika.sh` untuk menyiapkan aplikasi. Ini akan mengunduh CodeIgniter, Bootstrap, dan mengonfigurasi proyek secara otomatis.

```bash
bash setup_pintar_analitika.sh
```

### 3. Buat Database
Buat database di MySQL dengan nama `pintar_analitika`. Anda dapat menggunakan phpMyAdmin atau MySQL command line untuk membuatnya:
```sql
CREATE DATABASE pintar_analitika;
```

### 4. Import Struktur Database
Import file SQL ke dalam database Anda untuk menghasilkan tabel yang diperlukan:
```bash
mysql -u root -p pintar_analitika < database/pintar_analitika.sql
```

### 5. Konfigurasi Database
Buka file `application/config/database.php` dan sesuaikan pengaturan MySQL sesuai dengan sistem Anda (username, password, database name).

```php
$db['default'] = array(
    'dsn'   => '',
    'hostname' => 'localhost',
    'username' => 'root',
    'password' => '',
    'database' => 'pintar_analitika',
    'dbdriver' => 'mysqli',
    'dbprefix' => '',
    'pconnect' => FALSE,
    'db_debug' => (ENVIRONMENT !== 'production'),
    'cache_on' => FALSE,
    'cachedir' => '',
    'char_set' => 'utf8',
    'dbcollat' => 'utf8_general_ci',
    'swap_pre' => '',
    'encrypt' => FALSE,
    'compress' => FALSE,
    'stricton' => FALSE,
    'failover' => array(),
    'save_queries' => TRUE
);
```

### 6. Jalankan Aplikasi
Buka browser dan akses aplikasi melalui `http://localhost/pintar_analitika/`.

Jika semua langkah di atas berhasil, Anda akan melihat halaman utama aplikasi PintarAnalitika.

## Penggunaan

### 1. **Manajemen Pengguna**
Anda bisa menambahkan pengguna dengan tiga peran berbeda:
- **Admin**: Memiliki akses penuh terhadap semua fitur.
- **Manager**: Dapat mengelola data bisnis dan melihat laporan.
- **Staf**: Hanya dapat memasukkan data.

### 2. **Input Data Bisnis**
Untuk memasukkan data bisnis (seperti penjualan atau inventaris):
1. Navigasikan ke halaman **Tambah Data Bisnis**.
2. Isi form dengan jenis data, nilai, dan tanggal.
3. Klik **Submit** untuk menyimpan data.

### 3. **Melihat Laporan**
- Pergi ke halaman **Laporan Bisnis**.
- Laporan akan ditampilkan dalam bentuk tabel. Anda dapat melihat data yang telah diinputkan sebelumnya.

## Struktur Proyek

```
/pintar_analitika
│
├── /application
│   ├── /controllers       # Controller CodeIgniter
│   ├── /models            # Model CodeIgniter
│   ├── /views             # View untuk halaman web
│   │   ├── /data          # View untuk data bisnis
│   │   └── /public        # Asset publik (CSS, JS)
│
├── /system                # Sistem utama CodeIgniter
├── /public                # Akses file public
└── index.php              # Halaman utama aplikasi
```

## Pengembangan Lebih Lanjut

1. **Integrasi API**: Anda dapat mengintegrasikan API eksternal untuk mendapatkan data otomatis dari sumber eksternal.
2. **Penggunaan AI/ML**: Untuk analisis data lebih lanjut, Anda bisa mengintegrasikan algoritma **Machine Learning** untuk membuat prediksi bisnis.

## Kontribusi

Kami menyambut kontribusi dari siapa pun. Jika Anda ingin berkontribusi, silakan fork repository ini dan kirimkan pull request.

## Lisensi

Proyek ini dilisensikan di bawah **MIT License** - lihat file [LICENSE](LICENSE) untuk detail lebih lanjut.

