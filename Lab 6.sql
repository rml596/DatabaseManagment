--Robert Lynch
--Lab 6

--q1
/*Display the name and city of customers who live in any city that makes the 
most different kinds of products. (There are two cities that make the most 
different products. Return the name and city of customers from either one of those.)*/

select name, city
from customers
where city in (select city
		from products
		group by city
		order by count(city)
		limit 1
		) ;

--q2
--Display the names of products whose priceUSD is strictly below the average priceUSD, in reverse-alphabetical order.

select name
from products
where priceUSD < (select avg(priceUSD)
		   from products
		   )
		 order by name DESC;

--q3
--Display the customer name, pid ordered, and the total for all orders, sorted by total from low to high.

select customers.name, orders.pid, orders.totalUSD
from customers 
inner join orders on customers.cid = orders.cid
order by orders.totalUSD ASC;

--q4
--Display all customer names (in alphabetical order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs.
select c.name, coalesce(sum(o.totalUSD),0) as totalDollars
from orders o
right outer join customers c on c.cid = o.cid
group by c.name
order by c.name ASC;

--q5
--Display the names of all customers who bought products from agents based in New York along with the names of the products they ordered, and the names of the agents who sold it to them.
select products.name, agents.name, customers.name
from orders
inner join customers on customers.cid = orders.cid
inner join agents on agents.aid = orders.aid
inner join products on products.pid = orders.pid
where agents.city = 'New York';

--q6
/*Write a query to check the accuracy of the dollars column in the Orders table. This means calculating Orders.totalUSD from data 
in other tables and comparing those values to the values in Orders.totalUSD. Display all rows in Orders where Orders.totalUSD is 
incorrect, if any.*/
select *
from(select o.*, p.priceUSD*o.qty*(1-(c.discount/100)) as calculation
     from orders o
     inner join products p on o.pid=p.pid
     inner join customers c on o.cid=c.cid) as selectStatement
where totalUSD != calculation;

--q7
--What’s the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give example queries in SQL to demonstrate. (Feel free to use the CAP database to make your points here.)
/*

The difference between left and right outer join is that in a left join, the table in the "table1 left outer join table2 on ..." means that 
the table left (table1) takes preference, so if there are values that don't match in table1, they are still displayed. Right outer join is
just the opposite. An example of this is if you do "Customers left outer join Orders" every customer is matched up to an order and even the 
customers that did not get placed an order is displayed on the output. NULL is put in its place instead.

*/
