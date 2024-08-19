/*
Indexes
Index, veritabaný tablolarý üzerinde tanýmlanan ve veriye daha az iþlemle eriþmemizi saðlayan
veritabaný nesneleridir.
Index çeþitleri
Clustered Index
Non-Clustered Index

Clustered Index
Clustered indexler tablodaki verileri fiziksel olarak sýralar. Bir tabloda üzerinde sadece
bir tane clustered index bulunur. clustered index için seçilecek sütun en fazla kullanýlan
sütun olmalýdýr.

Yapý: create clustered index IX_IndexName on TabloAdi (AccountID)

Non-Clustered Index
Non-Clustered Index veriyi fiziksel deðil mantýksal olarak sýralar. Tablo üzerinde en
fazla 999 tane non-clustered index tanýmlanabilir. non-clustered indexler veriye
doðrudan eriþemez. Heap ya da bir clustered index üzerinden eriþir.

Yapý: create nonclustered index IX_IndexName on TabloAdi (AccountID)

Indexler tablo seviyesinde tutulur.

Eriþim için > ilgili tablo> Indexes

NOT: Indexler select sorgularýnda performansý arttýrýrken. Insert, Update gibi
iþlemlerin çok fazla uygulandýðý sütunlarda dikkatli kullanýlmalýdýr.


*/
SET STATISTICS TIME ON
use SALESPSP
select * from SALES where DATE_ in ('2026-01-26 11:06:55.273')

create nonclustered index IX_Date on SALES (DATE_)

select * from ITEMS
use SALESPSPTEST

select * from CUSTOMERS where CUSTOMERNAME in ('CUSTOMER0000001')
create nonclustered index IX_CustomerName on CUSTOMERS(CUSTOMERNAME)

select * from CUSTOMERS where CUSTOMERNAME in ('CUSTOMER0000001')

