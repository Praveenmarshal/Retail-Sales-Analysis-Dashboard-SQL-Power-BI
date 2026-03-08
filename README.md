# Retail-Sales-Analysis-Dashboard-SQL-Power-BI
Analyze product and outlet performance to understand sales distribution, identify top-performing items, and evaluate outlet efficiency.

🛒 Retail Sales Analysis Dashboard | SQL + Power BI
📊 Project Overview

This project analyzes retail sales data from Smart Bazaar outlets to identify key sales trends, product performance, and outlet efficiency.

The goal of this project is to transform raw retail data into actionable business insights using SQL for analysis and Power BI for interactive visualization.

The final output is a multi-page interactive dashboard that allows users to explore sales performance across products, outlets, and locations.

🧠 Business Problem

Retail businesses often struggle to understand:

Which products generate the highest revenue

Which outlet types perform best

How sales vary across locations

Which items consistently rank as top sellers

This project answers these questions through data analysis and visualization.

🛠 Tools & Technologies
Tool	Purpose
SQL (MySQL)	Data querying and analysis
Power BI	Dashboard visualization
Data Analysis	Business insights extraction
Window Functions	Ranking and advanced analytics
🗂 Dataset Information

The dataset contains retail product sales data across multiple outlets.

Key Columns
Column	Description
Item Identifier	Unique product ID
Item Type	Product category
Item Fat Content	Low Fat / Regular
Item Weight	Weight of product
Total Sales	Sales value
Rating	Customer rating
Outlet Identifier	Unique outlet ID
Outlet Type	Store type
Outlet Size	Store size
Outlet Location Type	Tier of city
Outlet Establishment Year	Year outlet opened
⚙️ Project Workflow
Dataset
   │
   ▼
SQL Data Analysis
   │
   ▼
Business Insights
   │
   ▼
Power BI Dashboard
   │
   ▼
Interactive Data Exploration
🔎 Key SQL Analysis
1️⃣ Total & Average Sales by Item Type
SELECT
    `Item Type`,
    SUM(`Total Sales`) AS total_sales,
    AVG(`Total Sales`) AS avg_sales_per_item
FROM smart_bazaar
GROUP BY `Item Type`
ORDER BY total_sales DESC;

This analysis helps identify top-performing product categories.

2️⃣ Top 5 Outlets by Revenue
SELECT
    `Outlet Identifier`,
    SUM(`Total Sales`) AS total_revenue
FROM smart_bazaar
GROUP BY `Outlet Identifier`
ORDER BY total_revenue DESC
LIMIT 5;

This query finds the highest revenue generating outlets.

3️⃣ Ranking Items by Sales (Window Function)
SELECT
`Outlet Type`,
`Item identifier`,
`Item type`,
`Total Sales`,
RANK() OVER (PARTITION BY `Outlet Type`
ORDER BY `Total Sales` DESC) AS sales_rank
FROM smart_bazaar;

This helps identify top-selling items within each outlet type.

📊 Power BI Dashboard

The project includes a 3-page interactive dashboard.

📌 Executive Overview

Shows high-level KPIs including:

Total Sales

Average Sales

Average Rating

Sales distribution by Item Type

Sales distribution by Outlet

📌 Product Performance

Analyzes product-level insights:

Top selling items

Sales by item category

Average sales comparison

Product contribution to total revenue

📌 Outlet Performance

Focuses on outlet analytics:

Sales by outlet location

Outlet type performance

Sales distribution across store types

📈 Key Insights

📌 Fruits & Vegetables generated the highest total revenue.

📌 Snack Foods is the second highest selling product category.

📌 Tier 2 outlets contribute the highest total sales.

📌 Supermarket Type 1 outlets consistently show strong sales performance.

📌 Several item identifiers consistently rank in the top sellers across outlets.

💡 Skills Demonstrated

✔ SQL Data Analysis
✔ Data Aggregation (SUM, AVG, MIN, MAX)
✔ Window Functions (RANK, DENSE_RANK)
✔ Business Insight Generation
✔ Dashboard Design
✔ Data Visualization

📷 Dashboard Preview

(Add your dashboard screenshots here)

Example:

/images
   executive_overview.png
   product_performance.png
   outlet_performance.png
🚀 Future Improvements

Add time-series sales trend analysis

Build sales forecasting models

Implement automated dashboard refresh

Add customer segmentation analysis

📂 Project Structure
Retail-Sales-Analysis
│
├── dataset
│     retail_sales.csv
│
├── sql_queries
│     sales_analysis.sql
│
├── dashboard
│     powerbi_dashboard.pbix
│
├── images
│     executive_overview.png
│     product_performance.png
│     outlet_performance.png
│
└── README.md

Email: praveenkicha01@gmail.com
linkedin:www.linkedin.com/in/praveen-kannan-6862382a2

👨‍💻 Author

PRAVEEN KANNAN

Aspiring Data Analyst passionate about turning data into actionable insights.


