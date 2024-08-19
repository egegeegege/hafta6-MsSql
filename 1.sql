/*
Indexes
Index, veritaban� tablolar� �zerinde tan�mlanan ve veriye daha az i�lemle eri�memizi sa�layan
veritaban� nesneleridir.
Index �e�itleri
Clustered Index
Non-Clustered Index

Clustered Index
Clustered indexler tablodaki verileri fiziksel olarak s�ralar. Bir tabloda �zerinde sadece
bir tane clustered index bulunur. clustered index i�in se�ilecek s�tun en fazla kullan�lan
s�tun olmal�d�r.

Yap�: create clustered index IX_IndexName on TabloAdi (AccountID)

Non-Clustered Index
Non-Clustered Index veriyi fiziksel de�il mant�ksal olarak s�ralar. Tablo �zerinde en
fazla 999 tane non-clustered index tan�mlanabilir. non-clustered indexler veriye
do�rudan eri�emez. Heap ya da bir clustered index �zerinden eri�ir.

Yap�: create nonclustered index IX_IndexName on TabloAdi (AccountID)

Indexler tablo seviyesinde tutulur.

Eri�im i�in > ilgili tablo> Indexes

NOT: Indexler select sorgular�nda performans� artt�r�rken. Insert, Update gibi
i�lemlerin �ok fazla uyguland��� s�tunlarda dikkatli kullan�lmal�d�r.


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

