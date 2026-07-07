-- Data is loaded into MySQL via Python (see python/mandi_analysis_final.ipynb) 
-- Run the notebook first, then run these queries.

create database mandi_db;
use mandi_db;

DROP TABLE IF EXISTS mandi_prices;

CREATE TABLE mandi_prices (
    Arrival_Date DATE,
    Commodity VARCHAR(100),
    Commodity_Code INT,
    District VARCHAR(50),
    Grade VARCHAR(20),
    Market VARCHAR(100),
    Max_Price INT,
    Min_Price INT,
    Modal_Price INT,
    State VARCHAR(50),
    Variety VARCHAR(100),
    Price_Year INT,
    Price_Month INT,
    Month_Name VARCHAR(10),
    YearMonth VARCHAR(7),
    Price_Spread INT,
    Spread_Pct DECIMAL(6,2)
);


USE mandi_db;

SELECT COUNT(*) FROM mandi_prices;

# Top 10 Most Traded Commodities

SELECT Commodity, COUNT(*) AS Record_Count
FROM mandi_prices
GROUP BY Commodity
ORDER BY Record_Count DESC
LIMIT 10;

# Top 10 Most Volatile Commodities (by Price Spread %)

SELECT Commodity, ROUND(AVG(Spread_Pct),2) AS Avg_Spread_Pct, COUNT(*) AS Records
FROM mandi_prices
GROUP BY Commodity
HAVING Records >= 50
ORDER BY Avg_Spread_Pct DESC
LIMIT 10;

# Monthly Price Trend — Onion

SELECT YearMonth, ROUND(AVG(Modal_Price),2) AS Avg_Price
FROM mandi_prices
WHERE Commodity = 'Onion'
GROUP BY YearMonth
ORDER BY YearMonth;

# Market-wise Price Comparison — Onion

SELECT Market, ROUND(AVG(Modal_Price),2) AS Avg_Price, COUNT(*) AS Records
FROM mandi_prices
WHERE Commodity = 'Onion'
GROUP BY Market
HAVING Records >= 20
ORDER BY Avg_Price DESC;

# Grade vs Average Price (All Commodities Combined)

SELECT Grade, ROUND(AVG(Modal_Price),2) AS Avg_Price, COUNT(*) AS Records
FROM mandi_prices
GROUP BY Grade
ORDER BY Avg_Price DESC;

#Grade vs Average Price — Onion Only 

SELECT Grade, ROUND(AVG(Modal_Price),2) AS Avg_Price, COUNT(*) AS Records
FROM mandi_prices
WHERE Commodity = 'Onion'
GROUP BY Grade
ORDER BY Avg_Price DESC;