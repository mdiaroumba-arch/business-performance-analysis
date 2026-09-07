USE business_performance;

-- 1. Chiffre d'affaires net total
SELECT 
    ROUND(SUM(sales), 2) AS total_sales
FROM sales;

-- 2. Profit total
SELECT 
    ROUND(SUM(profit), 2) AS total_profit
FROM sales;

-- 3. Total des unités vendues
SELECT 
    ROUND(SUM(units_sold), 2) AS total_units_sold
FROM sales;

-- 4. Total des remises
SELECT 
    ROUND(SUM(discounts), 2) AS total_discounts
FROM sales;

-- 5. COGS total
SELECT 
    ROUND(SUM(cogs), 2) AS total_cogs
FROM sales;

-- 6. Taux de marge global
SELECT 
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS margin_rate
FROM sales;

-- 7. Taux de remise global
SELECT
    ROUND(
        SUM(discounts) / SUM(gross_sales) * 100,
        2
    ) AS discount_rate
FROM sales;