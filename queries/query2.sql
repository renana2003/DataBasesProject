select t.employee_id, e.name, t.numofcs
from (select c.employee_id, count(c.customer_service_id) as numOfCS 
      from customerservice c
      where c.request_date > (CURRENT_DATE - 365) and c.is_treatmented = 1
      group by c.employee_id 
     ) t left join crammer.employee e on t.employee_id = e.id
where t.numofcs > 0
order by numOfCS desc
