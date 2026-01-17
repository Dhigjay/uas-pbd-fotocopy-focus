CREATE DATABASE fotocopy_db;
USE fotocopy_db;

-- DDL: Pembuatan Tabel

CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL
);

CREATE TABLE kasir (
    id_kasir VARCHAR(10) PRIMARY KEY,
    nama_kasir VARCHAR(100) NOT NULL
);

CREATE TABLE barang (
    id_barang INT PRIMARY KEY,
    jenis_layanan VARCHAR(50) NOT NULL,
    harga_satuan INT NOT NULL
);

CREATE TABLE transaksi (
    id_transaksi INT PRIMARY KEY,
    id_pelanggan INT,
    id_kasir VARCHAR(10),
    id_barang INT,
    jumlah_barang INT,
    tanggal DATE,
    dp INT,
    total_bayar INT,
    sub_total INT,
    kurang_sisa INT,
    CONSTRAINT fk_pelanggan FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    CONSTRAINT fk_kasir FOREIGN KEY (id_kasir) REFERENCES kasir(id_kasir),
    CONSTRAINT fk_barang FOREIGN KEY (id_barang) REFERENCES barang(id_barang)
);

-- DML: Pengisian Data

INSERT INTO pelanggan VALUES
(98765456, 'Daniel'),
(98765457, 'Rina'),
(98765458, 'Budi');

INSERT INTO kasir VALUES
('k0001', 'Albert'),
('k0002', 'Sinta');

INSERT INTO barang VALUES
(76348001, 'Print Warna', 9500),
(23591002, 'Laminating', 14500),
(99112003, 'Fotocopy Hitam Putih', 500),
(88123004, 'Jilid Spiral', 7000);

INSERT INTO transaksi VALUES
(120, 98765456, 'k0001', 76348001, 1, '2025-05-18', 0, 9500, 9500, 0),
(121, 98765456, 'k0001', 23591002, 1, '2025-05-18', 0, 14500, 14500, 0),
(122, 98765457, 'k0002', 99112003, 10, '2025-05-19', 0, 5000, 5000, 0),
(123, 98765458, 'k0001', 88123004, 1, '2025-05-19', 0, 7000, 7000, 0),
(124, 98765457, 'k0002', 76348001, 2, '2025-05-20', 0, 19000, 19000, 0);

-- TCL: Skenario Transaksi

START TRANSACTION;
INSERT INTO transaksi VALUES
(125, 98765456, 'k0001', 76348001, 2, '2025-05-21', 0, 19000, 19000, 0);
COMMIT;
-- Gunakan ROLLBACK jika terjadi kesalahan

-- Query Pengolahan Data

-- Menampilkan seluruh data transaksi
SELECT * FROM transaksi;

-- JOIN: Menampilkan transaksi lengkap
SELECT t.id_transaksi, p.nama_pelanggan, k.nama_kasir,
       b.jenis_layanan, t.jumlah_barang, t.sub_total, t.tanggal
FROM transaksi t
JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan
JOIN kasir k ON t.id_kasir = k.id_kasir
JOIN barang b ON t.id_barang = b.id_barang;

-- GROUP BY + Agregasi
SELECT b.jenis_layanan,
       SUM(t.sub_total) AS total_pendapatan
FROM transaksi t
JOIN barang b ON t.id_barang = b.id_barang
GROUP BY b.jenis_layanan;

-- HAVING
SELECT b.jenis_layanan,
       SUM(t.sub_total) AS total_pendapatan
FROM transaksi t
JOIN barang b ON t.id_barang = b.id_barang
GROUP BY b.jenis_layanan
HAVING SUM(t.sub_total) > 10000;

-- Subquery: Pelanggan dengan total bayar >= 20000
SELECT nama_pelanggan
FROM pelanggan
WHERE id_pelanggan IN (
    SELECT id_pelanggan
    FROM transaksi
    GROUP BY id_pelanggan
    HAVING SUM(total_bayar) >= 20000
);

-- Subquery: Pelanggan dengan total bayar <= 20000
SELECT nama_pelanggan
FROM pelanggan
WHERE id_pelanggan IN (
    SELECT id_pelanggan
    FROM transaksi
    GROUP BY id_pelanggan
    HAVING SUM(total_bayar) <= 20000
);
