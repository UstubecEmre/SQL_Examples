-- Flo examples

-- 1. Customers isimli bir veritabani ve verilen veri setindeki degiskenleri icerecek FLO isimli bir tablo olusturunuz.
/*
master_id E�siz m��teri numaras�
order_channel Al��veri� yap�lan platforma ait hangi kanal�n kullan�ld��� (Android, ios, Desktop, Mobile)
last_order_channel En son al��veri�in yap�ld��� kanal
first_order_date M��terinin yapt��� ilk al��veri� tarihi
last_order_date M��terinin yapt��� son al��veri� tarihi
last_order_date_online M��terinin online platformda yapt��� son al��veri� tarihi
last_order_date_offline M��terinin offline platformda yapt��� son al��veri� tarihi
order_num_total_ever_online M��terinin online platformda yapt��� toplam al��veri� say�s�
order_num_total_ever_offline M��terinin offline'da yapt��� toplam al��veri� say�s�
customer_value_total_ever_offline M��terinin offline al��veri�lerinde �dedi�i toplam �cret
customer_value_total_ever_online M��terinin online al��veri�lerinde �dedi�i toplam �cret
interested_in_categories_12 M��terinin son 12 ayda al��veri� yapt��� kategorilerin listesi
store_type 3 farkl� companyi ifade eder. A company'sinden al��veri� yapan ki�i B'dende yapt� ise A,B �eklinde yaz�lm��t�r.











*/



CREATE DATABASE CUSTOMERS

USE CUSTOMERS

CREATE TABLE FLO(
master_id INT PRIMARY KEY IDENTITY(1,1),





)