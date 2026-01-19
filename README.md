<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Dhigjay/Dhigjay/output/pacman-contribution-graph-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/Dhigjay/Dhigjay/output/pacman-contribution-graph.svg">
  <img alt="pacman contribution graph" src="https://raw.githubusercontent.com/Dhigjay/Dhigjay/output/pacman-contribution-graph.svg">
</picture>

###

## 👥 Anggota Kelompok

- Afif Abdilah M.S — 240103152  
- Maulana Dhigjay F.A — 240103166  
- Shandy Satria W.P — 240103178  

---
# 🎓 UAS Pemrograman Basis Data  
## Sistem Basis Data Transaksi Fotocopy & Print “Focus”

Repository ini merupakan dokumentasi lengkap proyek **Ujian Akhir Semester (UAS)** mata kuliah  
**Pemrograman Basis Data** dengan studi kasus usaha **Fotocopy & Print “Focus”**.

Proyek ini berfokus pada perancangan dan implementasi **basis data relasional** untuk
mengelola transaksi secara terstruktur, dimulai dari data mentah hingga menjadi
sistem database yang siap digunakan pada lingkungan nyata.

Seluruh tahapan dikerjakan secara sistematis dan akademis, meliputi:

- Analisis data awal (nota transaksi mentah)  
- Normalisasi tabel hingga **1NF, 2NF, dan 3NF**  
- Perancangan **Hubungan Antar Entitas**  
- Penentuan **Derajat Kardinalitas**  
- Penyusunan **Relasi Antar Tabel (PK & FK)**  
- Perancangan **Entity Relationship Diagram (ERD)**  
- Implementasi ke **DBMS MySQL**  
- Pembuatan database dan tabel (**DDL**)  
- Pengisian data (**DML**)  
- Pengelolaan transaksi (**TCL**)  
- Query lanjutan: **JOIN, GROUP BY, Agregasi, HAVING, Subquery**

Semua proses tersebut terdokumentasi di laporan dan direalisasikan dalam bentuk
**script SQL** yang dapat langsung dijalankan.

---

## 🧩 Studi Kasus

Studi kasus yang digunakan adalah sistem transaksi pada usaha  
**Fotocopy & Print “Focus”**.

Pada kondisi awal, data transaksi masih dicatat secara sederhana pada nota manual.
Hal ini menimbulkan beberapa permasalahan:

- Data tidak terstruktur  
- Terjadi pengulangan informasi  
- Sulit dilakukan pencarian dan pelaporan  
- Rentan kesalahan pencatatan  

Melalui proyek ini, data mentah tersebut dianalisis dan diubah menjadi
struktur basis data relasional yang rapi, konsisten, dan mudah dikelola.

---

## 🗂️ Normalisasi Data

### 🔹 First Normal Form (1NF)
Pada tahap ini, data mentah dipecah agar:
- Setiap kolom hanya berisi satu nilai (atomik)
- Tidak ada data ganda dalam satu sel

Hasilnya adalah pemisahan antara:
- Tabel item transaksi  
- Tabel data transaksi utama  

Tahap ini menjadi fondasi agar data dapat diproses secara terstruktur.

### 🔹 Second Normal Form (2NF)
Pada tahap 2NF:
- Data yang tidak sepenuhnya bergantung pada primary key dipisahkan
- Dibentuk tabel master seperti:
  - Pelanggan  
  - Kasir  
  - Barang/Layanan  

Tujuannya adalah menghilangkan *partial dependency* dan mengurangi redundansi data.

### 🔹 Third Normal Form (3NF)
Pada tahap 3NF:
- Ketergantungan tidak langsung dihilangkan
- Setiap atribut non-kunci hanya bergantung pada primary key

Hasil akhirnya adalah struktur database yang:
- Stabil  
- Efisien  
- Bebas dari anomali insert, update, dan delete  

---

## 🔗 Derajat Kardinalitas

Derajat kardinalitas menunjukkan banyaknya hubungan antar entitas.

Pada sistem ini diterapkan:

- **Pelanggan – Transaksi : 1 : N**  
  Satu pelanggan dapat melakukan banyak transaksi.

- **Kasir – Transaksi : 1 : N**  
  Satu kasir dapat melayani banyak transaksi.

- **Barang/Layanan – Transaksi : N : N**  
  Satu layanan dapat muncul pada banyak transaksi dan sebaliknya.

Visualisasi pada folder `Derajat Kardinalitas/` memperjelas aturan hubungan ini
sebagai dasar perancangan struktur database.

---

## 🧱 Relasi Antar Tabel

Relasi dibentuk menggunakan:

- **Primary Key (PK)** → identitas unik tiap tabel  
- **Foreign Key (FK)** → penghubung antar tabel  

Relasi utama:

- `pelanggan.id_pelanggan` → `transaksi.id_pelanggan`  
- `kasir.id_kasir` → `transaksi.id_kasir`  
- `barang.id_barang` → `transaksi.id_barang`

Relasi ini menjamin:

- Konsistensi data  
- Tidak ada pengulangan informasi  
- Setiap transaksi memiliki referensi yang jelas  

---

## 🗺️ Entity Relationship Diagram (ERD)

ERD merupakan blueprint sistem basis data.

ERD pada proyek ini menggambarkan:

- Entitas: Pelanggan, Kasir, Barang/Layanan, Transaksi  
- Atribut tiap entitas  
- Hubungan dan kardinalitas antar entitas  

Dari ERD inilah seluruh struktur tabel, PK, dan FK diturunkan lalu
diimplementasikan ke MySQL menggunakan MySQL Workbench.

![ERD_](https://github.com/user-attachments/assets/8c5e197e-f14f-49d9-9a83-e1413dc534af)

---

## ⚙️ Implementasi ke DBMS

Implementasi dilakukan menggunakan:

- **DDL**  
  Membuat database dan tabel beserta PK & FK

- **DML**  
  Mengisi data pelanggan, kasir, barang, dan transaksi

- **TCL**  
  Mengelola transaksi menggunakan `START TRANSACTION`, `COMMIT`, dan `ROLLBACK`

- **Query Lanjutan**  
  - JOIN  
  - GROUP BY & Agregasi  
  - HAVING  
  - Subquery  

Query digunakan untuk menghasilkan informasi seperti:
- Laporan transaksi  
- Total pendapatan per layanan  
- Pelanggan dengan transaksi terbesar  

---

## 🚀 Cara Menjalankan Database

1. Buka **MySQL Workbench**  
2. Buat atau pilih koneksi ke server MySQL  
3. Buka file `sql/fotocopy_database.sql`  
4. Jalankan seluruh script dari atas hingga bawah  
5. Database `fotocopy_db` akan terbentuk  
6. Jalankan query JOIN, GROUP BY, HAVING, dan Subquery

---

## 🖼️ Poster Proyek

Poster berikut merangkum seluruh proses perancangan dan implementasi
basis data dalam satu tampilan visual.

Poster ini memuat:
- Ringkasan masalah  
- Perancangan basis data  
- Kardinalitas  
- ERD  
- DDL, DML, TCL  
- Query wajib  
- Tujuan proyek  

![Poster Proyek](https://github.com/user-attachments/assets/d066dc76-93ca-4771-9207-a5347e2d7008)

---


Repository ini diharapkan menjadi contoh penerapan konsep
**basis data relasional yang sistematis dan akademis**,
mulai dari analisis data mentah hingga implementasi nyata pada DBMS.
