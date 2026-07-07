# Maharashtra Mandi Price Analysis

A data analysis project exploring agricultural commodity prices across mandis (markets) in Maharashtra, India — covering data cleaning, SQL analysis, Excel reporting, and an interactive Power BI dashboard.

## Objective

To analyze agricultural mandi price data from Maharashtra and uncover patterns in seasonal price fluctuations, grade-based pricing differences, and market-to-market price variation — helping identify which commodities are most volatile, when prices peak, and how quality grade and location affect pricing.

## Dataset

The dataset contains **142,654 records** of daily mandi price reports for agricultural commodities across districts and markets in Maharashtra, including:

| Column | Description |
|---|---|
| Arrival_Date | Date the commodity arrived at market |
| Commodity | Name of the agricultural commodity |
| District / Market | Location of the mandi |
| Grade | Quality grade (FAQ / Local) |
| Variety | Commodity variety |
| Min_Price / Max_Price / Modal_Price | Price range and most common price (₹) |
| Price_Spread / Spread_Pct | Derived: difference and % spread between min and max price |

## Methodology

1. **Data Cleaning (Python / Pandas)** — Loaded raw CSV data, checked for and removed duplicate records, validated price logic (flagged rows where min > modal > max, or zero/negative prices), converted date formats, and engineered new features (`Year`, `Month`, `YearMonth`, `Price_Spread`, `Spread_Pct`).
2. **Database Upload (Python / SQLAlchemy)** — Loaded the cleaned dataset into a MySQL database (`mandi_db`) for structured querying.
3. **SQL Analysis (MySQL)** — Ran 6 analytical queries covering most-traded commodities, price volatility, seasonal trends, market comparisons, and grade-based pricing.
4. **Excel Reporting** — Built PivotTables and PivotCharts to visualize average prices by commodity, volatility rankings, seasonal trends, and grade comparisons.
5. **Exploratory Data Analysis (Python / Matplotlib & Seaborn)** — Created supporting visualizations for the onion price trend, commodity volatility, and grade-based price comparison.
6. **Power BI Dashboard** — Built an interactive dashboard with 5 KPI cards, 4 charts, and a slicer for dynamic filtering.

## Key Findings

- **Onion prices show extreme seasonal volatility** — average monthly prices ranged from roughly ₹900 to ₹4,150 across the year (more than a 4x swing), with peaks typically in the post-monsoon months.
- **Grade significantly affects price** — FAQ-grade onions sold for an average of ~₹3,092, compared to ~₹1,265 for Local grade — a **~2.4x price difference**.
- **Market location creates significant price variation** — average onion prices differed by as much as **~40%** between the highest- and lowest-priced markets analyzed.
- Livestock-related commodities (Cow, She Buffalo, Ox) and highly perishable fruits (Pomegranate, Banana, Grapes) showed the highest price volatility overall.

## Tools Used

- **Python** (Pandas, SQLAlchemy, Matplotlib, Seaborn) — data cleaning, feature engineering, database upload, EDA
- **SQL** (MySQL) — structured querying and analysis
- **Excel** — PivotTables, PivotCharts, summary reporting
- **Power BI** — interactive dashboard with KPIs, charts, and slicers

## Repository Structure

```
maharashtra-mandi-price-analysis/
├── data/       → raw and cleaned datasets (CSV)
├── sql/        → SQL schema and analysis queries
├── excel/      → Excel workbook with PivotTables/PivotCharts
├── python/     → Jupyter notebook (cleaning, feature engineering, EDA, MySQL upload)
└── powerbi/    → Power BI dashboard (.pbix)
```

## How to Reproduce

1. Run the Jupyter notebook in `python/` — this cleans the raw data and loads it into a local MySQL database.
2. Run the queries in `sql/mandi_analysis_queries.sql` against the populated database.
3. Open the Excel workbook in `excel/` to view PivotTable-based summaries and charts.
4. Open the Power BI file in `powerbi/` to explore the interactive dashboard.
