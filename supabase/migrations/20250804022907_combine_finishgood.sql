SELECT
    tanggal,
    "Store",
    "item_name_original",
    finished_good,
    SUM("Qty") AS total_qty
    --,SUM(qty * unit_price) AS total_sales
FROM (
    -- Subkueri untuk menggabungkan data Januari dan Februari dan menstandardisasi nama kolom
    SELECT
        "No. Receipt" AS no_receipt,
        "Transaction Date"::DATE AS tanggal, -- Konversi ke DATE langsung di sini
        "Store",
        "Cashier",
        "Customer",
        "Order Type" AS order_type,
        "Payment Type" AS payment_type,
        "Category",
        "Sub Category" AS sub_category,
        "Item Name" AS item_name_original, -- Simpan nama asli untuk konversi
        "Qty",
        "Unit Price" AS unit_price,
        "Item Sales" AS item_sales,
        "Discount Item" AS discount_item,
        "Modifier",
        "Net Sales" AS net_sales
        -- Tambahkan semua kolom lain yang Anda butuhkan di sini
    FROM public.all_transactions

   
) AS combined_receipts
-- Lakukan JOIN lateral untuk mengkonversi dan memperbanyak baris
CROSS JOIN LATERAL (
    SELECT unnested_item AS finished_good
    FROM unnest(
        CASE
            WHEN combined_receipts.item_name_original = 'CIMOL MOZZA PORSI BESAR' THEN ARRAY['CIMOL MOZZA', 'CIMOL MOZZA']
            WHEN combined_receipts.item_name_original = 'CIMOL BOJOT PORSI BESAR' THEN ARRAY['CIMOL BOJOT', 'CIMOL BOJOT']
            WHEN combined_receipts.item_name_original = 'CIMOL AYAM PORSI BESAR' THEN ARRAY['CIMOL AYAM', 'CIMOL AYAM']
            -- Untuk MIX items, pisahkan menjadi masing-masing item
            WHEN combined_receipts.item_name_original = 'MIX BOJOT MOZZA' THEN ARRAY['CIMOL BOJOT', 'CIMOL MOZZA']
            WHEN combined_receipts.item_name_original = 'MIX MOZZA AYAM' THEN ARRAY['CIMOL MOZZA', 'CIMOL AYAM']
            WHEN combined_receipts.item_name_original = 'MIX BOJOT AYAM' THEN ARRAY['CIMOL BOJOT', 'CIMOL AYAM']
            WHEN combined_receipts.item_name_original = 'MIX MOZZA BEEF' THEN ARRAY['CIMOL MOZZA', 'CIMOL BEEF']
            WHEN combined_receipts.item_name_original = 'MIX BOJOT BEEF' THEN ARRAY['CIMOL BOJOT', 'CIMOL BEEF']
            WHEN combined_receipts.item_name_original = 'MIX AYAM BEEF' THEN ARRAY['CIMOL AYAM', 'CIMOL BEEF']
            -- Untuk item 1-ke-1 (Porsi Kecil, Frozen), tetap masukkan dalam array
            WHEN combined_receipts.item_name_original = 'CIMOL AYAM PORSI KECIL' THEN ARRAY['CIMOL AYAM']
            WHEN combined_receipts.item_name_original = 'CIMOL MOZZA PORSI KECIL' THEN ARRAY['CIMOL MOZZA']
            WHEN combined_receipts.item_name_original = 'CIMOL BOJOT PORSI KECIL' THEN ARRAY['CIMOL BOJOT']
            WHEN combined_receipts.item_name_original = 'CIMOL BEEF PORSI KECIL' THEN ARRAY['CIMOL BEEF']
            WHEN combined_receipts.item_name_original = 'Frozen Mozza' THEN ARRAY['FROZEN MOZZA']
            WHEN combined_receipts.item_name_original = 'Frozen Ayam' THEN ARRAY['FROZEN AYAM']
            WHEN combined_receipts.item_name_original = 'Frozen Bojot' THEN ARRAY['FROZEN BOJOT']
            -- Jika tidak ada aturan yang cocok, gunakan nama asli sebagai satu elemen array
            ELSE ARRAY[combined_receipts.item_name_original]
        END
    ) AS unnested_item -- Alias untuk setiap elemen setelah unnest
) AS item_conversion
WHERE item_conversion.finished_good IN ('CIMOL MOZZA', 'CIMOL BOJOT', 'CIMOL AYAM', 'CIMOL BEEF', 'FROZEN MOZZA', 'FROZEN AYAM', 'FROZEN BOJOT')
GROUP BY
    tanggal,
    "Store",
    "item_name_original",
    finished_good
ORDER BY
    tanggal,
    "Store",
    "item_name_original",
    finished_good;