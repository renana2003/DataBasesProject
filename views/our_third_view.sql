create or replace view our_third_view as
select f.fault_id, f.facility_id, f.fault_description, f.fault_level, f.report_date
from faults f
where f.is_treatmented = 0
order by f.fault_level, f.report_date;
