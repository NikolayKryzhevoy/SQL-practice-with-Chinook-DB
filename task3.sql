-- Which countries have the highest sales revenue? 
SELECT DISTINCT BillingCountry AS 'Country', SUM(Total) AS 'Revenue'
FROM invoices
GROUP BY 1
ORDER BY 2 DESC; 
-- USA with    523.06$
-- Canada with 303.96$
-- France with 195.10$

-- What percent of total revenue does each country make up? 
SELECT DISTINCT BillingCountry AS 'Country', ROUND(SUM(Total)/(SELECT SUM(Total) FROM invoices)*100, 2) AS 'Revenue (%)'
FROM invoices
GROUP BY 1
ORDER BY 2 DESC;  
-- USA    22.46%
-- Canada 13.05%
-- France  8.38%

