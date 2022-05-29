select 
   distinct hosts.host_id,
    guests.guest_id
from 
airbnb_hosts hosts
join
airbnb_guests guests
on hosts.nationality=guests.nationality
and hosts.gender=guests.gender;


/**************************/

