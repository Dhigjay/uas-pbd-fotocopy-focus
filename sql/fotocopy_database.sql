CREATE DATABASE fotocopy_db;
USE fotocopy_db;

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

select * from transaksi;

INSERT INTO pelanggan VALUES
(98765456, 'Daniel');

INSERT INTO kasir VALUES
('k0001', 'Albert');

INSERT INTO barang VALUES
(76348001, 'Print Warna', 9500),
(23591002, 'Laminating', 14500);

INSERT INTO transaksi VALUES
(120, 98765456, 'k0001', 76348001, 1, '2025-05-18', 0, 22000, 9500, 0),
(121, 98765456, 'k0001', 23591002, 1, '2025-05-18', 0, 22000, 14500, 0);


START TRANSACTION;
INSERT INTO transaksi VALUES
(122, 98765456, 'k0001', 76348001, 2, '2025-05-19', 0, 19000, 19000, 0);

COMMIT;
-- atau gunakan ROLLBACK; jika terjadi kesalahan

SELECT t.id_transaksi, p.nama_pelanggan, k.nama_kasir,
       b.jenis_layanan, t.jumlah_barang, t.sub_total, t.tanggal
FROM transaksi t
JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan
JOIN kasir k ON t.id_kasir = k.id_kasir
JOIN barang b ON t.id_barang = b.id_barang;

SELECT b.jenis_layanan,
       SUM(t.sub_total) AS total_pendapatan
FROM transaksi t
JOIN barang b ON t.id_barang = b.id_barang
GROUP BY b.jenis_layanan;

SELECT b.jenis_layanan,
       SUM(t.sub_total) AS total_pendapatan
FROM transaksi t
JOIN barang b ON t.id_barang = b.id_barang
GROUP BY b.jenis_layanan
HAVING SUM(t.sub_total) > 10000;

SELECT nama_pelanggan
FROM pelanggan
WHERE id_pelanggan IN (
    SELECT id_pelanggan
    FROM transaksi
    GROUP BY id_pelanggan
    HAVING SUM(total_bayar) >= 20000
);



