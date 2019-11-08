--case when

--1 case when then else end ezberle
select distinct emp.TitleOfCourtesy,(
case 
when emp.TitleOfCourtesy = 'Dr.'
then 'Diðer' 
when emp.TitleOfCourtesy = 'Mrs.'
then 'Evli Kadýn' 
when emp.TitleOfCourtesy = 'Mr.'
then 'Erkek' 
when emp.TitleOfCourtesy = 'Ms.'
then 'Bekar Kadýn' 
else 
'TANIMSIZ'
end) AS CinsiyetDurumu
 from Employees emp


-- internet örneði 
SELECT ct.Region, 
(CASE  
 WHEN Region is null  THEN 'BOÞ KAYIT' 
 WHEN Region = 'BC' THEN 'Bilecik' 
 WHEN Region = 'AK' THEN 'AK zihin' 
 ELSE 'Bilinmiyor' 
 END)
FROM Customers ct

select distinct Region from  dbo.Customers





SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'OTUZDAN BÜYÜK'
    WHEN Quantity = 30 THEN 'OTUZA EÞÝT'
	 WHEN Quantity < 30 THEN 'OTUZDAN KÜÇÜK'
    ELSE 'The quantity is under 30'
END AS MÝKTOR_KONTROL
FROM [Order Details];














