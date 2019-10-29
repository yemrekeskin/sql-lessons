--FONKSÝYONLAR
use Northwind
select ASCII('*') -- Girilen tekbir deðerin nümerik ascii karakter karþýlýðýný döner
select p.ProductID, ASCII(p.ProductID) from Products p

SELECT ASCII('h')
select CHAR(104)--YUKARIDA KÝ ASCII F harfinin ascii karþýlýðýný char içerisine verdiðimizde bize F bulur. 
select NCHAR(104)

select CHARINDEX('d','abcd',2)
SELECT CHARINDEX('t', 'Customer') AS MatchPosition; -- 
select p.ProductName, CHARINDEX('A', P.ProductName) from Products p --alfanümerik karakter dizisi içerisinde ki deðerin kaçýncý index olduðunu verir

select CONCAT('AAA', 'BBBB')
SELECT CONCAT('W3Schools', '.com'); --birleþirtirir
select 'Yunus'+' '+'Halil'+' '+'Ahmet'

select p.ProductName+' '+cast(p.CategoryID as varchar) from Products p --birleþtir, cast covert eder. 

--SELECT CONCAT_WS('-', 'www', 'W3Schools', 'com'), p.* from Products p -- böyle bir fonksiyon bu versiyon da yok.

select DATALENGTH('adsffsodakpodaspokdkopasdkpaspdokasoýpdjasoýjdoýasa') --data veri boyutunu verir
select p1.ProductName, LEN(p1.ProductName) [karakter sayýsý], DATALENGTH(p1.ProductName)[byte boyutu] from Products p1

SELECT DIFFERENCE('b', 'b'); -- arada fark olup olmadýðýnýn anlaþýldýðý fonksiyondur. eðer fark yoksa 4 döndürür.

SELECT FORMAT(123456789, '##-##-#####'); --formatlar
SELECT FORMAT(123456789, '##/##/#####')


select FORMAT(e1.BirthDate, '##-##-####') from Employees e1

DECLARE @d DATETIME = '12/01/2018'; 
SELECT FORMAT (@d, 'd', 'en-US') AS 'US English Result',
               FORMAT (@d, 'd', 'no') AS 'Norwegian Result',
               FORMAT (@d, 'd', 'zu') AS 'Zulu Result'; 


select LEFT('Yunus',2), LEFT('Dilan', 3) -- soldan belirtilen sayý kadar karakteri kýsýtlar
select RIGHT('Yunus', 2), RIGHT('Hüsna', 3) --saðdan belitilen sayý kadar karakterleri kýsýtlar
select right(p1.ProductName, 5), left(p1.ProductName, 5), p1.ProductName from Products p1

select len('iþl') -- karakter boyutu. 
select ProductName, len(ProductName) from Products where len(ProductName)>15
order by 2 desc

select LOWER('A'), UPPER('a')  -- küçük harfe, büyük harfe dönüþtürme
select LOWER(ProductName), UPPER(ProductName), ProductName from Products
update Products
set ProductName = LOWER(ProductName)
where LEN(ProductName)>30
select * from Products where len(ProductName)>30 --ürün adý 30 karakteri geçen ürünlerin isimlerini küçük harfe dönüþtürdük

SELECT QUOTENAME('abcdef'); -- alfa nümerik deðerleirn baþýna ve sonuna [] koyar
select QUOTENAME(ProductName) from Products p1 


SELECT REPLACE('SQL Tutorial', 'T', 'M');--dönüþtürme
select replace(FirstName, 'a', 'xxxxx'), firstname, * from Employees
select replace(TitleOfCourtesy,'.',''),TitleOfCourtesy from Employees


select DATALENGTH(LTRIM('       ABC')),DATALENGTH('ABC')
select RTRIM('ABC                ') -- BOÞLUKLARI TEMÝZLER

SELECT REPLICATE('AAA',2) -- VERÝLEN ÝNDEX KADAR KARAKTERÝ EKLER

SELECT REVERSE('SQL Tutorial'); --Terse çevirir
SELECT REVERSE('ABC');
SELECT SPACE(10), SPACE(23424); -- Rakamsal deðerleri boþ býrakýr. harf aldýðýnda hata verir. 

select STR(12133,2,2)
SELECT STR(185);
SELECT STR(185.5);
SELECT STR(185.466, 6, 2); --str yuvarlama formatý ilk deðer rakam, kaçtan sonra yuvarlayacaðý ve noktan sonraki karakter sayýsý.
-- ROUND
SELECT STUFF('SQL Tutorial', 1, 2, 'HTML'); --2 deðerden baþladý 2. deðere kadar çýkardý eklenecek olaný ekledi dilan tarif etti.

select SUBSTRING('Yunus',1,2) --2. karakterden baþla 2. karaktere kadar ilerle ve deðeri getir. 
select UNICODE('ð') --UNICODE CODE döner. 

----------sql matematik fonksiyonlarý

SELECT Abs(-243.5) AS AbsNum; --MUTLAK DEÐER. 
select abs(-99)

SELECT ACOS(0.25);
SELECT ACOS(0.50); 
select ASIN(0.25); 
select ATAN(0.60);
SELECT CEILING(25.75) AS CeilValue; --yuvarlama
SELECT CEILING(45.40) AS CeilValue; --yukarý yuvarla

select cos(45.20)
select cot(45.20)

select DEGREES(10) --radyan deðeri  
select EXP(10.20) -- e tabanýnda logaritmik deðer. 
select FLOOR(10.60) --aþaðý yuvarlar

select LOG(10.10) -- Doðal logaritmasýný döndürür. 
select LOG10(10.10) -- normalde 1 olmasý ama çýkmýyor hüsna... 

select PI() --pi sayýsý 

select POWER(5,5) -- ÜSSÜ sayý

select RAND()* 10 --random sayý

SELECT ROUND(235.415, 3) AS RoundValue; --yuvarla


-- tarih formatlarý

select CURRENT_TIMESTAMP; -- sistem tarihi
SELECT SYSDATETIME(); -- sistem tarihi mili saniye
select GETDATE();

SELECT DATEADD(DAY, 1, '2017/08/25') AS tarih; -- ekleme yapar

SELECT DATEDIFF(year, '2017/08/25', '2018/08/25') AS yýlfarki;
SELECT DATEDIFF(MONTH, '2011/08/25', '2011/12/25') AS ayfarký;
SELECT DATEDIFF(DAY, '2011/08/25', '2011/08/30') AS günfarký;


---
declare
@sayi1 varchar(10)
begin
	set @sayi1 = '10,25'
	set @sayi1 = cast(REPLACE(@sayi1, ',','.') as float);
	set @sayi1 = CONVERT(float, REPLACE(@sayi1, ',','.'))
	select cos(@sayi1)
end ---convert önemli tekrar edelim. 


select CURRENT_USER; --sistem kök kullanýcý

SELECT ISNUMERIC('asdsa')  -- rakamsa 1 deðilse 0 döner

select SESSION_USER; -- kök kullanýcý


SELECT SESSIONPROPERTY('Dasdas') -- karaktere null döner


select SYSTEM_USER -- sistem kullanýcýsýný döner

select USER_NAME(6)