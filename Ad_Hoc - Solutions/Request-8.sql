SELECT 
CASE
    WHEN date BETWEEN '2019-09-01' AND '2019-11-01' then "Q1" 
    WHEN date between '2019-12-01' AND '2020-02-01' then "Q2"
    WHEN date between '2020-03-01' AND '2020-05-01' then "Q3"
    WHEN date between '2020-06-01' AND '2020-08-01' then "Q4"
    END AS Quarter,
    ROUND(SUM(sold_quantity)/1000000,2) AS total_sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarter
ORDER BY total_sold_quantity DESC
LIMIT 1;
