SELECT 
	p.product_code, p.product, ROUND(m.manufacturing_cost, 2) AS manufacturing_cost
FROM dim_product p 
JOIN fact_manufacturing_cost m 
	ON p.product_code = m.product_code 
WHERE 
	m.manufacturing_cost = (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost)
    OR m.manufacturing_cost = (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost)
ORDER BY manufacturing_cost DESC;