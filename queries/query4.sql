select f.facility_id, count(f.fault_id) as num_faults
from faults f left join (select m.facility_id, max(m.checking_date) as last_checking_date 
                        from maintenance m 
                        group by m.facility_id
                       ) t on f.facility_id = t.facility_id 
where f.report_date > last_checking_date 
group by f.facility_id
order by num_faults desc
