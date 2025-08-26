USE Northwind

-- SQL, yapisal sorgulama dilidir (Structured Query Language), Ýngilizce'ye benzer, buyuk kucuk harf duyarliligi yoktur.


--Soru 1:  Butun kullanicilari getiren sorgu
SELECT 
	* 
FROM 
	Customers

-- Soru 2: Sadece CompanyName, City ve Country getiren sorguyu yaziniz
SELECT
	CompanyName [SirketIsmi], 
	City [Sehir],
	Country[Ulke]
FROM
	Customers

-- Soru 3: Mannheim sehrinde yasayan kisilerin ID, PostalCode bilgilerini listeleyin
SELECT
	 CustomerID
	,PostalCode
FROM
	Customers
WHERE 
	City = 'Mannheim'


-- Soru 4: Products tablosuna gecis yapin ve tum urunlerin adlarini ve fiyatlarini listeleyin.

SELECT 
	*
FROM 
	Products


SELECT
	 ProductName [UrunIsmi]
   , UnitPrice [UrunFiyati]
FROM 
	Products


-- Soru 5: Products tablosunda UnitsStock alani 20'den buyuk olanlarin ismini ve stok miktarini getirin
SELECT
	ProductName[UrunAdi]
  ,	UnitsInStock[StokAdedi]
FROM
	Products
WHERE
	UnitsInStock > 20


-- Soru 6: Products tablosunda calismaya devam edelim. Boylece goz asinaligi olusur ve sorgulari yazmasi kolaylasir.
-- Urunleri a'dan z'ye olacak sekilde siralayin

SELECT
	ProductName [UrunAdi]
 ,  UnitPrice [UrunFiyati]
FROM
	Products
ORDER BY
	ProductName


-- Soru 7: Urunleri stok miktari azalan sekilde siralayalim. Bu urunlerin urun ismi, stok adedi ve fiyati gosterilsin
SELECT
	ProductName [UrunAdi]
  , UnitsInStock [StokAdedi]
  , UnitPrice [UrunFiyati]
FROM
	Products
ORDER BY
	UnitsInStock DESC



-- Soru 8: En yuksek fiyatli 10 urunu listeleyelim.
SELECT TOP 10
	ProductName [UrunAdi]
  , UnitPrice [UrunFiyati]
FROM
	Products
ORDER BY
	UnitPrice DESC 


-- Soru 9: En dusuk stoklu 10 urunu listeleyelim.
SELECT TOP 10
	ProductName [UrunAdi]
  , UnitPrice [UrunFiyati]
  , UnitsInStock [UrunStokAdedi]
FROM
	Products
ORDER BY
	UnitsInStock  


-- Soru 10: Urunler tablosunda discountinued 1 olanlari listeleyelim 
SELECT
	ProductID [UrunID]
  , ProductName [UrunIsmi]
  , UnitsInStock [StokAdedi]
  , UnitPrice[UrunFiyati]
FROM
	Products
WHERE
	Discontinued = 1 
