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


-- Soru 11: Siparis tablosunda Customer ID'leri benzersiz olarak getirin
SELECT 
	DISTINCT CustomerID
FROM
	Orders 


-- Soru 12: Telefon numarasi belirtilmis musterileri listeleyen sorguyu yaziniz.

SELECT
	CustomerID [MusteriID]
  , Phone [TelefonNumarasi]
FROM
	Customers
WHERE
	Phone IS NOT NULL

-- Soru 13: Fax numarasi bos olan musterileri getiren sorguyu yaziniz.

SELECT
	CustomerID [MusteriID]
  , Fax
FROM
	Customers 
WHERE
	Fax IS NULL


-- Soru 14: Urun fiyatlarinin ortalamasini, en dusuk ve en yuksek urun fiyatlarini bulunuz.

SELECT
	AVG(UnitPrice) [OrtalamaUrunFiyati]
  , MIN(UnitPrice) [EnDusukFiyatliUrunFiyati]
  , MAX(UnitPrice) [EnYuksekFiyatliUrunFiyati]
FROM Products

-- Soru 15: Urun fiyati ile ortalama urun fiyatindan dusuk olanlari bulan sorguyu yaziniz.
SELECT
	ProductName AS UrunIsmi
  , UnitPrice AS UrunFiyati
  , UnitsInStock AS UrunStokAdedi
FROM Products
WHERE UnitPrice < (
      SELECT AVG(UnitPrice)
	  From Products
)


-- Soru 16: Gonderici firmalari Contact Title'ina gore siralayin.
SELECT
	ContactName AS KisiAdi 
  , ContactTitle AS KisiUnvani
 
FROM Suppliers
ORDER BY ContactTitle 

-- Soru 17: Her siparisin urun adedini listeleyen sorguyu yaziniz. Burada Group By kullanmalisiniz.
-- Aggregate function (min, max, sum, count vb. aritmatiksel fonksiyonlar) yaninda bir kriter varsa GROUP BY kullanmamiz gerekir. Anahtar kelimeler olarak da
-- bazinda, kiriliminda 
SELECT
	OrderID AS SiparisID
  , COUNT(Quantity) SiparisAdedi
FROM [Order Details]
GROUP BY OrderID


-- Soru 18: Siparis toplami 15'den kucuk olanlari listeleyen sorguyu yaziniz. Having kullanimi tavsiye edilir.
/*

HAVING matematiksel islemleri filtrelemek icin kullandigimiz kritik bir operator olarak karsimiza cikar.
GROUP BY ifadesinden sonra kullanilir.
WHERE'de diger filtreler ile kullanabiliriz, GROUP BY'dan once gelir

*/

SELECT
	OrderID AS SiparisID
  , SUM(Quantity) AS SiparisMiktari
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) < 15


-- WHERE yerine HAVING deneyelim 10268 ID no'lu siparisi getiren sorguyu yazalim.
SELECT
	OrderID AS SiparisID
  , SUM(Quantity) AS ToplamSiparisAdedi
FROM [Order Details]
-- WHERE OrderID = 10268
GROUP BY OrderID
HAVING OrderID = 10268



-- Soru 19: Her calisanin aldigi siparis sayisini bulunuz. Join islemlerini gerceklestirebilirsiniz.
SELECT
	Emp.EmployeeID AS CalisanID
  , Emp.FirstName + ' ' + LastName AS CalisanAdiSoyadi
  , Emp.Title AS CalisanUnvani
  , COUNT(O.OrderID) AS SiparisAdedi 
FROM 
	Employees as Emp
JOIN 
	Orders as O
ON 
	Emp.EmployeeID = O.EmployeeID
GROUP BY
	Emp.EmployeeID
  , Emp.FirstName + ' ' + LastName
  , Emp.Title


-- Soru 20: Urunleri kategorilere gore gruplayin ve ortalama fiyatlarini hesaplayin

SELECT
	P.ProductID AS UrunID
  , P.ProductName AS UrunAdi
  , C.CategoryName AS KategoriAdi
  , AVG(P.UnitPrice) AS OrtalamaFiyat 
FROM Products AS P
	RIGHT JOIN Categories AS C
ON
	P.CategoryID = C.CategoryID
GROUP BY 
	P.ProductID
  , P.ProductName
  , C.CategoryName


-- Soru 21: Her siparis icin siparis sirasini tarihe gore belirleyen
/*
Burada RowNumber, Rank, Dense Rank komutlarini bilmemiz iyi olacaktir.
Herhangi bir siralama icin islem yapmak istedigimizde ya da çoklayan veriyi tekilleþtirmek istedigimizde 
ornegin her bir musteriye, siparise tekil bir sayi vermek istedigimizde kullanilan yontemlerden biri.
Diger bir ornek olarak da performansa gore satis ve primlerin belirlenmesi

OVER sayiyi parcalamak icin kullanilan yontemdir.

RANK, her bir tarihe sayilar verir, tarihler esit olursa ayni tarihlere ayni sayiyi verir.
Bu durumda, bir bosluk birakir. Farklilastigi noktada verdigi sayinin 2 fazlasini verir.

DENSE_RANK ise, degisen bilgide bir fazlasini verir. Sayilari atlamadan ilerler.
RANK ise atlayarak ilerler.
ROW ise, verdigin kritere gore her bir sayiyi tekillestirerek devam eder.
*/ 

SELECT
	CustomerID AS MusteriID
  , OrderID AS SiparisID
  , OrderDate AS SiparisTarihi
  ROW_NUMBER() OVER (ORDER BY OrderDate) AS OrderSeq_ROW
, RANK() OVER (ORDER BY OrderDate) AS OrderSeq_RANK
, DENSE_RANK() OVER (ORDER BY OrderDate) AS OrderSeq_DENSE_RANK
FROM Orders;



-- Her bir musterinin en son yaptigi siparis
SELECT
	CustomerID AS MusteriID
  , OrderID AS SiparisID
  , OrderDate AS SiparisTarihi
   ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate desc) AS OrderRank
 , RANK() OVER (PARTITION BY CustomerID ORDER BY OrderDate desc) AS OrderRank1
 , DENSE_RANK() OVER (PARTITION BY CustomerID ORDER BY OrderDate desc) AS OrderRank2
FROM Orders;
ORDER BY
	CustomerID
  , OrderRank 
  , OrderRank1
  , OrderRank2



-- Yukaridaki ornekte CustomerID'yi gruplara boluyoruz, her bir musteriye tekil bir numara veriyoruz
-- Musteri numaralarini gruplayarak boluyor, numara atamasi yapar ve her bir numarayi tekillestirir.



-- Soru 22: CASE WHEN ile urun stok durumunu metinsel olarak gosteriniz
SELECT
	ProductName AS UrunAdi
  , UnitsInStock AS StokAdedi
  , CASE
		WHEN UnitsInStock = 0 
			THEN 'Stokta Yok!!!'
		WHEN UnitsInStock < 20 
			THEN 'Az Stok!'
		ELSE
			'Yeterli Stok'
	END AS StokDurumu
FROM Products;

		