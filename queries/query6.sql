select f.fault_level, avg(f.treatment_date - f.report_date) as avg_fault_time
from faults f
where f.is_treatmented = 1
group by f.fault_level
