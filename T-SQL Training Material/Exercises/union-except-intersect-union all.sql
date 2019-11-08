--union all /union
--intersect
--union 
--Except
	 


create table personel(
ad varchar (50),
soyad varchar(50),
numara int
)

create table musteri(
ad varchar (50),
soyad varchar(50),
numara int,
must_no varchar(50)
)


select p.ad from personel p
union--gelen data her iki tablonun da çoklayan verilerini tekler. her tablodan data saðlar
--veri tipleri kesinlikle ayný olmaldýr. 
select m.ad from musteri m


select p1.numara from personel p1
union 
select m1.must_no from musteri m1
--eðer data tipleri farklý ise int ve varchar veri tipinde bir ististani durum vardýr.
--eðer verinin içinde alfanümerik deðer yoksa sýkýntý olmaz. varchar tanýmlanan bir tipi 
--nümerik alan ile union yapýyorsak varchar alanda harf veya asci karakter olmamalýdýr. 



select p1.ad from personel p1
union all --her iki tablonunda ististasýz veri tipleri aynýysa her þeyi getirir. 
select m1.ad from musteri m1


select p1.ad  from personel p1
intersect --her iki tabloda ki kesiþenler
select m1.ad from musteri m1


select p1.ad  from personel p1
Except --yukarýda olup aþaðýdaki tabloda olmayanlar
select m1.ad from musteri m1

select m1.ad from musteri m1
Except --yukarýda olup aþaðýdaki tabloda olmayanlar
select p1.ad  from personel p1
