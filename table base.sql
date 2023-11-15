-- Membuat Tabel Base 
CREATE TABLE BaseDatamartPemasaran2 AS
SELECT
    P.id_invoice,
    P.tanggal,
    P.id_customer,
    C.nama AS nama_pelanggan,
    C.id_cabang_sales,
    C.cabang_sales,
    P.id_barang,
    B.nama_barang,
    B.kemasan,
    P.jumlah_barang,
    P.harga
FROM penjualan P
JOIN pelanggan C ON P.id_customer = C.id_customer
JOIN barang B ON P.id_barang = B.kode_barang;

