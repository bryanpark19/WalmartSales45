--viewing dataset
select * from Sales_data

--summing total sales between stores
Select Store, Sum(Weekly_Sales) AS total_sales From Sales_data group by Store
order by total_sales desc;

--Building table to bring into PowerBI
Select date,
store,
weekly_sales, 
temperature,
-- ability to classify temperature ranges
CASE WHEN temperature < 32 then 'very cold'
	when temperature between 32.1 and 40 then 'cold'
	when temperature between 40.1 and 55 then 'moderate'
	when temperature between 55.1 and 70 then 'warm'
	when temperature between 70.1 and 90 then 'hot'
	when temperature > 90.1 then 'very hot'
	Else 'Unknown' end as temperature_category,
fuel_price, 
--categorize fuel prices to see their impact on sales
Case when fuel_price < 3 then 'low fuel price'
	when fuel_price between 3.1 and 3.7 then 'moderate fuel prices'
	when fuel_price between 3.71 and 4.5 then 'high fuel prices'
	ELSE 'Unknown' end as fuel_price_category,
CPI, holiday_flag, 
unemployment,
--investigate whether unemployment is correlated to sales
case when unemployment < 4 then 'low unemployment'
	when unemployment between 4.01 and 6 then 'healthy unemployment rate'
	when unemployment > 6.01 then 'high unemployment rate'
	Else 'Unknown' end as Unemployment_category
from Sales_data