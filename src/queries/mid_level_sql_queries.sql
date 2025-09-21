USE SQL_QUIZ


SELECT * 
	FROM EMPLOYEE AS e;


SELECT *
FROM COMPANY AS c;


SELECT *
FROM FIELD AS f;


SELECT *
FROM DEPARTMENT AS d;


--1. Her sirkette kac calisan var?
SELECT
	--e.ID AS CALISAN_ID
   --,e.Name + ' ' + e.Surname AS CALISAN_ADI_SOYADI
   c.Name AS SIRKET_ISMI
   ,COUNT(e.ID)
FROM EMPLOYEE AS e
JOIN 
	COMPANY AS c
ON 
	e.CompanyId = c.ID
GROUP BY
	c.Name;

----------------------------------------------------------------------------------------

-- Saglama icin
SELECT
	COUNT(*) AS TOPLAM_KAYITLI_SIRKET_SAYISI
FROM COMPANY AS c;

----------------------------------------------------------------------------------------
-- Saglama icin
SELECT
	COUNT(*) AS TOPLAM_KAYITLI_ELEMAN_SAYISI
FROM EMPLOYEE AS e;


-- 2. Calisan sayisi 2 veya ikiden fazla olan sirketleri listele

SELECT
	c.Name AS SIRKET_ISMI
   ,COUNT(e.ID) AS CALISAN_SAYISI
FROM COMPANY AS c
JOIN 
	EMPLOYEE AS e
ON 
	e.CompanyId = c.ID
GROUP BY
	c.Name
HAVING
	COUNT(e.ID) >= 2;
	
-- Not: AGGREGATE FUNCTIONS (MIN, MAX, COUNT, AVG ...) vb. WHERE yerine HAVING kullanilir.
----------------------------------------------------------------------------------------
-- 3. Her departmanda calisanlarin ortalama maasini bul

-- Departmana gore gruplama var

SELECT
	d.DEPARTMENT AS DEPARTMAN_ISMI
   ,AVG(e.SALARY) AS ORTALAMA_MAAS
FROM EMPLOYEE AS e
JOIN
	DEPARTMENT AS d
ON
	e.DepartmentID = d.ID
GROUP BY
	d.Department



----------------------------------------------------------------------------------------
-- 4. Ortalama maasi 40000 olan departmanlari listele
SELECT
	d.DEPARTMENT AS DEPARTMAN_ISMI
   ,AVG(e.SALARY) AS ORTALAMA_MAAS
FROM EMPLOYEE AS e
JOIN
	DEPARTMENT AS d
ON
	e.DepartmentID = d.ID
GROUP BY
	d.Department
HAVING
	AVG(e.Salary) > 40000

----------------------------------------------------------------------------------------

-- 5. Calişanların adi, soyadi, sirket adi ve departman adini getir.
SELECT
	e.Name AS CALISAN_ADI
   ,e.Surname AS CALISAN_SOYAD
   ,c.Name AS SIRKET_AD
   ,d.Department AS DEPARTMAN_AD
FROM EMPLOYEE AS e
JOIN
	COMPANY AS c ON e.CompanyId = c.ID
JOIN
	DEPARTMENT AS d ON e.DepartmentID = d.ID;

----------------------------------------------------------------------------------------
-- 6. Her sirketteki en yuksek maasi alan calisani bul.

-- Sırkete gore grupla
SELECT
	c.Name AS SIRKET_ISMI
   ,MAX(e.SALARY) AS EN_YUKSEK_MAAS
FROM EMPLOYEE AS e
JOIN
	COMPANY AS c ON e.CompanyId = c.ID
GROUP BY 
	c.Name;
	
----------------------------------------------------------------------------------------
/*
7. Her calisanin maasina gore bir kategori olustur:

Maasi < 30.000 → DUSUK_MAAS

30.000–60.000 → ORTA_MAAS

60.000 → YUKSEK_MAAS

*/
SELECT
	e.Name + ' ' + e.Surname AS CALISAN_ADI_SOYADI
   ,e.Salary
   ,CASE
		WHEN e.Salary < 30000 THEN 'DUSUK_MAAS'
		WHEN e.SALARY BETWEEN 30000 AND 60000 THEN 'ORTA_MAAS'
		ELSE 'YUKSEK_MAAS'  
	END AS MAAS_KATEGORISI
FROM EMPLOYEE AS e;





----------------------------------------------------------------------------------------
-- 8. Her sirkette toplam maas butcesini bul. Merak edilen AGG fonksiyonlari da kullanilabilir:)

-- Kirilim, gruplama vb. ifadeleri gecerse GROUP BY o sutuna gore yapilir. m

SELECT
	c.Name AS SIRKET_ADI
   ,SUM(e.Salary) AS TOPLAM_MAAS
   ,AVG(e.Salary) AS ORTALAMA_MAAS
   ,COUNT(e.ID) AS KISI_SAYISI
   ,MIN(e.Salary) AS MINIMUM_MAAS
   ,MAX(e.Salary) AS MAKSIMUM_MAAS
FROM COMPANY AS c
JOIN
	EMPLOYEE AS e ON c.ID = e.CompanyId
GROUP BY
	c.Name;

----------------------------------------------------------------------------------------
-- 9. Toplam maas butcesi 100.000’den fazla olan sirketleri listele.

