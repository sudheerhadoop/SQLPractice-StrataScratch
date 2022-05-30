select 
    distinct home_library_code 
from 
    library_usage
where circulation_active_year=2016 and 
    notice_preference_definition='email' and 
    provided_email_address='false';
