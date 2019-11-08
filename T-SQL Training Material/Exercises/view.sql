--viewler
use Northwind

--select 'Yunus'+' '+'Halil' boþluk býrakma
alter view personel_satis  --view yarattýk
as
select e1.FirstName+' '+e1.LastName personel,
count(*) toplam_satis
 from Employees e1, Orders o1
where e1.EmployeeID = o1.EmployeeID 
group by e1.FirstName+' '+e1.LastName
having count(*)>100


select * from personel_satis --view listeleme


--doðum günü view
alter view dogum_gunuleri
as
select e1.FirstName, e1.LastName, e1.Title, e1.BirthDate from Employees e1
where day(e1.BirthDate) =  day(SYSDATETIME())
and MONTH(e1.BirthDate) = MONTH(SYSDATETIME())

select * from dogum_gunuleri




--pivot view

alter view pivot_urun_satis
as
SELECT 'OrderID' AS OrderID ,
[0] as sifir, [1] as bir , [2] as iki, [3] as uc, [4]
FROM
(SELECT UnitPrice, Quantity,ProductID
    FROM [Order Details]) AS SourceTable
PIVOT
(
AVG(UnitPrice)
FOR ProductID IN ([sifir], [bir], [iki], [uc], [4])
) AS PivotTable;

select * from pivot_urun_satis