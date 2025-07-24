DROP TABLE IF EXISTS public.all_stock;

CREATE TABLE public.all_stock AS (
    -- Tabel yang tidak memiliki kolom tertentu akan diisi dengan NULL
    
    -- Stock Gudang
    SELECT 
        'Gudang Pusat' AS "source_location",
        NULL AS "DC",
        "Kode Material",
        "Nama Barang",
        NULL AS "Nama Barang Lama",
        "SKU Lama",
        "Kategori",
        "Satuan",
        "Stock Awal",
        'juni' AS "period"
    FROM raw.raw_stock_gudang_juni
    UNION ALL
    SELECT 
        'Gudang Pusat' AS "source_location",
        NULL AS "DC",
        "Kode Material",
        "Nama Barang",
        NULL AS "Nama Barang Lama",
        "SKU Lama",
        "Kategori",
        "Satuan",
        "Stock Awal",
        'juli' AS "period"
    FROM raw.raw_stock_gudang_juli
    
    UNION ALL

    -- Stock Packing Frozen
    SELECT 
        'Packing Frozen' AS "source_location",
        NULL AS "DC",
        "Kode Material",
        "Nama Barang",
        NULL AS "Nama Barang Lama",
        NULL AS "SKU Lama",
        "Kategori",
        "Satuan",
        "Stock Awal",
        'juni' AS "period"
    FROM raw.raw_stock_packing_frozen_juni
    UNION ALL
    SELECT 
        'Packing Frozen' AS "source_location",
        NULL AS "DC",
        "Kode Material",
        "Nama Barang",
        NULL AS "Nama Barang Lama",
        NULL AS "SKU Lama",
        "Kategori",
        "Satuan",
        "Stock Awal",
        'juli' AS "period"
    FROM raw.raw_stock_packing_frozen_juli

    UNION ALL

    -- Stock DC (Cibiru, GBA, Pulogadung, Sariwangi, Sukamenak, Tebet)
    -- Menggabungkan semua DC yang strukturnya sama
    SELECT 
        'DC' AS "source_location",
        "DC",
        "Kode Material",
        "Nama Barang",
        NULL AS "Nama Barang Lama",
        NULL AS "SKU Lama",
        "Kategori",
        "Satuan",
        "Stock Awal",
        'juni' AS "period"
    FROM raw.raw_stock_dc_cibiru_juni
    UNION ALL
    SELECT 'DC' AS "source_location", "DC", "Kode Material", "Nama Barang", NULL, NULL, "Kategori", "Satuan", "Stock Awal", 'juli' FROM raw.raw_stock_dc_cibiru_juli
    UNION ALL
    SELECT 'DC' AS "source_location", "DC", "Kode Material", "Nama Barang", NULL, NULL, "Kategori", "Satuan", "Stock Awal", 'juni' FROM raw.raw_stock_dc_gba_juni
    UNION ALL
    SELECT 'DC' AS "source_location", "DC", "Kode Material", "Nama Barang", NULL, NULL, "Kategori", "Satuan", "Stock Awal", 'juli' FROM raw.raw_stock_dc_gba_juli
    UNION ALL
    SELECT 'DC' AS "source_location", "DC", "Kode Material", "Nama Barang", NULL, NULL, "Kategori", "Satuan", "Stock Awal", 'juni' FROM raw.raw_stock_dc_pulogadung_juni
    UNION ALL
    SELECT 'DC' AS "source_location", "DC", "Kode Material", "Nama Barang", NULL, NULL, "Kategori", "Satuan", "Stock Awal", 'juli' FROM raw.raw_stock_dc_pulogadung_juli
    UNION ALL
    SELECT 'DC' AS "source_location", "DC", "Kode Material", "Nama Barang", NULL, NULL, "Kategori", "Satuan", "Stock Awal", 'juni' FROM raw.raw_stock_dc_sariwangi_juni
    UNION ALL
    SELECT 'DC' AS "source_location", "DC", "Kode Material", "Nama Barang", NULL, NULL, "Kategori", "Satuan", "Stock Awal", 'juli' FROM raw.raw_stock_dc_sariwangi_juli
    UNION ALL
    SELECT 'DC' AS "source_location", "DC", "Kode Material", "Nama Barang", NULL, NULL, "Kategori", "Satuan", "Stock Awal", 'juni' FROM raw.raw_stock_dc_sukamenak_juni
    UNION ALL
    SELECT 'DC' AS "source_location", "DC", "Kode Material", "Nama Barang", NULL, NULL, "Kategori", "Satuan", "Stock Awal", 'juli' FROM raw.raw_stock_dc_sukamenak_juli
    UNION ALL
    SELECT 'DC' AS "source_location", "DC", "Kode Material", "Nama Barang", NULL, NULL, "Kategori", "Satuan", "Stock Awal", 'juni' FROM raw.raw_stock_dc_tebet_juni
    UNION ALL
    SELECT 'DC' AS "source_location", "DC", "Kode Material", "Nama Barang", NULL, NULL, "Kategori", "Satuan", "Stock Awal", 'juli' FROM raw.raw_stock_dc_tebet_juli

    UNION ALL

    -- Stock DC Sukasenang (Struktur unik dengan "Nama Barang Lama")
    SELECT 
        'DC' AS "source_location",
        "DC",
        "Kode Material",
        "Nama Barang",
        "Nama Barang Lama",
        NULL AS "SKU Lama",
        "Kategori",
        "Satuan",
        "Stock Awal",
        'juni' AS "period"
    FROM raw.raw_stock_dc_sukasenang_juni
    UNION ALL
    SELECT 
        'DC' AS "source_location",
        "DC",
        "Kode Material",
        "Nama Barang",
        "Nama Barang Lama",
        NULL AS "SKU Lama",
        "Kategori",
        "Satuan",
        "Stock Awal",
        'juli' AS "period"
    FROM raw.raw_stock_dc_sukasenang_juli
);