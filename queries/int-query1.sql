select e.facility_id, max(e.checking_date) as last_maintenance
from maintenance e
where e.facility_id in (select f.facilities_id
                        from ROFRIDMA.MODE_OF m left join (select t.facilities_id, max(t.date_mode) as max_date
                                   from ROFRIDMA.MODE_OF t
                                   group by t.facilities_id
                                  ) f on m.facilities_id = f.facilities_id
                        where f.max_date = m.date_mode and m.f_mode = 'on')
group by e.facility_id
order by last_maintenance
