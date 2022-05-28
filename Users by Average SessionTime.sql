with userid as (
select user_id,
    DATE(timestamp) as date,
    max(case when action = 'page_load' then timestamp else null end) page_load_ts ,
    min(case when action = 'page_exit' then timestamp else null end) page_exit_ts 
    from facebook_web_log
group by user_id,DATE(timestamp)),
usersession as 
(select user_id, date,(page_exit_ts::TIMESTAMP - page_load_ts::TIMESTAMP) as duration
from userid)

select user_id, avg(duration) from usersession
group by user_id
having avg(duration) IS NOT NULL;
