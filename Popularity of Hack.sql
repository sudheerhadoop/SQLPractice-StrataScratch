select 
    femp.location, 
    avg(fhs.popularity) as average_popularity
from facebook_hack_survey fhs
    join 
facebook_employees femp on
fhs.employee_id = femp.id
group by femp.location;
