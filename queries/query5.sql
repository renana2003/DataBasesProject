select f.facilities_id 
from ROFRIDMA.FACILITIES f
where f.facilities_id not in (select m.facility_id from maintenance m where m.checking_date > (current_date - 182)) 
order by f.facilities_id
