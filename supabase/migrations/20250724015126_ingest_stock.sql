DROP TABLE IF EXISTS public.all_cogm_in;

CREATE TABLE public.all_cogm_in AS (
    -- COGM Gudang
    SELECT
        'Gudang Pusat' AS "source_location",
        "Conc", "Tanggal", "Transaksi Dari", "Kode Material", NULL AS "DC", "Nama Bahan Baku",
        NULL AS "Nama Bahan Baku Lama", "SKU Lama", "Status Pemasukan", "Satuan",
        "Detail Packaging", NULL AS "Quantity Permintaan", "Quantity Diterima",
        NULL AS "Quantity Dikirim Gudang", NULL AS "Quantity Dikirim", "Batch No",
        "Exp Date / Prod Date" AS "exp_or_prod_date", "Nama Admin", "Vendor", "Keterangan",
        'juni' AS "period"
    FROM raw.raw_cogm_gudang_in_juni
    UNION ALL
    SELECT 'Gudang Pusat', "Conc", "Tanggal", "Transaksi Dari", "Kode Material", NULL, "Nama Bahan Baku", NULL, "SKU Lama", "Status Pemasukan", "Satuan", "Detail Packaging", NULL, "Quantity Diterima", NULL, NULL, "Batch No", "Exp Date / Prod Date", "Nama Admin", "Vendor", "Keterangan", 'juli' FROM raw.raw_cogm_gudang_in_juli
    
    UNION ALL

    -- COGM Frozen
    SELECT
        'Packing Frozen' AS "source_location",
        "Conc", "Tanggal", NULL, "Kode Material", NULL, NULL, "Nama Bahan Baku Lama",
        NULL, "Status Pemasukan", "Satuan", "Detail Packaging", "Quantity Permintaan",
        "Quantity Terkirim", NULL, NULL, "Batch No", "Prod Date", NULL, "Vendor", "Keterangan",
        'juni' AS "period"
    FROM raw.raw_cogm_frozen_in_juni
    UNION ALL
    SELECT 'Packing Frozen', "Conc", "Tanggal", NULL, "Kode Material", NULL, NULL, "Nama Bahan Baku Lama", NULL, "Status Pemasukan", "Satuan", "Detail Packaging", "Quantity Permintaan", "Quantity Terkirim", NULL, NULL, "Batch No", "Prod Date", NULL, "Vendor", "Keterangan", 'juli' FROM raw.raw_cogm_frozen_in_juli

    UNION ALL

    -- COGM DC (Cibiru, GBA, Pulogadung, Sukamenak, Sukasenang)
    SELECT
        'DC' AS "source_location",
        "Conc", "Tanggal", "Transaksi Dari", "Kode Material", "DC", "Nama Bahan Baku",
        NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL,
        "Quantity Diterima", "Quantity Dikirim Gudang", NULL, "Batch No",
        "Exp Date / Prod Date", NULL, "Vendor", "Keterangan",
        'juni' AS "period"
    FROM raw.raw_cogm_dc_cibiru_in_juni
    UNION ALL
    SELECT 'DC', "Conc", "Tanggal", "Transaksi Dari", "Kode Material", "DC", "Nama Bahan Baku", NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL, "Quantity Diterima", "Quantity Dikirim Gudang", NULL, "Batch No", "Exp Date / Prod Date", NULL, "Vendor", "Keterangan", 'juli' FROM raw.raw_cogm_dc_cibiru_in_juli
    UNION ALL
    SELECT 'DC', "Conc", "Tanggal", "Transaksi Dari", "Kode Material", "DC", "Nama Bahan Baku", NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL, "Quantity Diterima", "Quantity Dikirim Gudang", NULL, "Batch No", "Exp Date / Prod Date", NULL, "Vendor", "Keterangan", 'juni' FROM raw.raw_cogm_dc_gba_in_juni
    UNION ALL
    SELECT 'DC', "Conc", "Tanggal", "Transaksi Dari", "Kode Material", "DC", "Nama Bahan Baku", NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL, "Quantity Diterima", "Quantity Dikirim Gudang", NULL, "Batch No", "Exp Date / Prod Date", NULL, "Vendor", "Keterangan", 'juli' FROM raw.raw_cogm_dc_gba_in_juli
    UNION ALL
    SELECT 'DC', "Conc", "Tanggal", "Transaksi Dari", "Kode Material", "DC", "Nama Bahan Baku", NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL, "Quantity Diterima", "Quantity Dikirim Gudang", NULL, "Batch No", "Exp Date / Prod Date", NULL, "Vendor", "Keterangan", 'juni' FROM raw.raw_cogm_dc_pulogadung_in_juni
    UNION ALL
    SELECT 'DC', "Conc", "Tanggal", "Transaksi Dari", "Kode Material", "DC", "Nama Bahan Baku", NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL, "Quantity Diterima", "Quantity Dikirim Gudang", NULL, "Batch No", "Exp Date / Prod Date", NULL, "Vendor", "Keterangan", 'juli' FROM raw.raw_cogm_dc_pulogadung_in_juli
    UNION ALL
    SELECT 'DC', "Conc", "Tanggal", "Transaksi Dari", "Kode Material", "DC", "Nama Bahan Baku", NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL, "Quantity Diterima", "Quantity Dikirim Gudang", NULL, "Batch No", "Exp Date / Prod Date", NULL, "Vendor", "Keterangan", 'juni' FROM raw.raw_cogm_dc_sukamenak_in_juni
    UNION ALL
    SELECT 'DC', "Conc", "Tanggal", "Transaksi Dari", "Kode Material", "DC", "Nama Bahan Baku", NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL, "Quantity Diterima", "Quantity Dikirim Gudang", NULL, "Batch No", "Exp Date / Prod Date", NULL, "Vendor", "Keterangan", 'juli' FROM raw.raw_cogm_dc_sukamenak_in_juli
    UNION ALL
    SELECT 'DC', "Conc", "Tanggal", "Transaksi Dari", "Kode Material", NULL, "Nama Bahan Baku", NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL, "Quantity Diterima", "Quantity Dikirim Gudang", NULL, "Batch No", "Exp Date / Prod Date", NULL, "Vendor", "Keterangan", 'juni' FROM raw.raw_cogm_dc_sukasenang_in_juni
    UNION ALL
    SELECT 'DC', "Conc", "Tanggal", "Transaksi Dari", "Kode Material", NULL, "Nama Bahan Baku", NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL, "Quantity Diterima", "Quantity Dikirim Gudang", NULL, "Batch No", "Exp Date / Prod Date", NULL, "Vendor", "Keterangan", 'juli' FROM raw.raw_cogm_dc_sukasenang_in_juli
    UNION ALL
    SELECT 'DC', "Conc", "Tanggal", "Transaksi Dari", "Kode Material", "DC", "Nama Bahan Baku", NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL, "Quantity Diterima", "Quantity Dikirim Gudang", NULL, "Batch No", "Exp Date / Prod Date", NULL, "Vendor", "Keterangan", 'juni' FROM raw.raw_cogm_dc_sariwangi_in_juni
    UNION ALL
    SELECT 'DC', "Conc", "Tanggal", "Transaksi Dari", "Kode Material", "DC", "Nama Bahan Baku", NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL, "Quantity Diterima", "Quantity Dikirim Gudang", NULL, "Batch No", "Exp Date / Prod Date", NULL, "Vendor", "Keterangan", 'juli' FROM raw.raw_cogm_dc_sariwangi_in_juli

    UNION ALL

    -- COGM DC Tebet (Struktur unik dengan "Quantity Dikirim")
    SELECT
        'DC' AS "source_location",
        "Conc", "Tanggal", "Transaksi Dari", "Kode Material", "DC", "Nama Bahan Baku",
        NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL,
        "Quantity Diterima", NULL, "Quantity Dikirim", "Batch No",
        "Exp Date / Prod Date", NULL, "Vendor", "Keterangan",
        'juni' AS "period"
    FROM raw.raw_cogm_dc_tebet_in_juni
    UNION ALL
    SELECT 'DC', "Conc", "Tanggal", "Transaksi Dari", "Kode Material", "DC", "Nama Bahan Baku", NULL, NULL, "Status Pemasukan", "Satuan", "Detail Packaging", NULL, "Quantity Diterima", NULL, "Quantity Dikirim", "Batch No", "Exp Date / Prod Date", NULL, "Vendor", "Keterangan", 'juli' FROM raw.raw_cogm_dc_tebet_in_juli
);
