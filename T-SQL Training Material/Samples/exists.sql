--exists
create table departman(
 departman_id int identity(1,1),
 departman_adi varchar(50),
 departman_no int

)

select * from departman
select * from Personel


select * from Personel where exists (
select * from departman
) -- departman tablosuna baktý deðer varsa true dedi ve personel tablosunda ki her þeyi listeledi


select * from Personel where exists (
select * from departman where departman_id = 99 --departman 99 yok bu yüzden false deðer döner
)


select * from Personel p1 where p1.dept_id = 88
and not exists (
 select * from departman  d1 where d1.departman_id = p1.dept_id
)


select * from Personel p1 where p1.dept_id = 88
and exists (
 select * from departman  d1 where d1.departman_id = p1.dept_id
)

