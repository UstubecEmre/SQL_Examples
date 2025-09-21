-- SQL DQL (Data Query Language):
/*
SELECT
FROM
WHERE
GROUP BY
HAVING
DISTINCT
ORDER BY
LIMIT / TOP


*/
USE SQL_QUIZ


-- SQL Best Practice icin uyulmasi gerekenler
-- 1. Her anahtar kelime buyuk harfle baslamali
-- 2. Tablo ve sutun isimleri anlamli olmali
-- 3. Noktalý virgül ile sorguyu bitirmemiz tavsiye edilir
-- 4. Uzun sorgular icin takma isim yani alias kullanmamiz bizler icin iyi olacaktir.




-- 1. Tum calisanlari listeleyen sorguyu yaziniz.

SELECT * 
FROM EMPLOYEE AS e


-- 2. Deneyim yili 3'den fazla olanlari listeleyen sorguyu yaziniz
SELECT *
FROM EMPLOYEE as e
WHERE e.Experience > 3;


-- 3. Isim ve soyismi birlestiren ve yeni bir sutun adi olarak getiren sorguyu yaziniz
SELECT e.Name + ' ' + e.Surname AS ISIM_SOYISIM
FROM EMPLOYEE as e


--4. Icerisinde yahoo gecen emailleri getiren sorguyu yaziniz
SELECT 
	e.Name AS ISIM 
   ,e.Surname AS SOYISIM
   ,e.Email AS EMAIL
FROM EMPLOYEE AS e
WHERE e.Email LIKE '%yahoo%'


--5. Ismi e ile baslayip 4 karakterden olusan isimleri getiren sorguyu yaziniz

SELECT
	e.Name AS Isým
   ,e.Surname AS Soyisim
   ,e.Experience AS DENEYIM
   ,e.Salary AS MAAS
FROM EMPLOYEE AS e
WHERE
	e.Name LIKE 'e___'


--6. Maasi 30000'den az olup tecrubesi 1 yil veya daha fazla olan kisilerin isim, soyisim, maas, baslangic tarihini ve sirket id'sini getiren sorguyu yazin.

SELECT 
	e.Name AS ISIM
   ,e.Surname AS SOYISIM
   ,e.SALARY AS MAAS
   ,e.StartDate AS BASLANGIC_TARIHI
FROM EMPLOYEE AS e
WHERE
	e.Salary < 30000
	AND e.Experience >= 1


--7. Departman ID degeri 5 olan kisilerin isim, soyisim, maas ve sirket id'sini getiren sorguyu yazýn.

SELECT 
	e.Name AS ISIM
   ,e.Surname AS SOYISIM
   ,e.Salary AS MAAS
   ,e.CompanyId AS SIRKET_ID
FROM EMPLOYEE AS e
WHERE
	e.DepartmentID = 5


--8. Deneyime gore artandan azalana dogru bir siralama yapiniz ve ilgili sutunlari getiriniz
SELECT
	e.Name AS ISIM
   ,e.Surname AS SOYISIM
   ,e.Salary AS MAAS
   ,e.StartDate AS BASLANGIC_TARIHI
   ,e.Experience AS DENEYIM 
FROM EMPLOYEE AS e
ORDER BY
	e.Experience DESC
	
-- 9. Maasa gore azalandan artana dogru siralayin ve getirin.

SELECT
	e.Name AS ISIM
   ,e.Surname AS SOYISIM
   ,e.Salary AS MAAS
   ,e.Experience AS DENEYIM 
FROM EMPLOYEE AS e
ORDER BY
	e.Salary


-- 10. En yuksek ve en dusuk maasi getiren sorguyu yaziniz.

SELECT 
	MIN(e.Salary) AS MINIMUM_MAAS
   ,MAX(e.Salary) AS MAKSIMUM_MAAS
FROM EMPLOYEE AS e


------------------------------------------------------------------------------

-- Company ile ilgili sorulara gecelim

SELECT
	*
FROM COMPANY AS C;


-- 11. Ismi s ile biten sirketlerin ismini, ve kurulus tarihlerini getiren sorguyu yaziniz

SELECT
	c.Name AS SIRKET_ISMI
   ,c.EstablishedDate AS KURULUS_TARIHI
FROM COMPANY AS c
WHERE
	c.Name LIKE '%s';

-- 12. Kurulus tarihi 2003 ve 2012 olanlari getiren sorguyu yaziniz

SELECT
   c.Name AS SIRKET_ISMI
  ,c.EstablishedDate AS KURULUS_TARIHI
FROM COMPANY AS c
WHERE YEAR(c.EstablishedDate) IN (2003, 2012);

-- 13. 2010 ile 2014 tarihleri arasinda kurulan sirketleri getiren sorguyu yaziniz

SELECT
    c.Name AS SIRKET_ISMI
   ,c.EstablishedDate AS KURULUS_TARIHI
FROM COMPANY AS c
WHERE 
	YEAR(c.EstablishedDate) BETWEEN 2010 AND 2014
