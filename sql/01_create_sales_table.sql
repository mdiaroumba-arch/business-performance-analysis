-- Création de la base de données
CREATE DATABASE IF NOT EXISTS business_performance;

-- Sélection de la base
USE business_performance;

-- Création de la table des ventes
CREATE TABLE IF NOT EXISTS sales (
    segment VARCHAR(50),
    country VARCHAR(50),
    product VARCHAR(50),
    discount_band VARCHAR(30),

    units_sold DECIMAL(12,2),
    manufacturing_price DECIMAL(12,2),
    sale_price DECIMAL(12,2),

    gross_sales DECIMAL(15,3),
    discounts DECIMAL(15,3),
    sales DECIMAL(15,3),
    cogs DECIMAL(15,3),
    profit DECIMAL(15,3),

    sale_date DATE,
    month_number INT,
    month_name VARCHAR(20),
    year INT
);