SELECT
	c.Name AS SIRKET_ISMI
   ,SUM(e.Salary) AS TOPLAM_BUTCE
FROM EMPLOYEE AS e
JOIN
	COMPANY AS c ON e.CompanyId = c.ID
GROUP BY
	c.Name
HAVING
	SUM(e.Salary) > 100000;

----------------------------------------------------------------------------------------
-- 10. En az 2 farkli departmanda calisani olan sirketleri listele.

SELECT
	c.Name AS SIRKET_ISMI
   --,d.Department AS DEPARTMAN_ADI
   ,COUNT(DISTINCT d.ID) AS DEPARTMAN_SAYISI
FROM COMPANY AS c
JOIN
	EMPLOYEE AS e ON c.ID = e.CompanyID
JOIN
	DEPARTMENT AS d ON d.ID = e.DepartmentID
GROUP BY 
	c.Name 
 --  ,d.Department
HAVING
	COUNT(DISTINCT d.ID) >= 2;

--------------------------------
-- Merak eden icin
SELECT
	c.Name AS SIRKET_ISMI
   ,d.Department AS DEPARTMAN_ADI
   ,COUNT(d.ID) AS DEPARTMAN_SAYISI
FROM COMPANY AS c
JOIN
	EMPLOYEE AS e ON c.ID = e.CompanyID
JOIN
	DEPARTMENT AS d ON d.ID = e.DepartmentID
GROUP BY 
	c.Name 
   ,d.Department
HAVING
	COUNT(d.ID) = 2;

----------------------------------------------------------------------------------------
-- 11. Her departmandaki calisanlarin toplam deneyim yili (Experience) degerini bul.



----------------------------------------------------------------------------------------
-- 12. Deneyim yili toplami 8’den büyük olan departmanlari listele.

-- Departmana gore gruplama var
SELECT
	d.Department AS DEPARTMAN_ADI
   ,SUM(e.Experience) AS TOPLAM_DENEYIM
FROM EMPLOYEE AS e
JOIN
	DEPARTMENT AS d ON e.DepartmentID = d.ID
GROUP BY
	d.Department


---------------------------------------------
-- En az 8 yil deneyim
SELECT
	d.Department AS DEPARTMAN_ADI
   ,SUM(e.Experience) AS TOPLAM_DENEYIM
FROM EMPLOYEE AS e
JOIN
	DEPARTMENT AS d ON e.DepartmentID = d.ID
GROUP BY
	d.Department
HAVING
	SUM(e.Experience) >= 8

----------------------------------------------------------------------------------------
-- 13. Her calisanin calistigi sirketin faaliyet alanini (Field) da göster

-- Calisan bazli

SELECT
	c.Name AS SIRKET_ISMI
   ,f.Field AS FAALIYET_ALANI
   ,c.EstablishedDate AS KURULUS_YILI
FROM EMPLOYEE AS e
JOIN
	COMPANY AS c ON e.CompanyId = c.ID
JOIN
	FIELD AS f ON c.FieldID = f.ID;

---------------------------------------------

-- Sirketleri tekillestirelim
SELECT DISTINCT 
	c.Name AS SIRKET_ISMI
   ,f.Field AS FAALIYET_ALANI
   ,c.EstablishedDate AS KURULUS_YILI
FROM EMPLOYEE AS e
JOIN
	COMPANY AS c ON e.CompanyId = c.ID
JOIN
	FIELD AS f ON c.FieldID = f.ID;


----------------------------------------------------------------------------------------
-- 14. Her sirketin kurulus yilina göre sirketleri su şekilde kategorize et
/*

2000 öncesi → “ESKI_SIRKET”

2000–2010 arası → “ORTA_SIRKET”

2010 sonrası → “YENI_SIRKET”
*/

SELECT
	cmp.Name AS SIRKET_ISMI
   ,cmp.EstablishedDate AS SIRKET_KURULUS_TARIHI
    ,CASE
		WHEN YEAR(cmp.EstablishedDate) < 2000 THEN 'ESKI_SIRKET'
		WHEN YEAR(cmp.EstablishedDate) BETWEEN 2000 AND 2010 THEN 'ORTA_YASLI_SIRKET'
		ELSE 'YENI_SIRKET'
	END AS SIRKET_YAS_KATEGORISI
FROM COMPANY AS cmp
   
	

----------------------------------------------------------------------------------------
-- 15. Calisanlarin baslangic tarihine (StartDate) gore, 2020 oncesi baslayanları listele.

SELECT
	emp.Name AS CALISAN_ADI
   ,cmp.Name AS CALISANIN_SIRKETI
   ,fld.Field AS SIRKETIN_FAALIYET_ALANI
   ,dpt.Department AS CALISANIN_DEPARTMANI
   ,emp.StartDate AS BASLANGIC_YILI
   ,emp.Experience AS CALISANIN_DENEYIM_YILI
   ,emp.Salary AS CALISANIN_MAASI
FROM EMPLOYEE AS emp
JOIN
	COMPANY AS cmp ON emp.CompanyId = cmp.ID
JOIN
	DEPARTMENT AS dpt ON emp.DepartmentID = dpt.ID
JOIN
	FIELD AS fld ON cmp.FieldID = fld.ID
WHERE
	YEAR(emp.StartDate) < 2020
----------------------------------------------------------------------------------------