ORDER BY YEAR(c.EstablishedDate);

-- 14. En eski sirketi getiren sorguyu yaziniz
SELECT
    c.Name AS SIRKET_ISMI
   ,c.EstablishedDate AS KURULUS_TARIHI
FROM COMPANY AS c
WHERE 
	c.EstablishedDate = (
		SELECT MIN(c.EstablishedDate)
		FROM COMPANY AS c
	);


SELECT 
	TOP 1 c.Name AS SIRKET_ISMI
   ,c.EstablishedDate AS KURULUS_TARIHI
FROM COMPANY AS c
ORDER BY 
	c.EstablishedDate;

-- 15. En yeni kurulan tarihli sirketi getiren sorguyu yaziniz

SELECT
	TOP 1 c.Name AS SIRKET_ISMI
   ,c.EstablishedDate AS KURULUS_TARIHI
FROM COMPANY AS c
ORDER BY
	c.EstablishedDate DESC;


SELECT
	c.Name AS SIKET_ISMI
   ,c.EstablishedDate AS KURULUS_TARIHI
FROM COMPANY AS c
WHERE
	c.EstablishedDate = (
	SELECT 
		MAX(c.EstablishedDate)
	FROM COMPANY AS C
	);



--16. Nýsan ayinda kurulan sirketleri listeleyen kodu yaziniz.

SELECT
	c.Name AS SIRKET_ISMI
  , c.EstablishedDate AS KURULUS_TARIHI
FROM COMPANY AS c
WHERE 
	MONTH(c.EstablishedDate) = '4';



-- 17. Gunun 15'inde kurulanlari getiren sorguyu yaziniz
SELECT
	c.Name AS SIRKET_ISMI
  , c.EstablishedDate AS KURULUS_TARIHI
FROM COMPANY AS c
WHERE 
	DAY(c.EstablishedDate) = '15';


-- 18. FiledID'si 11 olanlarin sirket ismi ve kurulus yilini getiren sorguyu yaziniz
SELECT
	c.Name AS SIRKET_ISMI
   ,c.EstablishedDate AS KURULUS_YILI
FROM COMPANY AS c
WHERE 
	c.FieldID = 11;


-- 19. Kurulus yili 2015 sonrasi veya alani 4 olanlari getiren sorguyu yaziniz
SELECT
	c.Name AS SIRKET_ISMI
   ,c.EstablishedDate AS KURULUS_YILI
   ,c.FieldID AS ALAN_ID
FROM COMPANY AS c
WHERE 
	c.FieldID = 4
	OR YEAR(c.EstablishedDate) >= 2015;


-- 20. FieldID'si 5 olmayan ve 2012 yilinda kurulan sirketleri getiren sorguyu yaziniz

SELECT
	c.Name AS SIRKET_ISMI
   ,c.FieldID AS SIRKET_ALANI_ID
   ,c.EstablishedDate AS SIRKET_KURULUS_TARIHI
FROM COMPANY AS c
WHERE
	YEAR(c.EstablishedDate) = 2012
	AND c.FieldID <> 5

--------------------------------------------------------------------------------------------
-- FIELD tablosu ile calisalim

-- 21. Tum Alan bilgisini getiren sorguyu yaziniz

SELECT
	*
FROM FIELD AS f


--22. Field ID'si 4 olani getiren sorguyu yaziniz
SELECT
	f.ID AS ALAN_ID
   ,f.Field AS ALAN_ADI
FROM FIELD AS f
WHERE 
	f.ID = 4

-- 23. Field ismi Biomedical olan kayitlari getiren sorguyu yaziniz

SELECT
	f.ID AS ALAN_ID
   ,f.Field AS ALAN_ADI
FROM FIELD AS f
WHERE
	f.Field = 'Biomedical'


-- 24. Alan adi Education veya Alan ID'si 6 olanlari getiren sorguyu yaziniz

SELECT
	f.ID AS ALAN_ID
   ,f.Field AS ALAN_ISMI
FROM FIELD AS f
WHERE
	f.ID = 6
	OR f.Field = 'Education'


-- 25. Alan adi M ile baslayanlari getiren sorguyu yaziniz
SELECT
	f.ID AS ALAN_ID
   ,f.Field AS ALAN_ISMI
FROM FIELD AS f
WHERE
	f.Field LIKE 'M%'


-- 26. Alan isimlerinin icerisinde an gecenleri listeleyen sorguyu yaziniz

SELECT
	f.ID AS ALAN_ID
   ,f.Field AS ALAN_ISMI
FROM FIELD AS f
WHERE
	f.Field LIKE '%an%'


-- 27. Alan ismi e veya s ile biten kayitlari getiren sorguyu yaziniz

SELECT
	f.ID AS ALAN_ID
   ,f.Field AS ALAN_ISMI
FROM FIELD AS f
WHERE
	f.Field LIKE '%e'
	OR f.Field LIKE '%s'


