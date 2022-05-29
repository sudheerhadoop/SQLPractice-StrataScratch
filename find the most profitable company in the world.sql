select 
    company, continent 
from 
    forbes_global_2010_2014
where lower(sector)='financials'
order by profits desc 
limit 1;


/****************/

SELECT company,
       continent
FROM forbes_global_2010_2014
WHERE sector = 'Financials'
  AND profits =
    (SELECT MAX(profits)
     FROM forbes_global_2010_2014
     WHERE sector = 'Financials')
