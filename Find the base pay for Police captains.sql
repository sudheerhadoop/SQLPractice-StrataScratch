select 
    employeename, 
    basepay 
from sf_public_salaries
where UPPER(jobtitle) like '%POLICE%';

//** other approach

SELECT
    employeename, 
    basepay
FROM sf_public_salaries
WHERE 
    jobtitle ILIKE '%CAPTAIN%POLICE%'
