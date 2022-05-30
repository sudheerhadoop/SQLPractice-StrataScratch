select 
    nationality,
    count(distinct unit_id) as apartment_count
from 
    airbnb_hosts h
join 
    airbnb_units u 
on h.host_id=u.host_id
and h.age<30
where lower(u.unit_type)='apartment'
group by nationality;
