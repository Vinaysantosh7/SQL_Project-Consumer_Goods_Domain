SELECT 
	MONTHNAME(date) as month, f.fiscal_year AS year,
    ROUND(SUM((f.sold_quantity*g.gross_price))/1000000,2) AS Gross_sales_Amount
FROM dim_customer c
JOIN fact_sales_monthly f 
	ON c.customer_code = f.customer_code
JOIN fact_gross_price g 
	ON f.product_code = g.product_code 
    AND f.fiscal_year = g.fiscal_year
WHERE c.customer = "Atliq Exclusive"
GROUP BY month, year
LIMIT 1000000;