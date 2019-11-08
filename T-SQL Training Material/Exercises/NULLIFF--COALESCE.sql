--nullif --COALESCE
--iki kolona bakar, eðer deðerler aynýysa null verir
select nullif(emp.FirstName, emp.lastname) kontrol,
emp.FirstName, emp.lastname

 from Employees emp
  where emp.EmployeeID = 1


select nullif(emp.FirstName, emp.lastname) kontrol,
emp.FirstName, emp.lastname,
isnull(nullif(emp.FirstName, emp.lastname),'AYNI')
 from Employees emp
  where emp.EmployeeID = 1


select nullif(emp.FirstName, emp.lastname) kontrol, count(*)

 from Employees emp
  group by nullif(emp.FirstName, emp.lastname)  --tekrar eden kayýt sayýsý



select isnull(nullif(emp.FirstName, emp.lastname),'AYNI KAYIT') kontrol, 
count(*)
from Employees emp
group by nullif(emp.FirstName, emp.lastname)  --tekrar eden kayýt sayýsý
having count(*) > 1




--COALESCE : is null ile bire bir ayný
SELECT COALESCE(Region, 'BOÞ KAYIT COALESCE'),Region
 FROM Employees

SELECT COALESCE(Region, 'BOÞ KAYIT COALESCE'),Region,
ISNULL(Region, 'BOT KAYIT IS NULL')
 FROM Employees