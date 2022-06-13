select avg(t.treatment_date - t.request_date) as avg_response_time
from customerservice t
where t.is_treatmented = 1