-- 28. Alan ismini a'dan z'ye gore siralayan sorguyu yaziniz

SELECT
	f.ID AS ALAN_ID
   ,f.Field AS ALAN_ISMI
FROM FIELD AS f
ORDER BY 
	f.Field ASC


-- 29. Alan isimlerinden 6 harfli olanlari getiren sorguyu yaziniz

SELECT
	f.ID AS ALAN_ID
   ,f.Field AS ALAN_ISMI
FROM FIELD AS f
WHERE
	LEN(f.Field) = 6

-- 30. Alan isimleri 10 karakterden uzun olanlari getiren sorguyu yaziniz
SELECT
	f.ID AS ALAN_ID
   ,f.Field AS ALAN_ISMI
FROM FIELD AS f
WHERE
	LEN(f.Field) > 10


--------------------------------------------------------------------------------------------

-- DEPARTMENT ile ilgili calisalim

--31. Butun departmanlari getiren sorguyu yaziniz
SELECT
	*
FROM DEPARTMENT AS d;



-- 32. 9 numarali departmani getiren sorguyu yaziniz
SELECT
	d.ID AS DEPARTMAN_ID
   ,d.Department AS DEPARTMAN_ISMI
FROM DEPARTMENT AS d 
WHERE 
	d.ID = 9;

-- 33. Departman Numaralari 8 ile 12 arasinda olan kayitlari getiren sorguyu yaziniz

SELECT
	d.ID AS DEPARTMAN_ID
   ,d.Department AS DEPARTMAN_ISMI
FROM DEPARTMENT AS d
WHERE
	d.ID BETWEEN 8 AND 12;


-- 34. Departman ismi 'ce' veya 's' ile biten kayitlari getiren sorguyu yaziniz
SELECT
	d.ID AS DEPARTMAN_ID
   ,d.Department AS DEPARTMAN_ISMI
FROM DEPARTMENT AS d 
WHERE 
	d.Department LIKE '%ce' 
	OR d.Department LIKE '%s';


-- 35. Departman ismi 5 karakterden kisa olan departmanlari getiriniz

SELECT
	d.ID AS DEPARTMAN_ID
   ,d.Department AS DEPARTMAN_ISMI
FROM DEPARTMENT AS d 
WHERE 
	LEN(d.Department) < 5;

-- 36. Departman ID'si 4, 7, 11 olmayan kayitlari getiriniz
SELECT
	d.ID AS DEPARTMAN_ID
   ,d.Department AS DEPARTMAN_ISMI
FROM DEPARTMENT AS d 
WHERE 
	d.ID NOT IN (4, 7, 11)


-- 37. Departman ismi 'L' ile baslayan kayitlari getiriniz
SELECT
	d.ID AS DEPARTMAN_ID
   ,d.Department AS DEPARTMAN_ISMI
FROM DEPARTMENT AS d 
WHERE 
	d.Department LIKE 'L';

-- 38. Departman isminin karakter uzunlugu 10'dan uzun olanlari getiren sorguyu yaziniz
SELECT
	d.ID AS DEPARTMAN_ID
   ,d.Department AS DEPARTMAN_ISMI
FROM DEPARTMENT AS d 
WHERE 
	LEN(d.Department) > 10;

-- 39. Departman ID'si 4 olan veya departman isimleri Operations, Legal, Manufacturing, Talent Management olan kayitlari getiren sorguyu yaziniz
SELECT
	d.ID AS DEPARTMAN_ID
   ,d.Department AS DEPARTMAN_ISMI
FROM DEPARTMENT AS d 
WHERE 
	d.ID = 4
	OR d.Department IN ('Operations', 'Legal', 'Manufacturing', 'Talent Management');

-- 40. Departmanin icerisinde c harfi gecmeyenleri getiren sorguyu yaziniz
SELECT
	d.ID AS DEPARTMAN_ID
   ,d.Department AS DEPARTMAN_ISMI
FROM DEPARTMENT AS d 
WHERE 
	LOWER(d.Department) NOT LIKE '%c%';


-- 41. Departmanlari A'dan Z'ye siralayip getiren sorguyu yaziniz

SELECT
	d.ID AS DEPARTMAN_ID
   ,d.Department AS DEPARTMAN_ISMI
FROM DEPARTMENT AS d 
ORDER BY
	d.Department ASC;


-- 42. Departmanlari Z'den A'ya siralayan sorguyu yaziniz.
SELECT
	d.ID AS DEPARTMAN_ID
   ,d.Department AS DEPARTMAN_ISMI
FROM DEPARTMENT AS d 
ORDER BY
	d.Department DESC;

-- 43. Departmanlarin kac karakterden olustugunu ek sutun olarak getiren sorguyu yaziniz
SELECT
	d.ID AS DEPARTMAN_ID
   ,d.Department AS DEPARTMAN_ISMI
   ,LEN(d.Department) AS KARAKTER_SAYISI
FROM DEPARTMENT AS d ;


--------------------------------------------------------------------------------------------