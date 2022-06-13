select t.facilities_location, count(f.fault_id) as num_faults
from rofridma.facilities t left join faults f on t.facilities_id = f.facility_id
group by t.facilities_location
order by num_faults desc
