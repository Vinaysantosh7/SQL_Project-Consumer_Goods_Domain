with cte as (
		SELECT 
			c.channel,
			ROUND(SUM(f.sold_quantity*g.gross_price)/1000000, 3) AS gross_sales_mln
		FROM fact_sales_monthly f
		JOIN dim_customer c
			ON c.customer_code = f.customer_code
		JOIN fact_gross_price g ON
			f.product_code = g.product_code
			AND f.fiscal_year = g.fiscal_year
		WHERE f.fiscal_year = 2021
		GROUP BY c.channel
		ORDER BY gross_sales_mln DESC
)
,cte1 as (
	SELECT 
		SUM(gross_sales_mln) as total_gross_sales_mln
    FROM cte
)
SELECT 
	cte.*,
    ROUND((gross_sales_mln*100/total_gross_sales_mln), 2) AS percentage
FROM cte JOIN cte1
