-- Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.

-- film tablosunda film uzunluğu length sütununda gösterilmektedir. 
--Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?

-- film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?

-- film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.

-- payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

select count(length) from film where length > any (select avg(length) from film );

select count(*) from film where rental_rate = ALL (select max(rental_rate) from film);

select * from film where rental_rate = ALL (select min(rental_rate) from film) and replacement_cost = ALL (select min(replacement_cost) from film) ;


SELECT customer.first_name, customer.last_name,  COUNT(payment.customer_id) FROM payment JOIN customer ON customer.customer_id = payment.customer_id GROUP BY customer.first_name, customer.last_name, payment.customer_id ORDER BY COUNT(payment.customer_id) DESC;