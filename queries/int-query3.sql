select e.id,
       e.name,
       t.num_reported_faults
from crammer.employee e left join (select f.reporter_employee_id as employee_id, count(*) as num_reported_faults
                                   from faults f
                                   group by f.reporter_employee_id
                                   ) t on e.id = t.employee_id
where t.num_reported_faults > 0
order by t.num_reported_faults desc;
