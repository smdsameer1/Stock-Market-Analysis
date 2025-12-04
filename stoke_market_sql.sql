use stoke_market;
select * from fact_daily_prices;
select * from dim_company;
select * from dim_portfolio;
select * from dim_exchange;
select * from dim_sectors;
select * from dim_trader;
select * from fact_daily_prices;
select * from fact_orders;
select * from fact_dividends;
select * from fact_positions_snapshot;
select * from fact_splits;
select * from fact_trades;

-- Question-1 --
SELECT SUM(Total_Market) AS total_market_value
FROM fact_daily_prices;

-- Question-2 --
SELECT AVG(volume) AS avg_volume
FROM fact_daily_prices;

-- Question-3 --
SELECT company_id,
       STDDEV(returns) AS stddev_returns
FROM fact_daily_prices
GROUP BY company_id;

-- Question-4 --
SELECT Sector_Name,
       SUM(Returns) AS total_returns
FROM fact_daily_prices
GROUP BY Sector_Name
ORDER BY total_returns DESC
LIMIT 1;

-- Question-5 --
SELECT SUM(Quantity_Heild) AS total_quantity
FROM merge1;

-- Question-6 --
SELECT company_id,
       SUM(portfolio_return) AS total_portfolio_return
FROM portfolio_return
GROUP BY company_id
ORDER BY company_id ASC;

-- Question-7 --
select company_id , sum(Column1) as sum_of_companyid
from portfolio_return 
Group By company_id;

-- Question-8 --
SELECT 
    (SUM(port) - SUM(return_rate)) /0.16 AS sharpe_ratio
FROM portfolio_return;

-- Question 9--
SELECT side,
       COUNT(order_id) AS total_orders
FROM fact_trades
GROUP BY side;

-- Question-10 --
select (sum(is_Profit)/Count(is_Profit))*100 as Trade_Win_Rate
from fact_trades;

-- Question-11 --
select Profit_Loss, count(Profit_Loss) as count_of_Profit_loss
from fact_trades
group by Profit_Loss;




