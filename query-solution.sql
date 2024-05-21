CREATE TABLE pelanggan (
    KODE VARCHAR(11) PRIMARY KEY,
    NAMA VARCHAR(255),
    ALAMAT VARCHAR(255)
);

CREATE TABLE barang (
    KODE VARCHAR(255) PRIMARY KEY,
    NAMA VARCHAR(255),
    HARGA DOUBLE PRECISION
);

CREATE TABLE transaksi (
    KODE VARCHAR(255) PRIMARY KEY,
    TANGGAL DATE,
    KODE_PELANGGAN VARCHAR(255),
    KODE_BARANG VARCHAR(255),
    JUMLAH_BARANG DOUBLE PRECISION,
    FOREIGN KEY (KODE_PELANGGAN) REFERENCES pelanggan(KODE),
    FOREIGN KEY (KODE_BARANG) REFERENCES barang(KODE)
);


INSERT INTO barang (KODE, NAMA, HARGA) 
VALUES 
    ('B1', 'Baju', 12000),
    ('B2', 'Celana', 10000),
    ('B3', 'Sepatu', 30000);

INSERT INTO pelanggan (KODE, NAMA, ALAMAT) 
VALUES 
    ('P1', 'Yogi', 'JAKARTA'),
    ('P2', 'Anggi', 'BANDUNG'),
    ('P3', 'Rahma', 'BANDUNG');

INSERT INTO transaksi (KODE, TANGGAL, KODE_PELANGGAN, KODE_BARANG, JUMLAH_BARANG) 
VALUES 
    ('TRX001', '2019-10-01', 'P1', 'B1', 3),
    ('TRX002', '2019-10-02', 'P2', 'B2', 2),
    ('TRX003', '2019-10-08', 'P2', 'B1', 5),
    ('TRX004', '2019-10-10', 'P1', 'B1', 1),
    ('TRX005', '2019-10-17', 'P3', 'B2', 2),
    ('TRX006', '2019-10-17', 'P2', 'B3', 1),
    ('TRX007', '2019-10-18', 'P3', 'B1', 4),
    ('TRX008', '2019-10-18', 'P2', 'B2', 2);

select * from transaksi;

-- Soal 1
select *
from barang
where harga > 10000
order by harga asc;

-- Soal 2
select * 
from pelanggan
where nama like '%g%' and alamat = 'BANDUNG';

-- Soal 3
select t.KODE AS KODE, 
       t.TANGGAL AS TANGGAL, 
       p.NAMA AS NAMA_PELANGGAN, 
       b.NAMA AS NAMA_BARANG, 
       t.JUMLAH_BARANG AS JUMLAH, 
       b.HARGA AS HARGA_SATUAN,
	   (t.JUMLAH_BARANG * b.HARGA) as TOTAL
from transaksi t
join pelanggan p on t.KODE_PELANGGAN = p.KODE
join barang b on t.KODE_BARANG = b.KODE
order by p.NAMA asc, t.TANGGAL asc;

-- Soal 4
select p.NAMA as NAMA_PELANGGAN,
	   SUM(t.JUMLAH_BARANG) AS JUMLAH,
	   SUM(t.JUMLAH_BARANG * b.HARGA) AS TOTAL_HARGA
from transaksi t
join pelanggan p on t.KODE_PELANGGAN = p.KODE
join barang b on t.KODE_BARANG = b.KODE
group by p.NAMA
order by p.NAMA asc;
	   
	   
