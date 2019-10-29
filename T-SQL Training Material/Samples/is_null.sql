--is null 

select c1.Region, c1.ContactName, c1.CompanyName from Customers c1
where Region is null

select c1.Region, c1.ContactName, c1.CompanyName from Customers c1
where Region is not null

select sp.Country, sp.Fax, 
isnull(sp.Fax, 999999) fax2,
isnull(sp.Fax, 0) fax3
from Suppliers sp
