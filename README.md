
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
- **Database**: SQLite3
- **Bahasa Pemrograman**: PHP

## Persyaratan

Sebelum memulai, pastikan Anda memiliki perangkat lunak berikut:

- **PHP** >= 7.2
- **SQLite3**
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
Jalankan file bash `setup_pintar_analitika_sqlite.sh` untuk menyiapkan aplikasi. Ini akan mengunduh CodeIgniter, Bootstrap, dan mengonfigurasi proyek secara otomatis.

```bash
bash setup_pintar_analitika_sqlite.sh
```

### 3. Konfigurasi Database
Aplikasi ini menggunakan SQLite sebagai basis data. Tidak perlu membuat database secara manual, tetapi pastikan bahwa file database (`pintar_analitika.db`) ada di dalam direktori `application/database/`. Anda dapat membuat struktur tabel menggunakan SQLite3 atau alat manajemen SQLite.

Contoh tabel `business_data`:
```sql
CREATE TABLE business_data (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    data_type TEXT,
    value REAL,
    date TEXT,
    user_id INTEGER
);
```

### 4. Jalankan Aplikasi
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
│   ├── /database          # Direktori untuk file SQLite database
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
