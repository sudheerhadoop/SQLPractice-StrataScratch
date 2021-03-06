select 
    distinct year_rank,
    group_name,
    song_name
from 
    billboard_top_100_year_end
where year=2010 and year_rank <=10
order by year_rank;



/**********************/

SELECT
    year_rank as rank, 
    group_name,
    song_name
FROM billboard_top_100_year_end
WHERE 
    year = 2010 AND 
    year_rank BETWEEN 1 AND 10
GROUP BY 
    year_rank,
    group_name, 
    song_name
ORDER BY 
    year_rank ASC
