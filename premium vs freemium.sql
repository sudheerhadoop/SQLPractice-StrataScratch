with freemium as 
(select fact.date, 
    sum(case when accdim.paying_customer = 'yes' then fact.downloads else 0 end) paying_downloads,
    sum(case when accdim.paying_customer = 'no' then fact.downloads else 0 end) non_paying_downloads
from ms_download_facts fact
 join ms_user_dimension userdim
    on fact.user_id=userdim.user_id 
 join ms_acc_dimension accdim
    on userdim.acc_id=accdim.acc_id
group by date)


select 
    date, 
    non_paying_downloads, 
    paying_downloads
from freemium 
where non_paying_downloads > paying_downloads
order by date;



//** Another approach

SELECT date, non_paying,
             paying
FROM
  (SELECT date, sum(CASE
                        WHEN paying_customer = 'yes' THEN downloads
                    END) AS paying,
                sum(CASE
                        WHEN paying_customer = 'no' THEN downloads
                    END) AS non_paying
   FROM ms_user_dimension a
   INNER JOIN ms_acc_dimension b ON a.acc_id = b.acc_id
   INNER JOIN ms_download_facts c ON a.user_id=c.user_id
   GROUP BY date
   ORDER BY date) t
WHERE (non_paying - paying) >0
ORDER BY t.date ASC
