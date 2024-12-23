USE dataspark;

select gender, count(*) as "Count" from customers group by gender;
select Country,State,City,Continent, count(CustomerKey) from customers group by Country,State,City,Continent;

select Continent,Country,count(CustomerKey) from customers group by Continent,Country;
DESCRIBE overall_sales;

SELECT 
case when TIMESTAMPDIFF(YEAR, Birthday, Order_Date) <= 18 then "Child"
when TIMESTAMPDIFF(YEAR, Birthday, Order_Date) between 19 and 30 then "Young adults"
when TIMESTAMPDIFF(YEAR, Birthday, Order_Date) between 31 and 40 then "Adults in their thirties"
when TIMESTAMPDIFF(YEAR, Birthday, Order_Date) between 41 and 50 then "Middle Age"
when TIMESTAMPDIFF(YEAR, Birthday, Order_Date) between 51 and 60 then "Seniors"
when TIMESTAMPDIFF(YEAR, Birthday, Order_Date) between 61 and 70 then "Old Age"
when TIMESTAMPDIFF(YEAR, Birthday, Order_Date) >= 70 then "Super Seniors"
end as Age_range, count(*)
FROM overall_sales
group by Age_range;


SELECT AVG(OrderValue) AS AverageOrderValue
FROM (
    SELECT OrderNumber, SUM(Unit_Price_USD * Quantity) AS OrderValue
    FROM overall_sales
    GROUP BY OrderNumber
) AS OrderValues;


SELECT AVG(PurchaseCount) AS AveragePurchaseFrequency
FROM (
    SELECT CustomerKey, COUNT(DISTINCT OrderNumber) AS PurchaseCount
    FROM overall_sales
    GROUP BY CustomerKey
) AS PurchaseFrequencies;



SELECT CustomerKey,Product_Name, SUM(Quantity) AS TotalQuantity
FROM overall_sales
group by CustomerKey,Product_Name
ORDER BY SUM(Quantity) DESC
limit 50;


