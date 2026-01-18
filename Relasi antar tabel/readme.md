# Relasi Antar Tabel

Folder ini berisi desain relasi antar tabel pada sistem basis data
Fotocopy & Print “Focus”.

Relasi dibentuk menggunakan:
- Primary Key (PK) sebagai identitas unik tiap tabel
- Foreign Key (FK) sebagai penghubung antar tabel

Relasi utama yang diterapkan:
- Pelanggan ↔ Transaksi melalui `id_pelanggan`
- Kasir ↔ Transaksi melalui `id_kasir`
- Barang/Layanan ↔ Transaksi melalui `id_barang`

Tujuan relasi ini adalah:
- Menjaga integritas data
- Menghindari pengulangan informasi
- Memastikan setiap transaksi memiliki pelanggan, kasir, dan layanan yang jelas

Gambar desain dan implementasi pada folder ini menjadi acuan saat
membangun struktur tabel di DBMS.

