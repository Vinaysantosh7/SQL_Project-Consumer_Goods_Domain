with 
cte as (SELECT 
			p.segment AS segment, 
            COUNT(DISTINCT p.product_code) AS product_count_2020
		FROM dim_product p 
		JOIN fact_sales_monthly f 
			ON p.product_code = f.product_code 
		WHERE f.fiscal_year = 2020
        GROUP BY p.segment
		ORDER BY product_count_2020 DESC
)
,cte1 as (SELECT 
			p.segment AS segment, 
             COUNT(DISTINCT p.product_code) AS product_count_2021
		  FROM dim_product p 
		  JOIN fact_sales_monthly f 
			  ON p.product_code = f.product_code 
		  WHERE f.fiscal_year = 2021
          GROUP BY p.segment
		  ORDER BY product_count_2021 DESC
)
SELECT 
	cte.segment, product_count_2020, product_count_2021,
     (product_count_2021-product_count_2020) AS difference
FROM cte 
JOIN cte1 
	ON cte.segment = cte1.segment
ORDER BY difference DESC;


