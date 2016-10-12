--Lab 4
--q1
--Get the cities of agents booking an order for a customer whose cid is 'c006'
select city
from agents
where aid in (
		select aid
		from orders
		where cid = 'c006'
		);

--q2
--Get the ids of products ordered through any agent who takes at least one order from a customer in Kyoto, sorted by pid from highest to lowest.
select distinct pid
from orders
where aid in (
		select aid
		from orders
		where cid in (
				select cid
				from customers
				where city = 'Kyoto'
				)
		)
order by pid DESC;

--q3
--Get the ids and names of customers who did not place an order through agent a03.
select cid, name
from customers 
where cid in (select distinct cid
		from orders
		where aid != 'a03'
		);

		/* CORRECTION 
		select cid, name
		from customers 
		where cid not in (select cid
				from orders
				where aid = 'a03'
				);*/
		
--q4
--Get the ids of customers who ordered both product p01 and p07.
select cid
from customers
where cid in (select cid
		from orders
		where pid = 'p01'
		INTERSECT
		select cid
		from orders
		where pid = 'p07'
		);

--q5
--Get the ids of products not ordered by any customers who placed any order through agent a08 in pid order from highest to lowest.
select pid 
from products
where pid not in (select pid
		from orders
		where cid in (select cid
				from orders
				where aid = 'a08'
				)
		)
order by pid DESC;

--q6
--Get the name, discounts, and city for all customers who place orders through agents in Dallas or New York.

select name, discount, city
from customers
where cid in (select cid
		from orders
		where aid in (select aid
				from agents
				where city = 'Dallas' or city = 'New York'
				)
		);
		
--q7
--Get all customers who have the same discount as that of any customers in Dallas or London
select *
from customers
where discount in (select discount
			from customers
			where city in ('Dallas','London')
			);

--q8
/*Tell me about check constraints: What are they? What are they good for? 
What’s the advantage of putting that sort of thing inside the database? 
Make up some examples of good uses of check constraints and some examples of bad uses of check constraints. 
Explain the differences in your examples and argue your case.*/

			 
