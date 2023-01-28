with cte as (
		SELECT 
			p.division, f.product_code, CONCAT(p.product, "-", p.variant) AS product,
			SUM(f.sold_quantity) AS total_sold_quantity
		FROM  fact_sales_monthly f
		JOIN dim_product p
			ON p.product_code = f.product_code
		WHERE 
			f.fiscal_year = 2021
		GROUP BY 
			p.division, f.product_code, p.product, p.variant
		ORDER BY 
			total_sold_quantity DESC
		LIMIT 1000000
)
,cte1 as (
		SELECT 
			*, 
            DENSE_RANK() OVER(PARTITION BY division ORDER BY total_sold_quantity DESC) AS rank_order
		from cte
)
SELECT 
	* 
FROM cte1
WHERE rank_order <= 3;



