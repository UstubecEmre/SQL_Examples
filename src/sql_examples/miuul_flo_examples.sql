-- Flo examples

-- 1. Customers isimli bir veritabani ve verilen veri setindeki degiskenleri icerecek FLO isimli bir tablo olusturunuz.
/*
master_id Eþsiz müþteri numarasý
order_channel Alýþveriþ yapýlan platforma ait hangi kanalýn kullanýldýðý (Android, ios, Desktop, Mobile)
last_order_channel En son alýþveriþin yapýldýðý kanal
first_order_date Müþterinin yaptýðý ilk alýþveriþ tarihi
last_order_date Müþterinin yaptýðý son alýþveriþ tarihi
last_order_date_online Müþterinin online platformda yaptýðý son alýþveriþ tarihi
last_order_date_offline Müþterinin offline platformda yaptýðý son alýþveriþ tarihi
order_num_total_ever_online Müþterinin online platformda yaptýðý toplam alýþveriþ sayýsý
order_num_total_ever_offline Müþterinin offline'da yaptýðý toplam alýþveriþ sayýsý
customer_value_total_ever_offline Müþterinin offline alýþveriþlerinde ödediði toplam ücret
customer_value_total_ever_online Müþterinin online alýþveriþlerinde ödediði toplam ücret
interested_in_categories_12 Müþterinin son 12 ayda alýþveriþ yaptýðý kategorilerin listesi
store_type 3 farklý companyi ifade eder. A company'sinden alýþveriþ yapan kiþi B'dende yaptý ise A,B þeklinde yazýlmýþtýr.











*/



CREATE DATABASE CUSTOMERS

USE CUSTOMERS

CREATE TABLE FLO(
master_id INT PRIMARY KEY IDENTITY(1,1),





)