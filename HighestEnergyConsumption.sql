

with totalenergy as 
(select date, consumption from fb_eu_energy
UNION ALL
select date, consumption from fb_asia_energy
UNION ALL
select date, consumption from fb_na_energy)
,
energy_by_date as 
(
select date, sum(consumption) as sumenergy from 
totalenergy
group by date 
order by date asc),

maxenergy as 
(
select 
    max(sumenergy) maxenergycol from energy_by_date)


select date, sumenergy from 
energy_by_date energydate
join 
maxenergy me on sumenergy =  maxenergycol;
