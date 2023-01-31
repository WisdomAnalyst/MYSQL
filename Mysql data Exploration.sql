show databases;
use sql_sales;
show tables;

select * from list_of_orders;
select * from order_details;
select * from sales_target;

/* right joining order_details with Sales_target on the Category Column*/
Select st.month_of_order, st.Category, st.Target, od.Category, od.order_id, od.Amount, od.profit, od.Quantity
from sales_target as st right join order_details as od
on st.Category = od.Category;

/* looking at the profit for distincts order_ids with orders of % products across all product Categories */
select profit
from order_details
where order_id = Any (select order_id from order_details where Quantity = 5);

/* looking at the Orders by a Particular Customer "Manish" Overtime */
Select order_id, order_date, customerName
from  list_of_orders
where customerName like '%Manish%'
order by order_id;

/* Create Stored Procedure for covidvaccine_data*/
use `newschema`;
drop procedure if Exists `GetCovidDAta`; 
Delimiter //
use `newschema` //
create procedure `GetcovidData` ()
BEGIN
   select * from covidvaccine_data;
   END //
   

call GetcovidDAta();


/* looking Up basic covid-19 Vaccinated Populution of Nigerian States */
SELECT 
    State, Population, Total_Vaccinated_Population
FROM
    covidvaccine_data
WHERE
    Total_vaccinated_population BETWEEN 50000 AND 90000
ORDER BY Population DESC;

