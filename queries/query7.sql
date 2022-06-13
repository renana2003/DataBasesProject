select t.facility_id, avg(t.time_pass) as avg_days_between_maintenance
from (
select m1.facility_id, m1.checking_date - m2.checking_date as time_pass
      from maintenance m1, maintenance m2 
      where m1.facility_id = m2.facility_id and m1.checking_date > m2.checking_date and not exists
            (select * 
             from maintenance m 
             where m.facility_id = m1.facility_id and 
                   m.checking_date < m1.checking_date and 
                   m.checking_date > m2.checking_date)
      order by m1.facility_id) t
group by t.facility_id
order by avg_days_between_maintenance desc;
