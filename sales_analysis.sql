select monthname(order_date) as month, round(sum(Quantity*Unit_Price_USD)) as total_sum from overall_sales group by month;

SELECT 
    ProductKey, Product_Name, 
    sum(Quantity) as TotalQuantity, 
    round(sum(Quantity * Unit_Price_USD)) as TotalRevenue
from overall_sales
group by ProductKey, Product_Name;


SELECT 
    Currency_Code, 
    round(SUM(Quantity * Unit_Price_USD)) AS SalesInUSD,
    round(SUM(Quantity * Unit_Price_USD / Exchange)) AS SalesInLocalCurrency
FROM overall_sales
GROUP BY Currency_Code
ORDER BY SalesInUSD DESC;
