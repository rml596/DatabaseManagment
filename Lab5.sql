--Robert Lynch
--Lab 5


--q1
--Show the cities of agents booking an order for a customer whose id is 'c006'. Use joins this time; no subqueries
select city
from agents 
inner join orders 
on agents.aid = orders.aid
where orders.cid = 'c006';

--q2
--Show the ids of products ordered through any agent who makes at least one order for a customer in Kyoto, sorted by pid from highest to lowest. Use joins; no subqueries
select distinct o2.pid
from orders o1 inner join customers on o1.cid = customers.cid
               inner join orders o2 on o1.aid = o2.aid
where customers.city = 'Kyoto'
order by o2.pid desc

--q3
--Show the names of customers who have never placed an order. Use a subquery
Select cid,name
from customers
where cid not in (select cid
			from orders);

--q4
--Show the names of customers who have never placed an order. Use an outer join
Select name
from customers
	Full outer join orders
	on customers.cid = orders.cid
	where orders.cid is null;

--q5
--Show the names of customers who placed at least one order through an agent in their own city, along with those agent(s') names.
select distinct customers.name, agents.name
from orders 
	inner join agents on agents.aid=orders.aid
	inner join customers on customers.cid=orders.cid
	where agents.city=customers.city;


--q6
--Show the names of customers and agents living in the same city, along with the name of the shared city, regardless of whether or not the customer has ever placed an order with that agent.
Select customers.name, agents.name, customers.city
from customers, agents
where customers.city=agents.city;

--q7
--Show the name and city of customers who live in the city that makes the fewest different kinds of products. (Hint: Use count and group by on the Products table.)
select name, city
from customers
where city in (select city
		from products
		group by city
		order by count(pid) ASC
		limit 1);
