select ProductKey,Product_Name, round(sum(Quantity*Unit_Price_USD)) as total_sales 
from overall_sales group by ProductKey,Product_Name
order by total_sales desc limit 5;


select ProductKey,Product_Name, round(sum(Quantity*Unit_Price_USD)) as total_sales 
from overall_sales group by ProductKey,Product_Name
order by total_sales limit 5;



SELECT 
    ProductKey, Product_Name, 
    sum(Quantity) as TotalQuantity, 
    round(sum(Quantity * Unit_Price_USD)) as TotalRevenue, 
    round(sum(Quantity * Unit_Cost_USD)) as TotalCost,
    round((sum(Quantity * Unit_Price_USD) - sum(Quantity * Unit_Cost_USD))) as TotalProfit,
    round(((sum(Quantity * Unit_Price_USD) - sum(Quantity * Unit_Cost_USD)) / sum(Quantity * Unit_Price_USD)) * 100) as ProfitMarginPercentage
from overall_sales
group by ProductKey, Product_Name
order by ProfitMarginPercentage desc;

select Category, Subcategory, round(sum(Quantity * Unit_Price_USD)) as SubCategory_Revenue
from overall_sales
group by Subcategory,Category
order by Subcategory desc;
