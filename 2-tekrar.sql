use HastaneDB
-- Hastalardan adresi sultanbeyli olanlar� listeleyin.
select * from Hastalar where Adres like '%Sultanbeyli%'
-- Hastalardan sigorta t�r� SSK olanlar� listeleyin
select * from Hastalar where Sigorta_Turu = 'SSK'

-- Hastalardan sigorta t�r� Ba�kur olan hastalar�n Ad�,Soyad� ve Adreslerini listeleyin.
select Adi,Soyadi,Adres from Hastalar where Sigorta_Turu = 'Ba�kur'

-- Tahlillerden Fatih Eraslan adl� doktorun istedi�i tahlilleri listeleyin.
select * from Tahliller 
where Doktor_ID in(select ID from Doktorlar where Adi='Fatih' and Soyadi='Eraslan')
-- Fatih Eraslan adl� doktorun hangi poliklinikte �al��t���n� bulunuz.
select * from Poliklinikler 
where ID in (select Poliklinik_ID from Doktorlar where Adi='Fatih' and Soyadi='Eraslan')
-- Orhan ��nar adl� doktorun Hangi b�l�mde oldu�u ve b�l�mdeki personel say�s�n� listeleyin
select Bolum_Adi, Personel_Sayisi from Bolumler 
where ID in (select Bolum_ID from Doktorlar where Adi='Orhan' and Soyadi='��nar')
-- Hastalardan ka�� ssk l�d�r.
select COUNT(ID) as 'ssk l� hasta say�s�' from Hastalar where Sigorta_Turu = 'SSK'

-- 201 nolu poliklinikte ka� adet aktif randevu vard�r.
select COUNT(ID) as 'Aktif randevu say�s�' from Randevular 
where Poliklinik_ID in(select ID from Poliklinikler where Poliklinik_Adi= '201') and Randevu_Durumu ='Aktif'

-- Hastanede toplam ka� personel vard�r.
select SUM(Personel_Sayisi) as 'toplam personel say�s�' from Bolumler

-- Ahmet Erg�� adl� hastan�n
-- 1. Hangi tahlilleri yapt�rd���n� ve durumunu listeleyin
-- 2.Bu Tahlili Hangi doktor istemi�
select d.Adi as 'Doktor Ad�',d.Soyadi as 'Doktor Soyad',t.Tahlil_Adi,t.Tahlil_Sonuc from Hastalar h join Tahliller t on h.ID = t.Hasta_ID
join Doktorlar d on d.ID = t.Doktor_ID
where h.Adi = 'Ahmet' and  h.Soyadi = 'Erg��'


