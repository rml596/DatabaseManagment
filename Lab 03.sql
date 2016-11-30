select ordnum, totalUSD
from orders;


select name, city
from agents
where name='Smith';


select pid, name, priceUSD
from products
where quantity>201000;


select name, city
from customers
where city='Duluth';


select name
from agents
where city <> 'New York' and city <> 'Duluth';


select pid, name, city, quantity, priceUSD
from products
where priceUSD >= 1 and city <> 'New York' and city <> 'Duluth';


select ordnum, mon, cid, aid, pid, qty, totalUSD
from orders
where mon= 'feb' or mon = 'mar';


select ordnum, mon, cid, aid, pid, qty, totalUSD
from orders
where mon= 'feb' and totalUSD >= 600;


select ordnum, mon, cid, aid, pid, qty, totalUSD
from orders
where cid= 'c005';