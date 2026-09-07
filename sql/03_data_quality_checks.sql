USE business_performance;

-- 1. Vérifier le nombre total de lignes
SELECT COUNT(*) AS total_rows
FROM sales;

-- 2. Vérifier les valeurs manquantes sur les variables principales
SELECT
    SUM(segment IS NULL) AS null_segment,
    SUM(country IS NULL) AS null_country,
    SUM(product IS NULL) AS null_product,
    SUM(discount_band IS NULL) AS null_discount_band,
    SUM(units_sold IS NULL) AS null_units_sold,
    SUM(manifacturing_price IS NULL) AS null_manifacturing_price,
    SUM(sale_price IS NULL) AS null_sale_price,
    SUM(gross_sales IS NULL) AS null_gross_sales,
    SUM(discounts IS NULL) AS null_discounts,
    SUM(sales IS NULL) AS null_sales,
    SUM(cogs IS NULL) AS null_cogs,
    SUM(profit IS NULL) AS null_profit,
    SUM(sale_date IS NULL) AS null_sale_date,
    SUM(month_number IS NULL) AS null_month_number,
    SUM(month_name IS NULL) AS null_month_name,
    SUM(year IS NULL) AS null_year
FROM sales;

-- 3. Vérifier les modalités des variables catégorielles
SELECT DISTINCT segment
FROM sales;

SELECT DISTINCT country
FROM sales;

SELECT DISTINCT product
FROM sales;

SELECT DISTINCT discount_band
FROM sales;

-- 4. Vérifier la cohérence financière
SELECT COUNT(*) AS inconsistent_sales
FROM sales
WHERE ABS(sales - (gross_sales - discounts)) > 0.01;

SELECT COUNT(*) AS inconsistent_profit
FROM sales
WHERE ABS(profit - (sales - cogs)) > 0.01;

-- 5. Vérifier les valeurs négatives anormales
SELECT *
FROM sales
WHERE units_sold < 0
   OR gross_sales < 0
   OR discounts < 0
   OR sales < 0
   OR cogs < 0;

-- 6. Vérifier la période couverte
SELECT
    MIN(sale_date) AS min_date,
    MAX(sale_date) AS max_date
FROM sales;

-- 7. Vérifier la cohérence du calendrier
SELECT DISTINCT month_number, month_name
FROM sales
ORDER BY month_number;

SELECT DISTINCT year
FROM sales
ORDER BY year;