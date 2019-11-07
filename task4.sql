-- How many customers did each employee support?
SELECT EmployeeId, COUNT(*) as 'Customers'
FROM customers
	JOIN employees
		ON employees.EmployeeId = customers.SupportRepId
GROUP BY 1;
/*
ID  Customers
3	21
4	20
5	18
*/

-- What are their total sales and the average revenues for each sale?
SELECT EmployeeId, COUNT(*) as '#Sales', Round(SUM(Total),2) as 'Total Revenue', Round(SUM(Total)/COUNT(*),2) as 'Avg.Revenue/Sale'
FROM customers
	JOIN employees
		ON employees.EmployeeId = customers.SupportRepId
	JOIN invoices
		ON invoices.CustomerId = customers.CustomerId
GROUP BY 1;
/*
ID  Sales   Total_Revenue  Avg.Revenue
3	146	    833.04	       5.71
4	140	    775 40	       5.54
5	126	    720.16	       5.72
*/
