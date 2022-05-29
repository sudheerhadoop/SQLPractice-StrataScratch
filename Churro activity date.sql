select 
    activity_date,
    pe_description
from 
    los_angeles_restaurant_health_inspections
where
    UPPER(facility_name) like '%STREET CHURROS%' AND
    score < 95;
