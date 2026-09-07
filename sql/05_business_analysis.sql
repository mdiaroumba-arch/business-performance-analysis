USE business_performance;

-- =====================================================
-- 1. PERFORMANCE PAR SEGMENT
-- =====================================================

SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS margin_rate,
    ROUND(SUM(units_sold), 2) AS total_units_sold
FROM sales
GROUP BY segment
ORDER BY total_profit DESC;


-- =====================================================
-- 2. PERFORMANCE PAR PRODUIT
-- =====================================================

SELECT
    product,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS margin_rate,
    ROUND(SUM(units_sold), 2) AS total_units_sold
FROM sales
GROUP BY product
ORDER BY total_profit DESC;


-- =====================================================
-- 3. PERFORMANCE PAR PAYS
-- =====================================================

SELECT
    country,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS margin_rate
FROM sales
GROUP BY country
ORDER BY total_profit DESC;


-- =====================================================
-- 4. IMPACT DES REMISES
-- =====================================================

SELECT
    discount_band,
    ROUND(SUM(gross_sales), 2) AS gross_sales,
    ROUND(SUM(discounts), 2) AS total_discounts,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS margin_rate,
    ROUND(SUM(units_sold), 2) AS total_units_sold
FROM sales
GROUP BY discount_band
ORDER BY margin_rate DESC;


-- =====================================================
-- 5. TRANSACTIONS EN PERTE
-- =====================================================

SELECT
    segment,
    country,
    product,
    discount_band,
    sales,
    cogs,
    profit,
    sale_date
FROM sales
WHERE profit < 0
ORDER BY profit ASC;


-- =====================================================
-- 6. RÉPARTITION DES PERTES PAR SEGMENT
-- =====================================================

SELECT
    segment,
    COUNT(*) AS number_of_loss_rows,
    ROUND(SUM(profit), 2) AS total_loss
FROM sales
WHERE profit < 0
GROUP BY segment
ORDER BY total_loss ASC;


-- =====================================================
-- 7. RÉPARTITION DES PERTES PAR PRODUIT
-- =====================================================

SELECT
    product,
    COUNT(*) AS number_of_loss_rows,
    ROUND(SUM(profit), 2) AS total_loss
FROM sales
WHERE profit < 0
GROUP BY product
ORDER BY total_loss ASC;


-- =====================================================
-- 8. RÉPARTITION DES PERTES PAR NIVEAU DE REMISE
-- =====================================================

SELECT
    discount_band,
    COUNT(*) AS number_of_loss_rows,
    ROUND(SUM(profit), 2) AS total_loss
FROM sales
WHERE profit < 0
GROUP BY discount_band
ORDER BY total_loss ASC;


-- =====================================================
-- 9. ÉVOLUTION ANNUELLE
-- =====================================================

SELECT
    year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS margin_rate
FROM sales
GROUP BY year
ORDER BY year;


-- =====================================================
-- 10. ÉVOLUTION MENSUELLE
-- =====================================================

SELECT
    year,
    month_number,
    month_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY year, month_number, month_name
ORDER BY year, month_number;


-- =====================================================
-- 11. CONTRIBUTION DES PRODUITS AU CA
-- =====================================================

SELECT
    product,
    ROUND(SUM(sales), 2) AS product_sales,
    ROUND(
        SUM(sales) / (SELECT SUM(sales) FROM sales) * 100,
        2
    ) AS sales_contribution_pct
FROM sales
GROUP BY product
ORDER BY sales_contribution_pct DESC;


-- =====================================================
-- 12. CONTRIBUTION DES SEGMENTS AU PROFIT
-- =====================================================

SELECT
    segment,
    ROUND(SUM(profit), 2) AS segment_profit,
    ROUND(
        SUM(profit) / (SELECT SUM(profit) FROM sales) * 100,
        2
    ) AS profit_contribution_pct
FROM sales
GROUP BY segment
ORDER BY segment_profit DESC;