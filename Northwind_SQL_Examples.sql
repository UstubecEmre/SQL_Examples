USE Northwind

-- SQL, yapisal sorgulama dilidir (Structured Query Language), Ýngilizce'ye benzer, buyuk kucuk harf duyarliligi yoktur.


--Soru 1:  Butun kullanicilari getiren sorgu
SELECT * FROM Customers

-- Soru 2: Sadece CompanyName, City ve Country getiren sorguyu yaziniz
SELECT
	CompanyName [SirketIsmi], 
	City [Sehir],
	Country[Ulke]
FROM
Customers

-- Soru 3: Mannheim sehrinde yasayan kisilerin ID, PostalCode bilgilerini listeleyin
SELECT
	CustomerID,
	PostalCode
FROM
Customers
WHERE City = 'Mannheim'


-- Soru 4: Orders tablosuna gecis yapin ve tum urunlerin adlarini ve fiyatlarini listeleyin.
