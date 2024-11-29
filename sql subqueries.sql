/*======================
Use W3School for these
======================*/

/* 1. Find the total number of customers in the countries of top five spending customers.
Answer: 29 -> 53 */
select count(customerid)
from customers
where country in (
    SELECT top 5 Country
    FROM Customers c 
    left join orders o on c.customerid = o.customerid
    group by Country
    order by count(c.customerID) desc
)

/* 2. How much revenue is generated by the supliers of the top buying country (coutry of customers which spends most amount of money)
Hint: Find the name of Customer.Country with max Total sales and use this as the where clauese in the main query to find the revenue based on
supplier's country. 
Answer: 31875.65 */
SELECT sum(Quantity * Price) as Revenue
FROM (OrderDetails o
left join products p on p.productid = o.productid)
left join suppliers s on s.supplierid = p.supplierid
where s.Country = (
	SELECT top 1 Country
    FROM Customers c 
    left join orders o on c.customerid = o.customerid
    group by Country
    order by count(c.customerID) desc
)
group by s.Country

/*============================================
Use MySQL workbench, DB: productdb for these
=============================================*/

/* 1. , find the count of all the users who did not place any `Order`
Hint: remember to put the table name Order in backticks as in `Order` because Order is a key work in SQL.
Answer: 67 */
select count(userId)
from User
where userId not in (
	select userId
    from `Order`
)


/* 2. stock (inventory) of the most sold product - quantity
Answer: 50 */
select stock
from Inventory
where productId = (
   select productId
   from OrderItem
   group by productId
   order by sum(quantity) desc
   limit 1
)


/* 3. All the postalCodeFSA with no orders
Answer: Count is 31, the query will show the actual postalcodes. */
select postalCodeFSA
from User
where userId not in (
	select userId
    from `Order`
)
group by postalCodeFSA
