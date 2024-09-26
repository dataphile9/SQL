create database assignment2_mandatory
use assignment2_mandatory;

Create table Jomato
(OrderId int,
RestaurantName varchar(255),
RestaurantType varchar(255),
Rating float,
No_of_Rating int,
AverageCost float,
OnlineOrder varchar(255),
TableBooking varchar(255),	
CuisinesType varchar(255),
Area varchar(255),
LocalAddress varchar(255),	
Delivery_time int)

Bulk insert Jomato
from 'E:\Mustafa\Jomato\Jomato.csv'
with (
		firstrow=2,
		format='csv'
)
go

-----Assignment 2-----------

select * from Jomato;

/* 1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick
Chicken Bites’. */


CREATE FUNCTION StuffChicken
(@input VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    
    
    


/*2. Use the function to display the restaurant name and cuisine type which has the
maximum number of rating.*/






/*3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
start rating, ‘Good’ if it has above 3.5 and below 4 star rating, ‘Average’ if it is above 3
and below 3.5 and ‘Bad’ if it is below 3. */

alter table jomato
add Rating_status varchar(30);

update Jomato
set rating_status = case

when Rating>4 then 'excellent'
when rating between 3.5 and 4 then 'good'
when rating between 3 and 3.5 then 'average'
else 'bad'
end;

select * from jomato;

/* 4. Find the Ceil, floor and absolute values of the rating column and display the current
date and separately display the year, month_name and day.*/

select rating, CEILING(rating) as ceil_rating, floor(rating) as floor_rating, abs(rating) as abs_rating from Jomato;

select getdate();

SELECT DATENAME(yy, getdate())
select datename(MM, getdate()) as month_name
select datename(dd, getdate()) 


/* 5. Display the restaurant type and total average cost using rollup */

select * from jomato;

select restauranttype, sum(averagecost) as total_average_cost from jomato
group by rollup(restauranttype)











