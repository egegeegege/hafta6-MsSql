use HastaneDB
-- Hastalardan adresi sultanbeyli olanlarý listeleyin.
select * from Hastalar where Adres like '%Sultanbeyli%'
-- Hastalardan sigorta türü SSK olanlarý listeleyin
select * from Hastalar where Sigorta_Turu = 'SSK'

-- Hastalardan sigorta türü Baðkur olan hastalarýn Adý,Soyadý ve Adreslerini listeleyin.
select Adi,Soyadi,Adres from Hastalar where Sigorta_Turu = 'Baðkur'

-- Tahlillerden Fatih Eraslan adlý doktorun istediði tahlilleri listeleyin.
select * from Tahliller 
where Doktor_ID in(select ID from Doktorlar where Adi='Fatih' and Soyadi='Eraslan')
-- Fatih Eraslan adlý doktorun hangi poliklinikte çalýþtýðýný bulunuz.
select * from Poliklinikler 
where ID in (select Poliklinik_ID from Doktorlar where Adi='Fatih' and Soyadi='Eraslan')
-- Orhan Çýnar adlý doktorun Hangi bölümde olduðu ve bölümdeki personel sayýsýný listeleyin
select Bolum_Adi, Personel_Sayisi from Bolumler 
where ID in (select Bolum_ID from Doktorlar where Adi='Orhan' and Soyadi='Çýnar')
-- Hastalardan kaçý ssk lýdýr.
select COUNT(ID) as 'ssk lý hasta sayýsý' from Hastalar where Sigorta_Turu = 'SSK'

-- 201 nolu poliklinikte kaç adet aktif randevu vardýr.
select COUNT(ID) as 'Aktif randevu sayýsý' from Randevular 
where Poliklinik_ID in(select ID from Poliklinikler where Poliklinik_Adi= '201') and Randevu_Durumu ='Aktif'

-- Hastanede toplam kaç personel vardýr.
select SUM(Personel_Sayisi) as 'toplam personel sayýsý' from Bolumler

-- Ahmet Ergüç adlý hastanýn
-- 1. Hangi tahlilleri yaptýrdýðýný ve durumunu listeleyin
-- 2.Bu Tahlili Hangi doktor istemiþ
select d.Adi as 'Doktor Adý',d.Soyadi as 'Doktor Soyad',t.Tahlil_Adi,t.Tahlil_Sonuc from Hastalar h join Tahliller t on h.ID = t.Hasta_ID
join Doktorlar d on d.ID = t.Doktor_ID
where h.Adi = 'Ahmet' and  h.Soyadi = 'Ergüç'


