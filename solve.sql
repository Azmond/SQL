SELECT t1.CustomerId, t1.RegistrationDateTime
FROM Table1 t1 INNER JOIN Table2 t2 ON t1.CustomerId = t2.CustomerId
WHERE
t2.CustomerId = ANY(
 SELECT DISTINCT CustomerId
 FROM Table2 tt2
 WHERE
 tt2.PurchaiseDatetime>DATEADD(mm,-1,GETDATE()) AND tt2.ProductName LIKE 'smetana'
) 
AND t2.ProductName LIKE 'moloko'
GROUP BY t1.CustomerId, t1.RegistrationDateTime
