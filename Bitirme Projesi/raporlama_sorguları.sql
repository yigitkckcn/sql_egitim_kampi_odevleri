-- 1. En çok sipariş veren 5 müşteri (TOP 5 ile)
SELECT TOP 5
    m.ad, m.soyad, m.email, COUNT(s.id) as siparis_sayisi
FROM Musteri m
JOIN Siparis s ON m.id = s.musteri_id
GROUP BY m.id, m.ad, m.soyad, m.email
ORDER BY siparis_sayisi DESC;

-- 2. En çok satılan ürünler
SELECT 
    u.ad, SUM(sd.adet) as toplam_adet
FROM Urun u
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY u.id, u.ad
ORDER BY toplam_adet DESC;

-- 3. En yüksek cirosu olan satıcılar
SELECT 
    s.ad, SUM(sd.adet * sd.fiyat) as toplam_ciro
FROM Satici s
JOIN Urun u ON s.id = u.satici_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY s.id, s.ad
ORDER BY toplam_ciro DESC;

-- 4. Şehirlere göre müşteri sayısı
SELECT 
    sehir, COUNT(*) as musteri_sayisi
FROM Musteri
GROUP BY sehir
ORDER BY musteri_sayisi DESC;

-- 5. Kategori bazlı toplam satışlar
SELECT 
    k.ad, SUM(sd.adet * sd.fiyat) as toplam_satis
FROM Kategori k
JOIN Urun u ON k.id = u.kategori_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY k.id, k.ad
ORDER BY toplam_satis DESC;

-- 6. Aylara göre sipariş sayısı (DATE_FORMAT yerine FORMAT)
SELECT 
    FORMAT(tarih, 'yyyy-MM') as ay, COUNT(*) as siparis_sayisi
FROM Siparis
GROUP BY FORMAT(tarih, 'yyyy-MM')
ORDER BY ay;

-- 7. Siparişlerde müşteri, ürün, satıcı bilgisi
SELECT 
    s.id as siparis_id, m.ad, m.soyad, u.ad as urun_ad, sat.ad as satici_ad, sd.adet, sd.fiyat
FROM Siparis s
JOIN Musteri m ON s.musteri_id = m.id
JOIN Siparis_Detay sd ON s.id = sd.siparis_id
JOIN Urun u ON sd.urun_id = u.id
JOIN Satici sat ON u.satici_id = sat.id
ORDER BY s.id;

-- 8. Hiç satılmamış ürünler
SELECT 
    u.ad
FROM Urun u
LEFT JOIN Siparis_Detay sd ON u.id = sd.urun_id
WHERE sd.urun_id IS NULL;

-- 9. Hiç sipariş vermemiş müşteriler
SELECT 
    m.ad, m.soyad, m.email
FROM Musteri m
LEFT JOIN Siparis s ON m.id = s.musteri_id
WHERE s.musteri_id IS NULL;

-- 10. En çok kazanç sağlayan ilk 3 kategori
SELECT TOP 3
    k.ad, SUM(sd.adet * sd.fiyat) as toplam_kazanc
FROM Kategori k
JOIN Urun u ON k.id = u.kategori_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY k.id, k.ad
ORDER BY toplam_kazanc DESC;

-- 11. Ortalama sipariş tutarını geçen siparişler
SELECT 
    s.id, s.toplam_tutar
FROM Siparis s
WHERE s.toplam_tutar > (SELECT AVG(toplam_tutar) FROM Siparis)
ORDER BY s.toplam_tutar DESC;

-- 12. En az bir kez elektronik ürün satın alan müşteriler
SELECT DISTINCT 
    m.ad, m.soyad, m.email
FROM Musteri m
JOIN Siparis s ON m.id = s.musteri_id
JOIN Siparis_Detay sd ON s.id = sd.siparis_id
JOIN Urun u ON sd.urun_id = u.id
JOIN Kategori k ON u.kategori_id = k.id
WHERE k.ad = 'Elektronik';
