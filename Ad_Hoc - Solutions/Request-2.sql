with
cte1 as (
	SELECT 
		COUNT(DISTINCT product_code) AS unique_products_2020
	FROM fact_sales_monthly 
	WHERE fiscal_year = 2020
)
,cte2 as (
	SELECT 
		COUNT(DISTINCT product_code) AS unique_products_2021
	FROM fact_sales_monthly 
	WHERE fiscal_year = 2021
)
SELECT 
	cte1.*, cte2.*, 
    ROUND((cte2.unique_products_2021 - cte1.unique_products_2020)*100/cte1.unique_products_2020, 2) AS percentage_chg
FROM cte1
JOIN cte2;


