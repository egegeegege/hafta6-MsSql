create database HastaneDB
go
use HastaneDB
go
create table Personel(
	ID int primary key identity(1,1),
	Dogum_Tarihi datetime2,
	Ise_Giris_Tarihi datetime2,
	Adres text,
	Telefon varchar(13),
	Unvan varchar(50),
	TC varchar(11),
	Mezuniyet varchar(30)
)

create table Bolumler(
	ID int primary key identity(1,1),
	Bolum_Adi varchar(50),
	Personel_Sayisi int,
	Bulundugu_Blok varchar(10)
)

create table Poliklinikler(
	ID int primary key identity(1,1),
	Poliklinik_Adi varchar(50)
)

create table Doktorlar(
	ID int primary key identity(1,1),
	Personel_ID int foreign key references Personel(ID),
	Bolum_ID int foreign key references Bolumler(ID),
	Poliklinik_ID int foreign key references Poliklinikler(ID),
	Adi varchar(50),
	Soyadi varchar(50)
)

create table Hemsireler(
	ID int primary key identity(1,1),
	Personel_ID int foreign key references Personel(ID),
	Bolum_ID int foreign key references Bolumler(ID),
	Poliklinik_ID int foreign key references Poliklinikler(ID),
	Adi varchar(50),
	Soyadi varchar(50)
)

create table Memurlar(
	ID int primary key identity(1,1),
	Personel_ID int foreign key references Personel(ID),
	Bolum_ID int foreign key references Bolumler(ID),
	Poliklinik_ID int foreign key references Poliklinikler(ID),
	Adi varchar(50),
	Soyadi varchar(50)
)

create table Hastalar(
	ID int primary key identity(1,1),
	Adi varchar(50),
	Soyadi varchar(50),
	Dogum_Tarihi datetime2,
	Adres text,
	Telefon varchar(13),
	TC varchar(11),
	Sigorta_Turu varchar(30)
)

create table Randevular(
	ID int primary key identity(1,1),
	Doktor_ID int foreign key references Doktorlar(ID),
	Poliklinik_ID int foreign key references Poliklinikler(ID),
	Hasta_ID int foreign key references Hastalar(ID),
	Randevu_Tarihi datetime,
	Randevu_Durumu varchar(30)
)

create table Tahliller(
	ID int primary key identity(1,1),
	Doktor_ID int foreign key references Doktorlar(ID),
	Poliklinik_ID int foreign key references Poliklinikler(ID),
	Hasta_ID int foreign key references Hastalar(ID),
	Tahlil_Adi varchar(50),
	Tahlil_Sonuc varchar(50)
)
insert into Personel
values
('1985-05-10T00:00:00','2017-10-02T00:00:00','Sultanbeyli/�stanbul','552-656-45-65','Ba�hekim','55555555555','Doktora'),
('1988-05-10T00:00:00','2015-05-02T00:00:00','Maltepe/�stanbul','534-666-23-61','Muhasebe Personeli','65412325547','Lise'),
('1992-09-13T00:00:00','2013-01-07T00:00:00','Be�ikta�/�stanbul','529-652-78-36','Temizlik G�revlisi','96352230022','Lise'),
('1990-11-12T00:00:00','2022-08-12T00:00:00','Beylikd�z�/�stanbul','545-345-22-12','Uzm. Doktor','54120025356','Y�ksek Lisans'),
('1988-09-13T00:00:00','2015-03-02T00:00:00','Maltepe/�stanbul','522-355-24-11','Muhasebe Personeli','53330202122','Lisans'),
('1992-05-18T00:00:00','2023-07-10T00:00:00','Be�ikta�/�stanbul','522-355-24-11','Temizlik G�revlisi','54452562562','Lise'),
('1992-05-18T00:00:00','2023-08-18T00:00:00','Be�ikta�/�stanbul','522-355-24-11','G�venlik','54452562562','Lise'),
('1992-07-22T00:00:00','2022-05-12T00:00:00','Ata�ehir/�stanbul','544-233-12-67','Hem�ire','33626588521','Lisans')


insert into Bolumler
values
('Genel Cerrahi',20,'A'),
('Ortopedi',12,'A'),
('Dahiliye',23,'A'),
('N�roloji',12,'B'),
('KBB',22,'A'),
('Y�netim',11,'C'),
('Genel',60,'-')


insert into Poliklinikler
values
('101'),
('102'),
('103'),
('201'),
('211'),
('301'),
('313'),
('Genel')



insert into Doktorlar
values
(1,1,4,'Fatih','Eraslan'),
(4,4,3,'Orhan','��nar')

insert into Hemsireler
values
(8,3,6,'Ay�e','Demir')

insert into Memurlar
values
(2,6,8,'Ali','�elik'),
(3,7,8,'Fatma','�evik'),
(5,7,8,'Sevda','�st�n'),
(6,7,8,'Haydar','G�ven'),
(7,7,8,'Bahri','Baybars')


insert into Hastalar
values
('Ahmet','Erg��','1985-08-02T00:00:00','Sultanbeyli/�stanbul','522-655-65-63','54212003233','SSK'),
('Meltem','Erg��','1987-09-12T00:00:00','Sultanbeyli/�stanbul','552-565-12-78','65220222222','SSK'),
('Ali','Demir','1989-04-09T00:00:00','Beykoz/�stanbul','533-455-41-78','52330225487','Ba�kur'),
('Selim','Ok','1999-05-02T00:00:00','Sar�yer/�stanbul','522-122-02-98','65221225489','Ba�kur'),
('Ay�e','�evik','1965-05-02T00:00:00','Ba�ak�ehir/�stanbul','544-652-32-78','51420223222','SSK')

insert into Randevular
values
(1,4,1,'2024-08-20T00:00:00','Aktif'),
(1,4,2,'2024-08-21T00:00:00','Aktif'),
(1,4,3,'2024-07-12T00:00:00','Pasif'),
(2,7,4,'2024-09-12T00:00:00','Aktif'),
(2,3,5,'2023-02-12T00:00:00','Pasif')


insert into Tahliller
values
(1,4,1,'Hemoglabin Tahlili','��kt�'),
(1,4,2,'�drar Tahlili','��kmad�'),
(1,4,3,'�ns�lin Tahlili','��kt�'),
(2,7,4,'R�ntgen','��kt�')




