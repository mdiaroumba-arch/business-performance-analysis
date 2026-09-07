USE business_performance;

-- On vide la table avant de refaire un import
TRUNCATE TABLE sales;

-- Import du fichier CSV nettoyé
LOAD DATA LOCAL INFILE
'C:/Users/MOUSSA/Desktop/FORMATIONS/Formation_PowerBI/Projet_performance-analysis/business-performance-analysis/data/processed/sales_data_clean.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Vérification du nombre de lignes importées
SELECT COUNT(*) AS total_rows
FROM sales;

-- Aperçu des premières lignes
SELECT *
FROM sales
LIMIT 10;

