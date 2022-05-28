select extract(year from inspection_date) as year, count(violation_id) as n_inspections 
from sf_restaurant_health_violations 
where business_name like '%Roxanne Cafe%'
group by extract(year from inspection_date)
order by extract(year from inspection_date);
