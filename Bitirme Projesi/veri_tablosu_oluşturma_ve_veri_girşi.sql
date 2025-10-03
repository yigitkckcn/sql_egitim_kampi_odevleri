CREATE TABLE Kategori (
    id INT PRIMARY KEY IDENTITY(1,1),
    ad VARCHAR(50) NOT NULL
);
CREATE TABLE Satici (
    id INT PRIMARY KEY IDENTITY(1,1),
    ad VARCHAR(100) NOT NULL,
    adres NVARCHAR(200) NOT NULL
);
CREATE TABLE Musteri (
    id INT PRIMARY KEY IDENTITY(1,1),
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    sehir VARCHAR(50) NOT NULL,
    kayit_tarihi DATE NOT NULL
);
CREATE TABLE Urun (
    id INT PRIMARY KEY IDENTITY(1,1),
    ad VARCHAR(100) NOT NULL,
    fiyat DECIMAL(10, 2) NOT NULL,
    stok INT NOT NULL,
    kategori_id INT NULL,
    satici_id INT NULL,
    FOREIGN KEY (kategori_id) REFERENCES Kategori(id) ON DELETE SET NULL,
    FOREIGN KEY (satici_id) REFERENCES Satici(id) ON DELETE SET NULL
);
CREATE TABLE Siparis (
    id INT PRIMARY KEY IDENTITY(1,1),
    musteri_id INT,
    tarih DATE NOT NULL,
    toplam_tutar DECIMAL(10, 2) NOT NULL,
    odeme_turu VARCHAR(20) NOT NULL,
    FOREIGN KEY (musteri_id) REFERENCES Musteri(id) ON DELETE CASCADE
);
CREATE TABLE Siparis_Detay (
    id INT PRIMARY KEY IDENTITY(1,1),
    siparis_id INT,
    urun_id INT,
    adet INT NOT NULL,
    fiyat DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (siparis_id) REFERENCES Siparis(id) ON DELETE CASCADE,
    FOREIGN KEY (urun_id) REFERENCES Urun(id) ON DELETE CASCADE
);
CREATE INDEX idx_musteri_sehir ON Musteri(sehir);
CREATE INDEX idx_siparis_tarih ON Siparis(tarih);

INSERT INTO Kategori (ad) VALUES 
('Elektronik'), 
('Giyim'), 
('Ev & Bahçe'), 
('Spor');

INSERT INTO Satici (ad, adres) VALUES 
('TechTrend', N'İstanbul, Kadıköy'),
('ModaVibe', N'Ankara, Çankaya'),
('EvDeko', N'İzmir, Bornova');

INSERT INTO Musteri (ad, soyad, email, sehir, kayit_tarihi) VALUES 
('Ali', 'Yılmaz', 'ali.yilmaz@gmail.com', 'İstanbul', '2023-01-15'),
('Ayşe', 'Demir', 'ayse.demir@gmail.com', 'Ankara', '2023-02-20'),
('Mehmet', 'Kaya', 'mehmet.kaya@gmail.com', 'İzmir', '2023-03-10'),
('Fatma', 'Çelik', 'fatma.celik@gmail.com', 'İstanbul', '2023-04-05'),
('Can', 'Öztürk', 'can.ozturk@gmail.com', 'Bursa', '2023-05-12');

INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES 
('Akıllı Telefon', 5000.00, 100, 1, 1),
('Tişört', 100.00, 200, 2, 2),
('Saksı', 50.00, 150, 3, 3),
('Koşu Bandı', 3000.00, 20, 4, 1),
('Laptop', 8000.00, 50, 1, 1);

INSERT INTO Siparis (musteri_id, tarih, toplam_tutar, odeme_turu) VALUES 
(1, '2023-06-01', 5100.00, 'Kredi Kartı'),
(2, '2023-06-02', 200.00, 'Havale'),
(3, '2023-06-03', 8050.00, 'Kredi Kartı'),
(4, '2023-06-04', 300.00, 'Kapıda Ödeme'),
(5, '2023-06-05', 11000.00, 'Kredi Kartı');

INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES 
(1, 1, 1, 5000.00),
(1, 2, 1, 100.00),
(2, 2, 2, 100.00),
(3, 5, 1, 8000.00),
(3, 3, 1, 50.00),
(4, 2, 3, 100.00),
(5, 1, 1, 5000.00),
(5, 4, 2, 3000.00);