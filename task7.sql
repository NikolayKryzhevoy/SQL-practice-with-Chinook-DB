--How much revenue is generated each year, and what is its percent change from the previous year?
WITH tmp 
AS 	(
	SELECT strftime('%Y', InvoiceDate) as 'Year', strftime('%Y', InvoiceDate)+1 as 'YearB', SUM(Total) as 'Rev'
	FROM invoices
	GROUP BY 1
	)
SELECT A.Year, A.Rev as 'Revenue_Curr', B.Rev as 'Revenue_Prev', ROUND((A.Rev-B.Rev)/B.Rev*100.,2) as 'Percent_Change'
FROM tmp A, tmp B
WHERE CAST(A.Year AS INTEGER) = CAST(B.YearB AS INTEGER)
/*
Year    Rev.Curr  Rev.Prev  Percent.Change
2010	481.45	  449.46	 7.12
2011	469.58	  481.45	-2.47
2012	477.53	  469.58	 1.69
2013	450.58	  477.53	-5.64
*/
