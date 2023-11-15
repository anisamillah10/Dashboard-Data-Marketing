-- Membuat Tabel Agregat Datamart untuk Tim Pemasaran
CREATE TABLE AgregateDatamartPemasaran AS
SELECT
    EXTRACT(MONTH FROM P.tanggal) AS bulan,
    B.nama_barang,
    SUM(P.jumlah_barang) AS total_penjualan,
    SUM(P.jumlah_barang * P.harga) AS total_penghasilan,
    C.id_cabang_sales,
    C.cabang_sales,
    COUNT(P.id_customer) AS total_pelanggan
FROM penjualan P
JOIN barang B ON P.id_barang = B.kode_barang
JOIN pelanggan C ON P.id_customer = C.id_customer
GROUP BY EXTRACT(MONTH FROM P.tanggal), B.nama_barang, C.id_cabang_sales, C.cabang_sales
ORDER BY EXTRACT(MONTH FROM P.tanggal);

-- Menghitung total penghasilan dari setiap produk per bulan
SELECT
    bulan,
    nama_barang,
    SUM(total_penghasilan) AS total_penghasilan_perbulan
FROM AgregateDatamartPemasaran
GROUP BY bulan, nama_barang
ORDER BY bulan;

