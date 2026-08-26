SQL Data Analysis Project

Project Title

E-Commerce SQL Data Analysis

Objective

Use SQL to extract, filter, aggregate and analyze data from multiple related tables.

Tool

- MySQL

Tables

- customers
- categories
- products
- orders
- order_items

Queries Included

1. SELECT all customers
2. WHERE filtering
3. ORDER BY and price filtering
4. Sorting orders
5. GROUP BY with COUNT
6. Multi-table JOIN with aggregation
7. Customer-wise spending
8. INNER JOIN
9. LEFT JOIN
10. INNER vs LEFT JOIN row-count comparison
11. Duplicate detection with GROUP BY/HAVING
12. Subquery using AVG
13. CASE WHEN customer segmentation
14. Best-selling products
15. Subquery for above-average customers

How to Run

1. Open MySQL Workbench.
2. Open "sql_data_analysis_project.sql".
3. Execute the complete script.
4. Refresh the Schemas panel.
5. Select database "ecommerce_sql_analysis".
6. Run each Q1-Q15 separately.
7. Save screenshots or export result tables for every query.
8. Upload the SQL file and README to a public GitHub repository.

Interview Questions

WHERE vs HAVING

WHERE filters rows before grouping. HAVING filters groups after GROUP BY.

INNER JOIN vs LEFT JOIN

INNER JOIN returns only matching rows from both tables. LEFT JOIN returns every row from the left table and matching rows from the right table; unmatched right-side values become NULL.

How to find duplicate rows?

Use GROUP BY with HAVING COUNT(*) > 1 on the column(s) that should be unique.

Subquery vs CTE

A subquery is a query nested inside another query. A CTE uses "WITH" to define a temporary named result set, which can make complex queries easier to read and reuse.

Submission Checklist

- SQL script
- README.md
- Output screenshots/result tables for Q1-Q15
- Public GitHub repository
- GitHub repository link submitted to the internship portal
- LinkedIn post sharing the completed project
