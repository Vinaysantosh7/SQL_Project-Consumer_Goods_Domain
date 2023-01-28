SELECT 
    c.customer_code,
    c.customer,
	ROUND(AVG(pi.pre_invoice_discount_pct),4) AS average_discount_percentage
FROM
    dim_customer c
JOIN
    fact_pre_invoice_deductions pi ON c.customer_code = pi.customer_code
WHERE
    pi.fiscal_year = 2021
	AND c.market = 'India'
GROUP BY c.customer_code , c.customer
ORDER BY average_discount_percentage DESC
LIMIT 5;