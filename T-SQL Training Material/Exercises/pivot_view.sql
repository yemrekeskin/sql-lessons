alter view pivot_urun_satis
as
SELECT 'OrderID' AS OrderID ,
[0] 'sýfýr', [1] 'bir' , [2] 'iki' , [3] 'üçsün', [4] 'dört'
FROM
(SELECT UnitPrice, Quantity,ProductID
    FROM [Order Details]) AS SourceTable
PIVOT
(
AVG(UnitPrice)
FOR ProductID IN ([0], [1], [2], [3], [4])
) AS PivotTable;