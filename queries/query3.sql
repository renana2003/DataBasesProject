select t.fault_id,
       t.fault_description,
       t.facility_id,
       t.report_date,
       t.fault_level,
       t.reporter_employee_id
from faults t 
where t.is_treatmented = 0 
order by t.fault_level desc, t.report_date
