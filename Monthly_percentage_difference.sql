with revenue_monthly as
(select 
    split_part(created_at::TEXT, '-' , 1) || '-' || split_part(created_at::TEXT, '-' , 2) as year_month, 
    sum(value)/(select sum(value) 
from sf_transactions) as revenue from sf_transactions
group by 1
order by 1),

previous_revenue as 
(select year_month,
       revenue,
       lag(revenue,1) over(order by year_month) previous_month_revenue
from revenue_monthly)


select 
    year_month, 
    round(((revenue-previous_month_revenue)/previous_month_revenue)*100,2) as revenue_diff_pct
from previous_revenue;



/** Alternative approach

SELECT to_char(created_at::date, 'YYYY-MM') AS year_month,
       round(((sum(value) - lag(sum(value), 1) OVER w) / (lag(sum(value), 1) OVER w)) * 100, 2) AS revenue_diff_pct
FROM sf_transactions
GROUP BY year_month 
WINDOW w AS (
                                 ORDER BY to_char(created_at::date, 'YYYY-MM'))
ORDER BY year_month ASC
